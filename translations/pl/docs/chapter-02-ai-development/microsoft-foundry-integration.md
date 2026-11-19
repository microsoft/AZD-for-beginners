# Integracja Microsoft Foundry z AZD

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój AI-First
- **⬅️ Poprzedni rozdział**: [Rozdział 1: Twój pierwszy projekt](../chapter-01-foundation/first-project.md)
- **➡️ Następny**: [Agent AI](agents.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

## Przegląd

Ten przewodnik pokazuje, jak zintegrować usługi Microsoft Foundry z Azure Developer CLI (AZD) w celu usprawnienia wdrożeń aplikacji AI. Microsoft Foundry oferuje kompleksową platformę do tworzenia, wdrażania i zarządzania aplikacjami AI, podczas gdy AZD upraszcza proces infrastruktury i wdrażania.

## Czym jest Microsoft Foundry?

Microsoft Foundry to zunifikowana platforma Microsoft do rozwoju AI, która zawiera:

- **Katalog modeli**: Dostęp do nowoczesnych modeli AI
- **Prompt Flow**: Wizualny projektant przepływów pracy AI
- **Portal Microsoft Foundry**: Zintegrowane środowisko programistyczne dla aplikacji AI
- **Opcje wdrożenia**: Wiele opcji hostingu i skalowania
- **Bezpieczeństwo i ochrona**: Wbudowane funkcje odpowiedzialnej AI

## AZD + Microsoft Foundry: Razem lepiej

| Funkcja | Microsoft Foundry | Korzyść integracji z AZD |
|---------|-----------------|------------------------|
| **Wdrożenie modelu** | Ręczne wdrożenie przez portal | Automatyczne, powtarzalne wdrożenia |
| **Infrastruktura** | Konfiguracja projektu i zasobów | Start od `azure.yaml`; ewentualny export do Bicep lub Terraform |
| **Zarządzanie środowiskiem** | Skupienie na jednym środowisku | Wiele środowisk (dev/staging/prod) |
| **Integracja CI/CD** | Usługi wdrożenia i ewaluacji | Wykorzystanie konfiguracji w GitHub Actions lub Azure DevOps |
| **Zarządzanie kosztami** | Podstawowy monitoring | Optymalizacja kosztów dla konkretnego środowiska |

## Wymagania wstępne

- Subskrypcja Azure z odpowiednimi uprawnieniami
- Azure Developer CLI w wersji 1.37.0 lub nowszej dla GA Foundry workflow
- Dostęp do usług Microsoft Foundry Models
- Podstawowa znajomość Microsoft Foundry

> **Aktualizacja Foundry GA (2026-11-09):** Pakiet rozszerzeń `microsoft.foundry` osiągnął wersję 1.0 i ogólną dostępność [5 listopada 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Poniższy przewodnik opiera się na tym ogłoszeniu oraz szybkim startem Microsoft Learn. To przegląd dokumentacji, a nie walidacja wdrożenia na żywo. Opcjonalne funkcje podglądu i niezależnie wydane rozszerzenia zachowują swój własny status wydania.

**Cele nauki:** Zainstaluj pakiet GA, przejrzyj `azure.yaml` agenta, porównaj lokalne i wdrożone odpowiedzi oraz wyjaśnij ewaluację, CI/CD i granice sprzątania. Aby wykonać krok po kroku wdrożenie agenta, przejdź do [hosted-agent walkthrough](#hosted-agent-walkthrough-ga). Fragmenty zasobów poniżej dotyczą innych wzorców integracji.

## Podstawowe wzorce integracji

**Zakres przykładów:** Poniższy Bicep zawiera ilustracyjne fragmenty zasobów, a nie pełny, możliwy do wdrożenia szablon. Szablon nadrzędny musi definiować nazwy, `location`, odwołane zasoby, tożsamości, wyjścia i hosting aplikacji. Użyj powiązanego przykładu jako punktu startowego. Przykłady Bash wymagają uwierzytelnienia Azure CLI oddzielnie od `azd auth login`.

### Wzorzec 1: Integracja Microsoft Foundry Models

**Przypadek użycia**: Wdrażanie aplikacji czatu z modelami Azure OpenAI w Microsoft Foundry

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

Wywołujący potrzebuje dołączonej zarządzanej tożsamości i `Cognitive Services OpenAI User` na poziomie konta; wyłączanie kluczy nie daje dostępu. Przed wdrożeniem sprawdź dostępność regionu/modelu/SKU oraz limit.

### Wzorzec 2: Integracja AI Search + RAG

**Przypadek użycia**: Wdrażanie aplikacji opartych na generowaniu wspomaganym wyszukiwaniem (RAG)

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

Nie istnieje zasób ARM `Microsoft.Search/searchServices/dataConnections` dla tej integracji. Skonfiguruj indeks Wyszukiwania, źródło danych, indeksator/skillset lub wektoryzator przez obsługiwane API płaszczyzny danych Search. Jeśli Search wywołuje model osadzający, włącz jego zarządzaną tożsamość, przyznaj odpowiednią rolę modelu i skonfiguruj umiejętność osadzania/wektoryzator. Zobacz [zintegrowane wektoryzowanie](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

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

### Ustawienia zmiennych środowiskowych

Z wyjątkiem udokumentowanych ustawień AZD, takich jak `AZURE_LOCATION`, są to **własne nazwy wejściowe szablonu**. Nie mają wpływu, jeśli szablon/aplikacja ich nie wykorzystuje poprzez parametry i mapowania środowisk hosta. Dla `azure-search-openai-demo` użyj rzeczywistych nazw, takich jak `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` i `AZURE_SEARCH_SERVICE_SKU`. Pojemność modelu nie jest SKU konta.

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

Preferuj Entra ID z lokalnym uwierzytelnianiem klucza wyłączonym. Poniższe to tylko **alternatywa uwierzytelniania za pomocą klucza z czasów poprzednich** dla aplikacji wymagających kluczy: wymaga konta z włączonym uwierzytelnianiem klucza, tożsamości aplikacji dołączonej do hosta oraz działającego dostępu i sieci do Key Vault. Nie łącz pobierania kluczy z `disableLocalAuth: true` oczekując, że wywołania oparte na kluczu zadziałają.

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

Dla przepływu GA zainstaluj pakiet `microsoft.foundry` zamiast montować główne rozszerzenia pojedynczo:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Pakiet instaluje agentów, połączenia, inspektora, projekty, rutyny, umiejętności i skrzynki narzędziowe. Nie dodaje grupy poleceń `microsoft.foundry`. Ewaluacje, zestawy danych, dostrajanie i modele niestandardowe instalowane są osobno w razie potrzeby. Zobacz [referencję pakowania rozszerzeń](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Przewodnik po hosted-agent (GA)

**Hosted agent** uruchamia kod Twojego agenta na obliczeniach zarządzanych przez Foundry. To ćwiczenie używa przykładu API Responses podstawowego agenta Pythona z repozytorium upstream, a nie klasycznych fragmentów Agent Service SDK z innych lekcji.

#### 1. Przygotuj i zainicjuj

Użyj pustego katalogu poza tym checkoutem kursu. Zainstaluj Pythona 3.13 lub nowszego i aktualną [wersję uv](https://docs.astral.sh/uv/getting-started/installation/). Samodzielne instalacje uv mogą korzystać z `uv self update`. Sprawdź [uprawnienia hosted-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), dostępność modelu oraz limit w swojej subskrypcji i regionie przed provisioningiem. Zasoby Azure i lokalne wywołania modelu są płatne.

Ukończ powyższe instalacje `azd auth login` i pakietu. Lokalny przykładowy kod używa `DefaultAzureCredential`; jeśli używasz poświadczeń Azure CLI, zaloguj się `az login` tym samym kontem i dzierżawą co AZD. Samo logowanie AZD nie jest logowaniem Azure CLI.

Uruchom to jednolinijkowe polecenie w Bash lub PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Wybierz nowy lub istniejący projekt Foundry oraz subskrypcję i region. Aby ponownie użyć wdrożenia modelu, dodaj `--model-deployment <existing-deployment-name>` do polecenia inicjalizacyjnego **przed jego uruchomieniem** i wybierz istniejący projekt. Pozostań w katalogu zawierającym wygenerowany `azure.yaml` dla kolejnych poleceń.

#### 2. Przejrzyj definicję wdrożenia

Otwórz `azure.yaml` i znajdź te ustawienia w [upstream sample](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Ustawienie | Co sprawdzić |
|---------|---------------|
| `host: azure.ai.project` i `deployments` | Docelowy projekt Foundry i nazwa modelu, wersja, SKU wdrożenia, pojemność |
| `host: azure.ai.agent` i `project` | Hosted agent oraz katalog zawierający jego kod źródłowy |
| `codeConfiguration` | Runtime Pythona i punkt wejścia; przeglądany przykład używa `python_3_13` i `main.py` |
| `uses` | Zależność od usługi projektu Foundry |
| `container.resources` | Przydział CPU i pamięci, mimo że kod jest budowany zdalnie |
| `env` | Mapowanie wdrożenia modelu i `PYTHONNOUSERSITE: "1"` dla wyłączenia ładowania pakietów użytkownika |
| `infra.provider` | `microsoft.foundry`, która syntezuje wymaganą infrastrukturę |

Wykonaj commit przeglądanego `azure.yaml` i kodu agenta razem. Nie jest wymagana ręczna infrastruktura, aby zacząć; gdy będą potrzebne edytowalne pliki provisioningowe, postępuj zgodnie z [infrastrukturą ejection](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) dla Bicep lub Terraform i kontynuuj używanie `azd provision`. Nie commituj poświadczeń ani stanu środowiska `.azure/`.

#### 3. Provision i test lokalny

```bash
azd provision
azd ai agent run
```

Provisioning może tworzyć brakujące wdrożenia modelu **nawet w ponownie używanym projekcie**. Przejrzyj polecenia modelu i wybierz dostępną online opcję wdrożenia, taką jak Global Standard lub Data Zone Standard; limity i wsparcie regionalne się różnią.

Lokalny run przygotowuje zależności i uruchamia **Agent Inspector**, gdzie można sprawdzać żądania, odpowiedzi oraz aktywność narzędzi/modeli. Trzymaj go uruchomionego i otwórz drugi terminal w tym samym katalogu projektu:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Checkpoint:** Potwierdź, że otrzymujesz odpowiednią odpowiedź i możesz przejrzeć powiązaną lokalną aktywność. Lokalna egzekucja nadal wywołuje wdrożenie modelu w Azure; to nie jest test offline ani darmowy. Używaj syntetycznych poleceń i unikaj ujawniania sekretów lub danych wrażliwych w wynikach inspektora.

#### 4. Wdróż i porównaj

Zatrzymaj lokalny run kombinacją Ctrl+C po zakończeniu. Przed zdalnym wywołaniem skonfiguruj lub zweryfikuj projektowe [połączenie Application Insights i dostęp do czytania śledzeń](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

W trybie wdrożenia kodu AZD wysyła źródła do zdalnej kompilacji Foundry; nie jest potrzebna lokalna budowa kontenera dla tej ścieżki. Wyniki wdrożenia zawierają linki do playground i endpointu. Zweryfikuj odpowiedź od wdrożonego agenta oraz jego śledzenie w chmurze; same lokalne zdarzenia inspektora nie potwierdzają działania śledzenia w chmurze.

Dla kolejnych zmian sprawdź obsługę konfiguracji hosted-agent z `azd deploy --preview`. Strumieniuj logi z `azd ai agent monitor --follow` lub diagnozuj problemy z konfiguracją i dostępem przez `azd ai agent doctor`. Podgląd wdrożenia nie jest pełnym przeglądem infrastruktury ani bezpieczeństwa.

#### 5. Dodaj powtarzalny test jakości

Zainstaluj niezależnie wydane rozszerzenie ewaluacji, następnie wygeneruj szkic zestawów testowych:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Opisz zamierzone zachowanie agenta i wybierz **Dataset and evaluator**, następnie **Turn**. Przejrzyj i edytuj wygenerowane przypadki oraz rubrykę oceny, w tym przypadek pytania nieobsługiwanego, zanim skonfigurujesz ewaluację:

```bash
azd ai eval init --name quality
```

Wybierz przeglądany zestaw danych i rubrykę, potwierdź wdrożenie modelu sędziego. Sprawdź `evals/azure.eval.yaml` i jego referencję do usługi ewaluacji w `azure.yaml`, następnie zarejestruj zasoby i uruchom:

```bash
azd up
azd ai eval run start --eval quality
```

Sprawdź wyniki i przypadki nieudane lub z błędami; zakończona ewaluacja nie oznacza automatycznego przejścia jakościowego. Generowanie i ocena generują również koszty modelu. Commituj niepoufne konfiguracje, zestawy danych i rubryki, aby koledzy mogli porównywać zmiany. `azd ai agent optimize` może ponownie wykorzystać kompatybilną ewaluację jako bazę, ale przeglądaj kandydatów przed jej wyraźnym wdrożeniem. Zobacz [bramki jakości i migrację](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) dla starszych projektów i CI.

#### 6. Wykorzystaj workflow w CI/CD

Po pomyślnym `azd up` uruchom `azd pipeline config` i przejrzyj wygenerowany workflow GitHub Actions lub Azure DevOps. Zainstaluj `microsoft.foundry` na runnerze oraz `azure.ai.evaluations` jeśli uruchamiasz ewaluacje. Zachowaj wygenerowane ustawienia checkout, logowania i środowiska; sama instalacja nie uwierzytelnia potoku.

Używaj osobnego środowiska AZD dla każdego etapu, przyznaj tożsamości potoku wymagane uprawnienia zasobów i Foundry oraz przechowuj poświadczenia w sekretach potoku lub używaj tożsamości federacyjnej. Commituj zasoby ewaluacji i sprawdź, czy tożsamość ma dostęp do odwołanych zestawów danych/ewaluatorów. Zobacz [przykład potoku kursu](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) i [przewodnik Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Dokonaj świadomego sprzątania

Dla **nowego projektu utworzonego przez to środowisko** sprawdź zasoby wymienione przez `azd down` zanim potwierdzisz: usuwa on grupę zasobów i wszystko, co się w niej znajduje.

Dla **ponownie używanego projektu**, `azd down` pozostawia projekt, hosted agenta i inne zasoby na miejscu. Usuń tylko niechciane zasoby, którymi zarządzasz, korzystając z [szybkich wskazówek do sprzątania](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); nie usuwaj współdzielonej grupy zasobów, aby posprzątać jedno ćwiczenie.

**Kontrola ukończenia:** Wyjaśnij, które ustawienia sterują zachowaniem lokalnym i w chmurze, pokaż lokalne i wdrożone odpowiedzi, przejrzyj wynik ewaluacji i wskaż, które zasoby pozostają po sprzątaniu.

### Opcjonalnie: Scaffoldowanie za pomocą Microsoft Foundry Skill

Zainstaluj [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) dla hosta swojego agenta kodującego, a następnie otwórz osobny pusty folder. Poproś o wygenerowanie podstawowego przykładu Python Agent Framework Responses API w trybie wdrożenia kodu, wyjaśnij wygenerowany `azure.yaml` i zaproponuj subskrypcję, region, projekt oraz wdrożenie modelu. Wymagaj zatwierdzenia **przed utworzeniem zasobów Azure**, poproś o lokalny test i zatrzymaj przed wdrożeniem. Przejrzyj output i kontynuuj powyższe kroki wdrożeniowe tylko, gdy będziesz gotowy.

W istniejących projektach `--template`/`-t` zastępuje przestarzałą pisownię `--manifest`/`-m`; zmiana flagi nie migruje starszych manifestów ani zagnieżdżonej konfiguracji agenta. Zobacz [referencję AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Wdrożenie jednokrokowe

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
```

To tworzy zasób Insights, a nie instrumentację telemetrii. Gdy Twoja aplikacja emituje wychodzące spany wywołań modelu, uruchom ten ilustracyjny zapytanie w logach Application Insights (dostosuj filtr do swoich rzeczywistych nazw spanów):

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

Użyj prawdziwego odbiorcy i zweryfikuj uprawnienia do zakresu rozliczeniowego. Budżet wysyła alerty; nie jest limitem wydatków.

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

Ten fragment punktu końcowego wymaga także prywatnej strefy/grupy DNS, łączy VNet, łączności aplikacji z VNet oraz wyraźnej polityki dostępu publicznego. Utworzenie samego prywatnego punktu końcowego nie wyłącza dostępu publicznego.

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

### Strategie cachowania

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

Azure Cache for Redis Basic/Standard/Premium jest na [ścieżce wycofania](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); używaj Azure Managed Redis dla nowych wdrożeń i stosuj obecne wytyczne dotyczące szablonów/uwierzytelniania. Zakres odpowiedzi AI w cache ustawiaj według autoryzacji, modelu/instrukcji i wersji danych, z wygaśnięciem; nigdy nie udostępniaj prywatnych odpowiedzi używając tylko tekstu zapytania.

### Konfiguracja autoskalowania

**Częściowy zasób:** scal te ustawienia skalowania/wlotu do kompletnej aplikacji kontenerowej z zarządzanym środowiskiem, obrazem kontenera i limitami zasobów. Więcej replik nie zwiększa limitu modelu.

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

### Problem 1: Przekroczono limit OpenAI

**Objawy:**
- Wdrożenie kończy się błędami limitów
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

Zmienna capacity powyżej dotyczy tylko niestandardowego szablonu skonfigurowanego do jej użycia. Dla przykładu RAG użyj `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Nie zmieniaj `AZURE_LOCATION`, aby przenieść istniejące zasoby na miejsce; utwórz oddzielne środowisko dla nowego regionu i zaplanuj migrację/czyszczenie.

### Problem 2: Błędy uwierzytelniania

**Objawy:**
- Błędy 401/403 przy wywołaniach usług AI
- Komunikaty "Dostęp zabroniony"

**Rozwiązania:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problem 3: Problemy z wdrażaniem modelu

**Objawy:**
- Modele niedostępne we wdrożeniu
- Niepowodzenia określonych wersji modelu

**Rozwiązania:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Przykładowe szablony

Są to alternatywy, a nie polecenia wykonywane kolejno. Zacznij każde w osobnym pustym katalogu. Wyraźne określenie celu `.` utrzymuje inicjalizację w bieżącym katalogu; w przeciwnym razie AZD może utworzyć katalog podrzędny o nazwie szablonu bez zmiany bieżącego katalogu powłoki.

### Aplikacja czatu RAG (Python)

**Repozytorium**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Usługi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Referencyjna aplikacja czatu RAG do pytań na temat Twoich dokumentów, z wyszukiwaniem Azure AI Search. Przejrzyj obsługiwane modele, opcjonalne funkcje, wskazówki kosztowe i zabezpieczenia produkcyjne aktualnego przykładu przed użyciem; wdrożenie przykładu nie czyni aplikacji gotową do produkcji.

**Szybki start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplikacja czatu RAG (.NET)

**Repozytorium**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Usługi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: Odpowiednik w .NET/C# przykładu czatu RAG w Pythonie. Zbudowany z ASP.NET Core Minimal API i frontendem Blazor WebAssembly. Zawiera czat głosowy, wsparcie GPT-4o-mini wizyjne oraz towarzyszącą aplikację kliencką .NET MAUI Blazor Hybrid na desktop/mobilne.

**Szybki start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplikacja czatu RAG (Java)

**Repozytorium**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Usługi**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Wersja Java przykładu czatu RAG korzystająca z Langchain4J do orkiestracji AI. Obsługuje architekturę mikroserwisów opartą na zdarzeniach, wiele strategii wyszukiwania (tekst, wektor, hybrydowe), przesyłanie dokumentów z Azure Document Intelligence oraz wdrożenie na Azure Container Apps lub Azure Kubernetes Service.

**Szybki start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Przedsiębiorczy asystent handlu detalicznego z Microsoft Foundry

**Repozytorium**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Usługi**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: Kompleksowy asystent RAG w handlu detalicznym z użyciem Microsoft Foundry i Prompty. Chatbot Contoso Outdoor, który opiera odpowiedzi na katalogu produktów i danych zamówień klientów. Demonstruje pełny przepływ pracy GenAIOps — prototypowanie z Prompty, ocena z pomocą AI oraz wdrożenie przez AZD do Container Apps.

**Szybki start**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplikacja wieloagentowa do kreatywnego pisania

**Repozytorium**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Usługi**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Przykład wieloagentowy pokazujący orkiestrację agentów AI z Prompty. Używa agenta badawczego (Bing Grounding w Azure AI Agent Service), agenta produktu (Azure AI Search), agenta piszącego oraz agenta edytora do wspólnej produkcji dobrze zbadanych artykułów. Zawiera CI/CD z oceną w GitHub Actions.

**Szybki start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Bezserwerowy czat RAG (JavaScript/TypeScript)

**Repozytorium**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Usługi**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Opis**: W pełni bezserwerowy chatbot RAG korzystający z LangChain.js z Azure Functions dla API i Azure Static Web Apps dla hostingu. Używa Azure Cosmos DB jako repozytorium wektorów i bazy historii czatu. Obsługuje lokalny rozwój z Ollama do testów bezkosztowych.

**Szybki start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data Solution Accelerator

**Repozytorium**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Usługi**: Microsoft Foundry + Azure Container Apps (web/API/ingestia) + Azure AI Search z Cosmos DB lub PostgreSQL z pgvector

**Opis**: Akcelerator czatu opartego na dokumentach z cytatami. Aktualny przykład hostuje frontend React, backend FastAPI oraz pracownika Functions do wczytywania danych na Container Apps; opcje orkiestracji to Agent Framework i LangGraph. Opcje bazy danych/wyszukiwania są wybierane podczas wdrożenia. To punkt startowy, nie system produkcyjny pod klucz; nie zakładaj, że starsze warianty App Service, Semantic Kernel czy Prompt Flow opisują obecne domyślne rozwiązanie.

**Szybki start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agenci podróży AI — orkiestracja multi-agenty MCP

**Repozytorium**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Usługi**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Opis**: Aplikacja referencyjna do orkiestracji multi-agentów AI wykorzystująca trzy frameworki (LangChain.js, LlamaIndex.TS i Microsoft Agent Framework). Zawiera serwery MCP (Model Context Protocol) w czterech językach wdrożone jako bezserwerowe Azure Container Apps z monitorowaniem OpenTelemetry.

**Szybki start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Przeglądaj więcej szablonów**: Odwiedź [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) dla obecnie dostępnych szablonów w różnych językach i scenariuszach. Każdy przykładowy link to zewnętrzne repozytorium, a nie lokalny przykład z tego kursu; przed wdrożeniem sprawdź jego aktualne wymagania i wskazówki produkcyjne.

## Kolejne kroki

1. **Wypróbuj przykłady**: Zacznij od wstępnie zbudowanego szablonu dopasowanego do Twojego przypadku użycia
2. **Dostosuj do swoich potrzeb**: Modyfikuj infrastrukturę i kod aplikacji
3. **Dodaj monitoring**: Wdróż kompleksową obserwowalność
4. **Optymalizuj koszty**: Dostosuj konfiguracje do budżetu
5. **Zabezpiecz wdrożenie**: Wdróż wzorce bezpieczeństwa dla przedsiębiorstwa
6. **Skaluj do produkcji**: Dodaj funkcje wieloregionowe i wysokiej dostępności

## 🎯 Ćwiczenia praktyczne

### Ćwiczenie 1: Wdrożenie aplikacji czatu Microsoft Foundry Models (30 minut)
**Cel**: Wdrożenie i testowanie referencyjnej aplikacji czatu AI

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

**Kryteria sukcesu:**
- [ ] Wdrożenie kończy się bez błędów limitów
- [ ] Dostęp do interfejsu czatu w przeglądarce
- [ ] Możliwość zadawania pytań i otrzymywania odpowiedzi AI
- [ ] Application Insights pokazuje dane telemetrii
- [ ] Pomyślnie usunięto zasoby

**Koszt:** Przed wdrożeniem zapoznaj się z aktualnym przewodnikiem kosztów i wybranymi SKU. Rozliczanie trwa do momentu usunięcia zasobów; nie obowiązuje stały 30-minutowy koszt dla każdej konfiguracji.

### Ćwiczenie 2: Konfiguracja wdrożenia wielomodelowego (45 minut)
**Cel**: Wdrożenie wielu modeli AI z różnymi konfiguracjami

**Punkt startowy:** Istniejące konto Azure OpenAI i moduł grupy zasobów AZD, który może wywołać ten plik. Utwórz `infra/ai-models.bicep` z następującą zawartością w edytorze. Nie jest on automatycznie wdrażany tylko dlatego, że znajduje się pod `infra/`.

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

Z modułu grupy zasobów właściciela konta dodaj wywołanie modułu (dostosuj nazwę symbolu do swojego konta):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Nie deklaruj tych samych wdrożeń w obu modułach. Jeśli punkt wejścia AZD jest na poziomie subskrypcji, wywołaj to z jego modułu grupy zasobów i dostosuj ścieżkę względną. Zbuduj ten moduł zawierający za pomocą `az bicep build --file <path-to-containing-module>`, a następnie:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kryteria sukcesu:**
- [ ] Wiele modeli wdrożonych pomyślnie
- [ ] Zastosowano różne ustawienia pojemności
- [ ] Modele dostępne przez API
- [ ] Możliwość wywoływania obu modeli z aplikacji

### Ćwiczenie 3: Implementacja monitorowania kosztów (20 minut)
**Cel**: Konfiguracja alertów budżetowych i śledzenia kosztów

**Punkt startowy:** Wzorzec budżetowy powyżej oraz moduł infrastruktury grupy zasobów. Dodaj ten zasób w edytorze; przekaż `budgetStartDate` z mapowania parametrów (nie duplikuj parametru, jeśli już zadeklarowany). Zamień odbiorcę i potwierdź, że masz uprawnienia do zapisu budżetu.

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

Oczekiwane: odpowiedź zawiera `amount: 200`, oba progi i twojego odbiorcę. Sprawdź zarządzanie kosztami w portalu dla faktycznych opłat; dane kosztów są opóźnione i alert nie musi się wyzwolić podczas krótkiego ćwiczenia.

**Kryteria sukcesu:**
- [ ] Utworzono alert budżetowy w Azure
- [ ] Skonfigurowano powiadomienia email
- [ ] Możliwość podglądu danych kosztów w portalu Azure
- [ ] Progi budżetu ustawione odpowiednio

## 💡 Najczęściej zadawane pytania

<details>
<summary><strong>Jak zmniejszyć koszty Microsoft Foundry Models podczas rozwoju?</strong></summary>

1. **Sprawdź cennik**: Nie ma uniwersalnego darmowego miesięcznego limitu 50 000 tokenów dla modeli Azure OpenAI
2. **Dopasuj pojemność**: Pojemność `10` zazwyczaj oznacza 10 000 TPM dla tych modeli tekstowych Standard, a nie 10 TPM. Obniżenie limitu przepustowości nie obniża cen za token
3. **Używaj azd down**: Usuwaj zasoby jednorazowe, gdy nie prowadzisz aktywnego rozwoju (to nie jest dezalokacja)
4. **Cache odpowiedzi**: Wdróż cache Redis dla powtarzających się zapytań
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
- Bezpieczeństwo i zgodność przedsiębiorstwa
- Integracja z siecią prywatną
- Gwarancje SLA
- Uwierzytelnianie przez zarządzaną tożsamość
- Dostępne wyższe limity

**OpenAI API**: Oddzielny dostawca/API z własną dostępnością modeli, cennikiem, uwierzytelnianiem i opcjami łączności korporacyjnej. Porównuj aktualne oferty zamiast zakładać, że jest to tylko usługa publiczna lub zawsze najpierw udostępnia modele.

Wybieraj w oparciu o wymagania Twojej organizacji; przykłady zarządzanej tożsamości i prywatnych łączy specyficzne dla Azure w tym kursie odnoszą się do usług hostowanych w Azure, a nie do każdego modelu/dostawcy z katalogu Foundry.
</details>

<details>
<summary><strong>Jak radzić sobie z błędami przekroczenia limitów Microsoft Foundry Models?</strong></summary>

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

Tak! Użyj **Azure AI Search** do RAG (Retrieval Augmented Generation):

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
<summary><strong>Jak zabezpieczyć punkty końcowe modelu AI?</strong></summary>

**Najlepsze praktyki**:
1. Używaj Managed Identity (bez kluczy API)
2. Włącz prywatne punkty końcowe
3. Skonfiguruj grupy zabezpieczeń sieci
4. Wdróż ograniczanie przepustowości
5. Korzystaj z Azure Key Vault dla sekretów

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

**Nawigacja rozdziału:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Rozwój z naciskiem na AI
- **⬅️ Poprzedni rozdział**: [Rozdział 1: Twój pierwszy projekt](../chapter-01-foundation/first-project.md)
- **➡️ Następny**: [Agent AI](agents.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../chapter-03-configuration/configuration.md)

**Potrzebujesz pomocy?** Dołącz do naszych dyskusji społecznościowych lub otwórz zgłoszenie w repozytorium. Społeczność Azure AI + AZD jest tutaj, aby pomóc Ci odnieść sukces!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->