# 4. Konfiguracja szablonu

!!! tip "NA KONIEC TEGO MODUŁU BĘDZIESZ W STANIE"

    - [ ] Zrozumieć cel pliku `azure.yaml`
    - [ ] Zrozumieć strukturę pliku `azure.yaml`
    - [ ] Zrozumieć wartość `hooks` w cyklu życia azd
    - [ ] **Lab 4:** Zbadać i zmodyfikować zmienne środowiskowe

---

!!! prompt "Do czego służy plik `azure.yaml`? Użyj bloku kodu i wyjaśnij go linia po linii"

      Plik `azure.yaml` jest **plikiem konfiguracyjnym dla Azure Developer CLI (azd)**. Definiuje on, jak Twoja aplikacja powinna być wdrożona w Azure, w tym infrastrukturę, usługi, haki wdrożeniowe oraz zmienne środowiskowe.

---

## 1. Cel i funkcjonalność

Ten plik `azure.yaml` służy jako **plan wdrożenia** dla aplikacji agenta AI, która:

1. **Weryfikuje środowisko** przed wdrożeniem
2. **Utworza usługi Azure AI** (AI Hub, AI Project, Search itp.)
3. **Wdraża aplikację Python** do Azure Container Apps
4. **Konfiguruje modele AI** zarówno do chatu, jak i osadzania (embedding)
5. **Ustawia monitorowanie i śledzenie** dla aplikacji AI
6. **Obsługuje zarówno nowe, jak i istniejące** scenariusze projektu AI w Azure

Plik umożliwia **wdrożenie jednym poleceniem** (`azd up`) kompletnego rozwiązania agenta AI z odpowiednią weryfikacją, tworzeniem zasobów oraz konfiguracją po wdrożeniu.

??? info "Rozwiń, aby zobaczyć: `azure.yaml`"

      Plik `azure.yaml` definiuje, jak Azure Developer CLI powinien wdrażać i zarządzać aplikacją AI Agent w Azure. Przeanalizujmy go linia po linii.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: czy potrzebujemy hooków? 
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

## 2. Rozbiórka pliku

Przejdźmy przez plik sekcja po sekcji, aby zrozumieć, co robi i dlaczego.

### 2.1 **Nagłówek i schemat (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linia 1**: Zapewnia walidację schematu języka YAML dla wsparcia IDE i IntelliSense

### 2.2 Metadane projektu (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linia 5**: Definiuje nazwę projektu używaną przez Azure Developer CLI
- **Linie 6-7**: Określa bazę na szablonie w wersji 1.0.2
- **Linie 8-9**: Wymaga wersji Azure Developer CLI 1.14.0 lub nowszej

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

      - Na Unix/Linux: nadaje uprawnienia do wykonania skryptu walidacji i go uruchamia
      - Na Windows: uruchamia skrypt PowerShell walidacji
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

  - Wykonuje skrypty zapisu zmiennych środowiskowych
  - Kontynuuje wdrożenie nawet jeśli te skrypty się nie powiodą (`continueOnError: true`)

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

  - Wykonuje finalne skrypty ustawiające
  - Kontynuuje nawet jeśli skrypty się nie powiodą

### 2.4 Konfiguracja usługi (41-48)

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
- **Linia 43**: Wskazuje katalog `./src` jako źródło kodu
- **Linia 44**: Określa język programowania Python
- **Linia 45**: Używa Azure Container Apps jako platformy hostingowej
- **Linie 46-48**: Konfiguracja Dockera

      - Używa "api_and_frontend" jako nazwy obrazu
      - Buduje obraz Dockera zdalnie w Azure (nie lokalnie)

### 2.5 Zmienne potoku (49-76)

To zmienne, które pomagają uruchamiać `azd` w CI/CD dla automatyzacji

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

Ta sekcja definiuje zmienne środowiskowe używane **podczas wdrożenia**, uszeregowane według kategorii:

- **Nazwy zasobów Azure (linie 51-60)**:
      - Podstawowe nazwy zasobów usług Azure, np. Grupa zasobów, AI Hub, AI Project itd.
- **Flagi funkcji (linie 61-63)**:
      - Zmienne boolowskie do włączania/wyłączania konkretnych usług Azure
- **Konfiguracja agenta AI (linie 64-71)**:
      - Konfiguracja głównego agenta AI, w tym nazwa, ID, ustawienia wdrożenia, szczegóły modelu
