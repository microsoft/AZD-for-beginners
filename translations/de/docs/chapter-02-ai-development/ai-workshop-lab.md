# AI Workshop Lab: Ihre KI-Lösungen AZD-bereitstellbar machen

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Previous**: [Bereitstellung von KI-Modellen](ai-model-deployment.md)
- **➡️ Next**: [Best Practices für KI in der Produktion](production-ai-practices.md)
- **🚀 Next Chapter**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Workshop Übersicht

Dieses praxisorientierte Labor führt Entwickler durch den Prozess, eine vorhandene KI-Vorlage zu übernehmen und mit dem Azure Developer CLI (AZD) bereitzustellen. Sie lernen wesentliche Muster für produktionsreife KI-Bereitstellungen mit Microsoft Foundry-Diensten kennen.

> **Validierungshinweis (2026-03-25):** Dieses Workshop wurde gegen `azd` `1.23.12` geprüft. Wenn Ihre lokale Installation älter ist, aktualisieren Sie AZD vor Beginn, damit Authentifizierungs-, Vorlagen- und Bereitstellungsabläufe mit den folgenden Schritten übereinstimmen.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Lernziele

Am Ende dieses Workshops werden Sie in der Lage sein:
- ✅ Eine vorhandene KI-Anwendung in AZD-Vorlagen zu konvertieren
- ✅ Microsoft Foundry-Dienste mit AZD zu konfigurieren
- ✅ Sichere Anmeldeinformationsverwaltung für KI-Dienste zu implementieren
- ✅ Produktionsreife KI-Anwendungen mit Monitoring bereitzustellen
- ✅ Häufige Probleme bei KI-Bereitstellungen zu beheben

## Voraussetzungen

