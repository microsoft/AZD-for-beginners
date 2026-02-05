# 4. Konfiguracja szablonu

!!! tip "PO UKOŃCZENIU TEGO MODUŁU BĘDZIESZ W STANIE"

    - [ ] Zrozumieć cel pliku `azure.yaml`
    - [ ] Zrozumieć strukturę pliku `azure.yaml`
    - [ ] Zrozumieć wartość `hooks` w cyklu życia azd
    - [ ] **Lab 3:** 

---

!!! prompt "Do czego służy plik `azure.yaml`? Użyj bloku kodu i wyjaśnij linia po linii"

      Plik `azure.yaml` jest **plikem konfiguracyjnym dla Azure Developer CLI (azd)**. Określa, jak Twoja aplikacja powinna być wdrożona w Azure, w tym infrastrukturę, usługi, haki wdrożeniowe i zmienne środowiskowe.

---

## 1. Cel i funkcjonalność

Plik `azure.yaml` pełni rolę **planu wdrożeniowego** dla aplikacji agenta AI, który:

1. **Weryfikuje środowisko** przed wdrożeniem
2. **Tworzy usługi Azure AI** (AI Hub, AI Project, Search, itd.)
3. **Wdraża aplikację Python** w Azure Container Apps
4. **Konfiguruje modele AI** dla funkcji czatu i osadzania
5. **Ustawia monitorowanie i śledzenie** dla aplikacji AI
6. **Obsługuje zarówno nowe, jak i istniejące** scenariusze projektów Azure AI

Plik umożliwia **wdrożenie za pomocą jednej komendy** (`azd up`) kompletnego rozwiązania agenta AI z odpowiednią walidacją, tworzeniem zasobów i konfiguracją po wdrożeniu.

??? info "Rozwiń, aby zobaczyć: `azure.yaml`"

      Plik `azure.yaml` definiuje, jak Azure Developer CLI powinien wdrażać i zarządzać aplikacją agenta AI w Azure. Przeanalizujmy go linia po linii.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: czy potrzebujemy haków? 
      # TODO: czy potrzebujemy wszystkich zmiennych?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. Rozkładanie pliku na części

Przejdźmy przez plik sekcja po sekcji, aby zrozumieć, co robi - i dlaczego.

### 2.1 **Nagłówek i schemat (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linia 1**: Zapewnia walidację schematu serwera języka YAML dla wsparcia IDE i IntelliSense

### 2.2 Metadane projektu (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linia 5**: Definiuje nazwę projektu używaną przez Azure Developer CLI
- **Linie 6-7**: Określa, że projekt opiera się na wersji szablonu 1.0.2
- **Linie 8-9**: Wymaga wersji Azure Developer CLI 1.14.0 lub wyższej

### 2.3 Haki wdrożeniowe (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Linie 11-20**: **Hak przed wdrożeniem** - uruchamiany przed `azd up`

      - Na Unix/Linux: Umożliwia wykonanie skryptu walidacyjnego i uruchamia go
      - Na Windows: Uruchamia skrypt walidacyjny w PowerShell
      - Oba są interaktywne i zatrzymają wdrożenie, jeśli się nie powiodą

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Linie 21-30**: **Hak po utworzeniu zasobów** - uruchamiany po utworzeniu zasobów Azure

  - Wykonuje skrypty zapisujące zmienne środowiskowe
  - Kontynuuje wdrożenie, nawet jeśli te skrypty się nie powiodą (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Linie 31-40**: **Hak po wdrożeniu** - uruchamiany po wdrożeniu aplikacji

  - Wykonuje końcowe skrypty konfiguracji
  - Kontynuuje, nawet jeśli skrypty się nie powiodą

### 2.4 Konfiguracja usług (41-48)

Konfiguruje usługę aplikacji, którą wdrażasz.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Linia 42**: Definiuje usługę o nazwie "api_and_frontend"
- **Linia 43**: Wskazuje na katalog `./src` jako źródło kodu
- **Linia 44**: Określa Python jako język programowania
- **Linia 45**: Używa Azure Container Apps jako platformy hostingowej
- **Linie 46-48**: Konfiguracja Dockera

      - Używa "api_and_frontend" jako nazwy obrazu
      - Buduje obraz Dockera zdalnie w Azure (nie lokalnie)

### 2.5 Zmienne pipeline (49-76)

Są to zmienne, które pomagają uruchomić `azd` w pipeline CI/CD dla automatyzacji

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

Ta sekcja definiuje zmienne środowiskowe używane **podczas wdrożenia**, zorganizowane według kategorii:

- **Nazwy zasobów Azure (Linie 51-60)**:
      - Nazwy podstawowych zasobów usług Azure, np. Resource Group, AI Hub, AI Project, itd.- 
- **Przełączniki funkcji (Linie 61-63)**:
      - Zmienne logiczne do włączania/wyłączania określonych usług Azure
- **Konfiguracja agenta AI (Linie 64-71)**:
      - Konfiguracja głównego agenta AI, w tym nazwa, ID, ustawienia wdrożenia, szczegóły modelu- 
- **Konfiguracja osadzania AI (Linie 72-79)**:
      - Konfiguracja modelu osadzania używanego do wyszukiwania wektorowego
- **Wyszukiwanie i monitorowanie (Linie 80-84)**:
      - Nazwa indeksu wyszukiwania, istniejące ID zasobów oraz ustawienia monitorowania/śledzenia

---

## 3. Poznaj zmienne środowiskowe
Poniższe zmienne środowiskowe kontrolują konfigurację i zachowanie Twojego wdrożenia, zorganizowane według ich głównego celu. Większość zmiennych ma sensowne wartości domyślne, ale możesz je dostosować do swoich specyficznych wymagań lub istniejących zasobów Azure.

### 3.1 Wymagane zmienne 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 Konfiguracja modelu 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 Przełączniki funkcji
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 Konfiguracja projektu AI 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Sprawdź swoje zmienne

Użyj Azure Developer CLI, aby wyświetlić i zarządzać swoimi zmiennymi środowiskowymi:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

