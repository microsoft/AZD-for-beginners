# KI-Workshop Labor: Machen Sie Ihre KI-Lösungen AZD-bereitstellbar

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Kapitel 2 - KI-First-Entwicklung
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Dieses praktische Labor führt Entwickler durch den Prozess, eine vorhandene KI-Vorlage zu übernehmen und sie mit Azure Developer CLI (AZD) bereitzustellen. Sie lernen grundlegende Muster für produktionsreife KI-Bereitstellungen mit Microsoft Foundry-Diensten kennen.

**Dauer:** 2-3 Stunden  
**Level:** Mittelstufe  
**Voraussetzungen:** Grundlegende Azure-Kenntnisse, Vertrautheit mit KI/ML-Konzepten

## 🎓 Lernziele

Am Ende dieses Workshops werden Sie in der Lage sein:
- ✅ Eine vorhandene KI-Anwendung in AZD-Vorlagen zu konvertieren
- ✅ Microsoft Foundry-Dienste mit AZD zu konfigurieren
- ✅ Sichere Anmeldeinformationsverwaltung für KI-Dienste zu implementieren
- ✅ Produktionsreife KI-Anwendungen mit Monitoring bereitzustellen
- ✅ Häufige Probleme bei KI-Bereitstellungen zu beheben

## Voraussetzungen

