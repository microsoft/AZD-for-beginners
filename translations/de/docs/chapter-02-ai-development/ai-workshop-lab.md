# AI Workshop Lab: Ihre KI-Lösungen AZD-bereit machen

**Chapter Navigation:**
- **📚 Kursstart**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Vorheriges**: [Bereitstellung von KI-Modellen](ai-model-deployment.md)
- **➡️ Nächstes**: [Best Practices für Produktions-KI](production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Dieses praxisorientierte Labor führt Entwickler durch den Prozess, eine vorhandene KI-Vorlage zu übernehmen und sie mit dem Azure Developer CLI (AZD) bereitzustellen. Sie lernen wesentliche Muster für Produktions-KI-Bereitstellungen mit Microsoft Foundry-Diensten kennen.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

Am Ende dieses Workshops werden Sie in der Lage sein:
- ✅ Eine bestehende KI-Anwendung so konvertieren, dass sie AZD-Vorlagen verwendet
- ✅ Microsoft Foundry-Dienste mit AZD konfigurieren
- ✅ Sichere Verwaltung von Zugangsdaten für KI-Dienste implementieren
- ✅ Produktionsreife KI-Anwendungen mit Monitoring bereitstellen
- ✅ Häufige Probleme bei KI-Bereitstellungen beheben

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installiert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installiert
- [Git](https://git-scm.com/) installiert
- Code-Editor (VS Code empfohlen)

### Azure Resources
- Azure-Abonnement mit Contributor-Zugriff
- Zugriff auf Microsoft Foundry Models-Dienste (oder Möglichkeit, Zugriff zu beantragen)
- Berechtigung zum Erstellen von Ressourcengruppen

### Knowledge Prerequisites
- Grundlegendes Verständnis von Azure-Diensten
- Vertrautheit mit Kommandozeilen-Schnittstellen
- Grundlegende KI/ML-Konzepte (APIs, Modelle, Prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD-Installation prüfen
azd version

# Azure CLI prüfen
az --version

# Bei Azure anmelden
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Untersuchen Sie die wichtigen Dateien in einer KI-bereiten AZD-Vorlage:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
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

**What to look for:**
- Dienstdefinitionen für KI-Komponenten
- Zuordnungen von Umgebungsvariablen
- Host-Konfigurationen

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Bereitstellung des Microsoft Foundry Models-Dienstes
- Integration von Cognitive Search
- Sichere Schlüsselverwaltung
- Netzwerk-Sicherheitskonfigurationen

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: KI-Anwendungen erfordern oft mehrere koordinierte Dienste
- **Security**: API-Schlüssel und Endpunkte müssen sicher verwaltet werden
- **Scalability**: KI-Workloads haben spezielle Skalierungsanforderungen
- **Cost Management**: KI-Dienste können teuer werden, wenn sie nicht richtig konfiguriert sind

## Module 2: Deploy Your First AI Application

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
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Stellt den Microsoft Foundry Models-Dienst bereit
- ✅ Erstellt den Cognitive Search-Dienst
- ✅ Richtet einen App Service für die Webanwendung ein
- ✅ Konfiguriert Netzwerk und Sicherheit
- ✅ Stellt den Anwendungscode bereit
- ✅ Richtet Monitoring und Protokollierung ein

2. **Monitor the deployment progress** and note the resources being created.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test the AI functionality:**
   - Navigieren Sie zur Webanwendung
   - Testen Sie Beispielabfragen
   - Verifizieren Sie, dass KI-Antworten funktionieren

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Ihre Bereitstellung war erfolgreich, aber die KI reagiert nicht.

**Common issues to check:**
1. **OpenAI API keys**: Überprüfen Sie, ob sie korrekt gesetzt sind
2. **Model availability**: Prüfen Sie, ob Ihre Region das Modell unterstützt
3. **Network connectivity**: Stellen Sie sicher, dass die Dienste kommunizieren können
4. **RBAC permissions**: Überprüfen Sie, ob die App auf OpenAI zugreifen kann

**Debugging commands:**
```bash
# Umgebungsvariablen überprüfen
azd env get-values

# Bereitstellungsprotokolle anzeigen
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI-Bereitstellungsstatus überprüfen
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# Wechseln Sie zu einem anderen Modell (falls in Ihrer Region verfügbar)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Mit der neuen Konfiguration neu bereitstellen
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

**Best Practice**: Unterschiedliche Konfigurationen für Entwicklung und Produktion.

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

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: Konfigurieren Sie die Vorlage für kostengünstige Entwicklung.

**Tasks:**
1. Identifizieren Sie, welche SKUs auf kostenlose/basic-Tarife gesetzt werden können
2. Konfigurieren Sie Umgebungsvariablen für minimale Kosten
3. Stellen Sie bereit und vergleichen Sie die Kosten mit der Produktionskonfiguration

**Solution hints:**
- Verwenden Sie nach Möglichkeit den F0 (kostenlosen) Tarif für Cognitive Services
- Verwenden Sie im Entwicklungsmodus den Basic-Tarif für den Search Service
- Erwägen Sie die Verwendung des Consumption-Plans für Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Viele KI-Anwendungen verankern API-Schlüssel im Code oder verwenden unsichere Speicher.

**AZD Solution**: Managed Identity + Key Vault-Integration.

1. **Review the security configuration in your template:**
```bash
# Suche nach Key Vault- und Managed-Identity-Konfiguration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# Überprüfen, ob die Web-App die korrekte Identitätskonfiguration hat.
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if not already configured):

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

### Step 4.3: Monitoring and Observability

1. **Configure Application Insights:**
```bash
# Application Insights sollte automatisch konfiguriert werden
# Überprüfen Sie die Konfiguration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

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

### **Lab Exercise 4.1: Security Audit**

**Task**: Überprüfen Sie Ihre Bereitstellung auf Sicherheits-Best-Practices.

**Checklist:**
- [ ] Keine hartcodierten Geheimnisse im Code oder in der Konfiguration
- [ ] Managed Identity für Service-zu-Service-Authentifizierung verwendet
- [ ] Key Vault speichert sensible Konfiguration
- [ ] Netzwerkzugriff ist ordnungsgemäß eingeschränkt
- [ ] Monitoring und Protokollierung sind aktiviert

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, beantworten Sie diese Fragen:

1. **Application Architecture:**
   - Welche KI-Dienste verwendet Ihre App?
   - Welche Rechenressourcen benötigt sie?
   - Benötigt sie eine Datenbank?
   - Welche Abhängigkeiten bestehen zwischen den Diensten?

2. **Security Requirements:**
   - Welche sensiblen Daten verarbeitet Ihre App?
   - Welche Compliance-Anforderungen haben Sie?
   - Benötigen Sie privates Networking?

3. **Scaling Requirements:**
   - Welche Last erwarten Sie?
   - Benötigen Sie Auto-Scaling?
   - Gibt es regionale Anforderungen?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

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

**Challenge**: Erstellen Sie eine AZD-Vorlage für eine Dokumentenverarbeitungs-KI-App.

**Requirements:**
- Microsoft Foundry Models für Inhaltsanalyse
- Document Intelligence für OCR
- Storage Account für Dokumenten-Uploads
- Function App für die Verarbeitungslogik
- Web-App für die Benutzeroberfläche

**Bonus points:**
- Fügen Sie eine ordnungsgemäße Fehlerbehandlung hinzu
- Fügen Sie eine Kostenschätzung hinzu
- Richten Sie Monitoring-Dashboards ein

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Die Bereitstellung schlägt mit einem Quota-Fehler fehl
**Solutions:**
```bash
# Überprüfen Sie die aktuellen Kontingente
az cognitiveservices usage list --location eastus

# Beantragen Sie eine Kontingenterhöhung oder versuchen Sie eine andere Region
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** KI-Antworten schlagen fehl oder Modellbereitstellungsfehler
**Solutions:**
```bash
# Modellverfügbarkeit nach Region prüfen
az cognitiveservices model list --location eastus

# Auf ein verfügbares Modell aktualisieren
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** 403 Forbidden-Fehler beim Aufrufen von KI-Diensten
**Solutions:**
```bash
# Überprüfe Rollen-Zuweisungen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Füge fehlende Rollen hinzu
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Überprüfen Sie Application Insights auf Performance-Metriken
2. Überprüfen Sie die OpenAI-Service-Metriken im Azure-Portal
3. Überprüfen Sie die Netzwerkkonnektivität und Latenz

**Solutions:**
- Implementieren Sie Caching für häufige Abfragen
- Verwenden Sie das passende OpenAI-Modell für Ihren Anwendungsfall
- Erwägen Sie Read Replicas für Szenarien mit hoher Last

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Ihre Bereitstellung war erfolgreich, aber die Anwendung gibt 500-Fehler zurück.

**Debugging tasks:**
1. Überprüfen Sie die Anwendungsprotokolle
2. Überprüfen Sie die Dienstkonnektivität
3. Testen Sie die Authentifizierung
4. Überprüfen Sie die Konfiguration

**Tools to use:**
- `azd show` für einen Bereitstellungsüberblick
- Azure-Portal für detaillierte Dienstprotokolle
- Application Insights für Applikationstelemetrie

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Navigieren Sie zum Azure-Portal und erstellen Sie ein Dashboard mit:
- OpenAI-Anfrageanzahl und Latenz
- Anwendungsfehlerraten
- Ressourcenauslastung
- Kostenverfolgung

2. **Set up alerts:**
```bash
# Alarm bei hoher Fehlerrate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# Verwenden Sie die Azure CLI, um Kostendaten abzurufen.
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Richten Sie Budget-Alerts ein
- Verwenden Sie Autoscaling-Richtlinien
- Implementieren Sie Anfrage-Caching
- Überwachen Sie die Token-Nutzung für OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Optimieren Sie Ihre KI-Anwendung hinsichtlich Performance und Kosten.

**Metrics to improve:**
- Reduzieren Sie die durchschnittliche Antwortzeit um 20%
- Reduzieren Sie die monatlichen Kosten um 15%
- Halten Sie 99,9% Betriebszeit aufrecht

**Strategies to try:**
- Implementieren Sie Response-Caching
- Optimieren Sie Prompts für Token-Effizienz
- Verwenden Sie geeignete Compute-SKUs
- Richten Sie ein geeignetes Autoscaling ein

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Sie sind damit beauftragt, einen produktionsbereiten, KI-gestützten Kundenservice-Chatbot mit folgenden Anforderungen zu erstellen:

**Functional Requirements:**
- Webschnittstelle für Kundeninteraktionen
- Integration mit Microsoft Foundry Models für Antworten
- Dokumentensuche mithilfe von Cognitive Search
- Integration mit der bestehenden Kundendatenbank
- Mehrsprachige Unterstützung

**Non-Functional Requirements:**
- Umgang mit 1000 gleichzeitigen Nutzern
- 99,9% Verfügbarkeits-SLA
- SOC 2-Compliance
- Kosten unter $500/Monat
- Bereitstellung in mehreren Umgebungen (dev, staging, prod)

### Implementation Steps

1. **Entwerfen Sie die Architektur**
2. **Erstellen Sie die AZD-Vorlage**
3. **Implementieren Sie Sicherheitsmaßnahmen**
4. **Richten Sie Monitoring und Alerting ein**
5. **Erstellen Sie Bereitstellungspipelines**
6. **Dokumentieren Sie die Lösung**

### Evaluation Criteria

- ✅ **Funktionalität**: Erfüllt es alle Anforderungen?
- ✅ **Sicherheit**: Sind Best Practices implementiert?
- ✅ **Skalierbarkeit**: Kann es die Last bewältigen?
- ✅ **Wartbarkeit**: Sind Code und Infrastruktur gut organisiert?
- ✅ **Kosten**: Bleibt es im Budget?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service-Dokumentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry-Dokumentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat-App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Schnellstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI auf GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD-Vorlagen](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

Herzlichen Glückwunsch! Sie haben das KI-Workshop-Labor abgeschlossen. Sie sollten jetzt in der Lage sein:
- ✅ Vorhandene KI-Anwendungen in AZD-Vorlagen konvertieren
- ✅ Produktionsreife KI-Anwendungen bereitstellen
- ✅ Sicherheits-Best-Practices für KI-Workloads implementieren
- ✅ KI-Anwendungsleistung überwachen und optimieren
- ✅ Häufige Bereitstellungsprobleme beheben

### Nächste Schritte
1. Wenden Sie diese Muster auf Ihre eigenen KI-Projekte an
2. Stellen Sie Vorlagen der Community zur Verfügung
3. Treten Sie dem Microsoft Foundry Discord für fortlaufende Unterstützung bei
4. Erkunden Sie fortgeschrittene Themen wie Bereitstellungen in mehreren Regionen

---

**Workshop-Feedback**: Helfen Sie uns, diesen Workshop zu verbessern, indem Sie Ihre Erfahrungen im [Microsoft Foundry Discord #Azure-Kanal](https://discord.gg/microsoft-azure) teilen.

---

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-orientierte Entwicklung
- **⬅️ Vorherige**: [KI-Modell-Bereitstellung](ai-model-deployment.md)
- **➡️ Nächste**: [Best Practices für KI in der Produktion](production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Benötigen Sie Hilfe?** Treten Sie unserer Community bei, um Unterstützung und Diskussionen zu AZD- und KI-Bereitstellungen zu erhalten.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache ist als maßgebliche Quelle zu betrachten. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->