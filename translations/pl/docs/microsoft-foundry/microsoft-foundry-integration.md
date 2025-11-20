<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-20T02:54:02+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "pl"
}
-->
# Integracja Microsoft Foundry z AZD

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Rozwój oparty na AI
- **⬅️ Poprzedni rozdział**: [Rozdział 1: Twój pierwszy projekt](../getting-started/first-project.md)
- **➡️ Następny**: [Wdrażanie modelu AI](ai-model-deployment.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../getting-started/configuration.md)

## Przegląd

Ten przewodnik pokazuje, jak zintegrować usługi Microsoft Foundry z Azure Developer CLI (AZD) w celu uproszczonego wdrażania aplikacji AI. Microsoft Foundry oferuje kompleksową platformę do tworzenia, wdrażania i zarządzania aplikacjami AI, podczas gdy AZD upraszcza proces infrastruktury i wdrażania.

## Czym jest Microsoft Foundry?

Microsoft Foundry to zintegrowana platforma Microsoftu do rozwoju AI, która obejmuje:

- **Katalog modeli**: Dostęp do najnowocześniejszych modeli AI
- **Prompt Flow**: Wizualny projektant przepływów AI
- **Portal AI Foundry**: Zintegrowane środowisko rozwoju aplikacji AI
- **Opcje wdrażania**: Różnorodne opcje hostingu i skalowania
- **Bezpieczeństwo i ochrona**: Wbudowane funkcje odpowiedzialnego AI

## AZD + Microsoft Foundry: Lepsze razem

| Funkcja | Microsoft Foundry | Korzyść z integracji z AZD |
|---------|-----------------|------------------------|
| **Wdrażanie modeli** | Ręczne wdrażanie przez portal | Zautomatyzowane, powtarzalne wdrożenia |
| **Infrastruktura** | Tworzenie za pomocą kliknięć | Infrastruktura jako kod (Bicep) |
| **Zarządzanie środowiskiem** | Skupienie na jednym środowisku | Wielośrodowiskowe (dev/staging/prod) |
| **Integracja CI/CD** | Ograniczona | Wbudowane wsparcie dla GitHub Actions |
| **Zarządzanie kosztami** | Podstawowy monitoring | Optymalizacja kosztów dla konkretnych środowisk |

## Wymagania wstępne

- Subskrypcja Azure z odpowiednimi uprawnieniami
- Zainstalowany Azure Developer CLI
- Dostęp do usług Azure OpenAI
- Podstawowa znajomość Microsoft Foundry

## Podstawowe wzorce integracji

### Wzorzec 1: Integracja Azure OpenAI

**Zastosowanie**: Wdrażanie aplikacji czatowych z modelami Azure OpenAI

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

### Wzorzec 2: Integracja AI Search + RAG

**Zastosowanie**: Wdrażanie aplikacji z generacją wspomaganą wyszukiwaniem (RAG)

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

### Wzorzec 3: Integracja Document Intelligence

**Zastosowanie**: Przetwarzanie i analiza dokumentów

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

### Ustawienia zmiennych środowiskowych

**Konfiguracja produkcyjna:**
```bash
# Podstawowe usługi AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfiguracje modelu
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Ustawienia wydajności
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfiguracja deweloperska:**
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

## Procesy wdrażania

### Wdrażanie jednym poleceniem

```bash
# Wdróż wszystko jednym poleceniem
azd up

# Lub wdrażaj stopniowo
azd provision  # Tylko infrastruktura
azd deploy     # Tylko aplikacja
```

### Wdrażanie specyficzne dla środowiska

```bash
# Środowisko deweloperskie
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

### Integracja z Application Insights

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

### Konfiguracja automatycznego skalowania

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

### Problem 1: Przekroczony limit Azure OpenAI

**Objawy:**
- Wdrożenie kończy się błędami limitu
- Błędy 429 w logach aplikacji

**Rozwiązania:**
```bash
# Sprawdź bieżące wykorzystanie limitu
az cognitiveservices usage list --location eastus

# Spróbuj inny region
azd env set AZURE_LOCATION westus2
azd up

# Tymczasowo zmniejsz pojemność
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Problemy z uwierzytelnianiem

**Objawy:**
- Błędy 401/403 podczas wywoływania usług AI
- Komunikaty "Odmowa dostępu"

**Rozwiązania:**
```bash
# Zweryfikuj przypisania ról
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Sprawdź konfigurację zarządzanej tożsamości
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Zweryfikuj dostęp do Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problemy z wdrażaniem modeli

**Objawy:**
- Modele niedostępne w wdrożeniu
- Problemy z konkretnymi wersjami modeli

**Rozwiązania:**
```bash
# Wyświetl dostępne modele według regionu
az cognitiveservices model list --location eastus

# Zaktualizuj wersję modelu w szablonie bicep
# Sprawdź wymagania dotyczące pojemności modelu
```

## Przykładowe szablony

### Podstawowa aplikacja czatowa

**Repozytorium**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Usługi**: Azure OpenAI + Cognitive Search + App Service

**Szybki start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline przetwarzania dokumentów

**Repozytorium**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Usługi**: Document Intelligence + Storage + Functions

**Szybki start**:
```bash
azd init --template ai-document-processing
azd up
```

### Czat dla przedsiębiorstw z RAG

**Repozytorium**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Usługi**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Szybki start**:
```bash
azd init --template contoso-chat
azd up
```

## Kolejne kroki

