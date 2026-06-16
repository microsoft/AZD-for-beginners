# Microsoft Foundry-Integration mit AZD

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-orientierte Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Ihr erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nächstes**: [Bereitstellung von KI-Modellen](ai-model-deployment.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Übersicht

Dieser Leitfaden zeigt, wie Microsoft Foundry-Dienste mit der Azure Developer CLI (AZD) integriert werden, um die Bereitstellung von KI-Anwendungen zu vereinfachen. Microsoft Foundry bietet eine umfassende Plattform zum Erstellen, Bereitstellen und Verwalten von KI-Anwendungen, während AZD den Infrastruktur- und Bereitstellungsprozess vereinfacht.

## Was ist Microsoft Foundry?

Microsoft Foundry ist Microsofts einheitliche Plattform für die KI-Entwicklung, die beinhaltet:

- **Modellkatalog**: Zugriff auf hochmoderne KI-Modelle
- **Prompt Flow**: Visueller Designer für KI-Workflows
- **Microsoft Foundry Portal**: Integrierte Entwicklungsumgebung für KI-Anwendungen
- **Bereitstellungsoptionen**: Mehrere Hosting- und Skalierungsoptionen
- **Sicherheit und Schutz**: Eingebaute Funktionen für verantwortungsbewusste KI

## AZD + Microsoft Foundry: Gemeinsam besser

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Modellbereitstellung** | Manuelle Portal-Bereitstellung | Automatisierte, wiederholbare Bereitstellungen |
| **Infrastruktur** | Bereitstellung per Klick | Infrastruktur als Code (Bicep) |
| **Umgebungsverwaltung** | Fokus auf eine einzelne Umgebung | Multi-Umgebung (dev/staging/prod) |
| **CI/CD-Integration** | Begrenzt | Native Unterstützung für GitHub Actions |
| **Kostenmanagement** | Basisüberwachung | Umgebungsspezifische Kostenoptimierung |

## Voraussetzungen

- Azure-Abonnement mit geeigneten Berechtigungen
- Azure Developer CLI installiert
- Zugriff auf Microsoft Foundry Models-Dienste
- Grundlegende Vertrautheit mit Microsoft Foundry

> **Aktuelle AZD-Basislinie:** Diese Beispiele wurden gegen `azd` `1.23.12` geprüft. Für den AI-Agent-Workflow verwenden Sie die aktuelle Preview-Extension-Version und prüfen Sie Ihre installierte Version, bevor Sie beginnen.

## Kern-Integrationsmuster

### Muster 1: Integration von Microsoft Foundry Models

**Anwendungsfall**: Chat-Anwendungen mit Microsoft Foundry Models bereitstellen

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
```

### Muster 2: AI Search + RAG-Integration

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

### Muster 3: Integration von Document Intelligence

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

**Produktionskonfiguration:**
```bash
# Kern-KI-Dienste
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modellkonfigurationen
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

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
# Installiere die Foundry-Agenten-Erweiterung
azd extension install azure.ai.agents

# Installiere die Fine-Tuning-Erweiterung
azd extension install azure.ai.finetune

# Installiere die Erweiterung für benutzerdefinierte Modelle
azd extension install azure.ai.models

# Liste die installierten Erweiterungen auf
azd extension list --installed

# Überprüfe die aktuell installierte Version der Agenten-Erweiterung
azd extension show azure.ai.agents
```

Die KI-Erweiterungen entwickeln sich in der Preview-Phase noch schnell. Wenn ein Befehl anders reagiert als hier gezeigt, aktualisieren Sie die entsprechende Erweiterung, bevor Sie das Projekt selbst debuggen.

### Agent-First-Bereitstellung mit `azd ai`

Wenn Sie ein Agent-Manifest haben, verwenden Sie `azd ai agent init`, um ein Projekt aufzusetzen, das an den Foundry Agent Service angebunden ist:

```bash
# Aus einem Agentenmanifest initialisieren
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# In Azure bereitstellen
azd up
```

Neuere Preview-Releases von `azure.ai.agents` haben ebenfalls template-basierte Initialisierungsunterstützung für `azd ai agent init` hinzugefügt. Wenn Sie neueren Agentenbeispielen folgen, prüfen Sie die Hilfe der Extension auf die genau verfügbaren Flags in Ihrer installierten Version.

Siehe [AZD AI CLI-Befehle](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) für die vollständige Befehlsreferenz und Flags.

### Bereitstellung mit einem einzigen Befehl

```bash
# Alles mit einem Befehl bereitstellen
azd up

# Oder schrittweise bereitstellen
azd provision  # Nur Infrastruktur
azd deploy     # Nur Anwendung

# Für lang laufende Bereitstellungen von KI-Anwendungen in azd 1.23.11+
azd deploy --timeout 1800
```

### Umgebungspezifische Bereitstellungen

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

### Konfiguration von verwalteten Identitäten

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

### Auto-Scaling-Konfiguration

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
- Die Bereitstellung schlägt mit Kontingentfehlern fehl
- 429-Fehler in Anwendungsprotokollen

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
- 401/403-Fehler beim Aufrufen von KI-Diensten
- "Access denied"-Meldungen

**Lösungen:**
```bash
# Überprüfe Rollenzuweisungen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Überprüfe die Konfiguration der verwalteten Identität
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Überprüfe den Zugriff auf Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Probleme bei der Modellbereitstellung

**Symptome:**
- Modelle sind in der Bereitstellung nicht verfügbar
- Bestimmte Modellversionen schlagen fehl

**Lösungen:**
```bash
# Verfügbare Modelle nach Region auflisten
az cognitiveservices model list --location eastus

# Modellversion in Bicep-Vorlage aktualisieren
# Kapazitätsanforderungen des Modells prüfen
```

## Beispielvorlagen

### RAG-Chat-Anwendung (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beschreibung**: Das beliebteste Azure-AI-Beispiel — eine produktionsbereite RAG-Chat-App, mit der Sie Fragen zu Ihren eigenen Dokumenten stellen können. Verwendet GPT-4.1-mini für Chat, text-embedding-3-large für Embeddings und Azure AI Search für die Suche. Unterstützt multimodale Dokumente, Spracheingabe/-ausgabe, Microsoft Entra-Authentifizierung und Application Insights-Tracing.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG-Chat-Anwendung (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beschreibung**: Das .NET/C#-Äquivalent des Python RAG-Chat-Beispiels. Entwickelt mit ASP.NET Core Minimal API und Blazor WebAssembly-Frontend. Enthält Voice-Chat, GPT-4o-mini Vision-Unterstützung und einen Begleit-Client als .NET MAUI Blazor Hybrid für Desktop/Mobil.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG-Chat-Anwendung (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beschreibung**: Java-Version des RAG-Chat-Beispiels unter Verwendung von Langchain4J für die KI-Orchestrierung. Unterstützt eine mikroservicebasierte ereignisgesteuerte Architektur, mehrere Suchstrategien (Text, Vektor, Hybrid), Dokumenten-Uploads mit Azure Document Intelligence und Bereitstellung entweder auf Azure Container Apps oder Azure Kubernetes Service.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot mit Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dienste**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beschreibung**: End-to-End Retail-RAG-Copilot unter Verwendung von Microsoft Foundry und Prompty. Ein Contoso Outdoor-Händler-Chatbot, der Antworten auf Basis des Produktkatalogs und der Kundendaten zu Bestellungen fundiert. Demonstriert den vollständigen GenAIOps-Workflow — Prototyping mit Prompty, Bewertung mit KI-unterstützten Evaluatoren und Bereitstellung via AZD zu Container Apps.

**Schnellstart**:
```bash
azd init --template contoso-chat
azd up
```

### Multi-Agent-Anwendung für kreatives Schreiben

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Dienste**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beschreibung**: Multi-Agenten-Beispiel, das die Orchestrierung von KI-Agenten mit Prompty demonstriert. Verwendet einen Research-Agent (Bing Grounding im Azure AI Agent Service), einen Product-Agent (Azure AI Search), einen Writer-Agent und einen Editor-Agent, um gemeinsam gut recherchierte Artikel zu erstellen. Enthält CI/CD mit Evaluierung in GitHub Actions.

**Schnellstart**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG-Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Dienste**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Beschreibung**: Vollständig serverloser RAG-Chatbot mit LangChain.js, wobei Azure Functions die API bereitstellt und Azure Static Web Apps das Hosting übernimmt. Verwendet Azure Cosmos DB sowohl als Vektorstore als auch als Chatverlauf-Datenbank. Unterstützt lokale Entwicklung mit Ollama für gebührenfreies Testen.

**Schnellstart**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Dienste**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Beschreibung**: Enterprise-tauglicher RAG-Solution-Accelerator mit Admin-Portal für Dokumenten-Upload/-Management, mehreren Orchestrator-Optionen (Semantic Kernel, LangChain, Prompt Flow), Speech-to-Text, Microsoft Teams-Integration und Wahl zwischen PostgreSQL oder Cosmos DB als Backend. Konzipiert als anpassbarer Einstiegspunkt für Produktions-RAG-Szenarien.

**Schnellstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP-Orchestrierung

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Dienste**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-Server (.NET, Python, Java, TypeScript)

**Beschreibung**: Referenzanwendung für Multi-Agenten-KI-Orchestrierung unter Verwendung von drei Frameworks (LangChain.js, LlamaIndex.TS und Microsoft Agent Framework). Enthält MCP (Model Context Protocol)-Server in vier Sprachen, bereitgestellt als serverlose Azure Container Apps mit OpenTelemetry-Monitoring.

**Schnellstart**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Dienste**: Azure AI Services + Azure OpenAI

**Beschreibung**: Minimale Bicep-Vorlage, die Azure AI-Dienste mit konfigurierten Machine-Learning-Modellen bereitstellt. Ein leichter Ausgangspunkt, wenn nur die Azure AI-Infrastruktur ohne vollständigen Anwendungsstack bereitgestellt werden soll.

**Schnellstart**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Mehr Vorlagen durchsuchen**: Besuchen Sie die [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) für 80+ KI-spezifische AZD-Templates in verschiedenen Sprachen und Szenarien.

## Nächste Schritte

1. **Probieren Sie die Beispiele aus**: Beginnen Sie mit einer vorgefertigten Vorlage, die Ihrem Anwendungsfall entspricht
2. **Anpassen an Ihre Anforderungen**: Passen Sie die Infrastruktur und den Anwendungscode an
3. **Überwachung hinzufügen**: Implementieren Sie umfassende Beobachtbarkeit
4. **Kosten optimieren**: Feinabstimmung der Konfigurationen für Ihr Budget
5. **Sichern Sie Ihre Bereitstellung**: Implementieren Sie Unternehmenssicherheitsmuster
6. **Für die Produktion skalieren**: Fügen Sie Multi-Region- und Hochverfügbarkeitsfunktionen hinzu

## 🎯 Praxisübungen

### Übung 1: Microsoft Foundry Models Chat-App bereitstellen (30 Minuten)
**Ziel**: Eine produktionsreife KI-Chat-Anwendung bereitstellen und testen

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

**Geschätzte Kosten**: $5-10 für 30 Minuten Test

### Übung 2: Multi-Modell-Bereitstellung konfigurieren (45 Minuten)
**Ziel**: Mehrere KI-Modelle mit unterschiedlichen Konfigurationen bereitstellen

```bash
# Erstelle eine benutzerdefinierte Bicep-Konfiguration
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
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
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
- [ ] Verschiedene Kapazitätseinstellungen angewendet
- [ ] Modelle über die API erreichbar
- [ ] Beide Modelle aus der Anwendung aufrufbar

### Übung 3: Kostenüberwachung implementieren (20 Minuten)
**Ziel**: Budgetwarnungen und Kostenverfolgung einrichten

```bash
# Budgetwarnung in Bicep hinzufügen
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

# Aktuelle Kosten überprüfen
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Erfolgskriterien:**
- [ ] Budgetwarnung in Azure erstellt
- [ ] E-Mail-Benachrichtigungen konfiguriert
- [ ] Kosteninformationen im Azure-Portal einsehbar
- [ ] Budgetschwellenwerte angemessen gesetzt

## 💡 Häufig gestellte Fragen

<details>
<summary><strong>Wie reduziere ich die Kosten von Microsoft Foundry Models während der Entwicklung?</strong></summary>

1. **Free Tier nutzen**: Microsoft Foundry Models bietet 50.000 Tokens/Monat kostenlos
2. **Kapazität reduzieren**: Stellen Sie die Kapazität für die Entwicklung auf 10 TPM statt 30+ ein
3. **azd down verwenden**: Ressourcen freigeben, wenn nicht aktiv entwickelt wird
4. **Antworten cachen**: Implementieren Sie einen Redis-Cache für wiederholte Abfragen
5. **Prompt-Engineering nutzen**: Reduzieren Sie den Token-Verbrauch durch effiziente Prompts


```bash
# Entwicklungskonfiguration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Was ist der Unterschied zwischen Microsoft Foundry Models und der OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Unternehmenssicherheit und Compliance
- Integration privater Netzwerke
- SLA-Garantien
- Authentifizierung mit Managed Identity
- Höhere Kontingente verfügbar

**OpenAI API**:
- Schnellerer Zugriff auf neue Modelle
- Einfachere Einrichtung
- Niedrigere Einstiegshürde
- Nur öffentliches Internet

Für Produktionsanwendungen werden **Microsoft Foundry Models** empfohlen.
</details>

<details>
<summary><strong>Wie gehe ich mit Fehlermeldungen wegen überschrittener Kontingente bei Microsoft Foundry Models um?</strong></summary>

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
# Zum Azure-Portal gehen > Kontingente > Erhöhung anfordern
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

Siehe die Vorlage [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Wie sichere ich AI-Modellendpunkte?</strong></summary>

**Bewährte Vorgehensweisen**:
1. Managed Identity verwenden (keine API-Schlüssel)
2. Private Endpoints aktivieren
3. Netzwerksicherheitsgruppen konfigurieren
4. Ratenbegrenzung implementieren
5. Azure Key Vault für Geheimnisse verwenden

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

## Community and Support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installieren Sie Azure- + Foundry-Agent-Skills in Ihrem Editor mit `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Kursübersicht**: [AZD For Beginners](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-orientierte Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Ihr erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nächstes**: [KI-Modellbereitstellung](ai-model-deployment.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Benötigen Sie Hilfe?** Treten Sie unseren Community-Diskussionen bei oder eröffnen Sie ein Issue im Repository. Die Azure AI + AZD-Community ist hier, um Ihnen zum Erfolg zu verhelfen!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->