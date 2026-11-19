# Microsoft Foundry Integration mit AZD

**Kapitel-Navigation:**
- **📚 Kursstartseite**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - AI-First Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Dein erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nächstes**: [KI-Agenten](agents.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Übersicht

Dieser Leitfaden zeigt, wie man Microsoft Foundry-Dienste mit der Azure Developer CLI (AZD) für vereinfachte KI-Anwendungsbereitstellungen integriert. Microsoft Foundry bietet eine umfassende Plattform zum Erstellen, Bereitstellen und Verwalten von KI-Anwendungen, während AZD den Infrastruktur- und Bereitstellungsprozess vereinfacht.

## Was ist Microsoft Foundry?

Microsoft Foundry ist die einheitliche Plattform von Microsoft für die KI-Entwicklung, die umfasst:

- **Modelkatalog**: Zugang zu modernsten KI-Modellen
- **Prompt Flow**: Visueller Designer für KI-Arbeitsabläufe
- **Microsoft Foundry Portal**: Integrierte Entwicklungsumgebung für KI-Anwendungen
- **Bereitstellungsoptionen**: Verschiedene Hosting- und Skalierungsoptionen
- **Sicherheit und Schutz**: Eingebaute verantwortungsvolle KI-Funktionen

## AZD + Microsoft Foundry: Gemeinsam besser

| Funktion | Microsoft Foundry | Vorteil der AZD-Integration |
|---------|-----------------|------------------------|
| **Modellbereitstellung** | Manuelle Portalanwendung | Automatisierte, wiederholbare Bereitstellungen |
| **Infrastruktur** | Projekt- und Ressourcenkonfiguration | Starte mit `azure.yaml`; exportiere Bicep oder Terraform bei Bedarf |
| **Umgebungsverwaltung** | Fokus auf eine einzelne Umgebung | Multi-Umgebung (Entwicklung/Staging/Produktion) |
| **CI/CD-Integration** | Bereitstellungs- und Bewertungsdienste | Wiederverwendung der Konfiguration in GitHub Actions oder Azure DevOps |
| **Kostenmanagement** | Grundlegende Überwachung | Umgebungspezifische Kostenoptimierung |

## Voraussetzungen

- Azure-Abonnement mit entsprechenden Berechtigungen
- Azure Developer CLI 1.37.0 oder neuer für den GA Foundry-Workflow
- Zugang zu Microsoft Foundry Models-Diensten
- Grundlegende Vertrautheit mit Microsoft Foundry

> **Foundry GA-Update (2026-11-09):** Das Erweiterungsbündel `microsoft.foundry` erreichte Version 1.0 und allgemeine Verfügbarkeit am [5. November 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Die folgende Schritt-für-Schritt-Anleitung folgt dieser Ankündigung und dem verlinkten Microsoft Learn Schnellstart. Dies ist eine Dokumentationsüberprüfung, keine Live-Bereitstellungsvalidierung. Optionale Vorschaufunktionen und unabhängig veröffentlichte Erweiterungen behalten ihren eigenen Release-Status.

**Lernziele:** Installation des GA-Bündels, Überprüfung des `azure.yaml` eines Agenten, Vergleich lokaler mit bereitgestellten Antworten und Erklärung von Bewertung, CI/CD und Bereinigungsgrenzen. Für eine Schritt-für-Schritt-Agentbereitstellung gehen Sie zum [hosted-agent walkthrough](#hosted-agent-walkthrough-ga). Die untenstehenden Ressourcenfragmente behandeln weitere Integrationsmuster.

## Kern-Integrationsmuster

**Umfang der Beispiele:** Der nachfolgende Bicep-Code enthält illustrative Ressourcenfragmente, kein vollständiges bereitstellbares Template. Das übergeordnete Template muss Namen, `location`, referenzierte Ressourcen, Identitäten, Ausgaben und Anwendungshosting definieren. Verwenden Sie eine verlinkte Beispielvorlage als ausführbaren Startpunkt. Bash-Beispiele erfordern eine separate Azure CLI-Authentifizierung von `azd auth login`.

### Muster 1: Microsoft Foundry Models Integration

**Anwendungsfall**: Bereitstellung von Chat-Anwendungen mit Azure OpenAI-Modellen in Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**Infrastruktur (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Der Aufrufer benötigt eine angehängte Managed Identity und `Cognitive Services OpenAI User` auf Kontoebene; das Deaktivieren von Schlüsseln gewährt keinen Zugriff. Überprüfen Sie Verfügbarkeit von Region/Modell/SKU und Kontingenten vor der Bereitstellung.

### Muster 2: AI Search + RAG Integration

**Anwendungsfall**: Bereitstellung von Retrieval-Augmented Generation (RAG)-Anwendungen

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

Es gibt keine `Microsoft.Search/searchServices/dataConnections` ARM-Ressource für diese Integration. Konfigurieren Sie einen Suchindex, eine Datenquelle, Indexer/Skillset oder Vektorisierer über die unterstützten Search Data-Plane APIs. Wenn Search ein Embedding-Modell aufruft, aktivieren Sie dessen Managed Identity, gewähren Sie die relevante Modellrolle und konfigurieren Sie die Embedding-Skill/Vektorisierer. Siehe [integrierte Vektorisierung](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Muster 3: Document Intelligence Integration

**Anwendungsfall**: Dokumentenverarbeitungs- und Analyse-Workflows

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Konfigurationsmuster

### Einrichtung von Umgebungsvariablen

Abgesehen von dokumentierten AZD-Einstellungen wie `AZURE_LOCATION` sind dies **Eigene Eingabenamen der Vorlage**. Sie wirken sich nur aus, wenn die Vorlage/Anwendung sie über Parameter- und Host-Umgebungszuordnungen verwendet. Für `azure-search-openai-demo` verwenden Sie stattdessen die tatsächlichen Namen wie `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` und `AZURE_SEARCH_SERVICE_SKU`. Modellkapazität ist nicht die Konto-SKU.

**Produktionskonfiguration:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Entwicklungskonfiguration:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Sichere Konfiguration mit Key Vault

Bevorzugen Sie Entra ID mit deaktivierter lokaler Schlüssel-Authentifizierung. Das Folgende ist nur eine **Legacy-Alternative für Schlüssel-Authentifizierung** für Anwendungen, die Schlüssel benötigen: Erfordert ein Konto mit aktivierter Schlüssel-Authentifizierung, die Anwendungsidentität angehängt an den Host und funktionierenden Zugriff/Netzwerk für Key Vault. Kombinieren Sie nicht Schlüsselabruf mit `disableLocalAuth: true` und erwarten, dass schlüsselbasierte Aufrufe funktionieren.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Bereitstellungs-Workflows

### AZD-Erweiterungen für Foundry

Für den GA-Workflow installieren Sie das `microsoft.foundry` Bündel anstelle der Einzelinstallation der Kern-Erweiterungen:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Das Bündel installiert Agenten, Verbindungen, Inspector, Projekte, Routinen, Skills und Toolboxes. Es fügt keine `microsoft.foundry` Befehlsgruppe hinzu. Bewertungen, Datensätze, Feinabstimmung und Anpassungsmodelle werden bei Bedarf separat installiert. Siehe [Erweiterungspaketierungsreferenz](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Hosted-Agent Schritt-für-Schritt (GA)

Ein **Hosted Agent** führt Ihren Agent-Code auf von Foundry verwalteter Rechenkapazität aus. Diese Übung verwendet den upstream Basic Python Agent Framework Responses API Beispielcode, nicht die klassischen Agent Service SDK-Fragmente aus anderen Lektionen.

#### 1. Vorbereiten und initialisieren

Verwenden Sie ein leeres Verzeichnis außerhalb dieses Kurs-Checkouts. Installieren Sie Python 3.13 oder neuer und eine aktuelle [uv-Version](https://docs.astral.sh/uv/getting-started/installation/). Standalone uv-Installationen können `uv self update` verwenden. Überprüfen Sie [Hosted-Agent-Berechtigungen](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), Modellverfügbarkeit und Kontingent in Ihrem Abonnement und Ihrer Region vor dem Bereitstellen. Azure-Ressourcen und lokale Modellaufrufe verursachen Kosten.

Schließen Sie `azd auth login` und die Bündel-Installation oben ab. Lokaler Beispielcode verwendet `DefaultAzureCredential`; falls mit Azure CLI-Anmeldedaten, melden Sie sich bei `az login` mit demselben Konto und Mandanten wie AZD an. AZD-Anmeldung allein ist keine Azure CLI-Anmeldung.

Führen Sie folgenden Einzeiler in Bash oder PowerShell aus:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Wählen Sie ein neues oder bestehendes Foundry-Projekt sowie das beabsichtigte Abonnement und die Region. Um eine Modellbereitstellung wiederzuverwenden, fügen Sie `--model-deployment <existing-deployment-name>` zum Initialisierungsbefehl **vor dessen Ausführung** hinzu und wählen das bestehende Projekt aus. Bleiben Sie im Verzeichnis mit der generierten `azure.yaml` für die folgenden Befehle.

#### 2. Bereitstellungsdefinition überprüfen

Öffnen Sie `azure.yaml` und suchen Sie folgende Einstellungen im [upstream sample](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Einstellung | Was zu prüfen ist |
|---------|-----------------------|
| `host: azure.ai.project` und `deployments` | Beabsichtigtes Foundry-Projekt und Modellname, Version, Bereitstellungs-SKU und Kapazität |
| `host: azure.ai.agent` und `project` | Hosted Agent und Verzeichnis mit dessen Quellcode |
| `codeConfiguration` | Python-Ausführungsumgebung und Einstiegspunkt; das geprüfte Beispiel nutzt `python_3_13` und `main.py` |
| `uses` | Abhängigkeit vom Foundry-Projekt-Service |
| `container.resources` | CPU- und Speicherausstattung, obwohl der Code remote gebaut wird |
| `env` | Modellbereitstellungszuordnung und `PYTHONNOUSERSITE: "1"` zum Deaktivieren des Ladens von nutzerseitigen Paketen |
| `infra.provider` | `microsoft.foundry`, welche die benötigte Infrastruktur synthetisiert |

Committen Sie das überprüfte `azure.yaml` und den Agentcode zusammen. Für den Start ist keine handgeschriebene Infrastruktur erforderlich; wenn Sie bearbeitbare Bereitstellungsdateien benötigen, folgen Sie der Anleitung zur [Infrastruktur-Auslagerung](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) für Bicep oder Terraform und verwenden weiterhin `azd provision`. Speichern Sie keine Anmeldedaten oder `.azure/`-Umgebungszustände im Commit.

#### 3. Bereitstellen und lokal testen

```bash
azd provision
azd ai agent run
```

Die Bereitstellung kann fehlende Modellbereitstellungen **auch in einem wiederverwendeten Projekt** erzeugen. Überprüfen Sie die Modell-Prompts und wählen Sie einen verfügbaren Online-Bereitstellungstyp wie Global Standard oder Data Zone Standard; Kontingent und regionale Unterstützung variieren.

Der lokale Lauf bereitet Abhängigkeiten vor und öffnet **Agent Inspector**, wo Sie Anfragen, Antworten und Werkzeug-/Modellaktivität prüfen können. Lassen Sie ihn laufen und öffnen Sie ein zweites Terminal im gleichen Projektverzeichnis:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Zwischenkontrolle:** Bestätigen Sie, dass Sie eine relevante Antwort erhalten und die zugehörige lokale Aktivität inspizieren können. Die lokale Ausführung ruft weiterhin Ihre Azure-Modellbereitstellung auf; es ist kein Offline- oder kostenloser Test. Verwenden Sie synthetische Prompts und vermeiden Sie das Offenlegen von Geheimnissen oder sensiblen Daten im Inspector-Ausgang.

#### 4. Bereitstellen und vergleichen

Beenden Sie den lokalen Lauf mit Strg+C, wenn Sie fertig sind. Vor dem Aufruf aus der Ferne konfigurieren oder prüfen Sie die [Application Insights-Verbindung und Zugriffsrechte für Tracing](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) des Projekts.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

Im Code-Bereitstellungsmodus lädt AZD den Quellcode für einen Remote-Foundry-Build hoch; Sie benötigen keinen lokalen Container-Build für diesen Pfad. Die Bereitstellungsausgabe liefert Links zum Playground und zum Endpunkt. Verifizieren Sie eine Antwort vom bereitgestellten Agenten und dessen Cloud-Tracing; lokale Inspector-Ereignisse allein beweisen nicht, dass Cloud-Tracing funktioniert.

Für nachfolgende Änderungen prüfen Sie die unterstützte Hosted-Agent-Konfiguration mit `azd deploy --preview`. Streamen Sie Protokolle mit `azd ai agent monitor --follow` oder diagnostizieren Sie Setup- und Zugriffsprobleme mit `azd ai agent doctor`. Eine Bereitstellungsvorschau ist keine vollständige Infrastruktur- oder Sicherheitsüberprüfung.

#### 5. Fügen Sie eine wiederholbare Qualitätsprüfung hinzu

Installieren Sie die eigenständig veröffentlichte Evaluations-Erweiterung und generieren Sie Entwurfs-Testressourcen:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Beschreiben Sie das beabsichtigte Verhalten des Agenten und wählen Sie **Dataset und Beurteiler**, dann **Turn**. Überprüfen und bearbeiten Sie die generierten Fälle und die Bewertungsrichtlinie, einschließlich eines Falls mit nicht unterstützter Frage, bevor Sie die Evaluation konfigurieren:

```bash
azd ai eval init --name quality
```

Wählen Sie den überprüften Datensatz und die Richtlinie und bestätigen Sie die Modellbereitstellung des Bewertungsmodells. Inspizieren Sie `evals/azure.eval.yaml` und seine Referenz im Evaluationsdienst in `azure.yaml`, registrieren Sie dann die Ressourcen und führen Sie aus:

```bash
azd up
azd ai eval run start --eval quality
```

Prüfen Sie Bewertungen und fehlgeschlagene oder fehlerhafte Fälle; eine abgeschlossene Evaluation ist nicht automatisch eine Qualitätsfreigabe. Generierung und Bewertung verursachen ebenfalls Modellkosten. Committen Sie nichtgeheime Konfigurationen, Datensätze und Richtlinien, damit Teammitglieder Änderungen vergleichen können. `azd ai agent optimize` kann eine kompatible Evaluation als Ausgangspunkt wiederverwenden, aber prüfen Sie Kandidaten vor expliziter Bereitstellung. Siehe [Qualitätstore und Migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) für ältere Projekte und CI.

#### 6. Workflow in CI/CD wiederverwenden

Nach erfolgreichem `azd up` führen Sie `azd pipeline config` aus und prüfen den generierten GitHub Actions- oder Azure DevOps-Workflow. Installieren Sie `microsoft.foundry` auf dem Runner sowie `azure.ai.evaluations`, wenn Sie Bewertungen ausführen. Bewahren Sie generierte Checkout-, Anmelde- und Umgebungs-Einstellungen auf; Installation allein authentifiziert die Pipeline nicht.

Verwenden Sie für jede Stufe eine separate AZD-Umgebung, gewähren Sie der Pipeline-Identität die erforderlichen Ressourcen- und Foundry-Berechtigungen und bewahren Sie Zugangsdaten in Pipeline-Geheimnissen oder verwenden Sie föderierte Identität. Committen Sie Evaluationsressourcen und verifizieren Sie, dass die Identität auf die referenzierten Datensätze/Beurteiler zugreifen kann. Siehe das [Kurs-Pipeline-Beispiel](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) und den [Foundry CI/CD-Leitfaden](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Bewusst aufräumen

Für ein **neues Projekt, das von dieser Umgebung erstellt wurde**, überprüfen Sie die von `azd down` aufgeführten Ressourcen vor der Bestätigung: es löscht die Ressourcengruppe und alles darin.

Für ein **wiederverwendetes Projekt** belässt `azd down` das Projekt, den Hosted Agent und andere Ressourcen. Entfernen Sie nur unerwünschte Ressourcen, die Sie besitzen, mit der [Schnellstart-Bereinigungsanleitung](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); löschen Sie keine geteilte Ressourcengruppe, um eine einzelne Übung aufzuräumen.

**Abschlussprüfung:** Erklären Sie, welche Einstellungen lokales und Cloud-Verhalten steuern, zeigen Sie lokale und bereitgestellte Antworten, prüfen Sie ein Evaluierungsergebnis und identifizieren Sie, welche Ressourcen nach der Bereinigung verbleiben.

### Optional: Scaffold mit dem Microsoft Foundry Skill

Installieren Sie den [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) für Ihren Coding-Agent-Host, öffnen Sie dann einen separaten, leeren Ordner. Bitten Sie ihn, das grundlegende Python Agent Framework Responses API Beispiel im Code-Bereitstellungsmodus zu scaffolden, erklären Sie das generierte `azure.yaml` und schlagen Sie das Abonnement, die Region, das Projekt und die Modellbereitstellung vor. Fordern Sie eine Genehmigung **vor der Erstellung von Azure-Ressourcen** an, fordern Sie einen lokalen Test an und stoppen Sie vor der Bereitstellung. Überprüfen Sie die Ausgabe und fahren Sie mit den obigen Bereitstellungsschritten nur fort, wenn Sie bereit sind.

Für bestehende Projekte ersetzt `--template`/`-t` die veraltete Schreibweise `--manifest`/`-m`; das Ändern der Flagge migriert keine Legacy-Manifeste oder verschachtelte Agentenkonfigurationen. Siehe die [AI CLI-Referenz](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Einzelbefehl-Bereitstellung

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Umgebungsspezifische Bereitstellungen

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Überwachung und Beobachtbarkeit

### Integration von Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

Dies stellt eine Insights-Ressource bereit, keine Telemetrie-Instrumentierung. Sobald Ihre App ausgehende Model-Call-Spans sendet, führen Sie diese beispielhafte Abfrage in den Application Insights Logs aus (passen Sie den Filter an Ihre tatsächlichen Span-Namen an):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Kostenüberwachung

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

Verwenden Sie einen echten Empfänger und überprüfen Sie die Abrechnungsbereich-Berechtigungen. Ein Budget sendet Warnungen; es ist keine Ausgabengrenze.

## 🔐 Sicherheits-Best-Practices

### Managed Identity-Konfiguration

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Netzwerksicherheit

Dieses Endpunktfragment benötigt ebenfalls eine private DNS-Zone/-Gruppe, VNet-Verknüpfungen, Anwendungs-VNet-Konnektivität und eine explizite Richtlinie für den öffentlichen Zugriff. Das Erstellen eines privaten Endpunkts allein deaktiviert den öffentlichen Zugriff nicht.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
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

## Leistungsoptimierung

### Caching-Strategien

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache for Redis Basic/Standard/Premium befindet sich auf einem [Ruhestandspfad](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); verwenden Sie Azure Managed Redis für neue Bereitstellungen und folgen Sie den aktuellen Vorlagen-/Authentifizierungsanleitungen. Grenzen Sie zwischengespeicherte KI-Antworten durch Autorisierung, Modell/Anweisungen und Datenversion mit Ablaufzeit ein; teilen Sie private Antworten niemals nur über den Abfrage-Text.

### Auto-Skalierungskonfiguration

**Teilressource:** Fügen Sie diese Scale/Ingress-Einstellungen in eine vollständige Container-App mit verwalteter Umgebung, Container-Image und Ressourcenlimits ein. Mehr Replikate erhöhen keine Modell-Quote.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Fehlerbehebung bei häufigen Problemen

### Problem 1: OpenAI-Quota überschritten

**Symptome:**
- Bereitstellung schlägt mit Quota-Fehlern fehl
- 429-Fehler in den Anwendungsprotokollen

**Lösungen:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

Die oben genannte Kapazitätsvariable gilt nur für eine benutzerdefinierte Vorlage, die sie verwendet. Für das RAG-Beispiel verwenden Sie `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ändern Sie `AZURE_LOCATION` nicht, um bestehende Ressourcen zu verschieben; erstellen Sie für eine neue Region eine separate Umgebung und planen Sie Migration/Aufräumarbeiten.

### Problem 2: Authentifizierungsfehler

**Symptome:**
- 401/403-Fehler beim Aufruf von KI-Diensten
- "Zugriff verweigert"-Meldungen

**Lösungen:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problem 3: Modell-Bereitstellungsprobleme

**Symptome:**
- Modelle in der Bereitstellung nicht verfügbar
- Bestimmte Modellversionen schlagen fehl

**Lösungen:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Beispielvorlagen

Dies sind Alternativen, keine aufeinanderfolgende Befehle. Starten Sie jede in einem separaten leeren Verzeichnis. Das explizite `.` Ziel hält die Initialisierung in Ihrem aktuellen Verzeichnis; andernfalls kann die aktuelle AZD eine vorlagenbenannte Unterverzeichnis erstellen, ohne das Arbeitsverzeichnis Ihrer Shell zu ändern.

### RAG-Chat-Anwendung (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beschreibung**: Eine RAG-Chat-Referenzanwendung für Fragen über Ihre Dokumente, mit Azure AI Search-Recherche. Überprüfen Sie die vom aktuellen Beispiel unterstützten Modelle, optionale Funktionen, Kostentipps und Produktions-Härtung vor der Verwendung; das Bereitstellen einer Beispielanwendung macht diese nicht produktionsbereit.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG-Chat-Anwendung (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beschreibung**: Die .NET/C#-Entsprechung des Python RAG-Chat-Beispiels. Entwickelt mit ASP.NET Core Minimal API und Blazor WebAssembly Frontend. Enthält Sprach-Chat, GPT-4o-mini Vision-Unterstützung und einen begleitenden .NET MAUI Blazor Hybrid Desktop-/Mobil-Client.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG-Chat-Anwendung (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beschreibung**: Java-Version des RAG-Chat-Beispiels mit Langchain4J für KI-Orchestrierung. Unterstützt Microservice-Event-Driven-Architektur, mehrere Suchstrategien (Text, Vektor, Hybrid), Dokumentenupload mit Azure Dokument Intelligence und Bereitstellung auf Azure Container Apps oder Azure Kubernetes Service.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot mit Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dienste**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beschreibung**: End-to-End Retail RAG Copilot mit Microsoft Foundry und Prompty. Ein Contoso Outdoor Einzelhändler-Chatbot, der Antworten auf Produktkatalog- und Kundendaten stützt. Demonstriert den vollständigen GenAIOps-Workflow — Prototyp mit Prompty, Bewertung mit KI-gestützten Evaluatoren und Bereitstellung via AZD in Container Apps.

**Schnellstart**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreatives Schreiben Multi-Agenten-Anwendung

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Dienste**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beschreibung**: Multi-Agenten-Beispiel, das KI-Agenten-Orchestrierung mit Prompty demonstriert. Verwendet einen Forschungsagenten (Bing Grounding im Azure AI Agent Service), einen Produktagenten (Azure AI Search), einen Schreibagenten und einen Redaktionsagenten zur gemeinsamen Produktion gut recherchierter Artikel. Enthält CI/CD mit Bewertung in GitHub Actions.

**Schnellstart**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Dienste**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB für NoSQL + LangChain.js

**Beschreibung**: Vollständig serverloser RAG-Chatbot mit LangChain.js, Azure Functions für die API und Azure Static Web Apps für Hosting. Nutzt Azure Cosmos DB als Vektorspeicher und Chatverlaufsdatenbank. Unterstützt lokale Entwicklung mit Ollama für kostenfreies Testen.

**Schnellstart**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data Lösungsgeschwindigkeit

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Dienste**: Microsoft Foundry + Azure Container Apps (Web/API/Ingestion) + Azure AI Search mit Cosmos DB oder PostgreSQL mit pgvector

**Beschreibung**: Ein dokumentbasiertes Chat-Beschleuniger mit Zitaten. Das aktuelle Beispiel hostet ein React-Frontend, FastAPI-Backend und Functions-Ingestion-Worker auf Container Apps; Orchestrator-Optionen sind Agent Framework und LangGraph. Datenbank-/Abruffunktionen werden bei der Bereitstellung ausgewählt. Es ist ein Ausgangspunkt, kein fertiges Produktionssystem; ältere App Service-, Semantic Kernel- oder Prompt Flow-Varianten beschreiben nicht die aktuelle Standardversion.

**Schnellstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### KI-Reiseagenten – Multi-Agent MCP-Orchestrierung

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Dienste**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-Server (.NET, Python, Java, TypeScript)

**Beschreibung**: Referenzanwendung für Multi-Agent-KI-Orchestrierung mit drei Frameworks (LangChain.js, LlamaIndex.TS und Microsoft Agent Framework). Enthält MCP (Model Context Protocol) Server in vier Sprachen, bereitgestellt als serverlose Azure Container Apps mit OpenTelemetry-Überwachung.

**Schnellstart**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Weitere Vorlagen durchsuchen**: Besuchen Sie die [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) für aktuell verfügbare Vorlagen in verschiedenen Sprachen und Szenarien. Jedes verlinkte Beispiel ist ein externes Repository, kein lokal vom Kurs bereitgestelltes Beispiel; prüfen Sie dessen aktuelle Voraussetzungen und Produktionshinweise vor der Bereitstellung.

## Nächste Schritte

1. **Beispiele ausprobieren**: Beginnen Sie mit einer vorgefertigten Vorlage, die Ihrem Anwendungsfall entspricht
2. **Anpassen für Ihre Bedürfnisse**: Passen Sie Infrastruktur- und Anwendungscode an
3. **Überwachung hinzufügen**: Implementieren Sie umfassende Beobachtbarkeit
4. **Kosten optimieren**: Feinjustieren der Konfiguration für Ihr Budget
5. **Bereitstellung sichern**: Implementieren Sie Unternehmenssicherheitsmuster
6. **Für Produktion skalieren**: Fügen Sie Multi-Region- und Hochverfügbarkeitsfunktionen hinzu

## 🎯 Praktische Übungen

### Übung 1: Microsoft Foundry Models Chat-App bereitstellen (30 Minuten)
**Ziel**: Bereitstellen und Testen einer KI-Chat-Referenzanwendung

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**Erfolgskriterien:**
- [ ] Bereitstellung abgeschlossen ohne Quota-Fehler
- [ ] Zugriff auf Chat-Oberfläche im Browser möglich
- [ ] Fragen stellen und KI-gestützte Antworten erhalten möglich
- [ ] Application Insights zeigt Telemetriedaten
- [ ] Ressourcen erfolgreich bereinigt

**Kosten:** Überprüfen Sie die aktuelle Kostenübersicht und die ausgewählten SKUs des Beispiels vor der Bereitstellung. Die Abrechnung läuft weiter, bis Ressourcen gelöscht werden; eine feste 30-Minuten-Schätzung gilt nicht für jede Konfiguration.

### Übung 2: Multi-Modell-Bereitstellung konfigurieren (45 Minuten)
**Ziel**: Mehrere KI-Modelle mit unterschiedlichen Konfigurationen bereitstellen

**Ausgangspunkt:** Ein bestehendes Azure OpenAI-Konto und ein AZD Resource-Group-Modul, das diese Datei aufrufen kann. Erstellen Sie mit Ihrem Editor `infra/ai-models.bicep` mit dem folgenden Inhalt. Es wird nicht automatisch bereitgestellt, nur weil es unter `infra/` liegt.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Vom Resource-Group-Scoped-Modul, das das Konto besitzt, fügen Sie eine Modulaufruf (passe den Symbolnamen an ihr tatsächliches Konto an):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Deklarieren Sie dieselben Bereitstellungen nicht in beiden Modulen. Wenn der AZD-Einstiegspunkt abonnementbezogen ist, rufen Sie dies vom resource-groupbezogenen Kindmodul auf und passen Sie den relativen Pfad an. Bauen Sie dieses enthaltende Modul mit `az bicep build --file <path-to-containing-module>`, dann:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Erfolgskriterien:**
- [ ] Mehrere Modelle erfolgreich bereitgestellt
- [ ] Unterschiedliche Kapazitätseinstellungen angewendet
- [ ] Modelle über API zugänglich
- [ ] Beide Modelle von Anwendung anrufbar

### Übung 3: Kostenüberwachung implementieren (20 Minuten)
**Ziel**: Budget-Warnungen und Kostenverfolgung einrichten

**Ausgangspunkt:** Das oben gezeigte Budget-Muster und ein infrastructure module mit resource-group scope. Fügen Sie diese Ressource mit Ihrem Editor hinzu; übergeben Sie `budgetStartDate` aus Ihrem Parameter-Mapping (duplizieren Sie den Parameter nicht, wenn dieser bereits deklariert ist). Ersetzen Sie den Empfänger und bestätigen Sie, dass Sie Schreibzugriff für das Budget haben.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Erwartet wird, dass die Antwort `amount: 200` enthält, beide Schwellenwerte und Ihren Empfänger. Prüfen Sie das Kostenmanagement im Portal für tatsächliche Gebühren; Kostendaten sind verzögert und eine Warnung muss während einer kurzen Übung nicht ausgelöst werden.

**Erfolgskriterien:**
- [ ] Budget-Warnung in Azure erstellt
- [ ] E-Mail-Benachrichtigungen konfiguriert
- [ ] Kostenübersicht im Azure-Portal einsehbar
- [ ] Budget-Schwellenwerte passend gesetzt

## 💡 Häufig gestellte Fragen

<details>
<summary><strong>Wie kann ich Microsoft Foundry Models Kosten während der Entwicklung reduzieren?</strong></summary>

1. **Preise prüfen**: Es gibt keine universelle kostenlose 50.000-Token-Monatsfreigabe für Azure OpenAI-Modelle
2. **Kapazität richtig dimensionieren**: Capacity `10` entspricht typischerweise 10.000 TPM für diese Standard-Textmodelle, nicht 10 TPM. Das Reduzieren dieses Ratenlimits senkt die Preis pro Token nicht
3. **azd down verwenden**: Löschen Sie entbehrliche Ressourcen, wenn nicht aktiv entwickelt wird (dies ist keine Stilllegung)
4. **Antworten cachen**: Implementieren Sie Redis-Cache für wiederholte Abfragen
5. **Prompt Engineering anwenden**: Reduzieren Sie Token-Verbrauch mit effizienten Prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Was ist der Unterschied zwischen Microsoft Foundry Models und OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Unternehmenssicherheit und Compliance
- Private Netzwerkintegration
- SLA-Garantien
- Managed Identity-Authentifizierung
- Höhere Quoten verfügbar

**OpenAI API**: Ein separater Anbieter/API mit eigener Modellverfügbarkeit, Preisgestaltung, Authentifizierung und Enterprise-Konnektivitätsoptionen. Vergleichen Sie aktuelle Angebote, statt anzunehmen, dass es nur über das öffentliche Internet läuft oder immer Modelle als Erstes ausliefert.

Wählen Sie basierend auf den Anforderungen Ihrer Organisation; in diesem Kurs gezeigte azure-spezifische Managed Identity- und Private-Link-Beispiele gelten für Azure-gehostete Dienste, nicht für jedes Modell/Anbieter im Foundry-Katalog.
</details>

<details>
<summary><strong>Wie gehe ich mit "Microsoft Foundry Models quota exceeded"-Fehlern um?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Kann ich eigene Daten mit Microsoft Foundry Models nutzen?</strong></summary>

Ja! Verwenden Sie **Azure AI Search** für RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Siehe die [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) Vorlage.
</details>

<details>
<summary><strong>Wie sichere ich KI-Modellendpunkte?</strong></summary>

**Beste Praktiken**:
1. Verwenden Sie Managed Identity (keine API-Schlüssel)
2. Aktivieren Sie Private Endpoints
3. Konfigurieren Sie Netzwerksicherheitsgruppen
4. Implementieren Sie eine Ratenbegrenzung
5. Verwenden Sie Azure Key Vault für Geheimnisse

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Community und Support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues und Diskussionen](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Offizielle Dokumentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry Skill auf skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installieren Sie Azure + Foundry Agent Skills in Ihrem Editor mit `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitel-Navigation:**
- **📚 Kurs-Startseite**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - AI-First Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Ihr erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nächstes**: [AI Agents](agents.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brauchen Sie Hilfe?** Nehmen Sie an unseren Community-Diskussionen teil oder eröffnen Sie ein Issue im Repository. Die Azure AI + AZD Community ist hier, um Ihnen zum Erfolg zu verhelfen!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->