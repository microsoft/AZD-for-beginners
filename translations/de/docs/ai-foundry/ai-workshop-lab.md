<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T13:56:54+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "de"
}
-->
# AI Workshop Lab: Machen Sie Ihre KI-Lösungen AZD-bereit

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-First-Entwicklung
- **⬅️ Vorheriges**: [KI-Modellbereitstellung](ai-model-deployment.md)
- **➡️ Nächstes**: [Best Practices für produktive KI](production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

## Workshop-Übersicht

Dieses praktische Lab führt Entwickler durch den Prozess, eine bestehende KI-Vorlage zu nehmen und sie mit Azure Developer CLI (AZD) bereitzustellen. Sie lernen wesentliche Muster für produktive KI-Bereitstellungen mit Azure AI Foundry-Diensten.

**Dauer:** 2-3 Stunden  
**Level:** Mittelstufe  
**Voraussetzungen:** Grundkenntnisse in Azure, Vertrautheit mit KI/ML-Konzepten

## 🎓 Lernziele

Am Ende dieses Workshops werden Sie in der Lage sein:
- ✅ Eine bestehende KI-Anwendung in AZD-Vorlagen umzuwandeln
- ✅ Azure AI Foundry-Dienste mit AZD zu konfigurieren
- ✅ Sichere Verwaltung von Zugangsdaten für KI-Dienste umzusetzen
- ✅ Produktionsreife KI-Anwendungen mit Monitoring bereitzustellen
- ✅ Häufige Probleme bei der KI-Bereitstellung zu beheben

## Voraussetzungen

### Erforderliche Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installiert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installiert
- [Git](https://git-scm.com/) installiert
- Code-Editor (VS Code empfohlen)

### Azure-Ressourcen
- Azure-Abonnement mit Zugriff als Mitwirkender
- Zugriff auf Azure OpenAI-Dienste (oder Möglichkeit, Zugriff anzufordern)
- Berechtigungen zur Erstellung von Ressourcengruppen

### Wissensvoraussetzungen
- Grundlegendes Verständnis von Azure-Diensten
- Vertrautheit mit Kommandozeilen-Schnittstellen
- Grundlegende KI/ML-Konzepte (APIs, Modelle, Prompts)

## Lab-Einrichtung

### Schritt 1: Vorbereitung der Umgebung

1. **Überprüfen Sie die Installation der Tools:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Klonen Sie das Workshop-Repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Verständnis der AZD-Struktur für KI-Anwendungen

### Aufbau einer KI-fähigen AZD-Vorlage

Erkunden Sie die wichtigsten Dateien in einer KI-bereiten AZD-Vorlage:

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

### **Lab-Übung 1.1: Konfiguration erkunden**

1. **Untersuchen Sie die Datei azure.yaml:**
```bash
cat azure.yaml
```

**Worauf Sie achten sollten:**
- Dienstdefinitionen für KI-Komponenten
- Zuordnungen von Umgebungsvariablen
- Host-Konfigurationen

2. **Überprüfen Sie die Infrastruktur main.bicep:**
```bash
cat infra/main.bicep
```

**Wichtige KI-Muster, die Sie identifizieren sollten:**
- Bereitstellung des Azure OpenAI-Dienstes
- Integration von Cognitive Search
- Sichere Schlüsselverwaltung
- Netzwerksicherheitskonfigurationen

### **Diskussionspunkt:** Warum diese Muster für KI wichtig sind

- **Dienstabhängigkeiten**: KI-Anwendungen erfordern oft mehrere koordinierte Dienste
- **Sicherheit**: API-Schlüssel und Endpunkte müssen sicher verwaltet werden
- **Skalierbarkeit**: KI-Workloads haben einzigartige Skalierungsanforderungen
- **Kostenmanagement**: KI-Dienste können teuer sein, wenn sie nicht richtig konfiguriert sind

## Modul 2: Ihre erste KI-Anwendung bereitstellen

### Schritt 2.1: Umgebung initialisieren

1. **Erstellen Sie eine neue AZD-Umgebung:**
```bash
azd env new myai-workshop
```

2. **Setzen Sie die erforderlichen Parameter:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Schritt 2.2: Infrastruktur und Anwendung bereitstellen

1. **Bereitstellung mit AZD:**
```bash
azd up
```

**Was während `azd up` passiert:**
- ✅ Bereitstellung des Azure OpenAI-Dienstes
- ✅ Erstellung des Cognitive Search-Dienstes
- ✅ Einrichtung des App-Dienstes für die Webanwendung
- ✅ Konfiguration von Netzwerk und Sicherheit
- ✅ Bereitstellung des Anwendungscodes
- ✅ Einrichtung von Monitoring und Logging

2. **Überwachen Sie den Fortschritt der Bereitstellung** und notieren Sie die erstellten Ressourcen.

### Schritt 2.3: Bereitstellung überprüfen

1. **Überprüfen Sie die bereitgestellten Ressourcen:**
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
   - Überprüfen Sie, ob die KI-Antworten funktionieren

### **Lab-Übung 2.1: Fehlerbehebung üben**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die KI reagiert nicht.

**Häufige Probleme, die Sie überprüfen sollten:**
1. **OpenAI API-Schlüssel**: Überprüfen Sie, ob sie korrekt gesetzt sind
2. **Modellverfügbarkeit**: Prüfen Sie, ob Ihre Region das Modell unterstützt
3. **Netzwerkverbindung**: Stellen Sie sicher, dass Dienste kommunizieren können
4. **RBAC-Berechtigungen**: Überprüfen Sie, ob die App auf OpenAI zugreifen kann

**Debugging-Befehle:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: KI-Anwendungen an Ihre Bedürfnisse anpassen

### Schritt 3.1: KI-Konfiguration ändern

1. **OpenAI-Modell aktualisieren:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Zusätzliche KI-Dienste hinzufügen:**

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

1. **Erstellen Sie eine Produktionsumgebung:**
```bash
azd env new myai-production
```

2. **Setzen Sie produktspezifische Parameter:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab-Übung 3.1: Kostenoptimierung**

**Herausforderung**: Konfigurieren Sie die Vorlage für kosteneffiziente Entwicklung.

**Aufgaben:**
1. Identifizieren Sie, welche SKUs auf kostenlose/basische Stufen gesetzt werden können
2. Konfigurieren Sie Umgebungsvariablen für minimale Kosten
3. Bereitstellen und Kosten mit der Produktionskonfiguration vergleichen

**Lösungshinweise:**
- Verwenden Sie die F0 (kostenlose) Stufe für Cognitive Services, wenn möglich
- Verwenden Sie die Basic-Stufe für den Suchdienst in der Entwicklung
- Ziehen Sie den Verbrauchsplan für Funktionen in Betracht

## Modul 4: Sicherheit und Best Practices für die Produktion

### Schritt 4.1: Sichere Verwaltung von Zugangsdaten

**Aktuelle Herausforderung**: Viele KI-Anwendungen codieren API-Schlüssel hart oder verwenden unsicheren Speicher.

**AZD-Lösung**: Managed Identity + Key Vault-Integration.

1. **Überprüfen Sie die Sicherheitskonfiguration in Ihrer Vorlage:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Überprüfen Sie, ob Managed Identity funktioniert:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Schritt 4.2: Netzwerksicherheit

1. **Private Endpunkte aktivieren** (falls noch nicht konfiguriert):

Fügen Sie Ihrer Bicep-Vorlage hinzu:
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

1. **Application Insights konfigurieren:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **KI-spezifisches Monitoring einrichten:**

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

### **Lab-Übung 4.1: Sicherheitsprüfung**

**Aufgabe**: Überprüfen Sie Ihre Bereitstellung auf Sicherheitsbest Practices.

**Checkliste:**
- [ ] Keine hartcodierten Geheimnisse im Code oder in der Konfiguration
- [ ] Managed Identity für Dienst-zu-Dienst-Authentifizierung verwendet
- [ ] Key Vault speichert sensible Konfiguration
- [ ] Netzwerkzugriff ist ordnungsgemäß eingeschränkt
- [ ] Monitoring und Logging sind aktiviert

## Modul 5: Ihre eigene KI-Anwendung konvertieren

### Schritt 5.1: Bewertungsbogen

**Bevor Sie Ihre App konvertieren**, beantworten Sie diese Fragen:

1. **Anwendungsarchitektur:**
   - Welche KI-Dienste verwendet Ihre App?
   - Welche Compute-Ressourcen benötigt sie?
   - Benötigt sie eine Datenbank?
   - Welche Abhängigkeiten bestehen zwischen den Diensten?

2. **Sicherheitsanforderungen:**
   - Welche sensiblen Daten verarbeitet Ihre App?
   - Welche Compliance-Anforderungen haben Sie?
   - Benötigen Sie privates Networking?

3. **Skalierungsanforderungen:**
   - Welche Last erwarten Sie?
   - Benötigen Sie Auto-Skalierung?
   - Gibt es regionale Anforderungen?

### Schritt 5.2: Erstellen Sie Ihre AZD-Vorlage

**Folgen Sie diesem Muster, um Ihre App zu konvertieren:**

1. **Erstellen Sie die Grundstruktur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

### **Lab-Übung 5.1: Vorlage-Erstellungs-Challenge**

**Herausforderung**: Erstellen Sie eine AZD-Vorlage für eine Dokumentenverarbeitungs-KI-App.

**Anforderungen:**
- Azure OpenAI für Inhaltsanalyse
- Document Intelligence für OCR
- Storage Account für Dokumenten-Uploads
- Function App für Verarbeitungslogik
- Web-App für Benutzeroberfläche

**Bonuspunkte:**
- Fügen Sie eine ordnungsgemäße Fehlerbehandlung hinzu
- Integrieren Sie eine Kostenabschätzung
- Richten Sie Monitoring-Dashboards ein

## Modul 6: Häufige Probleme beheben

### Häufige Bereitstellungsprobleme

#### Problem 1: OpenAI-Dienstkontingent überschritten
**Symptome:** Bereitstellung schlägt mit Kontingentfehler fehl  
**Lösungen:**  
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell in Region nicht verfügbar
**Symptome:** KI-Antworten schlagen fehl oder Modellbereitstellungsfehler  
**Lösungen:**  
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Berechtigungsprobleme
**Symptome:** 403 Forbidden-Fehler beim Aufrufen von KI-Diensten  
**Lösungen:**  
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Leistungsprobleme

#### Problem 4: Langsame KI-Antworten
**Untersuchungsschritte:**
1. Überprüfen Sie Leistungsmetriken in Application Insights
2. Überprüfen Sie OpenAI-Dienstmetriken im Azure-Portal
3. Überprüfen Sie Netzwerkverbindung und Latenz

**Lösungen:**
- Implementieren Sie Caching für häufige Anfragen
- Verwenden Sie das passende OpenAI-Modell für Ihren Anwendungsfall
- Ziehen Sie Lese-Replikate für Szenarien mit hoher Last in Betracht

### **Lab-Übung 6.1: Debugging-Challenge**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die Anwendung gibt 500-Fehler zurück.

**Debugging-Aufgaben:**
1. Überprüfen Sie Anwendungsprotokolle
2. Überprüfen Sie die Dienstkonnektivität
3. Testen Sie die Authentifizierung
4. Überprüfen Sie die Konfiguration

**Verwendbare Tools:**
- `azd show` für Bereitstellungsübersicht
- Azure-Portal für detaillierte Dienstprotokolle
- Application Insights für Anwendungs-Telemetrie

## Modul 7: Monitoring und Optimierung

### Schritt 7.1: Umfassendes Monitoring einrichten

1. **Erstellen Sie benutzerdefinierte Dashboards:**

Navigieren Sie zum Azure-Portal und erstellen Sie ein Dashboard mit:
- OpenAI-Anfrageanzahl und Latenz
- Anwendungsfehlerraten
- Ressourcennutzung
- Kostenüberwachung

2. **Richten Sie Warnungen ein:**
```bash
# Alert for high error rate
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
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementieren Sie Kostenkontrollen:**
- Richten Sie Budgetwarnungen ein
- Verwenden Sie Auto-Skalierungsrichtlinien
- Implementieren Sie Anfrage-Caching
- Überwachen Sie die Token-Nutzung für OpenAI

### **Lab-Übung 7.1: Leistungsoptimierung**

**Aufgabe**: Optimieren Sie Ihre KI-Anwendung sowohl für Leistung als auch Kosten.

**Zu verbessernde Metriken:**
- Reduzieren Sie die durchschnittliche Antwortzeit um 20 %
- Senken Sie die monatlichen Kosten um 15 %
- Halten Sie eine Verfügbarkeit von 99,9 % aufrecht

**Strategien, die Sie ausprobieren können:**
- Implementieren Sie Antwort-Caching
- Optimieren Sie Prompts für Token-Effizienz
- Verwenden Sie passende Compute-SKUs
- Richten Sie ordnungsgemäßes Auto-Skalierung ein

## Abschluss-Challenge: End-to-End-Implementierung

### Herausforderungsszenario

Sie sind beauftragt, einen produktionsreifen KI-gestützten Kundenservice-Chatbot mit folgenden Anforderungen zu erstellen:

**Funktionale Anforderungen:**
- Web-Oberfläche für Kundeninteraktionen
- Integration mit Azure OpenAI für Antworten
- Dokumentensuchfunktionalität mit Cognitive Search
- Integration mit bestehender Kundendatenbank
- Unterstützung für mehrere Sprachen

**Nicht-funktionale Anforderungen:**
- Verarbeitung von 1000 gleichzeitigen Benutzern
- SLA von 99,9 % Verfügbarkeit
- SOC 2-Konformität
- Kosten unter $500/Monat
- Bereitstellung in mehreren Umgebungen (Entwicklung, Staging, Produktion)

### Implementierungsschritte

1. **Entwerfen Sie die Architektur**
2. **Erstellen Sie die AZD-Vorlage**
3. **Implementieren Sie Sicherheitsmaßnahmen**
4. **Richten Sie Monitoring und Warnungen ein**
5. **Erstellen Sie Bereitstellungspipelines**
6. **Dokumentieren Sie die Lösung**

### Bewertungskriterien

- ✅ **Funktionalität**: Erfüllt es alle Anforderungen?
- ✅ **Sicherheit**: Sind Best Practices umgesetzt?
- ✅ **Skalierbarkeit**: Kann es die Last bewältigen?
- ✅ **Wartbarkeit**: Ist der Code und die Infrastruktur gut organisiert?
- ✅ **Kosten**: Bleibt es im Budget?

## Zusätzliche Ressourcen

### Microsoft-Dokumentation
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI-Dienst-Dokumentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI Foundry-Dokumentation](https://learn.microsoft.com/azure/ai-studio/)

### Beispielvorlagen
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community-Ressourcen
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Abschlusszertifikat
Herzlichen Glückwunsch! Du hast das AI Workshop Lab abgeschlossen. Du solltest jetzt in der Lage sein:

- ✅ Bestehende KI-Anwendungen in AZD-Vorlagen umzuwandeln
- ✅ Produktionsreife KI-Anwendungen bereitzustellen
- ✅ Sicherheitsbest-Practices für KI-Workloads umzusetzen
- ✅ Die Leistung von KI-Anwendungen zu überwachen und zu optimieren
- ✅ Häufige Probleme bei der Bereitstellung zu beheben

### Nächste Schritte
1. Wende diese Muster auf deine eigenen KI-Projekte an
2. Trage Vorlagen zur Community bei
3. Trete dem Azure AI Foundry Discord bei, um fortlaufende Unterstützung zu erhalten
4. Erkunde fortgeschrittene Themen wie Multi-Region-Bereitstellungen

---

**Workshop-Feedback**: Hilf uns, diesen Workshop zu verbessern, indem du deine Erfahrungen im [Azure AI Foundry Discord #Azure-Kanal](https://discord.gg/microsoft-azure) teilst.

---

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-First-Entwicklung
- **⬅️ Vorheriges**: [Bereitstellung von KI-Modellen](ai-model-deployment.md)
- **➡️ Nächstes**: [Best Practices für Produktions-KI](production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

**Brauchen Sie Hilfe?** Treten Sie unserer Community bei, um Unterstützung und Diskussionen zu AZD und KI-Bereitstellungen zu erhalten.

---

