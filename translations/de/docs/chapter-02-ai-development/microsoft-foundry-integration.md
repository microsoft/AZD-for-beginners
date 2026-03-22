# Microsoft Foundry-Integration mit AZD

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-fokussierte Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Ihr erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Weiter**: [Bereitstellung von KI-Modellen](ai-model-deployment.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Überblick

Diese Anleitung zeigt, wie Microsoft Foundry-Dienste in die Azure Developer CLI (AZD) integriert werden, um die Bereitstellung von KI-Anwendungen zu vereinfachen. Microsoft Foundry bietet eine umfassende Plattform zum Erstellen, Bereitstellen und Verwalten von KI-Anwendungen, während AZD den Infrastruktur- und Bereitstellungsprozess vereinfacht.

## Was ist Microsoft Foundry?

Microsoft Foundry ist die einheitliche Plattform von Microsoft für KI-Entwicklung und umfasst:

- **Model Catalog**: Zugriff auf hochmoderne KI-Modelle
- **Prompt Flow**: Visueller Designer für KI-Workflows
- **Microsoft Foundry Portal**: Integrierte Entwicklungsumgebung für KI-Anwendungen
- **Deployment Options**: Mehrere Hosting- und Skalierungsoptionen
- **Safety and Security**: Eingebaute Funktionen für verantwortungsvolle KI

## AZD + Microsoft Foundry: Gemeinsam stärker

| Funktion | Microsoft Foundry | Vorteil der AZD-Integration |
|---------|-----------------|------------------------|
| **Model Deployment** | Manuelle Bereitstellung über Portal | Automatisierte, wiederholbare Bereitstellungen |
| **Infrastructure** | Bereitstellung per Klick | Infrastruktur als Code (Bicep) |
| **Environment Management** | Fokus auf einzelne Umgebung | Mehrere Umgebungen (dev/staging/prod) |
| **CI/CD Integration** | Begrenzt | Native Unterstützung für GitHub Actions |
| **Cost Management** | Grundlegendes Monitoring | Umgebungsspezifische Kostenoptimierung |

## Voraussetzungen

- Azure-Abonnement mit entsprechenden Berechtigungen
- Azure Developer CLI installiert
- Zugriff auf Microsoft Foundry Models-Dienste
- Grundkenntnisse in Microsoft Foundry

## Kern-Integrationsmuster

### Muster 1: Microsoft Foundry Models-Integration

**Anwendungsfall**: Bereitstellung von Chat-Anwendungen mit Microsoft Foundry Models

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
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
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Muster 2: AI Search + RAG-Integration

**Anwendungsfall**: Bereitstellung von Retrieval-Augmented-Generation- (RAG) Anwendungen

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

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Muster 3: Document Intelligence-Integration

**Anwendungsfall**: Dokumentenverarbeitung und Analyse-Workflows

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

**Produktionskonfiguration:**
```bash
# Kern-KI-Dienste
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modellkonfigurationen
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Leistungseinstellungen
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Entwicklungskonfiguration:**
```bash
# Kostenoptimierte Einstellungen für die Entwicklung
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Kostenlose Stufe
```

### Sichere Konfiguration mit Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
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
# Foundry agents-Erweiterung installieren
azd extension install azure.ai.agents

# Fine-Tuning-Erweiterung installieren
azd extension install azure.ai.finetune

# Erweiterung für benutzerdefinierte Modelle installieren
azd extension install azure.ai.models

# Installierte Erweiterungen auflisten
azd extension list
```

### Agenten-fokussierte Bereitstellung mit `azd ai`

Wenn Sie ein Agent-Manifest haben, verwenden Sie `azd ai agent init`, um ein Projekt zu scaffolden, das mit dem Foundry Agent Service verbunden ist:

```bash
# Aus einem Agentenmanifest initialisieren
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Auf Azure bereitstellen
azd up
```

Siehe [AZD AI CLI-Befehle](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) für die vollständige Befehlsreferenz und Flags.

### Bereitstellung mit einem einzelnen Befehl

```bash
# Alles mit einem Befehl bereitstellen
azd up

# Oder schrittweise bereitstellen
azd provision  # Nur Infrastruktur
azd deploy     # Nur Anwendung
```

### Umgebungsspezifische Bereitstellungen

```bash
# Entwicklungsumgebung
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produktionsumgebung
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Überwachung und Beobachtbarkeit

### Integration mit Application Insights

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
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Kostenüberwachung

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
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

## 🔐 Sicherheits-Best-Practices

### Konfiguration verwalteter Identitäten

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
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
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

### Auto-Skalierungskonfiguration

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
- Bereitstellung schlägt mit Kontingentfehlern fehl
- 429-Fehler in den Anwendungsprotokollen

**Lösungen:**
```bash
# Aktuelle Kontingentnutzung prüfen
az cognitiveservices usage list --location eastus

# Andere Region ausprobieren
azd env set AZURE_LOCATION westus2
azd up

# Kapazität vorübergehend reduzieren
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Authentifizierungsfehler

**Symptome:**
- 401/403-Fehler beim Aufruf von KI-Diensten
- "Access denied"-Meldungen

**Lösungen:**
```bash
# Rollenzuweisungen überprüfen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Konfiguration der verwalteten Identität überprüfen
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Zugriff auf Key Vault überprüfen
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Probleme bei der Modellbereitstellung

**Symptome:**
- Modelle in der Bereitstellung nicht verfügbar
- Bestimmte Modellversionen schlagen fehl

**Lösungen:**
```bash
# Verfügbare Modelle nach Region auflisten
az cognitiveservices model list --location eastus

# Modellversion in der Bicep-Vorlage aktualisieren
# Kapazitätsanforderungen des Modells prüfen
```

## Beispielvorlagen

### RAG-Chat-Anwendung (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beschreibung**: Das beliebteste Azure AI-Beispiel — eine produktionsbereite RAG-Chat-App, mit der Sie Fragen zu Ihren eigenen Dokumenten stellen können. Verwendet GPT-4.1-mini für Chat, text-embedding-ada-002 für Embeddings und Azure AI Search für die Retrieval-Schicht. Unterstützt multimodale Dokumente, Sprach-Ein-/Ausgabe, Microsoft Entra-Authentifizierung und Application Insights-Tracing.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG-Chat-Anwendung (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beschreibung**: Die .NET/C#-Entsprechung des Python RAG-Chat-Beispiels. Gebaut mit ASP.NET Core Minimal API und Blazor WebAssembly-Frontend. Enthält Sprach-Chat, GPT-4o-mini Vision-Unterstützung und einen Begleiter-Client als .NET MAUI Blazor Hybrid für Desktop/Mobil.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG-Chat-Anwendung (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beschreibung**: Java-Version des RAG-Chat-Beispiels unter Verwendung von Langchain4J für die KI-Orchestrierung. Unterstützt Microservice-eventgesteuerte Architektur, mehrere Suchstrategien (Text, Vektor, Hybrid), Dokumenten-Upload mit Azure Document Intelligence und Bereitstellung entweder auf Azure Container Apps oder Azure Kubernetes Service.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot mit Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dienste**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beschreibung**: End-to-End-Retail-RAG-Copilot mit Azure AI Foundry und Prompty. Ein Contoso Outdoor-Händler-Chatbot, der Antworten in Produktkatalog- und Kundenbestelldaten verankert. Demonstriert den kompletten GenAIOps-Workflow — Prototyp mit Prompty, Bewertung mit KI-gestützten Evaluatoren und Bereitstellung über AZD zu Container Apps.

**Schnellstart**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent-Anwendung

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Dienste**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beschreibung**: Multi-Agent-Beispiel, das die Orchestrierung von KI-Agenten mit Prompty demonstriert. Verwendet einen Recherche-Agenten (Bing Grounding im Azure AI Agent Service), einen Produkt-Agenten (Azure AI Search), einen Schreib-Agenten und einen Editor-Agenten, die gemeinsam gut recherchierte Artikel erstellen. Enthält CI/CD mit Bewertung in GitHub Actions.

**Schnellstart**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG-Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Dienste**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Beschreibung**: Vollständig serverloser RAG-Chatbot mit LangChain.js, Azure Functions für die API und Azure Static Web Apps für das Hosting. Verwendet Azure Cosmos DB sowohl als Vektor-Speicher als auch als Chatverlaufsdatenbank. Unterstützt lokale Entwicklung mit Ollama für kostenlose Tests.

**Schnellstart**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Dienste**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Beschreibung**: Enterprise-tauglicher RAG-Lösungsbeschleuniger mit Admin-Portal für Dokumenten-Upload/-Verwaltung, mehreren Orchestrator-Optionen (Semantic Kernel, LangChain, Prompt Flow), Speech-to-Text, Microsoft Teams-Integration und Wahl zwischen PostgreSQL- oder Cosmos DB-Backend. Entwickelt als anpassbarer Ausgangspunkt für produktive RAG-Szenarien.

**Schnellstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP-Orchestrierung

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Dienste**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Beschreibung**: Referenzanwendung für Multi-Agent-KI-Orchestrierung unter Verwendung von drei Frameworks (LangChain.js, LlamaIndex.TS und Microsoft Agent Framework). Enthält MCP (Model Context Protocol)-Server in vier Sprachen, die als serverlose Azure Container Apps mit OpenTelemetry-Monitoring bereitgestellt werden.

**Schnellstart**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Dienste**: Azure AI Services + Azure OpenAI

**Beschreibung**: Minimales Bicep-Template, das Azure AI-Dienste mit konfigurierten Machine-Learning-Modellen bereitstellt. Ein leichter Ausgangspunkt, wenn Sie nur die Azure AI-Infrastruktur ohne vollständigen Anwendungsstack bereitstellen möchten.

**Schnellstart**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Mehr Vorlagen durchsuchen**: Besuchen Sie die [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) für über 80 AI-spezifische AZD-Vorlagen in verschiedenen Sprachen und Szenarien.

## Nächste Schritte

1. **Beispiele ausprobieren**: Beginnen Sie mit einer vorgefertigten Vorlage, die zu Ihrem Anwendungsfall passt
2. **Für Ihre Bedürfnisse anpassen**: Passen Sie Infrastruktur und Anwendungs-Code an
3. **Überwachung hinzufügen**: Implementieren Sie umfassende Observability
4. **Kosten optimieren**: Konfigurieren Sie Feinabstimmungen für Ihr Budget
5. **Bereitstellung absichern**: Implementieren Sie unternehmensgerechte Sicherheitsmuster
6. **Für Produktion skalieren**: Fügen Sie Multi-Region- und Hochverfügbarkeitsfunktionen hinzu

## 🎯 Praktische Übungen

### Übung 1: Bereitstellen einer Microsoft Foundry Models Chat-App (30 Minuten)
**Ziel**: Eine produktionsbereite KI-Chat-Anwendung bereitstellen und testen

```bash
# Vorlage initialisieren
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Umgebungsvariablen setzen
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Bereitstellen
azd up

# Die Anwendung testen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# KI-Operationen überwachen
azd monitor

# Aufräumen
azd down --force --purge
```

**Erfolgskriterien:**
- [ ] Die Bereitstellung wird ohne Kontingentfehler abgeschlossen
- [ ] Zugriff auf die Chat-Oberfläche im Browser möglich
- [ ] Fragen stellen und KI-gestützte Antworten erhalten
- [ ] Application Insights zeigt Telemetriedaten
- [ ] Ressourcen erfolgreich bereinigt

**Geschätzte Kosten**: $5-10 für 30 Minuten Testdauer

### Übung 2: Konfigurieren einer Multi-Modell-Bereitstellung (45 Minuten)
**Ziel**: Mehrere KI-Modelle mit unterschiedlichen Konfigurationen bereitstellen

```bash
# Erstelle benutzerdefinierte Bicep-Konfiguration
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Bereitstellen und überprüfen
azd provision
azd show
```

**Erfolgskriterien:**
- [ ] Mehrere Modelle erfolgreich bereitgestellt
- [ ] Unterschiedliche Kapazitätseinstellungen angewendet
- [ ] Modelle über API erreichbar
- [ ] Anwendung kann beide Modelle aufrufen

### Übung 3: Implementieren der Kostenüberwachung (20 Minuten)
**Ziel**: Budgetwarnungen und Kostenverfolgung einrichten

```bash
# Budgetwarnung zu Bicep hinzufügen
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
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
EOF

# Budgetwarnung bereitstellen
azd provision

# Aktuelle Kosten prüfen
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Erfolgskriterien:**
- [ ] Budgetwarnung in Azure erstellt
- [ ] E-Mail-Benachrichtigungen konfiguriert
- [ ] Kostenübersicht im Azure-Portal einsehbar
- [ ] Budgetschwellen angemessen gesetzt

## 💡 Häufig gestellte Fragen

<details>
<summary><strong>Wie reduziere ich die Kosten für Microsoft Foundry Models während der Entwicklung?</strong></summary>

1. **Kostenlose Stufe verwenden**: Microsoft Foundry Models bietet 50.000 Tokens/Monat kostenlos
2. **Kapazität reduzieren**: Für die Entwicklung Kapazität auf 10 TPM statt 30+ setzen
3. **azd down verwenden**: Ressourcen freigeben, wenn nicht aktiv entwickelt wird
4. **Antworten cachen**: Redis-Cache für wiederholte Abfragen implementieren
5. **Prompt-Engineering verwenden**: Tokenverbrauch mit effizienten Prompts reduzieren

```bash
# Konfiguration für die Entwicklung
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Was ist der Unterschied zwischen Microsoft Foundry Models und der OpenAI-API?</strong></summary>

**Microsoft Foundry Models**:
- Unternehmenssicherheit und Compliance
- Integration in private Netzwerke
- SLA-Garantien
- Authentifizierung mit verwalteten Identitäten
- Höhere Kontingente verfügbar

**OpenAI API**:
- Schnellerer Zugang zu neuen Modellen
- Einfachere Einrichtung
- Geringere Einstiegshürde
- Nur öffentliches Internet

Für Produktionsanwendungen wird **Microsoft Foundry Models empfohlen**.
</details>

<details>
<summary><strong>Wie gehe ich mit Fehlern wegen überschrittenen Kontingents bei Microsoft Foundry Models um?</strong></summary>

```bash
# Aktuelles Kontingent prüfen
az cognitiveservices usage list --location eastus2

# Andere Region ausprobieren
azd env set AZURE_LOCATION westus2
azd up

# Kapazität vorübergehend reduzieren
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Kontingenterhöhung anfordern
# Gehe zum Azure-Portal > Kontingente > Erhöhung anfordern
```
</details>

<details>
<summary><strong>Kann ich meine eigenen Daten mit Microsoft Foundry Models verwenden?</strong></summary>

Ja! Verwenden Sie **Azure AI Search** für RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Siehe die [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) Vorlage.
</details>

<details>
<summary><strong>Wie sichere ich Endpunkte von KI-Modellen?</strong></summary>

**Beste Vorgehensweisen**:
1. Verwenden Sie Managed Identity (keine API-Schlüssel)
2. Private Endpunkte aktivieren
3. Netzwerksicherheitsgruppen konfigurieren
4. Ratenbegrenzung implementieren
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
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installieren Sie Azure + Foundry-Agent-Fähigkeiten in Ihrem Editor mit `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kurs-Startseite**: [AZD For Beginners](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Ihr erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nächstes**: [Bereitstellung von KI-Modellen](ai-model-deployment.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brauchen Sie Hilfe?** Nehmen Sie an unseren Community-Diskussionen teil oder eröffnen Sie ein Issue im Repository. Die Azure AI + AZD-Community ist hier, um Ihnen zum Erfolg zu verhelfen!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in der Ausgangssprache ist als maßgebliche Quelle zu betrachten. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->