- **Konfiguracja embeddingu AI (linie 72-79)**:
      - Konfiguracja modelu embeddingowego używanego do wyszukiwania wektorowego
- **Wyszukiwanie i monitorowanie (linie 80-84)**:
      - Nazwa indeksu wyszukiwania, istniejące ID zasobów oraz ustawienia monitoringu i śledzenia

---

## 3. Znajomość zmiennych środowiskowych
Poniższe zmienne środowiskowe kontrolują konfigurację i zachowanie Twojego wdrożenia, uszeregowane według ich głównego zastosowania. Większość zmiennych ma sensowne domyślne wartości, ale możesz je dostosować, aby odpowiadały Twoim specyficznym wymaganiom lub istniejącym zasobom Azure.

### 3.1 Wymagane zmienne 

```bash title="" linenums="0"
# Podstawowa konfiguracja Azure
AZURE_ENV_NAME                    # Nazwa środowiska (używana w nazewnictwie zasobów)
AZURE_LOCATION                    # Region wdrożenia
AZURE_SUBSCRIPTION_ID             # Docelowa subskrypcja
AZURE_RESOURCE_GROUP              # Nazwa grupy zasobów
AZURE_PRINCIPAL_ID                # Użytkownik główny dla RBAC

# Nazwy zasobów (generowane automatycznie, jeśli nie określono)
AZURE_AIHUB_NAME                  # Nazwa Microsoft Foundry hub
AZURE_AIPROJECT_NAME              # Nazwa projektu AI
AZURE_AISERVICES_NAME             # Nazwa konta usług AI
AZURE_STORAGE_ACCOUNT_NAME        # Nazwa konta magazynu
AZURE_CONTAINER_REGISTRY_NAME     # Nazwa rejestru kontenerów
AZURE_KEYVAULT_NAME               # Nazwa Key Vault (jeśli używana)
```

### 3.2 Konfiguracja modelu 
```bash title="" linenums="0"
# Konfiguracja modelu czatu
AZURE_AI_AGENT_MODEL_NAME         # Domyślnie: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Domyślnie: OpenAI (lub Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Domyślnie: najnowsza dostępna
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nazwa wdrożenia modelu czatu
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Domyślnie: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Domyślnie: 80 (tysięcy TPM)

# Konfiguracja modelu osadzania
AZURE_AI_EMBED_MODEL_NAME         # Domyślnie: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Domyślnie: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Domyślnie: najnowsza dostępna
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nazwa wdrożenia dla osadzeń
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Domyślnie: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Domyślnie: 50 (tysięcy TPM)

# Konfiguracja agenta
AZURE_AI_AGENT_NAME               # Wyświetlana nazwa agenta
AZURE_EXISTING_AGENT_ID           # Użyj istniejącego agenta (opcjonalnie)
```

### 3.3 Przełącznik funkcji
```bash title="" linenums="0"
# Usługi opcjonalne
USE_APPLICATION_INSIGHTS         # Domyślnie: prawda
USE_AZURE_AI_SEARCH_SERVICE      # Domyślnie: fałsz
USE_CONTAINER_REGISTRY           # Domyślnie: prawda

# Monitorowanie i śledzenie
ENABLE_AZURE_MONITOR_TRACING     # Domyślnie: fałsz
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Domyślnie: fałsz

# Konfiguracja wyszukiwania
AZURE_AI_SEARCH_INDEX_NAME       # Nazwa indeksu wyszukiwania
AZURE_SEARCH_SERVICE_NAME        # Nazwa usługi wyszukiwania
```

### 3.4 Konfiguracja projektu AI 
```bash title="" linenums="0"
# Użyj istniejących zasobów
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Pełny identyfikator zasobu istniejącego projektu AI
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL punktu końcowego istniejącego projektu
```

### 3.5 Sprawdź swoje zmienne

Użyj Azure Developer CLI, aby wyświetlić i zarządzać swoimi zmiennymi środowiskowymi:

```bash title="" linenums="0"
# Wyświetl wszystkie zmienne środowiskowe dla bieżącego środowiska
azd env get-values

# Pobierz konkretną zmienną środowiskową
azd env get-value AZURE_ENV_NAME

# Ustaw zmienną środowiskową
azd env set AZURE_LOCATION eastus

# Ustaw wiele zmiennych z pliku .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo iż staramy się zapewnić dokładność, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym należy traktować jako źródło ostateczne. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->