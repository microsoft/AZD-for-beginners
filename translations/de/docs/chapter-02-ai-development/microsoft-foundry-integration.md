# Microsoft Foundry Integration mit AZD

**Kapitel-Navigation:**
- **📚 Kurs Startseite**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-Zentrierte Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Dein erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nächstes**: [KI-Agenten](agents.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Übersicht

Diese Anleitung zeigt, wie Microsoft Foundry-Dienste mit Azure Developer CLI (AZD) für optimierte KI-Anwendungsbereitstellungen integriert werden. Microsoft Foundry bietet eine umfassende Plattform zum Erstellen, Bereitstellen und Verwalten von KI-Anwendungen, während AZD den Infrastruktur- und Bereitstellungsprozess vereinfacht.

## Was ist Microsoft Foundry?

Microsoft Foundry ist Microsofts einheitliche Plattform für KI-Entwicklung, die beinhaltet:

- **Modellkatalog**: Zugriff auf moderne KI-Modelle
- **Prompt Flow**: Visueller Designer für KI-Workflows
- **Microsoft Foundry Portal**: Integrierte Entwicklungsumgebung für KI-Anwendungen
- **Bereitstellungsoptionen**: Verschiedene Hosting- und Skalierungsoptionen
- **Sicherheit und Schutz**: Eingebaute verantwortungsbewusste KI-Funktionen

## AZD + Microsoft Foundry: Besser zusammen

| Funktion | Microsoft Foundry | AZD Integrationsvorteil |
|---------|-----------------|------------------------|
| **Modellbereitstellung** | Manuelle Portal-Bereitstellung | Automatisierte, wiederholbare Bereitstellungen |
| **Infrastruktur** | Klick-basierte Bereitstellung | Infrastruktur als Code (Bicep) |
| **Umgebungsverwaltung** | Fokus auf einzelne Umgebung | Mehrere Umgebungen (Dev/Staging/Prod) |
| **CI/CD-Integration** | Eingeschränkt | Native GitHub Actions Unterstützung |
| **Kostenverwaltung** | Grundüberwachung | Umgebungspezifische Kostenoptimierung |

## Voraussetzungen

- Azure-Abonnement mit entsprechenden Berechtigungen
- Azure Developer CLI installiert
- Zugriff auf Microsoft Foundry Models Dienste
- Grundkenntnisse zu Microsoft Foundry

> **Release-Überprüfung (2026-11-04):** Die KI-CLI-Anleitung wurde gegen `azd` `1.37.2`, Agenten `1.0.0-beta.23` und Evaluierungsdokumentation/-quellen `1.0.0-beta.2` geprüft. Verwenden Sie `azd >= 1.37.0` für den kombinierten Workflow. Siehe [Release-Änderungen und -Fixes](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); diese Prüfung zertifiziert nicht jede Vorlage oder SDK-Beispiel anhand einer Live-Bereitstellung.

## Kernintegrationsmuster

**Reichweite der Beispiele:** Das folgende Bicep enthält illustrative Ressourcenfragmente, keine vollständige einsatzbereite Vorlage. Die übergeordnete Vorlage muss Namen, `location`, referenzierte Ressourcen, Identitäten, Outputs und Hosting der Anwendung definieren. Verwenden Sie eine verlinkte Beispielvorlage als ausführbaren Ausgangspunkt. Bash-Beispiele erfordern eine separate Azure CLI-Authentifizierung neben `azd auth login`.

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

Der Aufrufer benötigt eine angehängte verwaltete Identität und `Cognitive Services OpenAI User` auf Kontoebene; das Deaktivieren von Schlüsseln gewährt keinen Zugriff. Prüfen Sie Region/Modell/SKU-Verfügbarkeit und Kontingent vor der Bereitstellung.

### Muster 2: KI-Suche + RAG-Integration

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

Es gibt keine `Microsoft.Search/searchServices/dataConnections` ARM-Ressource für diese Integration. Konfigurieren Sie einen Suchindex, eine Datenquelle, Indexer/Skillset oder Vektorisierer über die unterstützten Search Data-Plane APIs. Wenn Search ein Einbettungsmodell aufruft, aktivieren Sie dessen verwaltete Identität, gewähren die relevante Modellrolle und konfigurieren die Einbettungs-Fähigkeit bzw. den Vektorisierer. Siehe [integrierte Vektorisierung](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Muster 3: Dokumentenintelligenz-Integration

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

Mit Ausnahme der dokumentierten AZD-Einstellungen wie `AZURE_LOCATION` sind dies **eigene Vorlagen-Eingabenamen**. Sie wirken nur, wenn die Vorlage/Anwendung sie via Parameter- und Host-Umgebungsmapping nutzt. Für `azure-search-openai-demo` verwenden Sie deren tatsächliche Namen wie `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` und `AZURE_SEARCH_SERVICE_SKU`. Modellkapazität ist nicht Konten-SKU.

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

Bevorzugen Sie Entra ID mit lokal deaktivierter Schlüssel-Authentifizierung. Das Folgende ist nur eine **Legacy-Alternative mit Schlüssel-Authentifizierung** für Anwendungen, die Schlüssel benötigen: Erfordert ein Konto mit aktivierter Schlüssel-Authentifizierung, die Anwendung-Identität am Host angebunden und funktionierenden Key Vault Zugriff/Netzwerk. Kombinieren Sie keine Schlüsselerfassung mit `disableLocalAuth: true` und erwarten Schlüssel-basierte Aufrufe.

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

AZD bietet Erweiterungen, die KI-spezifische Funktionen für die Arbeit mit Microsoft Foundry-Diensten hinzufügen:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

Die KI-Erweiterungen entwickeln sich im Preview-Modus schnell weiter. Wenn ein Befehl sich anders verhält als hier gezeigt, aktualisieren Sie die jeweilige Erweiterung bevor Sie im Projekt forschen.

### Agent-First-Bereitstellung mit `azd ai`

Verwenden Sie `azd ai agent init` interaktiv oder übernehmen Sie eine aktuelle `azure.yaml` Agent-Projektvorlage, die mit Foundry Agent Service verbunden ist:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` ersetzt die veraltete Schreibweise `--manifest`/`-m`; ältere Manifest- und verschachtelte Agent-Konfiguration erfordert weiterhin Migration. Evaluieren Sie Agenten mit `azd ai eval` von `azure.ai.evaluations`, nicht mit dem entfernten Legacy-Workflow. Siehe [Evaluierungsmigration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) für Einrichtung, Ausführung und Ergebnisse.

Siehe [AZD KI CLI Befehle](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) für die vollständige Befehlsreferenz und Optionen.

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

### Umgebungs-spezifische Bereitstellungen

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

Dies stellt eine Insights-Ressource bereit, keine Telemetrieinstrumentierung. Sobald Ihre App ausgehende Modellaufrufspannen ausgibt, führen Sie folgende illustrative Abfrage in Application Insights Logs aus (passen Sie Filter an Ihre tatsächlichen Span-Namen an):

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

Verwenden Sie einen echten Empfänger und prüfen Sie Abrechnungsbereich-Berechtigungen. Ein Budget sendet Warnungen; es ist keine Ausgabengrenze.

## 🔐 Sicherheit Best Practices

### Verwaltung von Managed Identity

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

Dieses Endpunktfragment benötigt außerdem eine private DNS-Zone/-Gruppe, VNet-Links, Anwendungs-VNet-Konnektivität und eine explizit öffentliche Zugriffspolitik. Ein privater Endpunkt allein deaktiviert keinen öffentlichen Zugriff.

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

Azure Cache für Redis Basic/Standard/Premium wird [eingestellt](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); Verwenden Sie für neue Bereitstellungen Azure Managed Redis und folgen Sie dessen aktueller Vorlage/Authentifizierungsanleitung. Begrenzen Sie gecachte KI-Antworten nach Autorisierung, Modell/Anweisungen und Datenversion mit Ablaufzeit; teilen Sie private Antworten niemals nur anhand von Abfragetext.

### Auto-Skalierungskonfiguration

**Teilressource:** Fügen Sie diese Skalierungs- und Ingress-Einstellungen einer vollständigen Container-App mit verwalteter Umgebung, Container-Image und Ressourcenlimits hinzu. Mehr Replikate erhöhen kein Modell-Kontingent.

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

### Problem 1: OpenAI-Kontingent überschritten

**Symptome:**
- Bereitstellung schlägt mit Kontingentfehlern fehl
- 429-Fehler in Anwendungsprotokollen

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

Die oben genannte Kapazitätsvariable gilt nur für eine benutzerdefinierte Vorlage, die sie verwendet. Nutzen Sie für das RAG-Beispiel `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ändern Sie `AZURE_LOCATION` nicht, um bestehende Ressourcen zu verschieben; erstellen Sie eine separate Umgebung für eine neue Region und planen Sie Migration/Aufräumen.

### Problem 2: Authentifizierungsfehler

**Symptome:**
- 401/403-Fehler bei Aufrufen von KI-Diensten
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

### Problem 3: Modellbereitstellungsprobleme

**Symptome:**
- Modelle in der Bereitstellung nicht verfügbar
- Spezifische Modellversionen schlagen fehl

**Lösungen:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Beispielvorlagen

Dies sind Alternativen, keine sequentiellen Befehle. Starten Sie jeden in einem separaten leeren Verzeichnis. Das explizite `.` Ziel behält die Initialisierung in Ihrem aktuellen Verzeichnis; sonst erstellt aktuelles AZD ein untergeordnetes Verzeichnis mit dem Vorlagennamen, ohne Ihr Arbeitsverzeichnis zu wechseln.

### RAG-Chat-Anwendung (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beschreibung**: Eine RAG-Chat-Referenzanwendung für Fragen zu Ihren Dokumenten mit Azure AI Search Retrieval. Prüfen Sie die vom aktuellen Beispiel unterstützten Modelle, optionale Funktionen, Kostenhinweise und Produktionshärtung vor Gebrauch; das Bereitstellen eines Beispiels macht die Anwendung nicht produktionsbereit.

**Schneller Start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG-Chat-Anwendung (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beschreibung**: Das .NET/C#-Äquivalent des Python-RAG-Chat-Beispiels. Gebaut mit ASP.NET Core Minimal API und Blazor WebAssembly Frontend. Enthält Sprach-Chat, GPT-4o-mini-Vision-Unterstützung und eine begleitende .NET MAUI Blazor Hybrid Desktop/Mobil-Klient.

**Schneller Start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG-Chat-Anwendung (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beschreibung**: Java-Version des RAG-Chat-Beispiels unter Einsatz von Langchain4J für KI-Orchestrierung. Unterstützt Mikroservice Event-Driven-Architektur, mehrere Suchstrategien (Text, Vektor, Hybrid), Dokumentenupload mit Azure Document Intelligence und Bereitstellung auf Azure Container Apps oder Azure Kubernetes Service.

**Schneller Start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot mit Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dienste**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beschreibung**: End-to-End Retail RAG Copilot mit Microsoft Foundry und Prompty. Ein Contoso Outdoor-Einzelhändler-Chatbot, der Antworten auf Produktkatalog- und Kundenbestelldaten stützt. Demonstriert den gesamten GenAIOps-Workflow — Prototyp mit Prompty, Bewertung mit KI-unterstützten Evaluatoren und Bereitstellung via AZD zu Container Apps.

**Schneller Start**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreative Schreib Multi-Agent-Anwendung

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Dienste**: Azure OpenAI + Azure KI-Agenten-Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beschreibung**: Multi-Agenten-Beispiel zur Demonstration der KI-Agenten-Orchestrierung mit Prompty. Nutzt einen Forschungsagenten (Bing Grounding in Azure KI-Agenten-Service), einen Produktagenten (Azure AI Search), einen Schreibagenten und einen Lektor-Agenten, die gemeinsam fundierte Artikel erstellen. Enthält CI/CD mit Evaluierung in GitHub Actions.

**Schneller Start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverloser RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Dienste**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB für NoSQL + LangChain.js

**Beschreibung**: Vollständig serverloser RAG-Chatbot mit LangChain.js, Azure Functions als API und Azure Static Web Apps zum Hosting. Nutzt Azure Cosmos DB als Vektorspeicher und Chatverlaufsdatenbank. Unterstützt lokale Entwicklung mit Ollama für kostenfreies Testen.

**Schneller Start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat mit Deinen Daten Lösungsgenerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Dienste**: Microsoft Foundry + Azure Container Apps (Web/API/Ingestion) + Azure AI Search mit Cosmos DB oder PostgreSQL mit pgvector

**Beschreibung**: Ein dokumentenbasiertes Chat-Beschleuniger mit Zitaten. Das aktuelle Beispiel hostet ein React-Frontend, FastAPI-Backend und Functions Ingestion Worker auf Container Apps; Orchestrator-Optionen sind Agent Framework und LangGraph. Auswahl der Datenbank-/Abrufoptionen erfolgt bei Bereitstellung. Es ist ein Ausgangspunkt, kein schlüsselfertiges Produktionssystem; ältere App Service-, Semantic Kernel- oder Prompt Flow-Varianten beschreiben nicht den aktuellen Standard.

**Schneller Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### KI-Reiseagenten — Multi-Agenten MCP-Orchestrierung

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Dienste**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-Server (.NET, Python, Java, TypeScript)

**Beschreibung**: Referenzanwendung für Multi-Agenten-KI-Orchestrierung mit drei Frameworks (LangChain.js, LlamaIndex.TS und Microsoft Agent Framework). Beinhaltet MCP (Model Context Protocol)-Server in vier Sprachen, bereitgestellt als serverlose Azure Container Apps mit OpenTelemetry-Überwachung.

**Schnellstart**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Weitere Vorlagen durchsuchen**: Besuchen Sie die [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) für derzeit verfügbare Vorlagen für verschiedene Sprachen und Szenarien. Jedes verlinkte Beispiel ist ein externes Repository, kein lokales Beispiel dieses Kurses; prüfen Sie die aktuellen Voraussetzungen und Hinweise zur Produktion vor der Bereitstellung.

## Nächste Schritte

1. **Beispiele ausprobieren**: Beginnen Sie mit einer vorgefertigten Vorlage, die Ihrem Anwendungsfall entspricht
2. **An Ihre Bedürfnisse anpassen**: Infrastruktur- und Anwendungscode modifizieren
3. **Überwachung hinzufügen**: Umfassende Observability implementieren
4. **Kosten optimieren**: Konfigurationen an Ihr Budget anpassen
5. **Bereitstellung absichern**: Unternehmenssicherheitsmuster implementieren
6. **Für Produktion skalieren**: Multi-Region- und Hochverfügbarkeitsfunktionen hinzufügen

## 🎯 Praktische Übungen

### Übung 1: Microsoft Foundry Models Chat-App bereitstellen (30 Minuten)
**Ziel**: Eine KI-Chat-Referenzanwendung bereitstellen und testen

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

# Clean up
azd down --force --purge
```

**Erfolgskriterien:**
- [ ] Bereitstellung ohne Quotenfehler abschließen
- [ ] Chat-Schnittstelle im Browser zugänglich
- [ ] Fragen stellen und KI-basierte Antworten erhalten können
- [ ] Application Insights zeigt Telemetriedaten
- [ ] Ressourcen erfolgreich bereinigt

**Kosten:** Prüfen Sie vor der Bereitstellung die aktuelle Kostenübersicht und die ausgewählten SKUs. Die Abrechnung läuft weiter, bis die Ressourcen gelöscht werden; es gibt keine feste 30-minütige Schätzung, die auf jede Konfiguration zutrifft.

### Übung 2: Multi-Modell-Bereitstellung konfigurieren (45 Minuten)
**Ziel**: Mehrere KI-Modelle mit unterschiedlichen Konfigurationen bereitstellen

**Ausgangspunkt:** Ein vorhandenes Azure OpenAI-Konto und ein AZD-Ressourcengruppen-Modul, das diese Datei aufrufen kann. Erstellen Sie mit Ihrem Editor `infra/ai-models.bicep` mit folgendem Inhalt. Es wird nicht automatisch bereitgestellt, nur weil es sich unter `infra/` befindet.

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

Fügen Sie aus dem ressourcengruppenspezifischen Modul, dem das Konto gehört, einen Modulaufruf hinzu (passen Sie den Symbolnamen an Ihr tatsächliches Konto an):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Erklären Sie nicht dieselben Bereitstellungen in beiden Modulen. Wenn der AZD-Einstiegspunkt abonnementsweit ist, rufen Sie dies aus seinem kindmodul für die Ressourcengruppe auf und passen Sie den relativen Pfad an. Bauen Sie dieses enthaltende Modul mit `az bicep build --file <path-to-containing-module>`, dann:

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
- [ ] Beide Modelle aus der Anwendung aufrufbar

### Übung 3: Kostenüberwachung implementieren (20 Minuten)
**Ziel**: Budgetwarnungen und Kostenverfolgung einrichten

**Ausgangspunkt:** Das oben gezeigte Budgetmuster und ein ressourcengruppenspezifisches Infrastrukturmodul. Fügen Sie diese Ressource mit Ihrem Editor hinzu; übergeben Sie `budgetStartDate` aus Ihrer Parameterzuordnung (duplizieren Sie den Parameter nicht, wenn er bereits deklariert ist). Ersetzen Sie den Empfänger und bestätigen Sie, dass Sie Schreibzugriff auf das Budget haben.

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

Erwartet: Die Antwort enthält `amount: 200`, beide Schwellenwerte und Ihren Empfänger. Prüfen Sie im Portal die Kostenverwaltung auf tatsächliche Gebühren; Kostendaten sind verzögert, und eine Warnung muss während einer kurzen Übung nicht ausgelöst werden.

**Erfolgskriterien:**
- [ ] Budgetwarnung in Azure erstellt
- [ ] E-Mail-Benachrichtigungen konfiguriert
- [ ] Kostendaten im Azure-Portal einsehbar
- [ ] Budgetgrenzen angemessen festgelegt

## 💡 Häufig gestellte Fragen

<details>
<summary><strong>Wie kann ich die Kosten für Microsoft Foundry Models während der Entwicklung senken?</strong></summary>

1. **Preise prüfen**: Es gibt keine universelle kostenlose monatliche Freimenge von 50.000 Token für Azure OpenAI-Modelle
2. **Kapazität richtig dimensionieren**: Die Kapazität `10` entspricht typischerweise 10.000 TPM für diese Standard-Textmodelle, nicht 10 TPM. Die Reduzierung dieses Ratenlimits senkt nicht die Preise pro Token.
3. **azd down verwenden**: Löschen Sie verworfene Ressourcen, wenn Sie nicht aktiv entwickeln (dies ist keine Deallokation)
4. **Antworten cachen**: Implementieren Sie Redis-Cache für wiederholte Anfragen
5. **Prompt-Engineering nutzen**: Reduzieren Sie Tokenverbrauch durch effiziente Eingabeaufforderungen

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Was ist der Unterschied zwischen Microsoft Foundry Models und der OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Enterprise-Sicherheit und Compliance
- Integration in private Netzwerke
- SLA-Garantien
- Authentifizierung mit Managed Identity
- Höhere Kontingente verfügbar

**OpenAI API**: Ein separater Anbieter/API mit eigener Modellverfügbarkeit, Preisgestaltung, Authentifizierung und Enterprise-Konnektivitätsoptionen. Vergleichen Sie aktuelle Angebote, anstatt anzunehmen, dass sie nur öffentlich im Internet verfügbar ist oder Modelle immer zuerst liefert.

Wählen Sie basierend auf den Anforderungen Ihrer Organisation; Azure-spezifische Managed-Identity- und Private-Link-Beispiele in diesem Kurs gelten für Azure-gehostete Dienste, nicht für jedes Modell/Anbieter im Foundry-Katalog.
</details>

<details>
<summary><strong>Wie gehe ich mit Microsoft Foundry Models Fehlermeldungen bei überschrittener Kontingentgrenze um?</strong></summary>

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
<summary><strong>Kann ich meine eigenen Daten mit Microsoft Foundry Models verwenden?</strong></summary>

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
<summary><strong>Wie sichere ich KI-Modell-Endpunkte ab?</strong></summary>

**Beste Praktiken**:
1. Verwenden Sie Managed Identity (keine API-Schlüssel)
2. Aktivieren Sie Private Endpoints
3. Konfigurieren Sie Netzwerksicherheitsgruppen
4. Implementieren Sie Ratenbegrenzung
5. Nutzen Sie Azure Key Vault für Geheimnisse

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
- **Agent Skills**: [Microsoft Foundry Skill auf skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installieren Sie Azure- + Foundry-Agent Skills in Ihrem Editor mit `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitel-Navigation:**
- **📚 Kurs-Startseite**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Ihr erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nächstes**: [KI-Agenten](agents.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brauchen Sie Hilfe?** Treten Sie unseren Community-Diskussionen bei oder öffnen Sie ein Issue im Repository. Die Azure AI + AZD Community hilft Ihnen gerne zum Erfolg!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->