### Erforderliche Werkzeuge
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installiert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installiert
- [Git](https://git-scm.com/) installiert
- Code-Editor (VS Code empfohlen)

### Azure-Ressourcen
- Azure-Abonnement mit Contributor-Berechtigungen
- Zugang zu Azure OpenAI-Diensten (oder Möglichkeit, Zugang anzufordern)
- Berechtigung zum Erstellen von Ressourcengruppen

### Fachliche Voraussetzungen
- Grundlegendes Verständnis der Azure-Dienste
- Vertrautheit mit Kommandozeilenoberflächen
- Grundlegende KI/ML-Konzepte (APIs, Modelle, Prompts)

## Labor-Einrichtung

### Schritt 1: Umgebung vorbereiten

1. **Überprüfen Sie die Tool-Installationen:**
```bash
# Überprüfe die AZD-Installation
azd version

# Überprüfe die Azure CLI
az --version

# Bei Azure anmelden
az login
azd auth login
```

2. **Klonen Sie das Workshop-Repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Verständnis der AZD-Struktur für KI-Anwendungen

### Aufbau einer KI-AZD-Vorlage

Erkunden Sie die Schlüsseldokumente in einer KI-fertigen AZD-Vorlage:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Laborübung 1.1: Erkunden der Konfiguration**

1. **Untersuchen Sie die azure.yaml Datei:**
```bash
cat azure.yaml
```

**Worauf Sie achten sollten:**
- Dienstdefinitionen für KI-Komponenten
- Zuordnungen von Umgebungsvariablen
- Host-Konfigurationen

2. **Überprüfen Sie die main.bicep Infrastruktur:**
```bash
cat infra/main.bicep
```

**Wichtige KI-Muster zu identifizieren:**
- Bereitstellung des Azure OpenAI-Dienstes
- Integration von Cognitive Search
- Sichere Schlüsselverwaltung
- Netzwerk-Sicherheitskonfigurationen

### **Diskussionspunkt:** Warum diese Muster für KI wichtig sind

- **Dienstabhängigkeiten**: KI-Apps benötigen oft mehrere koordinierte Dienste
- **Sicherheit**: API-Schlüssel und Endpunkte müssen sicher verwaltet werden
- **Skalierbarkeit**: KI-Workloads haben besondere Skalierungsanforderungen
- **Kostenmanagement**: KI-Dienste können teuer werden, wenn sie nicht richtig konfiguriert sind

## Modul 2: Bereiten Sie Ihre erste KI-Anwendung bereit

### Schritt 2.1: Umgebung initialisieren

1. **Erstellen Sie eine neue AZD-Umgebung:**
```bash
azd env new myai-workshop
```

2. **Setzen Sie die erforderlichen Parameter:**
```bash
# Legen Sie Ihre bevorzugte Azure-Region fest
azd env set AZURE_LOCATION eastus

# Optional: Legen Sie ein bestimmtes OpenAI-Modell fest
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Schritt 2.2: Infrastruktur und Anwendung bereitstellen

1. **Bereitstellen mit AZD:**
```bash
azd up
```

**Was während `azd up` passiert:**
- ✅ Stellt den Azure OpenAI-Dienst bereit
- ✅ Erstellt den Cognitive Search-Dienst
- ✅ Richtet einen App Service für die Webanwendung ein
- ✅ Konfiguriert Netzwerk und Sicherheit
- ✅ Stellt Anwendungscode bereit
- ✅ Richtet Monitoring und Protokollierung ein

2. **Überwachen Sie den Bereitstellungsfortschritt** und notieren Sie die erstellten Ressourcen.

### Schritt 2.3: Verifizieren Sie Ihre Bereitstellung

1. **Prüfen Sie die bereitgestellten Ressourcen:**
```bash
azd show
```

2. **Öffnen Sie die bereitgestellte Anwendung:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testen Sie die KI-Funktionalität:**
   - Navigieren Sie zur Webanwendung
   - Probieren Sie Beispielanfragen aus
   - Verifizieren Sie, dass KI-Antworten funktionieren

### **Laborübung 2.1: Fehlerbehebungsübung**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die KI antwortet nicht.

**Häufige Probleme, die Sie überprüfen sollten:**
1. **OpenAI API-Schlüssel**: Überprüfen Sie, ob sie korrekt gesetzt sind
2. **Modellverfügbarkeit**: Prüfen Sie, ob Ihre Region das Modell unterstützt
3. **Netzwerkkonnektivität**: Stellen Sie sicher, dass die Dienste kommunizieren können
4. **RBAC-Berechtigungen**: Überprüfen Sie, ob die App auf OpenAI zugreifen kann

**Debugging-Befehle:**
```bash
# Umgebungsvariablen prüfen
azd env get-values

# Bereitstellungsprotokolle anzeigen
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI-Bereitstellungsstatus prüfen
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Anpassen von KI-Anwendungen an Ihre Anforderungen

### Schritt 3.1: Ändern der KI-Konfiguration

1. **Aktualisieren Sie das OpenAI-Modell:**
```bash
# Wechseln Sie zu einem anderen Modell (falls in Ihrer Region verfügbar)
azd env set AZURE_OPENAI_MODEL gpt-4

# Mit der neuen Konfiguration erneut bereitstellen
azd deploy
```

2. **Fügen Sie zusätzliche KI-Dienste hinzu:**

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

### Schritt 3.2: Umgebungsbezogene Konfigurationen

**Best Practice**: Unterschiedliche Konfigurationen für Entwicklung vs Produktion.

1. **Erstellen Sie eine Produktionsumgebung:**
```bash
azd env new myai-production
```

2. **Setzen Sie produktionsspezifische Parameter:**
```bash
# In der Produktion werden typischerweise höhere SKUs verwendet.
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Zusätzliche Sicherheitsfunktionen aktivieren
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laborübung 3.1: Kostenoptimierung**

**Herausforderung**: Konfigurieren Sie die Vorlage für kosteneffektive Entwicklung.

**Aufgaben:**
1. Identifizieren Sie, welche SKUs auf kostenlose/Basic-Stufen gesetzt werden können
2. Konfigurieren Sie Umgebungsvariablen für minimale Kosten
3. Bereitstellen und Kosten mit der Produktionskonfiguration vergleichen

**Hinweise zur Lösung:**
- Verwenden Sie nach Möglichkeit die F0 (kostenlose) Stufe für Cognitive Services
- Verwenden Sie die Basic-Stufe für den Search-Dienst in der Entwicklung
- Erwägen Sie die Verwendung des Consumption-Plans für Functions

## Modul 4: Sicherheit und Produktions-Best Practices

### Schritt 4.1: Sichere Anmeldeinformationsverwaltung

**Aktuelle Herausforderung**: Viele KI-Apps kodieren API-Schlüssel hart oder verwenden unsichere Speicher.

**AZD-Lösung**: Managed Identity + Key Vault-Integration.

1. **Überprüfen Sie die Sicherheitskonfiguration in Ihrer Vorlage:**
```bash
# Nach Key Vault- und Managed Identity-Konfiguration suchen
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifizieren Sie, dass Managed Identity funktioniert:**
```bash
# Überprüfen Sie, ob die Webanwendung die richtige Identitätskonfiguration hat
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Schritt 4.2: Netzwerksicherheit

1. **Aktivieren Sie private Endpunkte** (falls noch nicht konfiguriert):

Fügen Sie Ihrem Bicep-Template hinzu:
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

### Schritt 4.3: Monitoring und Beobachtbarkeit

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

### **Laborübung 4.1: Sicherheitsprüfung**

**Aufgabe**: Überprüfen Sie Ihre Bereitstellung auf Sicherheits-Best Practices.

**Checkliste:**
- [ ] Keine hartkodierten Geheimnisse im Code oder in der Konfiguration
- [ ] Managed Identity für Service-zu-Service-Authentifizierung verwendet
- [ ] Key Vault speichert sensitive Konfiguration
- [ ] Netzwerkzugriff ist angemessen eingeschränkt
- [ ] Monitoring und Protokollierung sind aktiviert

## Modul 5: Konvertierung Ihrer eigenen KI-Anwendung

### Schritt 5.1: Bewertungs-Arbeitsblatt

**Bevor Sie Ihre App konvertieren**, beantworten Sie diese Fragen:

1. **Anwendungsarchitektur:**
   - Welche KI-Dienste verwendet Ihre App?
   - Welche Compute-Ressourcen benötigt sie?
   - Benötigt sie eine Datenbank?
   - Welche Abhängigkeiten bestehen zwischen den Diensten?

2. **Sicherheitsanforderungen:**
   - Mit welchen sensiblen Daten arbeitet Ihre App?
   - Welche Compliance-Anforderungen haben Sie?
   - Benötigen Sie privates Networking?

3. **Skalierungsanforderungen:**
   - Wie hoch ist die erwartete Last?
   - Benötigen Sie Auto-Scaling?
   - Gibt es regionale Anforderungen?

### Schritt 5.2: Erstellen Sie Ihre AZD-Vorlage

**Folgen Sie diesem Muster, um Ihre App zu konvertieren:**

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

**infra/main.bicep** - Haupttemplate:
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

### **Laborübung 5.1: Template-Erstellungs-Herausforderung**

**Herausforderung**: Erstellen Sie eine AZD-Vorlage für eine Dokumentenverarbeitungs-KI-App.

**Anforderungen:**
- Azure OpenAI für Inhaltsanalyse
- Document Intelligence für OCR
- Storage Account für Dokument-Uploads
- Function App für Verarbeitungslogik
- Web-App für die Benutzeroberfläche

**Bonuspunkte:**
- Fügen Sie eine ordnungsgemäße Fehlerbehandlung hinzu
- Einschließlich Kostenschätzung
- Einrichten von Monitoring-Dashboards

## Modul 6: Fehlerbehebung bei häufigen Problemen

### Häufige Bereitstellungsprobleme

#### Problem 1: OpenAI-Service-Quota überschritten
**Symptome:** Bereitstellung schlägt mit Quota-Fehler fehl
**Lösungen:**
```bash
# Aktuelle Kontingente prüfen
az cognitiveservices usage list --location eastus

# Kontingenterhöhung anfordern oder eine andere Region ausprobieren
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell nicht in Region verfügbar
**Symptome:** KI-Antworten schlagen fehl oder Modellbereitstellung meldet Fehler
**Lösungen:**
```bash
# Modellverfügbarkeit nach Region prüfen
az cognitiveservices model list --location eastus

# Auf verfügbares Modell aktualisieren
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Berechtigungsprobleme
**Symptome:** 403 Forbidden-Fehler beim Aufrufen von KI-Diensten
**Lösungen:**
```bash
# Rollenzuweisungen überprüfen
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
2. Prüfen Sie OpenAI-Dienstmetriken im Azure-Portal
3. Verifizieren Sie Netzwerkverbindung und Latenz

**Lösungen:**
- Implementieren Sie Caching für häufige Anfragen
- Verwenden Sie das geeignete OpenAI-Modell für Ihren Anwendungsfall
- Erwägen Sie Read-Replicas für hochbelastete Szenarien

### **Laborübung 6.1: Debugging-Herausforderung**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die Anwendung gibt 500-Fehler zurück.

**Debugging-Aufgaben:**
1. Prüfen Sie Anwendungsprotokolle
2. Verifizieren Sie Dienstkonnektivität
3. Testen Sie die Authentifizierung
4. Überprüfen Sie die Konfiguration

**Tools zur Verwendung:**
- `azd show` für Bereitstellungsübersicht
- Azure-Portal für detaillierte Dienstprotokolle
- Application Insights für Anwendungs-Telemetrie

## Modul 7: Monitoring und Optimierung

### Schritt 7.1: Umfassendes Monitoring einrichten

1. **Erstellen Sie benutzerdefinierte Dashboards:**

Navigieren Sie zum Azure-Portal und erstellen Sie ein Dashboard mit:
- Anzahl und Latenz der OpenAI-Anfragen
- Anwendungsfehlerquoten
- Ressourcenauslastung
- Kostenverfolgung

2. **Richten Sie Alerts ein:**
```bash
# Alarm bei hoher Fehlerrate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Schritt 7.2: Kostenoptimierung

1. **Analysieren Sie die aktuellen Kosten:**
```bash
# Verwenden Sie die Azure CLI, um Kostendaten abzurufen
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementieren Sie Kostenkontrollen:**
- Richten Sie Budgetwarnungen ein
- Verwenden Sie Auto-Scaling-Richtlinien
- Implementieren Sie Request-Caching
- Überwachen Sie Token-Nutzung für OpenAI

### **Laborübung 7.1: Performance-Optimierung**

**Aufgabe**: Optimieren Sie Ihre KI-Anwendung sowohl für Leistung als auch für Kosten.

**Metriken zu verbessern:**
- Durchschnittliche Antwortzeit um 20% reduzieren
- Monatliche Kosten um 15% senken
- 99,9% Verfügbarkeit beibehalten

**Strategien zum Ausprobieren:**
- Implementieren Sie Response-Caching
- Optimieren Sie Prompts für Token-Effizienz
- Verwenden Sie geeignete Compute-SKUs
- Richten Sie korrektes Auto-Scaling ein

## Abschlussherausforderung: Ende-zu-Ende-Implementierung

### Szenario der Herausforderung

Sie sollen einen produktionsreifen, KI-gestützten Kundenservice-Chatbot erstellen mit folgenden Anforderungen:

**Funktionale Anforderungen:**
- Weboberfläche für Kundeninteraktionen
- Integration mit Azure OpenAI für Antworten
- Dokumentensuche mit Cognitive Search
- Integration mit bestehender Kundendatenbank
- Mehrsprachige Unterstützung

**Nicht-funktionale Anforderungen:**
- Verarbeitung von 1000 gleichzeitigen Nutzern
- 99,9% Uptime-SLA
- SOC 2-Konformität
- Kosten unter $500/Monat
- Bereitstellung in mehreren Umgebungen (dev, staging, prod)

### Implementierungsschritte

1. **Architektur entwerfen**
2. **AZD-Vorlage erstellen**
3. **Sicherheitsmaßnahmen implementieren**
4. **Monitoring und Alerting einrichten**
5. **Bereitstellungspipelines erstellen**
6. **Lösung dokumentieren**

### Bewertungskriterien

- ✅ **Funktionalität**: Erfüllt es alle Anforderungen?
- ✅ **Sicherheit**: Sind Best Practices implementiert?
- ✅ **Skalierbarkeit**: Kann es die Last bewältigen?
- ✅ **Wartbarkeit**: Ist Code und Infrastruktur gut organisiert?
- ✅ **Kosten**: Bleibt es im Budget?

## Zusätzliche Ressourcen

### Microsoft-Dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Beispielvorlagen
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community-Ressourcen
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Abschlusszertifikat
Herzlichen Glückwunsch! Sie haben das AI Workshop Lab abgeschlossen. Sie sollten jetzt in der Lage sein:

- ✅ Vorhandene KI-Anwendungen in AZD-Vorlagen umwandeln
- ✅ Produktionsreife KI-Anwendungen bereitstellen
- ✅ Beste Sicherheitspraktiken für KI-Workloads implementieren
- ✅ Die Leistung von KI-Anwendungen überwachen und optimieren
- ✅ Häufige Bereitstellungsprobleme beheben

### Nächste Schritte
1. Wenden Sie diese Muster in Ihren eigenen KI-Projekten an
2. Teilen Sie Vorlagen mit der Community
3. Treten Sie dem Microsoft Foundry Discord für fortlaufende Unterstützung bei
4. Erkunden Sie fortgeschrittene Themen wie mehrregionale Bereitstellungen

---

**Workshop-Feedback**: Helfen Sie uns, diesen Workshop zu verbessern, indem Sie Ihre Erfahrungen im [Microsoft Foundry Discord #Azure-Kanal](https://discord.gg/microsoft-azure) teilen.

---

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Zurück**: [Bereitstellung von KI-Modellen](ai-model-deployment.md)
- **➡️ Weiter**: [Best Practices für Produktions-KI](production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Benötigen Sie Hilfe?** Treten Sie unserer Community bei für Unterstützung und Diskussionen über AZD- und KI-Bereitstellungen.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes Co-op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, beachten Sie bitte, dass automatische Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Bei wichtigen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->