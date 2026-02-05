# Microsoft Foundry-Integration mit AZD

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - AI-First-Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Ihr erstes Projekt](../getting-started/first-project.md)
- **➡️ Weiter**: [AI-Modellbereitstellung](ai-model-deployment.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

## Überblick

Diese Anleitung zeigt, wie Microsoft Foundry-Dienste mit Azure Developer CLI (AZD) integriert werden können, um die Bereitstellung von KI-Anwendungen zu vereinfachen. Microsoft Foundry bietet eine umfassende Plattform für die Entwicklung, Bereitstellung und Verwaltung von KI-Anwendungen, während AZD den Infrastruktur- und Bereitstellungsprozess vereinfacht.

## Was ist Microsoft Foundry?

Microsoft Foundry ist die einheitliche Plattform von Microsoft für KI-Entwicklung, die Folgendes umfasst:

- **Modellkatalog**: Zugriff auf modernste KI-Modelle
- **Prompt Flow**: Visueller Designer für KI-Workflows
- **AI Foundry Portal**: Integrierte Entwicklungsumgebung für KI-Anwendungen
- **Bereitstellungsoptionen**: Verschiedene Hosting- und Skalierungsoptionen
- **Sicherheit und Schutz**: Eingebaute Funktionen für verantwortungsvolle KI

## AZD + Microsoft Foundry: Gemeinsam besser

| Funktion | Microsoft Foundry | Vorteil der AZD-Integration |
|----------|-------------------|-----------------------------|
| **Modellbereitstellung** | Manuelle Bereitstellung über Portal | Automatisierte, wiederholbare Bereitstellungen |
| **Infrastruktur** | Klickbasierte Bereitstellung | Infrastruktur als Code (Bicep) |
| **Umgebungsmanagement** | Fokus auf eine Umgebung | Mehrere Umgebungen (Entwicklung/Staging/Produktion) |
| **CI/CD-Integration** | Eingeschränkt | Native Unterstützung für GitHub Actions |
| **Kostenmanagement** | Basisüberwachung | Umgebungsspezifische Kostenoptimierung |

## Voraussetzungen

- Azure-Abonnement mit entsprechenden Berechtigungen
- Installierte Azure Developer CLI
- Zugriff auf Azure OpenAI-Dienste
- Grundkenntnisse in Microsoft Foundry

## Kernintegrationsmuster

### Muster 1: Azure OpenAI-Integration

**Anwendungsfall**: Bereitstellung von Chat-Anwendungen mit Azure OpenAI-Modellen

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
// Azure OpenAI Account
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

### Muster 2: KI-Suche + RAG-Integration

**Anwendungsfall**: Bereitstellung von Anwendungen mit Retrieval-Augmented Generation (RAG)

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

### Muster 3: Dokumentenintelligenz-Integration

**Anwendungsfall**: Workflows zur Dokumentenverarbeitung und -analyse

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

### Bereitstellung mit einem einzigen Befehl

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

## 🔐 Sicherheitsbest Practices

### Konfiguration von Managed Identity

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

## Fehlerbehebung bei häufigen Problemen

### Problem 1: OpenAI-Kontingent überschritten

**Symptome:**
- Bereitstellung schlägt mit Kontingentfehlern fehl
- 429-Fehler in den Anwendungsprotokollen

**Lösungen:**
```bash
# Überprüfen Sie die aktuelle Quotenverwendung
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
- 401/403-Fehler beim Aufrufen von KI-Diensten
- "Zugriff verweigert"-Meldungen

**Lösungen:**
```bash
# Überprüfen Sie die Rollenzuweisungen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Überprüfen Sie die Konfiguration der verwalteten Identität
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validieren Sie den Zugriff auf Key Vault
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
# Anforderungen an die Modellkapazität überprüfen
```

## Beispielvorlagen

### Basis-Chat-Anwendung

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dienste**: Azure OpenAI + Cognitive Search + App Service

**Schnellstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumentenverarbeitungspipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Dienste**: Dokumentenintelligenz + Speicher + Funktionen

**Schnellstart**:
```bash
azd init --template ai-document-processing
azd up
```

### Unternehmens-Chat mit RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dienste**: Azure OpenAI + Suche + Container-Apps + Cosmos DB

**Schnellstart**:
```bash
azd init --template contoso-chat
azd up
```

## Nächste Schritte

1. **Probieren Sie die Beispiele aus**: Beginnen Sie mit einer vorgefertigten Vorlage, die zu Ihrem Anwendungsfall passt
2. **Passen Sie an Ihre Bedürfnisse an**: Ändern Sie die Infrastruktur und den Anwendungscode
3. **Fügen Sie Überwachung hinzu**: Implementieren Sie umfassende Beobachtbarkeit
4. **Optimieren Sie die Kosten**: Feinabstimmung der Konfigurationen für Ihr Budget
5. **Sichern Sie Ihre Bereitstellung**: Implementieren Sie Sicherheitsmuster für Unternehmen
6. **Skalieren Sie auf Produktion**: Fügen Sie Multi-Region- und Hochverfügbarkeitsfunktionen hinzu

## 🎯 Praktische Übungen

### Übung 1: Bereitstellung einer Azure OpenAI-Chat-App (30 Minuten)
**Ziel**: Bereitstellen und Testen einer produktionsreifen KI-Chat-Anwendung

```bash
# Vorlage initialisieren
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Umgebungsvariablen festlegen
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Bereitstellen
azd up

# Anwendung testen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# KI-Operationen überwachen
azd monitor

# Aufräumen
azd down --force --purge
```

**Erfolgskriterien:**
- [ ] Bereitstellung wird ohne Kontingentfehler abgeschlossen
- [ ] Zugriff auf die Chat-Oberfläche im Browser möglich
- [ ] Fragen stellen und KI-gestützte Antworten erhalten
- [ ] Application Insights zeigt Telemetriedaten
- [ ] Ressourcen erfolgreich bereinigt

**Geschätzte Kosten**: $5-10 für 30 Minuten Testzeit

### Übung 2: Konfiguration einer Multi-Modell-Bereitstellung (45 Minuten)
**Ziel**: Bereitstellung mehrerer KI-Modelle mit unterschiedlichen Konfigurationen

```bash
# Erstellen Sie eine benutzerdefinierte Bicep-Konfiguration
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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
- [ ] Modelle über API zugänglich
- [ ] Beide Modelle können von der Anwendung aufgerufen werden

### Übung 3: Implementierung der Kostenüberwachung (20 Minuten)
**Ziel**: Einrichten von Budgetwarnungen und Kostenverfolgung

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
- [ ] Kosteninformationen im Azure-Portal sichtbar
- [ ] Budgetgrenzen angemessen festgelegt

## 💡 Häufig gestellte Fragen

<details>
<summary><strong>Wie reduziere ich Azure OpenAI-Kosten während der Entwicklung?</strong></summary>

1. **Kostenlose Stufe nutzen**: Azure OpenAI bietet 50.000 Tokens/Monat kostenlos
2. **Kapazität reduzieren**: Kapazität auf 10 TPM statt 30+ für Entwicklung setzen
3. **azd down verwenden**: Ressourcen deallokieren, wenn nicht aktiv entwickelt wird
4. **Antworten zwischenspeichern**: Redis-Cache für wiederholte Abfragen implementieren
5. **Prompt Engineering verwenden**: Tokenverbrauch durch effiziente Prompts reduzieren

```bash
# Entwicklungskonfiguration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Was ist der Unterschied zwischen Azure OpenAI und OpenAI API?</strong></summary>

**Azure OpenAI**:
- Sicherheit und Compliance für Unternehmen
- Integration in private Netzwerke
- SLA-Garantien
- Authentifizierung über Managed Identity
- Höhere Kontingente verfügbar

**OpenAI API**:
- Schnellere Verfügbarkeit neuer Modelle
- Einfachere Einrichtung
- Niedrigere Einstiegshürde
- Nur öffentliches Internet

Für Produktionsanwendungen wird **Azure OpenAI empfohlen**.
</details>

<details>
<summary><strong>Wie gehe ich mit Azure OpenAI-Kontingentüberschreitungsfehlern um?</strong></summary>

```bash
# Überprüfen Sie das aktuelle Kontingent
az cognitiveservices usage list --location eastus2

# Versuchen Sie eine andere Region
azd env set AZURE_LOCATION westus2
azd up

# Kapazität vorübergehend reduzieren
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Kontingenterhöhung anfordern
# Gehen Sie zu Azure-Portal > Kontingente > Erhöhung anfordern
```
</details>

<details>
<summary><strong>Kann ich meine eigenen Daten mit Azure OpenAI verwenden?</strong></summary>

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
<summary><strong>Wie sichere ich KI-Modellendpunkte?</strong></summary>

**Best Practices**:
1. Verwenden Sie Managed Identity (keine API-Schlüssel)
2. Aktivieren Sie Private Endpoints
3. Konfigurieren Sie Netzwerksicherheitsgruppen
4. Implementieren Sie Ratenbegrenzung
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

- **Microsoft Foundry Discord**: [#Azure-Kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Probleme und Diskussionen](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Offizielle Dokumentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - AI-First-Entwicklung
- **⬅️ Vorheriges Kapitel**: [Kapitel 1: Ihr erstes Projekt](../getting-started/first-project.md)
- **➡️ Weiter**: [AI-Modellbereitstellung](ai-model-deployment.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

**Brauchen Sie Hilfe?** Treten Sie unseren Community-Diskussionen bei oder eröffnen Sie ein Problem im Repository. Die Azure AI + AZD-Community unterstützt Sie gerne!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->