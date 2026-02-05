# AI Workshop Lab: Machen Sie Ihre KI-Lösungen AZD-bereit

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-First-Entwicklung
- **⬅️ Vorheriges**: [KI-Modellbereitstellung](ai-model-deployment.md)
- **➡️ Nächstes**: [Best Practices für produktive KI](production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

## Workshop-Übersicht

Dieses praxisorientierte Lab führt Entwickler durch den Prozess, eine bestehende KI-Vorlage zu nehmen und sie mit Azure Developer CLI (AZD) bereitzustellen. Sie lernen wesentliche Muster für produktive KI-Bereitstellungen mit Microsoft Foundry-Diensten.

**Dauer:** 2-3 Stunden  
**Level:** Mittelstufe  
**Voraussetzungen:** Grundkenntnisse in Azure, Vertrautheit mit KI/ML-Konzepten

## 🎓 Lernziele

Am Ende dieses Workshops werden Sie in der Lage sein:
- ✅ Eine bestehende KI-Anwendung in AZD-Vorlagen umzuwandeln
- ✅ Microsoft Foundry-Dienste mit AZD zu konfigurieren
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
- Azure-Abonnement mit Beitragszugriff
- Zugriff auf Azure OpenAI-Dienste (oder Möglichkeit, Zugriff anzufordern)
- Berechtigungen zur Erstellung von Ressourcengruppen

### Wissensvoraussetzungen
- Grundlegendes Verständnis von Azure-Diensten
- Vertrautheit mit Kommandozeilen-Schnittstellen
- Grundlegende KI/ML-Konzepte (APIs, Modelle, Prompts)

## Lab-Einrichtung

### Schritt 1: Vorbereitung der Umgebung

1. **Überprüfen Sie die Tool-Installationen:**
```bash
# Überprüfen Sie die AZD-Installation
azd version

# Überprüfen Sie die Azure CLI
az --version

# Melden Sie sich bei Azure an
az login
azd auth login
```

2. **Klonen Sie das Workshop-Repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Verständnis der AZD-Struktur für KI-Anwendungen

### Anatomie einer KI-AZD-Vorlage

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

1. **Untersuchen Sie die azure.yaml-Datei:**
```bash
cat azure.yaml
```

**Worauf Sie achten sollten:**
- Dienstdefinitionen für KI-Komponenten
- Zuordnungen von Umgebungsvariablen
- Host-Konfigurationen

2. **Überprüfen Sie die main.bicep-Infrastruktur:**
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

### Schritt 2.1: Die Umgebung initialisieren

1. **Erstellen Sie eine neue AZD-Umgebung:**
```bash
azd env new myai-workshop
```

2. **Erforderliche Parameter festlegen:**
```bash
# Legen Sie Ihre bevorzugte Azure-Region fest
azd env set AZURE_LOCATION eastus

# Optional: Legen Sie ein spezifisches OpenAI-Modell fest
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

### Schritt 2.3: Überprüfen Sie Ihre Bereitstellung

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
   - Überprüfen Sie, ob KI-Antworten funktionieren

### **Lab-Übung 2.1: Fehlerbehebung üben**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die KI reagiert nicht.

**Häufige Probleme, die überprüft werden sollten:**
1. **OpenAI-API-Schlüssel**: Überprüfen Sie, ob sie korrekt gesetzt sind
2. **Modellverfügbarkeit**: Prüfen Sie, ob Ihr Region das Modell unterstützt
3. **Netzwerkverbindung**: Stellen Sie sicher, dass Dienste kommunizieren können
4. **RBAC-Berechtigungen**: Überprüfen Sie, ob die App auf OpenAI zugreifen kann

**Fehlerbehebungsbefehle:**
```bash
# Überprüfen Sie Umgebungsvariablen
azd env get-values

# Anzeigen der Bereitstellungsprotokolle
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Überprüfen Sie den Bereitstellungsstatus von OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: KI-Anwendungen an Ihre Bedürfnisse anpassen

### Schritt 3.1: Die KI-Konfiguration ändern

1. **Aktualisieren Sie das OpenAI-Modell:**
```bash
# Wechseln Sie zu einem anderen Modell (falls in Ihrer Region verfügbar)
azd env set AZURE_OPENAI_MODEL gpt-4

# Erneut bereitstellen mit der neuen Konfiguration
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

2. **Produktionsspezifische Parameter festlegen:**
```bash
# Die Produktion verwendet normalerweise höhere SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Zusätzliche Sicherheitsfunktionen aktivieren
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab-Übung 3.1: Kostenoptimierung**

**Herausforderung**: Konfigurieren Sie die Vorlage für kosteneffektive Entwicklung.

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

**Aktuelle Herausforderung**: Viele KI-Anwendungen codieren API-Schlüssel hart oder verwenden unsichere Speicher.

**AZD-Lösung**: Managed Identity + Key Vault-Integration.

1. **Überprüfen Sie die Sicherheitskonfiguration in Ihrer Vorlage:**
```bash
# Suchen Sie nach Key Vault- und Managed Identity-Konfiguration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Überprüfen Sie, ob Managed Identity funktioniert:**
```bash
# Überprüfen Sie, ob die Webanwendung die richtige Identitätskonfiguration hat
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
# Application Insights sollte automatisch konfiguriert werden
# Überprüfen Sie die Konfiguration:
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
   - Benötigen Sie ein privates Netzwerk?

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

### **Lab-Übung 5.1: Vorlagen-Erstellungs-Challenge**

**Herausforderung**: Erstellen Sie eine AZD-Vorlage für eine Dokumentenverarbeitungs-KI-App.

**Anforderungen:**
- Azure OpenAI für Inhaltsanalyse
- Document Intelligence für OCR
- Storage Account für Dokumenten-Uploads
- Function App für Verarbeitungslogik
- Web-App für Benutzeroberfläche

**Bonuspunkte:**
- Fügen Sie eine ordnungsgemäße Fehlerbehandlung hinzu
- Integrieren Sie eine Kostenschätzung
- Richten Sie Monitoring-Dashboards ein

## Modul 6: Häufige Probleme beheben

### Häufige Bereitstellungsprobleme

#### Problem 1: OpenAI-Dienstkontingent überschritten
**Symptome:** Bereitstellung schlägt mit Kontingentfehler fehl
**Lösungen:**
```bash
# Überprüfen Sie die aktuellen Quoten
az cognitiveservices usage list --location eastus

# Fordern Sie eine Quotenerhöhung an oder versuchen Sie eine andere Region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell in Region nicht verfügbar
**Symptome:** KI-Antworten schlagen fehl oder Modellbereitstellungsfehler
**Lösungen:**
```bash
# Überprüfen Sie die Modellverfügbarkeit nach Region
az cognitiveservices model list --location eastus

# Aktualisieren Sie auf verfügbares Modell
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Berechtigungsprobleme
**Symptome:** 403 Forbidden-Fehler beim Aufrufen von KI-Diensten
**Lösungen:**
```bash
# Überprüfen Sie die Rollenzuweisungen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Fehlende Rollen hinzufügen
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Leistungsprobleme

#### Problem 4: Langsame KI-Antworten
**Untersuchungsschritte:**
1. Überprüfen Sie Application Insights auf Leistungsmetriken
2. Überprüfen Sie OpenAI-Dienstmetriken im Azure-Portal
3. Überprüfen Sie Netzwerkverbindung und Latenz

**Lösungen:**
- Implementieren Sie Caching für häufige Anfragen
- Verwenden Sie das passende OpenAI-Modell für Ihren Anwendungsfall
- Ziehen Sie Lese-Replikate für Szenarien mit hoher Last in Betracht

### **Lab-Übung 6.1: Debugging-Challenge**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die Anwendung gibt 500-Fehler zurück.

**Fehlerbehebungsaufgaben:**
1. Überprüfen Sie Anwendungsprotokolle
2. Überprüfen Sie die Dienstkonnektivität
3. Testen Sie die Authentifizierung
4. Überprüfen Sie die Konfiguration

**Verwendbare Tools:**
- `azd show` für Bereitstellungsübersicht
- Azure-Portal für detaillierte Dienstprotokolle
- Application Insights für Anwendungstelemetrie

## Modul 7: Monitoring und Optimierung

### Schritt 7.1: Umfassendes Monitoring einrichten

1. **Erstellen Sie benutzerdefinierte Dashboards:**

Navigieren Sie zum Azure-Portal und erstellen Sie ein Dashboard mit:
- OpenAI-Anfrageanzahl und Latenz
- Anwendungsfehlerraten
- Ressourcennutzung
- Kostenverfolgung

2. **Richten Sie Warnungen ein:**
```bash
# Warnung bei hoher Fehlerquote
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
# Verwenden Sie Azure CLI, um Kostendaten abzurufen
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementieren Sie Kostenkontrollen:**
- Budgetwarnungen einrichten
- Autoskalierungsrichtlinien verwenden
- Anfrage-Caching implementieren
- Token-Nutzung für OpenAI überwachen

### **Lab-Übung 7.1: Leistungsoptimierung**

**Aufgabe**: Optimieren Sie Ihre KI-Anwendung sowohl für Leistung als auch für Kosten.

**Zu verbessernde Metriken:**
- Durchschnittliche Antwortzeit um 20 % reduzieren
- Monatliche Kosten um 15 % senken
- 99,9 % Verfügbarkeit beibehalten

**Strategien zum Ausprobieren:**
- Antwort-Caching implementieren
- Prompts für Token-Effizienz optimieren
- Passende Compute-SKUs verwenden
- Ordentliche Autoskalierung einrichten

## Abschluss-Challenge: End-to-End-Implementierung

### Herausforderungsszenario

Sie sind beauftragt, einen produktionsreifen KI-gestützten Kundenservice-Chatbot mit folgenden Anforderungen zu erstellen:

**Funktionale Anforderungen:**
- Web-Oberfläche für Kundeninteraktionen
- Integration mit Azure OpenAI für Antworten
- Dokumentensuchfunktionalität mit Cognitive Search
- Integration mit bestehender Kundendatenbank
- Mehrsprachige Unterstützung

**Nicht-funktionale Anforderungen:**
- Verarbeitung von 1000 gleichzeitigen Benutzern
- 99,9 % Verfügbarkeits-SLA
- SOC 2-Konformität
- Kosten unter $500/Monat
- Bereitstellung in mehreren Umgebungen (Entwicklung, Staging, Produktion)

### Implementierungsschritte

1. **Architektur entwerfen**
2. **AZD-Vorlage erstellen**
3. **Sicherheitsmaßnahmen umsetzen**
4. **Monitoring und Warnungen einrichten**
5. **Bereitstellungspipelines erstellen**
6. **Lösung dokumentieren**

### Bewertungskriterien

- ✅ **Funktionalität**: Werden alle Anforderungen erfüllt?
- ✅ **Sicherheit**: Sind Best Practices umgesetzt?
- ✅ **Skalierbarkeit**: Kann die Lösung die Last bewältigen?
- ✅ **Wartbarkeit**: Ist der Code und die Infrastruktur gut organisiert?
- ✅ **Kosten**: Bleibt die Lösung im Budget?

## Zusätzliche Ressourcen

### Microsoft-Dokumentation
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI-Dienst-Dokumentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry-Dokumentation](https://learn.microsoft.com/azure/ai-studio/)

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

- ✅ Bestehende KI-Anwendungen in AZD-Vorlagen umzuwandeln
- ✅ Produktionsreife KI-Anwendungen bereitzustellen
- ✅ Sicherheitsbest-Practices für KI-Workloads umzusetzen
- ✅ Die Leistung von KI-Anwendungen zu überwachen und zu optimieren
- ✅ Häufige Probleme bei der Bereitstellung zu beheben

### Nächste Schritte
1. Wenden Sie diese Muster auf Ihre eigenen KI-Projekte an
2. Tragen Sie Vorlagen zur Community bei
3. Treten Sie dem Microsoft Foundry Discord bei, um fortlaufende Unterstützung zu erhalten
4. Erkunden Sie fortgeschrittene Themen wie Multi-Region-Bereitstellungen

---

**Workshop-Feedback**: Helfen Sie uns, diesen Workshop zu verbessern, indem Sie Ihre Erfahrungen im [Microsoft Foundry Discord #Azure-Kanal](https://discord.gg/microsoft-azure) teilen.

---

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-First-Entwicklung
- **⬅️ Vorheriges**: [KI-Modellbereitstellung](ai-model-deployment.md)
- **➡️ Nächstes**: [Best Practices für Produktions-KI](production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

**Brauchen Sie Hilfe?** Treten Sie unserer Community bei, um Unterstützung und Diskussionen über AZD und KI-Bereitstellungen zu erhalten.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->