1. **Wypróbuj przykłady**: Zacznij od gotowego szablonu dopasowanego do Twojego przypadku użycia
2. **Dostosuj do swoich potrzeb**: Zmodyfikuj infrastrukturę i kod aplikacji
3. **Dodaj monitorowanie**: Wprowadź kompleksową obserwowalność
4. **Optymalizuj koszty**: Dostosuj konfiguracje do swojego budżetu
5. **Zabezpiecz wdrożenie**: Wprowadź wzorce bezpieczeństwa dla przedsiębiorstw
6. **Skaluj do produkcji**: Dodaj funkcje wieloregionowe i wysokiej dostępności

## 🎯 Ćwiczenia praktyczne

### Ćwiczenie 1: Wdrażanie aplikacji czatowej Azure OpenAI (30 minut)
**Cel**: Wdrażanie i testowanie gotowej do produkcji aplikacji czatowej AI

```bash
# Zainicjuj szablon
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

# Posprzątaj
azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Wdrożenie zakończone bez błędów limitu
- [ ] Dostęp do interfejsu czatu w przeglądarce
- [ ] Możliwość zadawania pytań i otrzymywania odpowiedzi AI
- [ ] Dane telemetryczne widoczne w Application Insights
- [ ] Skuteczne wyczyszczenie zasobów

**Szacowany koszt**: $5-10 za 30 minut testowania

### Ćwiczenie 2: Konfiguracja wdrożenia wielomodelowego (45 minut)
**Cel**: Wdrażanie wielu modeli AI z różnymi konfiguracjami

```bash
# Utwórz niestandardową konfigurację Bicep
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

# Wdróż i zweryfikuj
azd provision
azd show
```

**Kryteria sukcesu:**
- [ ] Wdrożenie wielu modeli zakończone sukcesem
- [ ] Zastosowanie różnych ustawień pojemności
- [ ] Modele dostępne przez API
- [ ] Możliwość wywoływania obu modeli z aplikacji

### Ćwiczenie 3: Wprowadzenie monitorowania kosztów (20 minut)
**Cel**: Konfiguracja alertów budżetowych i śledzenia kosztów

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

# Wdróż alert budżetowy
azd provision

# Sprawdź bieżące koszty
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kryteria sukcesu:**
- [ ] Utworzony alert budżetowy w Azure
- [ ] Skonfigurowane powiadomienia e-mail
- [ ] Możliwość przeglądania danych kosztowych w Azure Portal
- [ ] Odpowiednio ustawione progi budżetowe

## 💡 Najczęściej zadawane pytania

<details>
<summary><strong>Jak zmniejszyć koszty Azure OpenAI podczas rozwoju?</strong></summary>

1. **Użyj darmowego poziomu**: Azure OpenAI oferuje 50,000 tokenów/miesiąc za darmo
2. **Zmniejsz pojemność**: Ustaw pojemność na 10 TPM zamiast 30+ dla rozwoju
3. **Użyj azd down**: Zwolnij zasoby, gdy nie pracujesz aktywnie
4. **Buforuj odpowiedzi**: Wprowadź Redis cache dla powtarzających się zapytań
5. **Użyj inżynierii promptów**: Zmniejsz zużycie tokenów dzięki efektywnym promptom

```bash
# Konfiguracja rozwojowa
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Jaka jest różnica między Azure OpenAI a OpenAI API?</strong></summary>

**Azure OpenAI**:
- Bezpieczeństwo i zgodność dla przedsiębiorstw
- Integracja z prywatną siecią
- Gwarancje SLA
- Uwierzytelnianie za pomocą zarządzanej tożsamości
- Wyższe dostępne limity

**OpenAI API**:
- Szybszy dostęp do nowych modeli
- Prostsza konfiguracja
- Niższy próg wejścia
- Tylko publiczny internet

Dla aplikacji produkcyjnych **zalecane jest Azure OpenAI**.
</details>

<details>
<summary><strong>Jak poradzić sobie z błędami przekroczenia limitu Azure OpenAI?</strong></summary>

```bash
# Sprawdź bieżący limit
az cognitiveservices usage list --location eastus2

# Spróbuj inny region
azd env set AZURE_LOCATION westus2
azd up

# Tymczasowo zmniejsz pojemność
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Złóż wniosek o zwiększenie limitu
# Przejdź do Azure Portal > Limity > Złóż wniosek o zwiększenie
```
</details>

<details>
<summary><strong>Czy mogę używać własnych danych z Azure OpenAI?</strong></summary>

Tak! Użyj **Azure AI Search** dla RAG (Retrieval Augmented Generation):

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
1. Użyj zarządzanej tożsamości (bez kluczy API)
2. Włącz prywatne punkty końcowe
3. Skonfiguruj grupy zabezpieczeń sieciowych
4. Wprowadź ograniczenia szybkości
5. Użyj Azure Key Vault do przechowywania sekretów

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

- **Microsoft Foundry Discord**: [Kanał #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problemy i dyskusje](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficjalna dokumentacja](https://learn.microsoft.com/azure/ai-studio/)

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Rozwój oparty na AI
- **⬅️ Poprzedni rozdział**: [Rozdział 1: Twój pierwszy projekt](../getting-started/first-project.md)
- **➡️ Następny**: [Wdrażanie modelu AI](ai-model-deployment.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../getting-started/configuration.md)

**Potrzebujesz pomocy?** Dołącz do dyskusji społeczności lub otwórz zgłoszenie w repozytorium. Społeczność Azure AI + AZD jest tutaj, aby pomóc Ci odnieść sukces!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za źródło autorytatywne. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->