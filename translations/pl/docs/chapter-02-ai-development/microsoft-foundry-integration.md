# Integracja Microsoft Foundry z AZD

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD Dla Początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Programowanie AI-First
- **⬅️ Poprzedni rozdział**: [Rozdział 1: Twój pierwszy projekt](../chapter-01-foundation/first-project.md)
- **➡️ Następny**: [Wdrażanie modelu AI](ai-model-deployment.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

## Przegląd

Ten przewodnik pokazuje, jak zintegrować usługi Microsoft Foundry z interfejsem Azure Developer CLI (AZD) w celu usprawnionego wdrażania aplikacji AI. Microsoft Foundry zapewnia kompleksową platformę do tworzenia, wdrażania i zarządzania aplikacjami AI, podczas gdy AZD upraszcza proces infrastruktury i wdrażania.

## Co to jest Microsoft Foundry?

Microsoft Foundry to zunifikowana platforma Microsoft do tworzenia AI, która obejmuje:

- **Katalog modeli**: Dostęp do najnowocześniejszych modeli AI
- **Prompt Flow**: Wizualny kreator przepływów AI
- **Portal Microsoft Foundry**: Zintegrowane środowisko deweloperskie dla aplikacji AI
- **Opcje wdrażania**: Różnorodne opcje hostingu i skalowania
- **Bezpieczeństwo i ochrona**: Wbudowane funkcje odpowiedzialnej AI

## AZD + Microsoft Foundry: Razem lepiej

| Funkcja | Microsoft Foundry | Korzyści integracji z AZD |
|---------|-----------------|------------------------|
| **Wdrażanie modeli** | Ręczne wdrażanie przez portal | Zautomatyzowane, powtarzalne wdrożenia |
| **Infrastruktura** | Konfiguracja przez kliknięcie | Infrastruktura jako kod (Bicep) |
| **Zarządzanie środowiskami** | Skupienie na jednym środowisku | Obsługa wielu środowisk (dev/staging/prod) |
| **Integracja CI/CD** | Ograniczona | Natywne wsparcie GitHub Actions |
| **Zarządzanie kosztami** | Podstawowy monitoring | Optymalizacja kosztów specyficzna dla środowiska |

## Wymagania wstępne

- Subskrypcja Azure z odpowiednimi uprawnieniami
- Zainstalowany Azure Developer CLI
- Dostęp do usług Microsoft Foundry Models
- Podstawowa znajomość Microsoft Foundry

> **Aktualna baza AZD:** Te przykłady zostały sprawdzone na `azd` `1.27.1`. Dla przepływu agenta AI użyj aktualnej wersji rozszerzenia preview i sprawdź zainstalowaną wersję przed rozpoczęciem.

## Podstawowe wzorce integracji

### Wzorzec 1: Integracja Microsoft Foundry Models

**Przypadek użycia**: Wdrażanie aplikacji czatu z modelami Microsoft Foundry Models

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

**Infrastruktura (main.bicep):**
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

### Wzorzec 2: Integracja AI Search + RAG

**Przypadek użycia**: Wdrażanie aplikacji generowania uzupełnionego wyszukiwaniem (RAG)

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

### Wzorzec 3: Integracja inteligencji dokumentów

**Przypadek użycia**: Przepływy pracy przetwarzania i analizy dokumentów

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

## 🔧 Wzorce konfiguracji

### Konfiguracja zmiennych środowiskowych

**Konfiguracja produkcyjna:**
```bash
# Podstawowe usługi AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfiguracje modeli
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Ustawienia wydajności
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfiguracja developerska:**
```bash
# Ustawienia zoptymalizowane pod kątem kosztów dla rozwoju
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Darmowy poziom
```

### Bezpieczna konfiguracja z Key Vault

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

## Przepływy wdrażania

### Rozszerzenia AZD dla Foundry

AZD dostarcza rozszerzenia, które dodają możliwości specyficzne dla AI do pracy z usługami Microsoft Foundry:

```bash
# Zainstaluj rozszerzenie agentów Foundry
azd extension install azure.ai.agents

# Zainstaluj rozszerzenie do dopasowywania
azd extension install azure.ai.finetune

# Zainstaluj rozszerzenie niestandardowych modeli
azd extension install azure.ai.models

# Wyświetl listę zainstalowanych rozszerzeń
azd extension list --installed

# Sprawdź aktualnie zainstalowaną wersję rozszerzenia agenta
azd extension show azure.ai.agents
```

Rozszerzenia AI są nadal intensywnie rozwijane w wersji preview. Jeśli polecenie działa inaczej niż pokazano tutaj, zaktualizuj odpowiednie rozszerzenie przed rozwiązywaniem problemów z samym projektem.

### Wdrażanie z agentem za pomocą `azd ai`

Jeśli posiadasz manifest agenta, użyj `azd ai agent init` do wygenerowania projektu połączonego z usługą Foundry Agent:

```bash
# Inicjalizuj z manifestu agenta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Wdróż do Azure
azd up
```

Ostatnie wersje preview `azure.ai.agents` dodały również wsparcie inicjalizacji bazującej na szablonach dla `azd ai agent init`. Jeśli korzystasz z nowszych przykładów agentów, sprawdź pomoc rozszerzenia dla dokładnych dostępnych flag w Twojej wersji.

Zobacz [Polecenia AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) dla pełnej referencji poleceń i flag.

### Wdrażanie jednolinijkowe

```bash
# Wdróż wszystko za pomocą jednego polecenia
azd up

# Lub wdrażaj stopniowo
azd provision  # Tylko infrastruktura
azd deploy     # Tylko aplikacja

# Do długotrwałych wdrożeń aplikacji AI w azd 1.23.11+
azd deploy --timeout 1800
```

### Wdrażania specyficzne dla środowiska

```bash
# Środowisko programistyczne
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Środowisko produkcyjne
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitorowanie i obserwowalność

### Integracja Application Insights

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

### Monitorowanie kosztów

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

## 🔐 Najlepsze praktyki bezpieczeństwa

### Konfiguracja tożsamości zarządzanej

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

### Bezpieczeństwo sieci

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

## Optymalizacja wydajności

### Strategie buforowania

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

### Konfiguracja autoskalowania

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

## Rozwiązywanie typowych problemów

### Problem 1: Przekroczony limit OpenAI

**Objawy:**
- Wdrożenie nie powiodło się z powodu błędów limitu
- Błędy 429 w logach aplikacji

**Rozwiązania:**
```bash
# Sprawdź bieżące zużycie limitu
az cognitiveservices usage list --location eastus

# Spróbuj innego regionu
azd env set AZURE_LOCATION westus2
azd up

# Tymczasowo zmniejsz pojemność
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Błędy uwierzytelniania

**Objawy:**
- Błędy 401/403 podczas wywołań usług AI
- Komunikaty "Dostęp zabroniony"

**Rozwiązania:**
```bash
# Zweryfikuj przypisania ról
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Sprawdź konfigurację zarządzanej tożsamości
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Zweryfikuj dostęp do Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problemy z wdrożeniem modelu

**Objawy:**
- Modele niedostępne we wdrożeniu
- Niepowodzenia konkretnych wersji modeli

**Rozwiązania:**
```bash
# Wyświetl dostępne modele według regionu
az cognitiveservices model list --location eastus

# Zaktualizuj wersję modelu w szablonie bicep
# Sprawdź wymagania dotyczące pojemności modelu
```

## Przykładowe szablony

### Aplikacja czatu RAG (Python)

**Repozytorium**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Usługi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Najpopularniejszy przykład Azure AI — gotowa do produkcji aplikacja czatu RAG pozwalająca zadawać pytania na podstawie własnych dokumentów. Używa GPT-4.1-mini do czatu, text-embedding-3-large do osadzania i Azure AI Search do wyszukiwania. Obsługuje dokumenty multimodalne, wejście/wyjście mowy, uwierzytelnianie Microsoft Entra i śledzenie w Application Insights.

**Szybki start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplikacja czatu RAG (.NET)

**Repozytorium**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Usługi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: .NET/C# odpowiednik przykładu czatu RAG w Pythonie. Zbudowany z ASP.NET Core Minimal API i frontendem Blazor WebAssembly. Zawiera czat głosowy, wsparcie GPT-4o-mini vision oraz towarzyszącego klienta .NET MAUI Blazor Hybrid na desktop/mobilne.

**Szybki start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplikacja czatu RAG (Java)

**Repozytorium**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Usługi**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Wersja Java przykładu czatu RAG używająca Langchain4J do orkiestracji AI. Obsługuje architekturę mikroserwisów opartą na zdarzeniach, różne strategie wyszukiwania (tekst, wektor, hybryda), przesyłanie dokumentów z Azure Document Intelligence oraz wdrożenie na Azure Container Apps lub Azure Kubernetes Service.

**Szybki start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot Retail Enterprise z Microsoft Foundry

**Repozytorium**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Usługi**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: Kompleksowy copilot retail RAG wykorzystujący Microsoft Foundry i Prompty. Chatbot sieci handlowej Contoso Outdoor opierający odpowiedzi na katalogu produktów i danych o zamówieniach klientów. Demonstruje pełny przepływ pracy GenAIOps — prototypowanie z Prompty, ocena z pomocą evaluatorów AI oraz wdrożenie przez AZD do Container Apps.

**Szybki start**:
```bash
azd init --template contoso-chat
azd up
```

### Aplikacja wielo-agentowa do pisania kreatywnego

**Repozytorium**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Usługi**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Przykład wielo-agentowy pokazujący orkiestrację agentów AI z Prompty. Używa agenta badawczego (Bing Grounding w Azure AI Agent Service), agenta produktowego (Azure AI Search), agenta pisarza i agenta redaktora do wspólnego tworzenia dobrze zbadanych artykułów. Zawiera CI/CD z oceną w GitHub Actions.

**Szybki start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repozytorium**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Usługi**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Opis**: W pełni bezserwerowy chatbot RAG korzystający z LangChain.js z Azure Functions jako API i Azure Static Web Apps do hostingu. Używa Azure Cosmos DB jako magazynu wektorów i bazy historii czatu. Obsługuje lokalny rozwój z Ollama do testów bezkosztowych.

**Szybki start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repozytorium**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Usługi**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Opis**: Enterprise-grade RAG solution accelerator z panelem administracyjnym do przesyłania i zarządzania dokumentami, wieloma opcjami orkiestracji (Semantic Kernel, LangChain, Prompt Flow), rozpoznawaniem mowy, integracją Microsoft Teams oraz wyborem backendu PostgreSQL lub Cosmos DB. Zaprojektowany jako punkt startowy do personalizacji scenariuszy produkcyjnych RAG.

**Szybki start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agent Podróżniczy AI — wielo-agentowa orkiestracja MCP

**Repozytorium**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Usługi**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + serwery MCP (.NET, Python, Java, TypeScript)

**Opis**: Aplikacja referencyjna do orkiestracji AI wielo-agentowej korzystająca z trzech frameworków (LangChain.js, LlamaIndex.TS i Microsoft Agent Framework). Posiada serwery MCP (Model Context Protocol) w czterech językach, wdrożone jako bezserwerowe Azure Container Apps z monitorowaniem OpenTelemetry.

**Szybki start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repozytorium**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Usługi**: Usługi Azure AI + Azure OpenAI

**Opis**: Minimalny szablon Bicep, który wdraża usługi Azure AI z skonfigurowanymi modelami uczenia maszynowego. Lekka baza startowa, gdy potrzebujesz jedynie infrastruktury Azure AI bez pełnego stosu aplikacji.

**Szybki start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Przeglądaj więcej szablonów**: Odwiedź [Galeria Awesome AZD AI Template](https://azure.github.io/awesome-azd/?tags=ai) z ponad 80 szablonami AZD specyficznymi dla AI w różnych językach i scenariuszach.

## Kolejne kroki

1. **Wypróbuj przykłady**: Zacznij od szablonu dopasowanego do Twojego przypadku użycia
2. **Dostosuj do swoich potrzeb**: Modyfikuj infrastrukturę i kod aplikacji
3. **Dodaj monitoring**: Wdróż kompleksową obserwowalność
4. **Optymalizuj koszty**: Dopasuj konfiguracje do budżetu
5. **Zabezpiecz wdrożenie**: Wdróż wzorce bezpieczeństwa klasy enterprise
6. **Skaluj do produkcji**: Dodaj funkcje wielu regionów i wysokiej dostępności

## 🎯 Ćwiczenia praktyczne

### Ćwiczenie 1: Wdrożenie aplikacji czatu Microsoft Foundry Models (30 minut)
**Cel**: Wdróż i przetestuj produkcyjną aplikację czat AI

```bash
# Inicjalizuj szablon
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Ustaw zmienne środowiskowe
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Wdróż
azd up

# Przetestuj aplikację
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitoruj operacje AI
azd monitor

# Wyczyść środowisko
azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Wdrożenie zakończone bez błędów limitu
- [ ] Możliwość dostępu do interfejsu czatu w przeglądarce
- [ ] Możliwość zadawania pytań i otrzymywania odpowiedzi AI
- [ ] Application Insights pokazuje dane telemetryczne
- [ ] Pomyślne usunięcie zasobów po teście

**Szacowane koszty**: 5-10 USD za 30 minut testów

### Ćwiczenie 2: Konfiguracja wdrożenia wielu modeli (45 minut)
**Cel**: Wdróż wiele modeli AI z różnymi konfiguracjami

```bash
# Utwórz niestandardową konfigurację Bicep
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

# Wdróż i zweryfikuj
azd provision
azd show
```

**Kryteria sukcesu:**
- [ ] Wiele modeli pomyślnie wdrożonych
- [ ] Zastosowane różne ustawienia pojemności
- [ ] Modele dostępne przez API
- [ ] Możliwość wywołania obu modeli z aplikacji

### Ćwiczenie 3: Implementacja monitorowania kosztów (20 minut)
**Cel**: Skonfiguruj alerty budżetowe i śledzenie kosztów

```bash
# Dodaj alert budżetowy do Bicep
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

# Wdrażaj alert budżetowy
azd provision

# Sprawdź bieżące koszty
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kryteria sukcesu:**
- [ ] Utworzony alert budżetowy w Azure
- [ ] Skonfigurowane powiadomienia e-mail
- [ ] Możliwość przeglądania danych kosztów w Azure Portal
- [ ] Odpowiednio ustawione progi budżetowe

## 💡 Często zadawane pytania

<details>
<summary><strong>Jak zmniejszyć koszty Microsoft Foundry Models podczas tworzenia?</strong></summary>

1. **Używaj warstwy darmowej**: Microsoft Foundry Models oferuje 50 000 tokenów/miesiąc za darmo
2. **Zmniejsz pojemność**: Ustaw pojemność na 10 TPM zamiast 30+ na dev
3. **Używaj azd down**: Zwolnij zasoby, gdy nie pracujesz aktywnie nad developmentem
4. **Buforuj odpowiedzi**: Wdróż Redis cache dla powtarzalnych zapytań
5. **Korzystaj z inżynierii promptów**: Zmniejsz zużycie tokenów przez efektywne promptowanie


```bash
# Konfiguracja deweloperska
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Jaka jest różnica między modelami Microsoft Foundry a API OpenAI?</strong></summary>

**Modele Microsoft Foundry**:
- Bezpieczeństwo i zgodność na poziomie przedsiębiorstwa
- Integracja z prywatną siecią
- Gwarancje SLA
- Uwierzytelnianie za pomocą zarządzanej tożsamości
- Dostępne wyższe limity

**API OpenAI**:
- Szybszy dostęp do nowych modeli
- Prostsza konfiguracja
- Niższa bariera wejścia
- Tylko publiczny internet

Dla aplikacji produkcyjnych **zalecane są modele Microsoft Foundry**.
</details>

<details>
<summary><strong>Jak radzić sobie z błędami przekroczenia limitu w modelach Microsoft Foundry?</strong></summary>

```bash
# Sprawdź bieżące limity
az cognitiveservices usage list --location eastus2

# Wypróbuj inny region
azd env set AZURE_LOCATION westus2
azd up

# Tymczasowo zmniejsz pojemność
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Poproś o zwiększenie limitu
# Przejdź do Azure Portal > Limity > Poproś o zwiększenie
```
</details>

<details>
<summary><strong>Czy mogę używać własnych danych z modelami Microsoft Foundry?</strong></summary>

Tak! Użyj **Azure AI Search** do RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Zobacz szablon [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Jak zabezpieczyć punkty końcowe modeli AI?</strong></summary>

**Najlepsze praktyki**:
1. Używaj zarządzanej tożsamości (bez kluczy API)
2. Włącz prywatne punkty końcowe
3. Skonfiguruj grupy zabezpieczeń sieci
4. Wdróż ograniczanie szybkości
5. Używaj Azure Key Vault do tajemnic

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

## Społeczność i wsparcie

- **Microsoft Foundry Discord**: [kanał #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Zgłoszenia i dyskusje](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficjalna dokumentacja](https://learn.microsoft.com/azure/ai-studio/)
- **Umiejętności agenta**: [Umiejętność Microsoft Foundry na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Zainstaluj umiejętności agenta Azure + Foundry w swoim edytorze za pomocą `npx skills add microsoft/github-copilot-for-azure`

---

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój w modelu AI-First
- **⬅️ Poprzedni rozdział**: [Rozdział 1: Twój pierwszy projekt](../chapter-01-foundation/first-project.md)
- **➡️ Następny**: [Wdrożenie modelu AI](ai-model-deployment.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

**Potrzebujesz pomocy?** Dołącz do naszych dyskusji społecznościowych lub otwórz zgłoszenie w repozytorium. Społeczność Azure AI + AZD jest tutaj, by pomóc Ci odnieść sukces!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->