### Erforderliche Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installiert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installiert
- [Git](https://git-scm.com/) installiert
- Code-Editor (VS Code empfohlen)

### Azure-Ressourcen
- Azure-Abonnement mit Contributor-Zugriff
- Zugriff auf Microsoft Foundry Models-Dienste (oder Möglichkeit, Zugriff anzufordern)
- Berechtigung zum Erstellen von Ressourcengruppen

### Fachliche Voraussetzungen
- Grundverständnis von Azure-Diensten
- Vertrautheit mit Kommandozeilenoberflächen
- Grundlegende AI/ML-Konzepte (APIs, Modelle, Prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD-Installation überprüfen
azd version

# Azure CLI überprüfen
az --version

# Bei Azure für AZD-Workflows anmelden
azd auth login

# Nur bei der Azure CLI anmelden, wenn Sie vorhaben, während der Diagnose az-Befehle auszuführen
az login
```

Wenn Sie in mehreren Tenants arbeiten oder Ihr Abonnement nicht automatisch erkannt wird, wiederholen Sie den Vorgang mit `azd auth login --tenant-id <tenant-id>`.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Erkunden Sie die wichtigsten Dateien in einer AZD-Vorlage, die KI-Ready ist:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**Worauf zu achten ist:**
- Service-Definitionen für KI-Komponenten
- Umgebungsvariablen-Zuordnungen
- Host-Konfigurationen

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Wesentliche KI-Muster, die zu identifizieren sind:**
- Bereitstellung des Microsoft Foundry Models-Dienstes
- Integration von Azure AI Search
- Sichere Schlüsselverwaltung
- Netzwerksicherheitskonfigurationen

### **Diskussionspunkt:** Warum diese Muster für KI wichtig sind

- **Service-Abhängigkeiten**: KI-Anwendungen erfordern häufig mehrere koordinierte Dienste
- **Sicherheit**: API-Schlüssel und Endpunkte müssen sicher verwaltet werden
- **Skalierbarkeit**: KI-Workloads haben spezielle Skalierungsanforderungen
- **Kostenmanagement**: KI-Dienste können teuer werden, wenn sie nicht richtig konfiguriert sind

## Modul 2: Deployen Ihrer ersten KI-Anwendung

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Legen Sie Ihre bevorzugte Azure-Region fest
azd env set AZURE_LOCATION eastus

# Optional: Legen Sie ein bestimmtes OpenAI-Modell fest
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**Was während `azd up` passiert:**
- ✅ Provisioniert den Microsoft Foundry Models-Dienst
- ✅ Erstellt den Azure AI Search-Dienst
- ✅ Richtet App Service für die Webanwendung ein
- ✅ Konfiguriert Netzwerk und Sicherheit
- ✅ Stellt den Anwendungs-Code bereit
- ✅ Richtet Monitoring und Logging ein

2. **Überwachen Sie den Bereitstellungsfortschritt** und beachten Sie die erstellten Ressourcen.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show
```

Öffnen Sie den im `azd show` ausgegebenen Web-Endpunkt.

3. **Test the AI functionality:**
   - Navigieren Sie zur Webanwendung
   - Probieren Sie Beispielabfragen aus
   - Verifizieren Sie, dass die KI-Antworten funktionieren

### **Lab Exercise 2.1: Troubleshooting Practice**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die KI antwortet nicht.

**Häufige Probleme, die zu prüfen sind:**
1. **OpenAI API keys**: Überprüfen Sie, ob sie korrekt gesetzt sind
2. **Model availability**: Prüfen Sie, ob Ihr Gebiet die Modellverfügbarkeit unterstützt
3. **Network connectivity**: Stellen Sie sicher, dass die Dienste kommunizieren können
4. **RBAC permissions**: Überprüfen Sie, ob die App auf OpenAI zugreifen kann

**Debugging-Befehle:**
```bash
# Umgebungsvariablen prüfen
azd env get-values

# Bereitstellungsprotokolle anzeigen
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Status der OpenAI-Bereitstellung prüfen
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Anpassen von KI-Anwendungen an Ihre Anforderungen

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# Wechseln Sie zu einem anderen Modell (falls es in Ihrer Region verfügbar ist)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Mit der neuen Konfiguration erneut bereitstellen
azd deploy
```

2. **Add additional AI services:**

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

### Step 3.2: Environment-Specific Configurations

**Beste Praxis**: Unterschiedliche Konfigurationen für Entwicklung und Produktion.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# In der Produktion werden typischerweise höhere SKUs verwendet
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Zusätzliche Sicherheitsfunktionen aktivieren
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Kostenoptimierung**

**Challenge**: Konfigurieren Sie die Vorlage für kosteneffiziente Entwicklung.

**Aufgaben:**
1. Ermitteln Sie, welche SKUs auf kostenlose/Basic-Stufen gesetzt werden können
2. Konfigurieren Sie Umgebungsvariablen für minimale Kosten
3. Deployen Sie und vergleichen Sie die Kosten mit der Produktionskonfiguration

**Lösungshinweise:**
- Verwenden Sie F0 (kostenlos) Tarif für Azure AI-Dienste, wenn möglich
- Verwenden Sie die Basic-Stufe für den Search-Dienst in der Entwicklung
- Erwägen Sie die Verwendung des Consumption-Plans für Functions

## Modul 4: Sicherheit und Produktions-Best Practices

### Step 4.1: Sichere Anmeldeinformationsverwaltung

**Aktuelle Herausforderung**: Viele KI-Apps codieren API-Schlüssel hart oder verwenden unsicheren Speicher.

**AZD-Lösung**: Managed Identity + Key Vault-Integration.

1. **Überprüfen Sie die Sicherheitskonfiguration in Ihrer Vorlage:**
```bash
# Nach der Konfiguration von Key Vault und verwalteter Identität suchen
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifizieren Sie, dass die Managed Identity funktioniert:**
```bash
# Überprüfen, ob die Webanwendung die korrekte Identitätskonfiguration hat
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Netzwerksicherheit

1. **Enable private endpoints** (falls nicht bereits konfiguriert):

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

### Step 4.3: Monitoring und Observability

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

### **Lab Exercise 4.1: Sicherheitsprüfung**

**Aufgabe**: Überprüfen Sie Ihre Bereitstellung auf Sicherheits-Best Practices.

**Checkliste:**
- [ ] Keine hartcodierten Geheimnisse im Code oder in der Konfiguration
- [ ] Managed Identity für Service-zu-Service-Authentifizierung verwendet
- [ ] Key Vault speichert sensible Konfiguration
- [ ] Netzwerkzugriff ist richtig eingeschränkt
- [ ] Monitoring und Logging sind aktiviert

## Modul 5: Konvertieren Ihrer eigenen KI-Anwendung

### Step 5.1: Assessment Worksheet

**Bevor Sie Ihre App konvertieren**, beantworten Sie diese Fragen:

1. **Anwendungsarchitektur:**
   - Welche KI-Dienste verwendet Ihre App?
   - Welche Compute-Ressourcen benötigt sie?
   - Benötigt sie eine Datenbank?
   - Welche Abhängigkeiten bestehen zwischen den Diensten?

2. **Sicherheitsanforderungen:**
   - Mit welchen sensiblen Daten arbeitet Ihre App?
   - Welche Compliance-Anforderungen bestehen?
   - Benötigen Sie privates Networking?

3. **Skalierungsanforderungen:**
   - Wie hoch ist die erwartete Last?
   - Benötigen Sie Auto-Scaling?
   - Gibt es regionale Anforderungen?

### Step 5.2: Create Your AZD Template

**Folgen Sie diesem Muster, um Ihre App zu konvertieren:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD-Vorlage initialisieren
azd init --template minimal
```

2. **Create azure.yaml:**
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

3. **Create infrastructure templates:**

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

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: Erstellen Sie eine AZD-Vorlage für eine Dokumentenverarbeitungs-KI-Anwendung.

**Anforderungen:**
- Microsoft Foundry Models für Inhaltsanalyse
- Document Intelligence für OCR
- Storage Account für Dokument-Uploads
- Function App für Verarbeitungslogik
- Web-App für die Benutzeroberfläche

**Bonus-Punkte:**
- Fügen Sie eine angemessene Fehlerbehandlung hinzu
- Integrieren Sie eine Kostenschätzung
- Richten Sie Monitoring-Dashboards ein

## Modul 6: Behebung häufiger Probleme

### Häufige Bereitstellungsprobleme

#### Problem 1: OpenAI Service-Quota überschritten
**Symptome:** Bereitstellung schlägt mit Quota-Fehler fehl
**Lösungen:**
```bash
# Aktuelle Kontingente prüfen
az cognitiveservices usage list --location eastus

# Kontingenterhöhung anfordern oder eine andere Region ausprobieren
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell in der Region nicht verfügbar
**Symptome:** KI-Antworten schlagen fehl oder Modellbereitstellung erzeugt Fehler
**Lösungen:**
```bash
# Modellverfügbarkeit nach Region prüfen
az cognitiveservices model list --location eastus

# Auf ein verfügbares Modell aktualisieren
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Berechtigungsprobleme
**Symptome:** 403 Forbidden-Fehler beim Aufrufen von KI-Diensten
**Lösungen:**
```bash
# Rollen-Zuweisungen prüfen
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
1. Prüfen Sie Application Insights auf Performance-Metriken
2. Überprüfen Sie OpenAI-Service-Metriken im Azure-Portal
3. Verifizieren Sie Netzwerkverbindung und Latenz

**Lösungen:**
- Implementieren Sie Caching für häufige Abfragen
- Verwenden Sie das geeignete OpenAI-Modell für Ihren Anwendungsfall
- Erwägen Sie Read Replicas für Hochlastszenarien

### **Lab Exercise 6.1: Debugging Challenge**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die Anwendung liefert 500-Fehler zurück.

**Debugging-Aufgaben:**
1. Prüfen Sie die Anwendungsprotokolle
2. Verifizieren Sie die Service-Konnektivität
3. Testen Sie die Authentifizierung
4. Überprüfen Sie die Konfiguration

**Zu verwendende Tools:**
- `azd show` für eine Übersicht der Bereitstellung
- Azure-Portal für detaillierte Service-Protokolle
- Application Insights für Anwendungs-Telemetrie

## Modul 7: Monitoring und Optimierung

### Step 7.1: Umfassendes Monitoring einrichten

1. **Erstellen Sie benutzerdefinierte Dashboards:**

Navigieren Sie zum Azure-Portal und erstellen Sie ein Dashboard mit:
- OpenAI-Anfrageanzahl und Latenz
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

### Step 7.2: Kostenoptimierung

1. **Analysieren Sie die aktuellen Kosten:**
```bash
# Verwenden Sie die Azure CLI, um Kostendaten abzurufen.
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementieren Sie Kosteneinschränkungen:**
- Richten Sie Budgetwarnungen ein
- Verwenden Sie Autoscaling-Richtlinien
- Implementieren Sie Request-Caching
- Überwachen Sie die Token-Nutzung für OpenAI

### **Lab Exercise 7.1: Performance-Optimierung**

**Aufgabe**: Optimieren Sie Ihre KI-Anwendung sowohl für Performance als auch Kosten.

**Metriken zur Verbesserung:**
- Durchschnittliche Antwortzeit um 20% reduzieren
- Monatliche Kosten um 15% senken
- 99,9% Verfügbarkeit beibehalten

**Strategien zum Ausprobieren:**
- Implementieren Sie Antwort-Caching
- Optimieren Sie Prompts für Token-Effizienz
- Verwenden Sie geeignete Compute-SKUs
- Richten Sie angemessenes Autoscaling ein

## Abschließende Herausforderung: Ende-zu-Ende-Implementierung

### Szenario der Herausforderung

Sie sollen einen produktionsreifen, KI-gestützten Kundendienst-Chatbot erstellen mit folgenden Anforderungen:

**Funktionale Anforderungen:**
- Web-Oberfläche für Kundeninteraktionen
- Integration mit Microsoft Foundry Models für Antworten
- Dokumentensuche mithilfe von Azure AI Search
- Integration mit bestehender Kundendatenbank
- Mehrsprachige Unterstützung

**Nicht-funktionale Anforderungen:**
- Handhabung von 1000 gleichzeitigen Nutzern
- 99,9% Betriebszeit-SLA
- SOC 2-Compliance
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

- ✅ **Funktionalität**: Erfüllt sie alle Anforderungen?
- ✅ **Sicherheit**: Sind Best Practices implementiert?
- ✅ **Skalierbarkeit**: Kann sie die Last bewältigen?
- ✅ **Wartbarkeit**: Ist Code und Infrastruktur gut organisiert?
- ✅ **Kosten**: Bleibt sie im Budget?

## Zusätzliche Ressourcen

### Microsoft-Dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Beispielvorlagen
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community-Ressourcen
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Abschlusszertifikat

Herzlichen Glückwunsch! Sie haben das KI-Workshop-Lab abgeschlossen. Sie sollten jetzt in der Lage sein:

- ✅ Bestehende KI-Anwendungen in AZD-Vorlagen konvertieren
- ✅ Produktionsreife KI-Anwendungen bereitstellen
- ✅ Sicherheits-Best-Practices für KI-Workloads implementieren
- ✅ Leistung von KI-Anwendungen überwachen und optimieren
- ✅ Häufige Bereitstellungsprobleme beheben

### Nächste Schritte
1. Wenden Sie diese Muster auf Ihre eigenen KI-Projekte an
2. Tragen Sie Vorlagen zur Community bei
3. Treten Sie dem Microsoft Foundry Discord für fortlaufende Unterstützung bei
4. Erkunden Sie fortgeschrittene Themen wie Bereitstellungen in mehreren Regionen

---

**Workshop-Feedback**: Helfen Sie uns, diesen Workshop zu verbessern, indem Sie Ihre Erfahrungen im [Microsoft Foundry Discord #Azure-Kanal](https://discord.gg/microsoft-azure) teilen.

---

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - AI-First-Entwicklung
- **⬅️ Vorheriges**: [Bereitstellung von KI-Modellen](ai-model-deployment.md)
- **➡️ Weiter**: [Best Practices für produktive KI](production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Benötigen Sie Hilfe?** Treten Sie unserer Community bei, um Unterstützung und Diskussionen über AZD- und KI-Bereitstellungen zu erhalten.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->