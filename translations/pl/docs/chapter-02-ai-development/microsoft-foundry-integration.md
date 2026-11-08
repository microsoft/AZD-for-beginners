# Integracja Microsoft Foundry z AZD

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój skoncentrowany na AI
- **⬅️ Poprzedni rozdział**: [Rozdział 1: Twój pierwszy projekt](../chapter-01-foundation/first-project.md)
- **➡️ Następny**: [Agenci AI](agents.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

## Przegląd

Niniejszy przewodnik pokazuje, jak zintegrować usługi Microsoft Foundry z Azure Developer CLI (AZD) w celu usprawnienia wdrożeń aplikacji AI. Microsoft Foundry oferuje kompleksową platformę do tworzenia, wdrażania i zarządzania aplikacjami AI, natomiast AZD upraszcza proces zarządzania infrastrukturą i wdrożeniami.

## Czym jest Microsoft Foundry?

Microsoft Foundry to zunifikowana platforma Microsoft do rozwoju AI, która obejmuje:

- **Katalog modeli**: Dostęp do najnowocześniejszych modeli AI
- **Prompt Flow**: Wizualny projektant przepływów pracy AI
- **Portal Microsoft Foundry**: Zintegrowane środowisko programistyczne dla aplikacji AI
- **Opcje wdrożenia**: Wiele opcji hostingu i skalowania
- **Bezpieczeństwo i odpowiedzialność**: Wbudowane funkcje odpowiedzialnej AI

## AZD + Microsoft Foundry: Razem lepiej

| Funkcja | Microsoft Foundry | Korzyść integracji AZD |
|---------|-----------------|------------------------|
| **Wdrożenie modelu** | Ręczne wdrożenie przez portal | Automatyczne, powtarzalne wdrożenia |
| **Infrastruktura** | Udostępnianie przez kliknięcia | Infrastruktura jako kod (Bicep) |
| **Zarządzanie środowiskiem** | Skupienie na jednym środowisku | Wielośrodowiskowe (dev/staging/prod) |
| **Integracja CI/CD** | Ograniczona | Natywne wsparcie GitHub Actions |
| **Zarządzanie kosztami** | Podstawowy monitoring | Optymalizacja kosztów specyficzna dla środowiska |

## Wymagania wstępne

- Subskrypcja Azure z odpowiednimi uprawnieniami
- Zainstalowany Azure Developer CLI
- Dostęp do usług Microsoft Foundry Models
- Podstawowa znajomość Microsoft Foundry

> **Przegląd wersji (2026-11-04):** Poradnik AI CLI był sprawdzany względem dokumentacji/źródła `azd` `1.37.2`, agentów `1.0.0-beta.23` oraz oceniania `1.0.0-beta.2`. Używaj `azd >= 1.37.0` dla zintegrowanego przepływu pracy. Zobacz [zmiany i poprawki w wersjach](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); ten przegląd nie certyfikuje każdej szablonowej lub SDK przykładowej implementacji względem działającego wdrożenia.

## Główne wzorce integracji

**Zakres przykładów:** Poniższy Bicep zawiera fragmenty ilustrujące zasoby, a nie pełny szablon do wdrożenia. Zawierający szablon musi definiować nazwy, `location`, zasoby referencyjne, tożsamości, wyniki i hosting aplikacji. Użyj powiązanego przykładu jako punktu wyjścia do uruchomienia. Przykłady Bash wymagają osobnej autoryzacji Azure CLI oprócz `azd auth login`.

### Wzorzec 1: Integracja Microsoft Foundry Models

**Przypadek użycia**: Wdrażanie aplikacji czatowych z modelami Azure OpenAI w Microsoft Foundry

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

Wywołujący potrzebuje dołączonej zarządzanej tożsamości i `Cognitive Services OpenAI User` na poziomie konta; wyłączenie kluczy nie daje dostępu. Przed wdrożeniem zweryfikuj dostępność regionu/modelu/SKU oraz limitów.

### Wzorzec 2: Integracja AI Search + RAG

**Przypadek użycia**: Wdrażanie aplikacji generowanych z pomocą wyszukiwania (RAG)

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

Nie istnieje zasób ARM `Microsoft.Search/searchServices/dataConnections` dla tej integracji. Skonfiguruj indeks wyszukiwania, źródło danych, indeksator/zestaw umiejętności lub wektoryzator przez obsługiwane API na poziomie danych wyszukiwania. Jeśli Wyszukiwarka wywołuje model osadzający, włącz jego zarządzaną tożsamość, nadaj odpowiednią rolę modelu oraz skonfiguruj umiejętność osadzania/wektoryzator. Zobacz [zintegrowaną wektoryzację](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Wzorzec 3: Integracja Document Intelligence

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

Z wyjątkiem udokumentowanych ustawień AZD, takich jak `AZURE_LOCATION`, to są **nazwy customowych parametrów w szablonie**. Nie mają wpływu, chyba że szablon/aplikacja je odczytuje przez mapowanie parametrów i środowiska hosta. Dla `azure-search-openai-demo` używaj rzeczywistych nazw jak `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` i `AZURE_SEARCH_SERVICE_SKU`. Pojemność modelu nie jest SKU konta.

**Konfiguracja produkcyjna:**
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

**Konfiguracja deweloperska:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Bezpieczna konfiguracja z Key Vault

Preferuj Entra ID z wyłączoną lokalną autoryzacją klucza. Poniższe to tylko **stara alternatywa autoryzacji kluczem** dla aplikacji wymagających kluczy: wymaga konta z włączoną autoryzacją klucza, tożsamości aplikacji dołączonej do hosta oraz dostępu do Key Vault i ustawień sieciowych. Nie łącz pobierania kluczy z `disableLocalAuth: true` i nie oczekuj, że wywołania oparte na kluczu zadziałają.

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

## Przepływy wdrożenia

### Rozszerzenia AZD dla Foundry

AZD oferuje rozszerzenia dodające specyficzne możliwości AI do pracy z usługami Microsoft Foundry:

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

Rozszerzenia AI wciąż szybko się rozwijają w wersji preview. Jeśli polecenie zachowuje się inaczej niż tutaj, zaktualizuj odpowiednie rozszerzenie przed diagnozowaniem projektu.

### Wdrożenie najpierw agenta z `azd ai`

Używaj `azd ai agent init` interaktywnie lub przyjmij aktualny szablon projektu agenta `azure.yaml` podłączony do Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` zastępuje przestarzałą odmianę `--manifest`/`-m`; starszy manifest i zagnieżdżona konfiguracja agenta wymagają migracji. Agenci oceniani są przez `azd ai eval` z `azure.ai.evaluations`, nie z usuniętego starego przepływu pracy. Zobacz [migrację oceniania](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) dotyczącą konfiguracji, uruchomienia i wyników.

Zobacz [Polecenia AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) dla pełnego zestawu poleceń i flag.

### Wdrożenie jednym poleceniem

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Wdrożenia specyficzne dla środowiska

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
```

To udostępnia zasób Insights, nie instrumentację telemetryczną. Gdy Twoja aplikacja emituje span-y wywołań modelu wychodzące, uruchom ten ilustracyjny zapytanie w Application Insights Logs (dostosuj filtr do rzeczywistych nazw span-ów):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitorowanie kosztów

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

Użyj prawdziwego odbiorcy i zweryfikuj uprawnienia do zakresu rozliczeń. Budżet wysyła alerty; nie jest limitem wydatków.

## 🔐 Najlepsze praktyki bezpieczeństwa

### Konfiguracja zarządzanej tożsamości

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

Ten fragment punktu końcowego wymaga także prywatnej strefy/grupy DNS, powiązań VNet, łączności aplikacji z VNet oraz wyraźnej polityki dostępu publicznego. Utworzenie prywatnego punktu końcowego samo nie wyłącza dostępu publicznego.

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

Azure Cache for Redis Basic/Standard/Premium znajduje się na [ścieżce wygaszania](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); używaj Azure Managed Redis dla nowych wdrożeń i postępuj zgodnie z jego aktualnym przewodnikiem dotyczącym szablonów i uwierzytelniania. Zakres buforowanych odpowiedzi AI powiązany jest z autoryzacją, modelem/instrukcjami i wersją danych, z datą wygaśnięcia; nigdy nie udostępniaj prywatnych odpowiedzi tylko na podstawie tekstu zapytania.

### Konfiguracja auto-skalowania

**Fragment zasobu:** połącz te ustawienia skalowania/wejścia w pełny Container App z zarządzanym środowiskiem, obrazem kontenera i limitami zasobów. Więcej replik nie zwiększa limitu modelu.

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
- Wdrożenie nieudane z błędami limitu
- Błędy 429 w logach aplikacji

**Rozwiązania:**
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

Zmienna pojemności powyżej dotyczy tylko niestandardowego szablonu, który ją wykorzystuje. Dla przykładu RAG użyj `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Nie zmieniaj `AZURE_LOCATION` w celu przeniesienia istniejących zasobów na miejsce; utwórz oddzielne środowisko dla nowego regionu i zaplanuj migrację/porządki.

### Problem 2: Błędy uwierzytelniania

**Objawy:**
- Błędy 401/403 podczas wywołań usług AI
- Komunikaty „Dostęp zabroniony”

**Rozwiązania:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problem 3: Problemy z wdrożeniem modeli

**Objawy:**
- Modele niedostępne we wdrożeniu
- Konkretnie wersje modeli nieudane

**Rozwiązania:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Przykładowe szablony

To są alternatywy, a nie kolejno wykonywane polecenia. Rozpoczynaj każde w osobnym pustym katalogu. Wyraźny cel `.` pozwala inicjalizować w bieżącym katalogu; w przeciwnym razie aktualny AZD może utworzyć podrzędny katalog o nazwie szablonu bez zmiany katalogu roboczego powłoki.

### Aplikacja czatowa RAG (Python)

**Repozytorium**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Usługi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Referencyjna aplikacja czatu RAG do pytań nad dokumentami z wyszukiwaniem Azure AI Search. Przed użyciem zapoznaj się z obsługiwanymi modelami, opcjonalnymi funkcjami, wytycznymi kosztowymi i utwardzeniem produkcyjnym; wdrożenie przykładu nie czyni aplikacji gotową do produkcji.

**Szybki start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplikacja czatowa RAG (.NET)

**Repozytorium**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Usługi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: Odpowiednik czatu RAG w Pythonie w technologii .NET/C#. Zbudowany z użyciem ASP.NET Core Minimal API i frontendem Blazor WebAssembly. Zawiera czat głosowy, wsparcie GPT-4o-mini vision oraz towarzyszącego klienta .NET MAUI Blazor Hybrid na desktop i urządzenia mobilne.

**Szybki start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplikacja czatowa RAG (Java)

**Repozytorium**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Usługi**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Wersja Java czatu RAG z użyciem Langchain4J do orkiestracji AI. Wspiera architekturę mikroserwisów event-driven, różnorodne strategie wyszukiwania (tekst, wektor, hybrydowe), przesyłanie dokumentów z Azure Document Intelligence oraz wdrożenie na Azure Container Apps lub Azure Kubernetes Service.

**Szybki start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copilot dla detalistów enterprise z Microsoft Foundry

**Repozytorium**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Usługi**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: Kompleksowy copilot detaliczny RAG wykorzystujący Microsoft Foundry i Prompty. Chatbot Contoso Outdoor, który opiera odpowiedzi na katalogu produktów i danych o zamówieniach klientów. Demonstruje pełny przepływ GenAIOps — prototypowanie z Prompty, ocenianie z asystą AI oraz wdrażanie poprzez AZD do Container Apps.

**Szybki start**:
```bash
azd init --template contoso-chat .
azd up
```

### Wieloagentowa aplikacja do kreatywnego pisania

**Repozytorium**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Usługi**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Przykład wieloagentowy demonstrujący orkiestrację agentów AI z Prompty. Używa agenta badawczego (Bing Grounding w Azure AI Agent Service), agenta produktu (Azure AI Search), agenta piszącego oraz agenta redaktora do wspólnego tworzenia dobrze badanych artykułów. Zawiera CI/CD z oceną w GitHub Actions.

**Szybki start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repozytorium**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Usługi**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Opis**: W pełni bezserwerowy chatbot RAG wykorzystujący LangChain.js z Azure Functions dla API oraz Azure Static Web Apps dla hostingu. Używa Azure Cosmos DB jako bazy danych wektorów i historii czatu. Wspiera lokalny rozwój z Ollama dla testów bezkosztowych.

**Szybki start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Accelerator do Czatu z Twoimi Danymi

**Repozytorium**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Usługi**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search z Cosmos DB lub PostgreSQL z pgvector

**Opis**: Accelerator czatu oparty na dokumentach z cytowaniami. Obecny przykład hostuje frontend React, backend FastAPI i pracownika Functions do pobierania na Container Apps; opcje orkiestracji to Agent Framework i LangGraph. Opcje bazy danych/pobierania wybierane podczas wdrożenia. To punkt startu, nie system produkcyjny „pod klucz”; nie zakładaj, że starsze warianty App Service, Semantic Kernel lub Prompt Flow opisują obecny standard.

**Szybki start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agenci Podróży AI — Orkiestracja Multi-Agent MCP

**Repozytorium**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Usługi**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Serwery MCP (.NET, Python, Java, TypeScript)

**Opis**: Aplikacja referencyjna do orkiestracji AI wielu agentów z użyciem trzech frameworków (LangChain.js, LlamaIndex.TS i Microsoft Agent Framework). Zawiera serwery MCP (Model Context Protocol) w czterech językach, wdrożone jako bezserwerowe Azure Container Apps z monitorowaniem OpenTelemetry.

**Szybki start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Przeglądaj więcej szablonów**: Odwiedź [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai), aby zobaczyć dostępne szablony w różnych językach i scenariuszach. Każdy podlinkowany przykład to zewnętrzne repozytorium, a nie lokalny przykład dostarczony w tym kursie; sprawdź jego aktualne wymagania i wskazówki produkcyjne przed wdrożeniem.

## Kolejne kroki

1. **Wypróbuj przykłady**: Zacznij od gotowego szablonu dopasowanego do twojego przypadku użycia
2. **Dostosuj do swoich potrzeb**: Zmodyfikuj infrastrukturę i kod aplikacji
3. **Dodaj monitoring**: Wdróż kompleksową obserwowalność
4. **Optymalizuj koszty**: Dostosuj konfiguracje do budżetu
5. **Zabezpiecz wdrożenie**: Wdróż wzorce bezpieczeństwa klasy korporacyjnej
6. **Skaluj do produkcji**: Dodaj funkcje wieloregionalne i wysokiej dostępności

## 🎯 Ćwiczenia praktyczne

### Ćwiczenie 1: Wdróż aplikację czatu Microsoft Foundry Models (30 minut)
**Cel**: Wdróż i przetestuj aplikację referencyjną czatu AI

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

**Kryteria sukcesu:**
- [ ] Wdrożenie zakończone bez błędów limitów
- [ ] Możliwość dostępu do interfejsu czatu w przeglądarce
- [ ] Możliwość zadawania pytań i otrzymywania odpowiedzi zasilanych AI
- [ ] Application Insights pokazuje dane telemetryczne
- [ ] Zasoby zostały pomyślnie usunięte

**Koszt:** Przed wdrożeniem zapoznaj się z aktualnym przewodnikiem kosztów i wybranymi SKU. Opłaty trwają aż do usunięcia zasobów; brak stałego 30-minutowego szacunku dla każdej konfiguracji.

### Ćwiczenie 2: Skonfiguruj wdrożenie wielu modeli (45 minut)
**Cel**: Wdróż wiele modeli AI z różnymi konfiguracjami

**Punkt startowy:** Istniejące konto Azure OpenAI oraz moduł grupy zasobów AZD, który może wywołać ten plik. Utwórz `infra/ai-models.bicep` z następującą zawartością w swoim edytorze. Nie jest automatycznie wdrażany tylko dlatego, że jest pod `infra/`.

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

Z modułu grupy zasobów, który posiada konto, dodaj wywołanie modułu (dostosuj nazwę symbolu do swojego konta):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Nie deklaruj tych samych wdrożeń w obu modułach. Jeśli punkt wejścia AZD jest na poziomie subskrypcji, wywołaj to z jego modułu grupy zasobów potomnego i dostosuj ścieżkę względną. Zbuduj ten moduł zawierający za pomocą `az bicep build --file <path-to-containing-module>`, następnie:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kryteria sukcesu:**
- [ ] Kilka modeli pomyślnie wdrożonych
- [ ] Zastosowano różne ustawienia pojemności
- [ ] Modele dostępne przez API
- [ ] Aplikacja może wywoływać oba modele

### Ćwiczenie 3: Wdróż monitoring kosztów (20 minut)
**Cel**: Skonfiguruj alerty budżetowe i śledzenie kosztów

**Punkt startowy:** Wzorzec budżetowy powyżej i moduł infrastruktury w zakresie grupy zasobów. Dodaj ten zasób w swoim edytorze; przekaż `budgetStartDate` ze swojego mapowania parametrów (nie duplikuj parametru, jeśli już zadeklarowany). Zamień odbiorcę i potwierdź, że masz dostęp do zapisu budżetu.

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

Oczekiwane: odpowiedź zawiera `amount: 200`, oba progi i twojego odbiorcę. Sprawdź Zarządzanie kosztami w portalu dla rzeczywistych opłat; dane kosztów są opóźnione, więc alert nie musi się włączać podczas krótkiego ćwiczenia.

**Kryteria sukcesu:**
- [ ] Alert budżetowy utworzony w Azure
- [ ] Konfiguracja powiadomień e-mail
- [ ] Możliwość przeglądania danych kosztów w portalu Azure
- [ ] Progi budżetowe odpowiednio ustawione

## 💡 Najczęściej zadawane pytania

<details>
<summary><strong>Jak zmniejszyć koszty Microsoft Foundry Models podczas rozwoju?</strong></summary>

1. **Sprawdź cennik**: Nie ma uniwersalnego darmowego limitu 50 000 tokenów miesięcznie dla modeli Azure OpenAI
2. **Dopasuj pojemność**: Pojemność `10` zazwyczaj oznacza 10 000 TPM dla tych Standardowych modeli tekstowych, a nie 10 TPM. Obniżenie limitu przepustowości nie zmniejsza cen za token
3. **Używaj azd down**: Usuwaj zasoby tymczasowe, gdy nie rozwijasz aktywnie (to nie dezalokacja)
4. **Buforuj odpowiedzi**: Wdróż pamięć podręczną Redis dla powtarzanych zapytań
5. **Używaj inżynierii promptów**: Zmniejsz zużycie tokenów efektywnymi promptami

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Jaka jest różnica między Microsoft Foundry Models a OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Bezpieczeństwo i zgodność na poziomie przedsiębiorstwa
- Integracja z prywatną siecią
- Gwarancje SLA
- Uwierzytelnianie managed identity
- Wyższe dostępne limity

**OpenAI API**: Oddzielny dostawca/API z własną dostępnością modeli, cennikiem, uwierzytelnianiem i opcjami łączności korporacyjnej. Porównuj aktualne oferty, zamiast zakładać, że jest dostępne tylko przez publiczny internet lub że zawsze dostarcza modele najpierw.

Wybieraj na podstawie wymagań organizacji; przykłady managed identity i private-link specyficzne dla Azure w tym kursie dotyczą usług hostowanych w Azure, a nie każdego modelu/dostawcy w katalogu Foundry.
</details>

<details>
<summary><strong>Jak radzić sobie z błędami przekroczenia limitu Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Czy mogę używać własnych danych z Microsoft Foundry Models?</strong></summary>

Tak! Użyj **Azure AI Search** dla RAG (Retrieval Augmented Generation):

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

Zobacz szablon [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Jak zabezpieczyć punkty końcowe modeli AI?</strong></summary>

**Najlepsze praktyki**:
1. Używaj Managed Identity (bez kluczy API)
2. Włącz Prywatne Punkty Końcowe
3. Skonfiguruj grupy zabezpieczeń sieci
4. Wdróż ograniczanie szybkości
5. Używaj Azure Key Vault na sekrety

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
- **Agent Skills**: [Umiejętność Microsoft Foundry na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Zainstaluj umiejętności agenta Azure + Foundry w swoim edytorze za pomocą `npx skills add microsoft/github-copilot-for-azure`

---

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój z AI jako priorytetem
- **⬅️ Poprzedni rozdział**: [Rozdział 1: Twój pierwszy projekt](../chapter-01-foundation/first-project.md)
- **➡️ Następny**: [Agent AI](agents.md)
- **🚀 Kolejny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

**Potrzebujesz pomocy?** Dołącz do dyskusji społeczności lub zgłoś problem w repozytorium. Społeczność Azure AI + AZD jest tu, by pomóc Ci odnieść sukces!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->