# Microsoft Foundry Integration mit AZD

**Kapitel-Navigation:**
- **📚 Kursstart**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Ihr erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nächstes**: [Bereitstellung von KI-Modellen](ai-model-deployment.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Übersicht

Diese Anleitung zeigt, wie Microsoft Foundry-Dienste mit Azure Developer CLI (AZD) für eine optimierte Bereitstellung von KI-Anwendungen integriert werden. Microsoft Foundry bietet eine umfassende Plattform zum Erstellen, Bereitstellen und Verwalten von KI-Anwendungen, während AZD den Infrastruktur- und Bereitstellungsprozess vereinfacht.

## Was ist Microsoft Foundry?

Microsoft Foundry ist Microsofts einheitliche Plattform für KI-Entwicklung, die umfasst:

- **Modellkatalog**: Zugang zu hochmodernen KI-Modellen
- **Prompt Flow**: Visueller Designer für KI-Workflows
- **Microsoft Foundry Portal**: Integrierte Entwicklungsumgebung für KI-Anwendungen
- **Bereitstellungsoptionen**: Verschiedene Hosting- und Skalierungsoptionen
- **Sicherheit und Schutz**: Eingebaute verantwortungsvolle KI-Funktionen

## AZD + Microsoft Foundry: Gemeinsam besser

| Merkmal | Microsoft Foundry | Vorteil der AZD-Integration |
|---------|-----------------|------------------------|
| **Modellbereitstellung** | Manuelle Portalbereitstellung | Automatisierte, wiederholbare Bereitstellungen |
| **Infrastruktur** | Klick-für-Klick Bereitstellung | Infrastruktur als Code (Bicep) |
| **Umgebungsverwaltung** | Fokus auf einzelne Umgebung | Mehrere Umgebungen (Dev/Staging/Prod) |
| **CI/CD-Integration** | Eingeschränkt | Native Unterstützung für GitHub Actions |
| **Kostenmanagement** | Grundlegende Überwachung | Umweltbezogene Kostenoptimierung |

## Voraussetzungen

- Azure-Abonnement mit passenden Berechtigungen
- Installierte Azure Developer CLI
- Zugriff auf Microsoft Foundry Models-Dienste
- Grundlegende Vertrautheit mit Microsoft Foundry

> **Aktuelle AZD-Basisversion:** Diese Beispiele wurden mit `azd` `1.27.1` geprüft. Für den KI-Agenten-Workflow verwenden Sie die aktuelle Vorschauversion der Erweiterung und prüfen Sie vor Beginn Ihre installierte Version.

## Kernintegration Patterns

### Pattern 1: Integration von Microsoft Foundry Models

**Anwendungsfall**: Bereitstellung von Chat-Anwendungen mit Microsoft Foundry Models Modellen

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

### Pattern 2: AI-Suche + RAG-Integration

**Anwendungsfall**: Bereitstellung von Retrieval Augmented Generation (RAG)-Anwendungen

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

### Pattern 3: Dokumentenintelligenz-Integration

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

## 🔧 Konfigurations-Patterns

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
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Kostenloses Kontingent
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

AZD bietet Erweiterungen, die KI-spezifische Fähigkeiten für die Arbeit mit Microsoft Foundry-Diensten hinzufügen:

```bash
# Installieren Sie die Foundry-Agenten-Erweiterung
azd extension install azure.ai.agents

# Installieren Sie die Fine-Tuning-Erweiterung
azd extension install azure.ai.finetune

# Installieren Sie die benutzerdefinierte Modelle-Erweiterung
azd extension install azure.ai.models

# Auflisten der installierten Erweiterungen
azd extension list --installed

# Überprüfen Sie die derzeit installierte Version der Agenten-Erweiterung
azd extension show azure.ai.agents
```

Die KI-Erweiterungen entwickeln sich in der Vorschau noch schnell weiter. Sollte ein Befehl anders funktionieren als hier gezeigt, aktualisieren Sie die betreffende Erweiterung, bevor Sie das Projekt selbst prüfen.

### Agent-First-Bereitstellung mit `azd ai`

Wenn Sie ein Agenten-Manifest haben, verwenden Sie `azd ai agent init`, um ein Projekt zu starten, das mit dem Foundry Agent Service verbunden ist:

```bash
# Von einem Agentenmanifest initialisieren
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Nach Azure bereitstellen
azd up
```

Neuere Vorschauversionen von `azure.ai.agents` haben auch Vorlagen-basierte Initialisierungsunterstützung für `azd ai agent init` hinzugefügt. Wenn Sie neuere Agenten-Beispiele folgen, schauen Sie in die Hilfeseite der Erweiterung für die verfügbaren Flags in Ihrer installierten Version.

Siehe [AZD AI CLI-Befehle](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) für die vollständige Befehlsreferenz und Flags.

### Bereitstellung mit einem einzigen Befehl

```bash
# Alles mit einem Befehl bereitstellen
azd up

# Oder inkrementell bereitstellen
azd provision  # Nur Infrastruktur
azd deploy     # Nur Anwendung

# Für lang laufende KI-App-Bereitstellungen in azd 1.23.11+
azd deploy --timeout 1800
```

### Umgebungs-spezifische Bereitstellungen

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

### Application Insights Integration

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

## 🔐 Sicherheit Best Practices

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

### Auto-Skalierungs-Konfiguration

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

## Fehlerbehebung häufiger Probleme

### Problem 1: OpenAI-Quota überschritten

**Symptome:**
- Bereitstellung schlägt mit Quota-Fehlern fehl
- 429-Fehler in Anwendungsprotokollen

**Lösungen:**
```bash
# Überprüfen Sie die aktuelle Kontingentnutzung
az cognitiveservices usage list --location eastus

# Versuchen Sie eine andere Region
azd env set AZURE_LOCATION westus2
azd up

# Kapazität vorübergehend reduzieren
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Authentifizierungsfehler

**Symptome:**
- 401/403-Fehler beim Aufruf von KI-Diensten
- "Zugriff verweigert"-Meldungen

**Lösungen:**
```bash
# Rollen-Zuweisungen überprüfen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Überprüfen der Konfiguration der verwalteten Identität
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Zugriff auf den Key Vault validieren
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Modellbereitstellungsprobleme

**Symptome:**
- Modelle nicht in der Bereitstellung verfügbar
- Spezifische Modellversionen schlagen fehl

**Lösungen:**
```bash
# Verfügbare Modelle nach Region auflisten
az cognitiveservices model list --location eastus

# Modellversion in der Bicep-Vorlage aktualisieren
# Modellkapazitätsanforderungen überprüfen
```

## Beispielvorlagen

### RAG-Chat-Anwendung (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beschreibung**: Das beliebteste Azure AI-Beispiel – eine produktionsreife RAG-Chat-App, die es Ihnen ermöglicht, Fragen zu Ihren eigenen Dokumenten zu stellen. Verwendet GPT-4.1-mini für Chat, text-embedding-3-large für Embeddings und Azure AI Search für die Suche. Unterstützt multimodale Dokumente, Sprachein-/-ausgabe, Microsoft Entra Authentifizierung und Application Insights-Tracing.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG-Chat-Anwendung (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beschreibung**: Die .NET/C#-Entsprechung des Python RAG-Chat-Beispiels. Gebaut mit ASP.NET Core Minimal API und Blazor WebAssembly-Frontend. Enthält Sprachchat, GPT-4o-mini Vision-Unterstützung und einen Begleit-Client als .NET MAUI Blazor Hybrid für Desktop/Mobil.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG-Chat-Anwendung (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Dienste**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beschreibung**: Java-Version des RAG-Chat-Beispiels unter Verwendung von Langchain4J für die KI-Orchestrierung. Unterstützt eine Microservice-Ereignisarchitektur, mehrere Suchstrategien (Text, Vektor, Hybrid), Dokumenten-Upload mit Azure Document Intelligence und Bereitstellung auf Azure Container Apps oder Azure Kubernetes Service.

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot mit Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dienste**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beschreibung**: End-to-End Retail RAG Copilot mit Microsoft Foundry und Prompty. Ein Contoso Outdoor Retailer Chatbot, der Antworten auf Produktkatalog- und Kundenbestelldaten stützt. Zeigt den kompletten GenAIOps Workflow – Prototyp mit Prompty, Bewertung mit KI-unterstützten Evaluatoren und Bereitstellung via AZD zu Container Apps.

**Schnellstart**:
```bash
azd init --template contoso-chat
azd up
```

### Kreative Mehr-Agenten-Anwendung zum Schreiben

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Dienste**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beschreibung**: Mehr-Agenten-Beispiel, das die KI-Agenten-Orchestrierung mit Prompty demonstriert. Verwendet einen Forschungsagenten (Bing Grounding im Azure AI Agent Service), einen Produktagenten (Azure AI Search), einen Schreibagenten und einen Lektoragenten, die gemeinsam gut recherchierte Artikel erstellen. Enthält CI/CD mit Auswertung in GitHub Actions.

**Schnellstart**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverloser RAG-Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Dienste**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB für NoSQL + LangChain.js

**Beschreibung**: Vollständig serverloser RAG-Chatbot mit LangChain.js, Azure Functions für die API und Azure Static Web Apps zum Hosting. Verwendet Azure Cosmos DB als Vektor- und Chatverlaufsdatenbank. Unterstützt lokale Entwicklung mit Ollama zum kostenfreien Testen.

**Schnellstart**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat mit Ihrer Datenlösung Beschleuniger

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Dienste**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Beschreibung**: Unternehmensgerechte RAG-Lösung mit Verwaltungsportal für Dokumenten-Upload/-Verwaltung, mehreren Orchestrator-Optionen (Semantic Kernel, LangChain, Prompt Flow), Sprach-zu-Text, Microsoft Teams-Integration und Auswahl zwischen PostgreSQL oder Cosmos DB-Backend. Entworfen als anpassbarer Startpunkt für Produktions-RAG-Szenarien.

**Schnellstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### KI-Reiseagenten — Mehr-Agenten-MCP-Orchestrierung

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Dienste**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-Server (.NET, Python, Java, TypeScript)

**Beschreibung**: Referenzanwendung für die Orchestrierung von Mehr-Agenten-KI mit drei Frameworks (LangChain.js, LlamaIndex.TS und Microsoft Agent Framework). Verfügt über MCP (Model Context Protocol)-Server in vier Sprachen, bereitgestellt als serverlose Azure Container Apps mit OpenTelemetry-Monitoring.

**Schnellstart**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Dienste**: Azure AI-Dienste + Azure OpenAI

**Beschreibung**: Minimale Bicep-Vorlage, die Azure AI-Dienste mit konfigurierten Machine Learning-Modellen bereitstellt. Ein leichter Einstiegspunkt, wenn Sie nur die Azure AI-Infrastruktur ohne kompletten Anwendungsstack bereitstellen möchten.

**Schnellstart**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Weitere Vorlagen durchsuchen**: Besuchen Sie die [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) für über 80 KI-spezifische AZD-Vorlagen in verschiedenen Sprachen und Szenarien.

## Nächste Schritte

1. **Beispiele ausprobieren**: Beginnen Sie mit einer vorgefertigten Vorlage, die zu Ihrem Anwendungsfall passt
2. **Für Ihre Bedürfnisse anpassen**: Ändern Sie Infrastruktur- und Anwendungscode
3. **Überwachung hinzufügen**: Implementieren Sie umfassende Beobachtbarkeit
4. **Kosten optimieren**: Feinabstimmung der Konfigurationen für Ihr Budget
5. **Sichern Sie Ihre Bereitstellung**: Implementieren Sie unternehmensgerechte Sicherheitsmuster
6. **Für die Produktion skalieren**: Fügen Sie Multi-Region- und Hochverfügbarkeitsfunktionen hinzu

## 🎯 Praktische Übungen

### Übung 1: Microsoft Foundry Models Chat-App bereitstellen (30 Minuten)
**Ziel**: Bereitstellung und Test einer produktionsbereiten KI-Chat-Anwendung

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
- [ ] Bereitstellung erfolgt ohne Quotenfehler
- [ ] Zugriff auf Chat-Oberfläche im Browser möglich
- [ ] Fragen stellen und KI-gestützte Antworten erhalten möglich
- [ ] Application Insights zeigt Telemetriedaten
- [ ] Ressourcen wurden erfolgreich bereinigt

**Geschätzte Kosten**: 5-10 $ für 30 Minuten Testzeit

### Übung 2: Multi-Modell-Bereitstellung konfigurieren (45 Minuten)
**Ziel**: Bereitstellung mehrerer KI-Modelle mit unterschiedlichen Konfigurationen

```bash
# Erstellen Sie eine benutzerdefinierte Bicep-Konfiguration
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
- [ ] Unterschiedliche Kapazitätseinstellungen angewandt
- [ ] Modelle über API erreichbar
- [ ] Beide Modelle können von der Anwendung angesprochen werden

### Übung 3: Kostenüberwachung einrichten (20 Minuten)
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

# Aktuelle Kosten überprüfen
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Erfolgskriterien:**
- [ ] Budgetwarnung in Azure erstellt
- [ ] E-Mail-Benachrichtigungen konfiguriert
- [ ] Kostendaten im Azure-Portal sichtbar
- [ ] Budgetgrenzen angemessen gesetzt

## 💡 Häufig gestellte Fragen

<details>
<summary><strong>Wie kann ich die Kosten von Microsoft Foundry Models während der Entwicklung reduzieren?</strong></summary>

1. **Free Tier nutzen**: Microsoft Foundry Models bietet 50.000 Token/Monat kostenlos
2. **Kapazität reduzieren**: Kapazität auf 10 TPM statt 30+ für Entwicklungszwecke einstellen
3. **azd down verwenden**: Ressourcen freigeben, wenn nicht aktiv entwickelt wird
4. **Antworten cachen**: Redis Cache für wiederholte Anfragen implementieren
5. **Prompt Engineering einsetzen**: Tokenverbrauch durch effiziente Eingabeaufforderungen reduzieren


```bash
# Entwicklungskonfiguration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Was ist der Unterschied zwischen Microsoft Foundry Models und OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Unternehmenssicherheit und Compliance
- Integration in private Netzwerke
- SLA-Garantien
- Managed Identity Authentifizierung
- Höhere Kontingente verfügbar

**OpenAI API**:
- Schnellere Verfügbarkeit neuer Modelle
- Einfachere Einrichtung
- Niedrigere Einstiegshürde
- Nur über das öffentliche Internet

Für produktive Anwendungen wird **Microsoft Foundry Models empfohlen**.
</details>

<details>
<summary><strong>Wie gehe ich mit Fehlern bei Überschreitung des Kontingents bei Microsoft Foundry Models um?</strong></summary>

```bash
# Aktuellen Kontingent prüfen
az cognitiveservices usage list --location eastus2

# Anderen Bereich versuchen
azd env set AZURE_LOCATION westus2
azd up

# Kapazität vorübergehend reduzieren
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Kontingentserhöhung anfordern
# Zum Azure-Portal > Kontingente > Erhöhung anfordern gehen
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
<summary><strong>Wie sichere ich AI-Modellendpunkte ab?</strong></summary>

**Beste Praktiken**:
1. Verwenden Sie Managed Identity (keine API-Schlüssel)
2. Aktivieren Sie Private Endpoints
3. Konfigurieren Sie Netzwerksicherheitsgruppen
4. Implementieren Sie Rate Limiting
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

**Kapitelnavigation:**
- **📚 Kurs Startseite**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - AI-First Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Ihr erstes Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nächstes Kapitel**: [AI Modell-Bereitstellung](ai-model-deployment.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brauchen Sie Hilfe?** Treten Sie unseren Community-Diskussionen bei oder eröffnen Sie ein Issue im Repository. Die Azure AI + AZD Community ist hier, um Ihnen zum Erfolg zu verhelfen!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->