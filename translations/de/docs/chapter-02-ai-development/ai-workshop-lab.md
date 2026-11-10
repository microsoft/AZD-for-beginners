# KI-Workshop-Labor: Ihre KI-Lösungen AZD-bereitstellbar machen

**Kapitelnavigation:**
- **📚 Kursstart**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 – KI-First Entwicklung
- **⬅️ Vorheriges**: [KI-Modell-Bereitstellung](ai-model-deployment.md)
- **➡️ Nächstes**: [Produktions-KI-Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Workshop-Übersicht

Dieses praxisorientierte Labor führt Entwickler durch den Prozess, eine vorhandene KI-Vorlage zu nehmen und diese mit Azure Developer CLI (AZD) bereitzustellen. Sie lernen wichtige Muster für produktionsgerechte KI-Bereitstellungen mit Microsoft Foundry-Diensten.

> **Release-Überprüfung (2026-11-04):** Die AZD-Befehlsanleitung und Beispielkonfigurationsnamen wurden mit der `azd` `1.37.2` Version und der aktuellen Konfiguration des verlinkten Beispiels abgeglichen. Dies ist eine Dokumentationsprüfung, keine Validierung einer Live-Bereitstellung. Das RAG-Labor benötigt nicht die Agent-Erweiterung; für Agentbewertung verwenden Sie die separate `azure.ai.evaluations` Erweiterung und [aktuellen Bewertungsworkflow](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), nicht die veralteten Agentbewertungsbefehle.

**Dauer:** 2-3 Stunden  
**Niveau:** Mittelstufe  
**Voraussetzungen:** Grundkenntnisse Azure, Vertrautheit mit KI/ML-Konzepten

## 🎓 Lernziele

Am Ende dieses Workshops werden Sie in der Lage sein:
- ✅ Eine vorhandene KI-AZD-Vorlage zu durchsuchen und die Umwandlung Ihrer eigenen Anwendung zu planen
- ✅ Microsoft Foundry-Dienste mit AZD zu konfigurieren
- ✅ Sichere Anmeldeinformationen für KI-Dienste zu verwalten
- ✅ Eine KI-Referenzanwendung mit Monitoring bereitzustellen
- ✅ Häufige KI-Bereitstellungsprobleme zu beheben

## Voraussetzungen

### Erforderliche Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installiert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installiert
- [Git](https://git-scm.com/) installiert
- Code-Editor (empfohlen: VS Code)

Diese Befehlsblöcke verwenden Bash-Syntax (einschließlich Zeilenfortsetzungen und `grep`). Unter Windows verwenden Sie Git Bash/WSL oder übersetzen sie in PowerShell. Installieren Sie außerdem die aufgeführten Sprach-, Paketmanager- und Container-Tools in der [lokalen Umgebungseinrichtung des Beispiels](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure-Ressourcen
- Azure-Abonnement mit Berechtigungen für Ressourcenerstellung und Rollenzuweisungen (Contributor allein kann keine RBAC-Zuweisungen erstellen; verwenden Sie eine autorisierte Rollenadministratorrolle oder das dokumentierte Äquivalent im Beispiel)
- Zugriff auf Microsoft Foundry Models-Dienste (oder Fähigkeit, Zugriff zu beantragen)
- Berechtigungen zur Ressourcengruppenerstellung

### Wissen-Voraussetzungen
- Grundlegendes Verständnis von Azure-Diensten
- Vertrautheit mit Kommandozeileninterfaces
- Grundlegende KI/ML-Konzepte (APIs, Modelle, Prompts)

## Lab Setup

### Schritt 1: Umgebungsvorbereitung

1. **Überprüfen Sie die Tool-Installationen:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Wenn Sie über mehrere Mandanten arbeiten oder Ihr Abonnement nicht automatisch erkannt wird, versuchen Sie es erneut mit `azd auth login --tenant-id <tenant-id>`.

2. **Klonen Sie das Workshop-Repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Aufbau der AZD-Struktur für KI-Anwendungen verstehen

### Anatomie einer KI-AZD-Vorlage

Erkunden Sie die wichtigsten Dateien einer KI-fähigen AZD-Vorlage:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Das ausgecheckte Beispiel kann sich ändern; `.azure/` erscheint nach der Initialisierung der Umgebung, nicht unbedingt in einem frischen Klon. Untersuchen Sie den tatsächlichen Checkout, anstatt fehlende Verzeichnisse zu erstellen, um dieser schematischen Darstellung zu entsprechen.

### **Lab-Übung 1.1: Konfiguration erkunden**

1. **Untersuchen Sie die azure.yaml Datei:**
```bash
cat azure.yaml
```

**Worauf Sie achten sollten:**
- Dienstdefinitionen für KI-Komponenten
- Umgebungsvariable-Mappings
- Host-Konfigurationen

2. **Überprüfen Sie die main.bicep Infrastruktur:**
```bash
cat infra/main.bicep
```

**Wichtige KI-Muster erkennen:**
- Bereitstellung des Microsoft Foundry Models-Dienstes
- Azure AI Search-Integration
- Sichere Schlüsselverwaltung
- Netzwerksicherheitskonfigurationen

### **Diskussionspunkt:** Warum diese Muster für KI wichtig sind

- **Dienstabhängigkeiten**: KI-Anwendungen benötigen oft mehrere koordinierte Dienste
- **Sicherheit**: API-Schlüssel und Endpunkte müssen sicher verwaltet werden
- **Skalierbarkeit**: KI-Workloads haben einzigartige Skalierungsanforderungen
- **Kostenmanagement**: KI-Dienste können teuer sein, wenn sie nicht richtig konfiguriert sind

## Modul 2: Ihre erste KI-Anwendung bereitstellen

### Schritt 2.1: Die Umgebung initialisieren

1. **Erstellen Sie eine neue AZD-Umgebung:**
```bash
azd env new myai-workshop
```

2. **Setzen Sie erforderliche Parameter:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Schritt 2.2: Infrastruktur und Anwendung bereitstellen

1. **Bereitstellung mit AZD:**
```bash
azd up
```

**Was während `azd up` passiert:**
- ✅ Provisioniert Microsoft Foundry Models-Dienst
- ✅ Erstellt Azure AI Search-Dienst
- ✅ Richtet Azure Container Apps für Backend und gebündeltes Frontend (Standard im aktuellen Beispiel) ein
- ✅ Konfiguriert Netzwerk und Sicherheit
- ✅ Stellt Anwendungscode bereit
- ✅ Richtet Monitoring und Logging ein

2. **Überwachen Sie den Bereitstellungsfortschritt** und achten Sie auf die erstellten Ressourcen.

### Schritt 2.3: Überprüfen Sie Ihre Bereitstellung

1. **Prüfen Sie die bereitgestellten Ressourcen:**
```bash
azd show
```

2. **Öffnen Sie die bereitgestellte Anwendung:**
```bash
azd show
```

Öffnen Sie den im `azd show` Output angezeigten Web-Endpunkt.

3. **Testen Sie die KI-Funktionalität:**
   - Navigieren Sie zur Webanwendung
   - Probieren Sie Beispielanfragen aus
   - Vergewissern Sie sich, dass KI-Antworten funktionieren

### **Lab-Übung 2.1: Fehlerbehebung üben**

**Szenario**: Ihre Bereitstellung ist erfolgreich, aber die KI antwortet nicht.

**Häufige Probleme prüfen:**
1. **Authentifizierung**: Überprüfen Sie verwaltete Identität und Rollenzuweisungen; prüfen Sie API-Schlüssel nur, wenn Sie bewusst schlüsselbasierte Authentifizierung aktiviert haben
2. **Modellverfügbarkeit**: Prüfen Sie, ob Ihre Region das Modell unterstützt
3. **Netzwerkverbindung**: Stellen Sie sicher, dass die Dienste kommunizieren können
4. **RBAC-Berechtigungen**: Vergewissern Sie sich, dass die App Zugriff auf OpenAI hat

**Debug-Befehle:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: KI-Anwendungen an Ihre Bedürfnisse anpassen

### Schritt 3.1: KI-Konfiguration ändern

1. **OpenAI-Modell aktualisieren:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Weitere KI-Dienste hinzufügen:**

Bearbeiten Sie `infra/main.bicep`, um Document Intelligence hinzuzufügen:

Das Folgende ist ein illustrativer Ausschnitt, keine vollständige Vorlage. Das Beispiel stellt möglicherweise bereits Dokumentverarbeitungsdienste bereit: Prüfen Sie vor dem Hinzufügen doppelter Ressourcen die aktuelle Infrastruktur. Benutzerdefinierte Ergänzungen erfordern Verkabelung von Outputs, Identitäten und Anwendungskonfiguration.

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

**Beste Praxis**: Unterschiedliche Konfigurationen für Entwicklung vs. Produktion.

1. **Erstellen Sie eine Produktionsumgebung:**
```bash
azd env new myai-production
```

2. **Setzen Sie produktspezifische Parameter:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Diese Namen stammen aus der Beispiel-[main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json). `azd env set` speichert einen Wert, macht eine beliebige Variable jedoch nicht wirksam: Die Vorlage muss ihn verwenden. Prüfen Sie die Beispiel-[Netzwerkisolation](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md), bevor Sie den öffentlichen Zugriff deaktivieren, und verwenden Sie `azd up`, um Infrastrukturänderungen anzuwenden. OpenAI SKU `S0` allein bestimmt nicht den Modeldurchsatz; auch Modellbereitstellungstyp und Kapazität sind wichtig.

### **Lab-Übung 3.1: Kostenoptimierung**

**Herausforderung**: Konfigurieren Sie die Vorlage für kosteneffiziente Entwicklung.

**Aufgaben:**
1. Wählen Sie die entbehrliche Workshop-Umgebung: `azd env select myai-workshop`.
2. Notieren Sie aktuelle Search SKU und Modellkapazität aus `infra/main.parameters.json` und der ausgewählten Umgebung.
3. Verwenden Sie die unterstützten Eingaben unten, nach Bestätigung der Modell-/Regionalquote:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Überprüfen Sie Search SKU und Bereitstellungskapazität im Portal und schätzen Sie die Differenz mit dem Preisrechner. Rechnen Sie nicht damit, dass Abrechnungsdaten sofort aktualisiert werden.

**Erfolgskriterien:** Search nutzt Basic, die Chat-Bereitstellung hat die gewünschte unterstützte Kapazität, und die App beantwortet weiterhin eine Beispielanfrage. Kapazität `10` ist eine Rate-Limit-Allokation, kein Tokenpreisnachlass. Such-Stufen-Änderungen können eingeschränkt sein oder eine Neuerstellung erfordern; experimentieren Sie nicht mit Produktionsressourcen. F0 ist dienstspezifisch, keine Azure OpenAI Modell-SKU.

## Modul 4: Sicherheit und Best Practices für die Produktion

### Schritt 4.1: Sichere Anmeldeinformationsverwaltung

**Aktuelles Problem**: Viele KI-Anwendungen kodieren API-Schlüssel oder verwenden unsichere Speicher.

**AZD-Lösung**: Managed Identity + Key Vault-Integration.

1. **Überprüfen Sie die Sicherheitskonfiguration Ihrer Vorlage:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifizieren Sie, dass Managed Identity funktioniert:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Schritt 4.2: Netzwerksicherheit

1. **Aktivieren Sie private Endpunkte** mit der unterstützten Netzwerkkonfiguration des Beispiels (falls noch nicht konfiguriert).

Für Ihre eigene Vorlage zeigt dieser illustrative Ausschnitt die OpenAI-Endpunktverbindung. Es benötigt außerdem ein VNet, private DNS-Konfiguration und Anwendungs-Konnektivität; fügen Sie es nicht unverändert ins Beispiel ein, das bereits private Endpunkt-Module hat:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Aktivieren Sie die Application Insights-Integration des Beispiels:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Die Instrumentierung des Beispiels sendet Telemetriedaten; eine beliebige `OPENAI_MONITOR_ENABLED` Einstellung aktiviert keine KI-Kennzahlen. Prüfen Sie Traces für Modellaufrufe, Latenz, Fehler und Token-Nutzung, und vermeiden Sie das Aufzeichnen sensibler Prompts oder Antworten.

### **Lab-Übung 4.1: Sicherheitsaudit**

**Aufgabe**: Prüfen Sie Ihre Bereitstellung auf Sicherheitsbest Practices.

**Checkliste:**
- [ ] Keine hartkodierten Geheimnisse im Code oder der Konfiguration
- [ ] Managed Identity für Dienst-zu-Dienst-Authentifizierung verwendet
- [ ] Key Vault speichert sensible Konfiguration
- [ ] Netzwerkzugriffe sind angemessen eingeschränkt
- [ ] Monitoring und Logging sind aktiviert

## Modul 5: Ihre eigene KI-Anwendung konvertieren

### Schritt 5.1: Bewertungsarbeitsblatt

**Bevor Sie Ihre App konvertieren**, beantworten Sie diese Fragen:

1. **Anwendungsarchitektur:**
   - Welche KI-Dienste nutzt Ihre App?
   - Welche Ressourcen benötigt sie?
   - Benötigt sie eine Datenbank?
   - Welche Abhängigkeiten bestehen zwischen Diensten?

2. **Sicherheitsanforderungen:**
   - Welche sensiblen Daten verarbeitet Ihre App?
   - Welche Compliance-Anforderungen gibt es?
   - Benötigen Sie privates Networking?

3. **Skalierungsanforderungen:**
   - Wie hoch ist die erwartete Last?
   - Benötigen Sie Auto-Skalierung?
   - Gibt es regionale Anforderungen?

### Schritt 5.2: Erstellen Sie Ihre AZD-Vorlage

**Folgen Sie diesem Muster, um Ihre App zu konvertieren:**

**Nur Scaffold:** Dieser Abschnitt enthält keinen API-/Webanwendungs-Quellcode, keine Host-Infrastruktur, Modellbereitstellungen, Identity/RBAC oder eine fertiggestellt `main.parameters.json`. Die ressourcengruppenbezogene Bicep-Datei zeigt die Modulkomposition; ein typischer AZD-Abonnement-Einstiegspunkt muss eine Ressourcengruppe erstellen und diese auf diesem Scope aufrufen. Erwarten Sie nicht, dass `azd up` eine vollständige App bereitstellt, wenn Sie nur diese Fragmente kopieren. Für eine ausführbare Basis behalten Sie das RAG-Beispiel aus Modul 1 bei.

1. **Erstellen Sie die Grundstruktur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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

**infra/main.bicep** – Hauptvorlage:
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

**infra/modules/openai.bicep** – OpenAI-Modul:
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab-Übung 5.1: Vorlage-Erstellungsherausforderung**

**Herausforderung**: Erstellen Sie eine AZD-Vorlage für eine KI-Dokumentenverarbeitungsanwendung.

**Anforderungen:**
- Microsoft Foundry Models für Inhaltsanalyse
- Document Intelligence für OCR
- Speicherkonto für Dokumenten-Uploads
- Function App für Verarbeitungslogik
- Web-App für Benutzeroberfläche

**Bonuspunkte:**
- Fügen Sie angemessene Fehlerbehandlung hinzu
- Einschluss der Kostenschätzung
- Erstellen Sie Monitoring-Dashboards

## Modul 6: Häufige Probleme beheben

### Häufige Bereitstellungsprobleme

#### Problem 1: OpenAI-Dienstkontingent überschritten
**Symptome:** Bereitstellung schlägt mit Kontingent-Fehler fehl
**Lösungen:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell in Region nicht verfügbar
**Symptome:** KI-Antworten fehlschlagen oder Modellbereitstellungsfehler
**Lösungen:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problem 3: Berechtigungsprobleme
**Symptome:** 403 Forbidden-Fehler bei KI-Dienstaufrufen
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
1. Prüfen Sie Application Insights auf Leistungskennzahlen
2. Überprüfen Sie OpenAI-Dienstkennzahlen im Azure-Portal
3. Verifizieren Sie Netzwerkverbindung und Latenz

**Lösungen:**
- Implementieren Sie Caching für häufige Abfragen
- Verwenden Sie das passende OpenAI-Modell für Ihren Anwendungsfall
- Skalieren Sie Anwendungskopien nur nach Prüfung der Modell-RPM/TPM-Grenzen; Azure OpenAI-Bereitstellungen bieten keine generische Datenbank-"read replica"-Einstellung

### **Lab-Übung 6.1: Debugging-Herausforderung**

**Szenario**: Ihre Bereitstellung war erfolgreich, aber die Anwendung liefert 500er-Fehler.

**Debugging-Aufgaben:**
1. Prüfen Sie Anwendungsprotokolle
2. Verifizieren Sie Dienstverbindung
3. Authentifizierung testen
4. Konfiguration überprüfen

**Zu verwendende Tools:**
- `azd show` für eine Übersicht der Bereitstellungen
- Azure-Portal für detaillierte Servicelogs
- Application Insights für Anwendungs-Telemetrie

## Modul 7: Überwachung und Optimierung

### Schritt 7.1: Umfassende Überwachung einrichten

1. **Benutzerdefinierte Dashboards erstellen:**

Navigiere zum Azure-Portal und erstelle ein Dashboard mit:
- OpenAI-Anfrageanzahl und Latenz
- Anwendungsfehlerquoten
- Ressourcennutzung
- Kostenverfolgung

2. **Alarme einrichten:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Überprüfe, ob die Komponente Anfragetelemetrie ausgibt, und füge eine Aktionsgruppe hinzu, falls Benachrichtigungen erforderlich sind. Die Metrik ist eine Zählung, kein Fehlerprozentsatz; eine Rate Alarmierung benötigt eine passende Abfrage und Nenner.

### Schritt 7.2: Kostenoptimierung

1. **Aktuelle Kosten analysieren:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Ersetze die Datumsplatzhalter. Die Consumption API-Unterstützung variiert je nach Abrechnungsvereinbarung; verwende Kostenmanagement im Portal, wenn Nutzungsdetails nicht verfügbar sind. Kosten verzögern sich, sind kein Echtzeit-Testorakel.

2. **Kostenkontrollen implementieren:**
- Budgetwarnungen einrichten
- Autoskalierungspolicies verwenden
- Anforderungscaching implementieren
- Token-Nutzung für OpenAI überwachen

### **Laborausübung 7.1: Leistungsoptimierung**

**Aufgabe**: Optimiere deine KI-Anwendung hinsichtlich Leistung und Kosten.

**Zu verbessernde Metriken:**
- Durchschnittliche Antwortzeit um 20 % reduzieren
- Monatliche Kosten um 15 % senken
- Definiere ein 99,9 % Verfügbarkeits-SLO und ein Messfenster (ein kurzes Labor kann keine monatliche Betriebszeit demonstrieren)

**Strategien zum Ausprobieren:**
- Antwort-Caching implementieren
- Prompts für Token-Effizienz optimieren
- Geeignete Compute-SKUs verwenden
- Effektive Autoskalierung einrichten

## Abschlussherausforderung: End-to-End-Implementierung

### Szenario der Herausforderung

Dies ist eine **optionale Architektur-/Design-Herausforderung**, keine gelieferte ausführbare Übung oder Produktionszertifizierung. Schlage einen KI-gesteuerten Kundenservice-Chatbot vor und dokumentiere, welche Anforderungen weitere Implementierung und Nachweise benötigen:

**Funktionale Anforderungen:**
- Web-Interface für Kundeninteraktionen
- Integration mit Microsoft Foundry Models für Antworten
- Dokumentensuche mit Azure AI Search
- Integration mit bestehender Kundendatenbank
- Mehrsprachige Unterstützung

**Nicht-funktionale Anforderungen:**
- Handle 1000 gleichzeitige Nutzer
- 99,9 % Verfügbarkeits-SLA
- SOC 2 Compliance
- Kosten unter 500 $/Monat
- Bereitstellung in mehreren Umgebungen (Entwicklung, Test, Produktion)

Dies sind hypothetische Stakeholder-Anforderungen, keine gleichzeitig garantierten Ergebnisse. Definiere Anfragefrequenz, Prompt-/Ausgabegrößen und Sitzungsdauer, bevor Kosten geschätzt werden; 1.000 gleichzeitige Nutzer stellen keine Arbeitslast dar oder belegen, dass ein Budget von 500 $ machbar ist. SOC 2 ist ein organisatorisches Auditergebnis, kein per AZD-Vorlage aktivierbarer Schalter. Identifiziere Kompromisse und lehne unrealistische Anforderungen mit Nachweisen ab.

### Umsetzungs-Schritte

1. **Architektur entwerfen**
2. **Die AZD-Vorlage erstellen**
3. **Sicherheitsmaßnahmen implementieren**
4. **Überwachungs- und Alarmierungs-Setup**
5. **Deployment-Pipelines erstellen**
6. **Die Lösung dokumentieren**

### Bewertungskriterien

- ✅ **Funktionalität**: Sind implementierte Funktionen demonstriert und bestehende Lücken klar benannt?
- ✅ **Sicherheit**: Sind Best Practices umgesetzt?
- ✅ **Skalierbarkeit**: Kann die Lösung die Last bewältigen?
- ✅ **Wartbarkeit**: Ist Code und Infrastruktur gut organisiert?
- ✅ **Kosten**: Bleibt der Rahmen eingehalten?

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

## 🎓 Abschlusskontrolle

Glückwunsch! Du hast das AI Workshop Lab abgeschlossen. Du solltest nun in der Lage sein:

- ✅ Zu erklären, wie eine bestehende KI-Anwendung auf eine AZD-Vorlage angepasst wird
- ✅ Eine KI-Referenzanwendung bereitzustellen und zu testen
- ✅ Sicherheits-Best-Practices für KI-Workloads umzusetzen
- ✅ Die Leistung von KI-Anwendungen zu überwachen und zu optimieren
- ✅ Häufige Bereitstellungsprobleme zu beheben

**Aufräumen:** Führe `azd env list` aus, wähle jede in diesem Labor erstellte Testumgebung (`myai-workshop`; falls bereitgestellt `myai-production`/`myai-quota-test`) und führe `azd down` in jeder aus. Prüfe den Löschplan; das Löschen der lokalen Konfiguration einer Umgebung löscht nicht automatisch Azure-Ressourcen. Vermeide `--purge`, es sei denn, du verstehst die irreversible Entfernung von soft-gelöschten Ressourcen.

### Nächste Schritte
1. Wende diese Muster auf deine eigenen KI-Projekte an
2. Trage Vorlagen zur Community zurück
3. Tritt dem Microsoft Foundry Discord für fortlaufenden Support bei
4. Erkunde fortgeschrittene Themen wie Multi-Region-Bereitstellungen

---

**Workshop-Feedback**: Hilf uns, diesen Workshop zu verbessern, indem du deine Erfahrungen im [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) teilst.

---

**Kapitel-Navigation:**
- **📚 Kursstartseite**: [AZD For Beginners](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - AI-First Entwicklung
- **⬅️ Vorheriges**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Nächstes**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brauchen Sie Hilfe?** Trete unserer Community bei für Support und Diskussionen zu AZD und KI-Bereitstellungen.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->