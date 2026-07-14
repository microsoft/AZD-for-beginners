# AI Workshop Lab: So machen Sie Ihre KI-Lösungen AZD-bereit für die Bereitstellung

**Kapitel-Navigation:**
- **📚 Kursstartseite**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-First Entwicklung
- **⬅️ Zurück**: [Bereitstellung von KI-Modellen](ai-model-deployment.md)
- **➡️ Weiter**: [Best Practices für KI im Produktivbetrieb](production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Workshop-Übersicht

Dieses praktische Labor führt Entwickler durch den Prozess, eine bestehende KI-Vorlage zu übernehmen und mit Azure Developer CLI (AZD) bereitzustellen. Sie lernen wesentliche Muster für produktive KI-Bereitstellungen mit Microsoft Foundry-Diensten kennen.

> **Validierungshinweis (2026-07-13):** Dieser Workshop wurde mit `azd` `1.27.1` geprüft. Wenn Ihre lokale Installation älter ist, aktualisieren Sie AZD vor Beginn, damit die Authentifizierungs-, Vorlagen- und Bereitstellungsabläufe mit den untenstehenden Schritten übereinstimmen.

**Dauer:** 2-3 Stunden  
**Niveau:** Mittelstufe  
**Voraussetzungen:** Grundkenntnisse in Azure, vertraut mit KI/ML-Konzepten

## 🎓 Lernziele

Am Ende dieses Workshops werden Sie in der Lage sein:
- ✅ Eine bestehende KI-Anwendung in AZD-Vorlagen zu konvertieren
- ✅ Microsoft Foundry-Dienste mit AZD zu konfigurieren
- ✅ Sichere Verwaltung von Zugangsdaten für KI-Dienste umzusetzen
- ✅ Produktionsreife KI-Anwendungen mit Monitoring bereitzustellen
- ✅ Häufige Probleme bei KI-Bereitstellungen zu beheben

## Voraussetzungen

### Erforderliche Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installiert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installiert
- [Git](https://git-scm.com/) installiert
- Code-Editor (VS Code empfohlen)

### Azure-Ressourcen
- Azure-Abonnement mit Mitwirkendenzugriff
- Zugriff auf Microsoft Foundry Models Dienste (oder Möglichkeit, Zugriff zu beantragen)
- Berechtigungen zur Erstellung von Ressourcengruppen

### Wissen-Voraussetzungen
- Grundlegendes Verständnis zu Azure-Diensten
- Vertrautheit mit Kommandozeilenschnittstellen
- Grundlagen zu KI/ML-Konzepten (APIs, Modelle, Prompts)

## Lab Setup

### Schritt 1: Vorbereitung der Umgebung

1. **Überprüfen der Tool-Installationen:**
```bash
# Überprüfen Sie die AZD-Installation
azd version

# Überprüfen Sie die Azure CLI
az --version

# Melden Sie sich bei Azure für AZD-Workflows an
azd auth login

# Melden Sie sich nur beim Azure CLI an, wenn Sie während der Diagnose az-Befehle ausführen möchten
az login
```

Wenn Sie mit mehreren Mandanten arbeiten oder Ihr Abonnement nicht automatisch erkannt wird, versuchen Sie es erneut mit `azd auth login --tenant-id <tenant-id>`.

2. **Repository des Workshops klonen:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Verstehen der AZD-Struktur für KI-Anwendungen

### Aufbau einer KI-AZD-Vorlage

Erkunden Sie die wichtigsten Dateien in einer KI-fähigen AZD-Vorlage:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Übung 1.1: Erkunden der Konfiguration**

1. **Untersuchen der azure.yaml Datei:**
```bash
cat azure.yaml
```

**Worauf Sie achten sollten:**
- Service-Definitionen für KI-Komponenten
- Umgebungsvariablen-Zuordnungen
- Host-Konfigurationen

2. **Überprüfung der main.bicep Infrastruktur:**
```bash
cat infra/main.bicep
```

**Wichtige KI-Muster zur Identifikation:**
- Bereitstellung des Microsoft Foundry Models Dienstes
- Integration von Azure AI Search
- Sicheres Schlüsselmanagement
- Netzwerksicherheitskonfigurationen

### **Diskussionspunkt:** Warum diese Muster für KI wichtig sind

- **Service-Abhängigkeiten**: KI-Anwendungen benötigen oft mehrere koordinierte Dienste
- **Sicherheit**: API-Schlüssel und Endpunkte müssen sicher verwaltet werden
- **Skalierbarkeit**: KI-Workloads haben spezielle Anforderungen an die Skalierung
- **Kostenmanagement**: KI-Dienste können teuer sein, wenn sie nicht korrekt konfiguriert sind

## Modul 2: Deployment Ihrer ersten KI-Anwendung

### Schritt 2.1: Initialisieren der Umgebung

1. **Eine neue AZD-Umgebung anlegen:**
```bash
azd env new myai-workshop
```

2. **Benötigte Parameter setzen:**
```bash
# Legen Sie Ihre bevorzugte Azure-Region fest
azd env set AZURE_LOCATION eastus

# Optional: Legen Sie ein bestimmtes OpenAI-Modell fest
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Schritt 2.2: Deployment der Infrastruktur und Anwendung

1. **Mit AZD bereitstellen:**
```bash
azd up
```

**Was bei `azd up` passiert:**
- ✅ Bereitstellung des Microsoft Foundry Models Dienstes
- ✅ Erstellung des Azure AI Search Dienstes
- ✅ Einrichtung des App Service für die Webanwendung
- ✅ Konfiguration von Netzwerk und Sicherheit
- ✅ Deployment des Anwendungscodes
- ✅ Einrichtung von Monitoring und Logging

2. **Überwachen Sie den Fortschritt der Bereitstellung** und beachten Sie die erstellten Ressourcen.

### Schritt 2.3: Überprüfung Ihrer Bereitstellung

1. **Überprüfen Sie die bereitgestellten Ressourcen:**
```bash
azd show
```

2. **Öffnen Sie die bereitgestellte Anwendung:**
```bash
azd show
```

Öffnen Sie den Web-Endpunkt, der in der Ausgabe von `azd show` angezeigt wird.

3. **Testen Sie die KI-Funktionalität:**
   - Navigieren Sie zur Webanwendung
   - Probieren Sie Beispielanfragen aus
   - Verifizieren Sie, dass die KI-Antworten funktionieren

### **Lab Übung 2.1: Troubleshooting-Praxis**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die KI reagiert nicht.

**Häufige Probleme, die überprüft werden sollten:**
1. **OpenAI API-Schlüssel**: Überprüfen Sie, ob sie korrekt gesetzt sind
2. **Modellverfügbarkeit**: Prüfen Sie, ob Ihr Gebiet das Modell unterstützt
3. **Netzwerkverbindung**: Stellen Sie sicher, dass die Dienste kommunizieren können
4. **RBAC-Berechtigungen**: Verifizieren Sie, dass die App auf OpenAI zugreifen kann

**Debugging-Befehle:**
```bash
# Überprüfen Sie Umgebungsvariablen
azd env get-values

# Deployment-Protokolle anzeigen
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI-Deployment-Status überprüfen
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Anpassen von KI-Anwendungen an Ihre Bedürfnisse

### Schritt 3.1: Ändern der KI-Konfiguration

1. **Aktualisieren des OpenAI-Modells:**
```bash
# Wechseln Sie zu einem anderen Modell (falls in Ihrer Region verfügbar)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Erneut mit der neuen Konfiguration bereitstellen
azd deploy
```

2. **Weitere KI-Dienste hinzufügen:**

Bearbeiten Sie `infra/main.bicep`, um Document Intelligence hinzuzufügen:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Schritt 3.2: Umgebungsspezifische Konfigurationen

**Best Practice**: Unterschiedliche Konfigurationen für Entwicklung und Produktion.

1. **Erstellen einer Produktionsumgebung:**
```bash
azd env new myai-production
```

2. **Setzen produktspezifischer Parameter:**
```bash
# Die Produktion verwendet typischerweise höhere SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Zusätzliche Sicherheitsfunktionen aktivieren
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Übung 3.1: Kostenoptimierung**

**Aufgabe**: Konfigurieren Sie die Vorlage für kosteneffiziente Entwicklung.

**Aufgaben:**
1. Identifizieren Sie, welche SKUs auf freie/Standard-Tarife gesetzt werden können
2. Konfigurieren Sie Umgebungsvariablen für minimale Kosten
3. Bereitstellen und Kosten mit der Produktionskonfiguration vergleichen

**Lösungshinweise:**
- Verwenden Sie nach Möglichkeit die F0 (kostenlose) Stufe für Azure KI-Dienste
- Nutzen Sie die Basic-Stufe für den Suchdienst in der Entwicklung
- Ziehen Sie die Nutzung des Consumption-Plans für Functions in Betracht

## Modul 4: Sicherheit und bewährte Produktionspraktiken

### Schritt 4.1: Sichere Verwaltung von Zugangsdaten

**Aktuelle Herausforderung**: Viele KI-Apps speichern API-Schlüssel hartkodiert oder unsicher.

**AZD-Lösung**: Managed Identity + Key Vault Integration.

1. **Überprüfen Sie die Sicherheitskonfiguration in Ihrer Vorlage:**
```bash
# Suche nach Key Vault- und Managed Identity-Konfiguration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifizieren Sie, dass Managed Identity funktioniert:**
```bash
# Überprüfen Sie, ob die Webanwendung die korrekte Identitätskonfiguration hat
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Schritt 4.2: Netzwerksicherheit

1. **Aktivieren Sie private Endpunkte** (sofern noch nicht konfiguriert):

Fügen Sie diese Zeilen Ihrer Bicep-Vorlage hinzu:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Schritt 4.3: Überwachung und Beobachtbarkeit

1. **Konfigurieren Sie Application Insights:**
```bash
# Application Insights sollte automatisch konfiguriert werden
# Überprüfen Sie die Konfiguration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Richten Sie KI-spezifisches Monitoring ein:**

Fügen Sie benutzerdefinierte Metriken für KI-Operationen hinzu:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Lab Übung 4.1: Sicherheitsprüfung**

**Aufgabe**: Überprüfen Sie Ihre Bereitstellung auf Sicherheitsbest Practices.

**Checkliste:**
- [ ] Keine hartkodierten Geheimnisse im Code oder in der Konfiguration
- [ ] Managed Identity für Dienst-zu-Dienst-Authentifizierung genutzt
- [ ] Key Vault speichert sensible Konfiguration
- [ ] Netzwerkzugriff ist angemessen beschränkt
- [ ] Monitoring und Logging sind aktiviert

## Modul 5: Konvertieren Ihrer eigenen KI-Anwendung

### Schritt 5.1: Bewertungsbogen

**Bevor Sie Ihre App konvertieren**, beantworten Sie diese Fragen:

1. **Anwendungsarchitektur:**
   - Welche KI-Dienste verwendet Ihre App?
   - Welche Rechenressourcen werden benötigt?
   - Benötigt sie eine Datenbank?
   - Wie sind die Abhängigkeiten zwischen Diensten?

2. **Sicherheitsanforderungen:**
   - Welche sensiblen Daten verarbeitet Ihre App?
   - Welche Compliance-Anforderungen bestehen?
   - Benötigen Sie privates Networking?

3. **Skalierungsanforderungen:**
   - Wie hoch ist die erwartete Last?
   - Benötigen Sie Auto-Scaling?
   - Gibt es regionale Anforderungen?

### Schritt 5.2: Erstellen Ihrer AZD-Vorlage

**Folgen Sie diesem Muster zur App-Konvertierung:**

1. **Erstellen Sie die Grundstruktur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD-Vorlage initialisieren
azd init --template minimal
```

2. **Erstellen Sie azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Erstellen Sie Infrastrukturvorlagen:**

**infra/main.bicep** - Hauptvorlage:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI-Modul:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab Übung 5.1: Herausforderung zur Vorlagenerstellung**

**Aufgabe**: Erstellen Sie eine AZD-Vorlage für eine KI-App zur Dokumentenverarbeitung.

**Anforderungen:**
- Microsoft Foundry Models für Inhaltsanalyse
- Document Intelligence für OCR
- Speicherkonto für Dokumenten-Uploads
- Function App zur Verarbeitungslogik
- Web-App für Benutzeroberfläche

**Bonuspunkte:**
- Fügen Sie ein korrektes Fehlerhandling hinzu
- Beinhaltet Kostenschätzung
- Richten Sie Monitoring-Dashboards ein

## Modul 6: Fehlerbehebung bei häufigen Problemen

### Häufige Bereitstellungsprobleme

#### Problem 1: OpenAI Service-Quota überschritten
**Symptome:** Bereitstellung schlägt mit Quotenfehler fehl
**Lösungen:**
```bash
# Aktuelle Kontingente prüfen
az cognitiveservices usage list --location eastus

# Kontingenterhöhung anfordern oder andere Region versuchen
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell im Gebiet nicht verfügbar
**Symptome:** KI-Antworten fehlen oder Modell-Bereitstellungsfehler
**Lösungen:**
```bash
# Verfügbarkeit des Modells nach Region prüfen
az cognitiveservices model list --location eastus

# Auf verfügbares Modell aktualisieren
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Berechtigungsprobleme
**Symptome:** 403 Forbidden Fehler beim Aufruf von KI-Diensten
**Lösungen:**
```bash
# Überprüfen Sie Rollenzuweisungen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Fehlende Rollen hinzufügen
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance-Probleme

#### Problem 4: Langsame KI-Antworten
**Untersuchungsschritte:**
1. Überprüfen Sie Application Insights auf Performance-Metriken
2. Analysieren Sie OpenAI Service-Metriken im Azure-Portal
3. Prüfen Sie Netzwerkverbindung und Latenz

**Lösungen:**
- Implementieren Sie Caching für häufige Anfragen
- Verwenden Sie das passende OpenAI Modell für Ihren Anwendungsfall
- Ziehen Sie bei hoher Last read replicas in Betracht

### **Lab Übung 6.1: Debugging-Herausforderung**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die Anwendung gibt 500 Fehler zurück.

**Debugging-Aufgaben:**
1. Prüfen Sie Anwendungsprotokolle
2. Überprüfen Sie die Dienstverbindung
3. Testen Sie die Authentifizierung
4. Überprüfen Sie die Konfiguration

**Verwendbare Werkzeuge:**
- `azd show` für Deployment-Übersicht
- Azure-Portal für detaillierte Dienstprotokolle
- Application Insights für Anwendungs-Telemetrie

## Modul 7: Monitoring und Optimierung

### Schritt 7.1: Umfassendes Monitoring einrichten

1. **Erstellen Sie benutzerdefinierte Dashboards:**

Navigieren Sie zum Azure-Portal und erstellen Sie ein Dashboard mit:
- OpenAI-Anfrageanzahl und Latenz
- Fehlerquoten der Anwendung
- Ressourcenauslastung
- Kostenverfolgung

2. **Richten Sie Warnungen ein:**
```bash
# Alarm bei hoher Fehlerquote
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Schritt 7.2: Kostenoptimierung

1. **Analysieren Sie aktuelle Kosten:**
```bash
# Verwenden Sie die Azure CLI, um Kostendaten abzurufen
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementieren Sie Kostenkontrollen:**
- Richten Sie Budgetwarnungen ein
- Nutzen Sie Autoskalierungspolicen
- Implementieren Sie Anfragen-Caching
- Überwachen Sie Token-Verbrauch für OpenAI

### **Lab Übung 7.1: Performance-Optimierung**

**Aufgabe**: Optimieren Sie Ihre KI-Anwendung hinsichtlich Leistung und Kosten.

**Zu verbessernde Metriken:**
- Reduzieren Sie die durchschnittliche Antwortzeit um 20%
- Senken Sie die monatlichen Kosten um 15%
- Halten Sie eine Betriebszeit von 99,9%

**Strategien zum Ausprobieren:**
- Implementieren Sie Antwort-Caching
- Optimieren Sie Prompts für Token-Effizienz
- Verwenden Sie geeignete Compute-SKUs
- Richten Sie ordnungsgemäße Autoskalierung ein

## Abschließende Herausforderung: End-to-End Umsetzung

### Szenario der Herausforderung

Ihre Aufgabe ist es, einen produktionsreifen, KI-gestützten Kundenservice-Chatbot zu erstellen, mit folgenden Anforderungen:

**Funktionale Anforderungen:**
- Webschnittstelle für Kundeninteraktionen
- Integration mit Microsoft Foundry Models für Antworten
- Dokumentensuche mittels Azure AI Search
- Integration mit bestehender Kundendatenbank
- Mehrsprachige Unterstützung

**Nicht-funktionale Anforderungen:**
- Handhabung von 1000 gleichzeitigen Nutzern
- 99,9% SLA für Betriebszeit
- SOC 2 Compliance
- Kosten unter 500 USD/Monat
- Deployment in mehreren Umgebungen (Entwicklung, Test, Produktion)

### Umsetzungsschritte

1. **Entwerfen der Architektur**
2. **Erstellen der AZD-Vorlage**
3. **Implementieren von Sicherheitsmaßnahmen**
4. **Einrichten von Monitoring und Alarmierung**
5. **Erstellen von Deployment-Pipelines**
6. **Dokumentieren der Lösung**

### Bewertungskriterien

- ✅ **Funktionalität**: Werden alle Anforderungen erfüllt?
- ✅ **Sicherheit**: Sind Best Practices umgesetzt?
- ✅ **Skalierbarkeit**: Kann die Last bewältigt werden?
- ✅ **Wartbarkeit**: Ist Code und Infrastruktur gut organisiert?
- ✅ **Kosten**: Bleibt es im Budget?

## Weiterführende Ressourcen

### Microsoft Dokumentation
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Dokumentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentation](https://learn.microsoft.com/azure/ai-studio/)

### Beispielvorlagen
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community-Ressourcen
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Abschlusszertifikat

Herzlichen Glückwunsch! Sie haben das KI-Workshop-Labor abgeschlossen. Sie sollten nun in der Lage sein:

- ✅ Bestehende KI-Anwendungen in AZD-Vorlagen umzuwandeln
- ✅ Produktionsreife KI-Anwendungen bereitzustellen
- ✅ Sicherheitsbest Practices für KI-Arbeitslasten umzusetzen
- ✅ Die Leistung von KI-Anwendungen zu überwachen und zu optimieren
- ✅ Häufige Bereitstellungsprobleme zu beheben

### Nächste Schritte
1. Wenden Sie diese Muster auf Ihre eigenen KI-Projekte an
2. Tragen Sie Vorlagen zurück an die Community bei
3. Treten Sie dem Microsoft Foundry Discord für fortlaufende Unterstützung bei
4. Erkunden Sie fortgeschrittene Themen wie Multi-Region-Bereitstellungen

---

**Workshop-Feedback**: Helfen Sie uns, diesen Workshop zu verbessern, indem Sie Ihre Erfahrungen im [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) teilen.

---

**Kapitel-Navigation:**
- **📚 Startseite des Kurses**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-First-Entwicklung
- **⬅️ Zurück**: [KI-Modell-Bereitstellung](ai-model-deployment.md)
- **➡️ Weiter**: [Produktions-KI-Best Practices](production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brauchen Sie Hilfe?** Treten Sie unserer Community bei, um Unterstützung und Diskussionen über AZD- und KI-Bereitstellungen zu erhalten.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->