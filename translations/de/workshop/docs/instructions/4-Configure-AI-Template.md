<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T11:02:08+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "de"
}
-->
# 4. Konfigurieren einer Vorlage

!!! tip "AM ENDE DIESES MODULS WERDEN SIE IN DER LAGE SEIN"

    - [ ] Den Zweck von `azure.yaml` verstanden haben
    - [ ] Die Struktur von `azure.yaml` verstanden haben
    - [ ] Den Wert der azd-Lebenszyklus-`hooks` verstanden haben
    - [ ] **Lab 3:** 

---

!!! prompt "Was macht die Datei `azure.yaml`? Verwenden Sie einen Codeblock und erklären Sie sie Zeile für Zeile"

      Die Datei `azure.yaml` ist die **Konfigurationsdatei für Azure Developer CLI (azd)**. Sie definiert, wie Ihre Anwendung in Azure bereitgestellt werden soll, einschließlich Infrastruktur, Dienste, Bereitstellungshooks und Umgebungsvariablen.

---

## 1. Zweck und Funktionalität

Die Datei `azure.yaml` dient als **Bereitstellungsplan** für eine KI-Agenten-Anwendung, die:

1. **Die Umgebung vor der Bereitstellung validiert**
2. **Azure AI-Dienste bereitstellt** (AI Hub, AI Project, Search usw.)
3. **Eine Python-Anwendung** in Azure Container Apps bereitstellt
4. **KI-Modelle konfiguriert** für Chat- und Einbettungsfunktionen
5. **Überwachung und Tracing** für die KI-Anwendung einrichtet
6. **Sowohl neue als auch bestehende** Azure AI-Projekt-Szenarien unterstützt

Die Datei ermöglicht eine **Bereitstellung mit einem einzigen Befehl** (`azd up`) einer vollständigen KI-Agenten-Lösung mit ordnungsgemäßer Validierung, Bereitstellung und Nachbereitstellungskonfiguration.

??? info "Erweitern, um `azure.yaml` anzuzeigen"

      Die Datei `azure.yaml` definiert, wie Azure Developer CLI diese KI-Agenten-Anwendung in Azure bereitstellen und verwalten soll. Lassen Sie uns sie Zeile für Zeile durchgehen.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: Brauchen wir Hooks? 
      # TODO: Brauchen wir alle Variablen?

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

## 2. Datei analysieren

Lassen Sie uns die Datei Abschnitt für Abschnitt durchgehen, um zu verstehen, was sie tut - und warum.

### 2.1 **Header und Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Zeile 1**: Bietet Schema-Validierung für YAML-Sprachserver für IDE-Unterstützung und IntelliSense

### 2.2 Projekt-Metadaten (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Zeile 5**: Definiert den Projektnamen, der von Azure Developer CLI verwendet wird
- **Zeilen 6-7**: Gibt an, dass dies auf einer Vorlage Version 1.0.2 basiert
- **Zeilen 8-9**: Erfordert Azure Developer CLI Version 1.14.0 oder höher

### 2.3 Bereitstellungshooks (11-40)

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

- **Zeilen 11-20**: **Pre-Bereitstellungshook** - wird vor `azd up` ausgeführt

      - Auf Unix/Linux: Macht das Validierungsskript ausführbar und führt es aus
      - Auf Windows: Führt das PowerShell-Validierungsskript aus
      - Beide sind interaktiv und stoppen die Bereitstellung, wenn sie fehlschlagen

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
- **Zeilen 21-30**: **Post-Provision-Hook** - wird nach der Erstellung von Azure-Ressourcen ausgeführt

  - Führt Skripte zum Schreiben von Umgebungsvariablen aus
  - Setzt die Bereitstellung fort, auch wenn diese Skripte fehlschlagen (`continueOnError: true`)

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
- **Zeilen 31-40**: **Post-Bereitstellungshook** - wird nach der Bereitstellung der Anwendung ausgeführt

  - Führt abschließende Setup-Skripte aus
  - Setzt die Bereitstellung fort, auch wenn Skripte fehlschlagen

### 2.4 Service-Konfiguration (41-48)

Konfiguriert den Anwendungsdienst, den Sie bereitstellen.

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

- **Zeile 42**: Definiert einen Dienst namens "api_and_frontend"
- **Zeile 43**: Verweist auf das Verzeichnis `./src` für den Quellcode
- **Zeile 44**: Gibt Python als Programmiersprache an
- **Zeile 45**: Verwendet Azure Container Apps als Hosting-Plattform
- **Zeilen 46-48**: Docker-Konfiguration

      - Verwendet "api_and_frontend" als Bildnamen
      - Erstellt das Docker-Bild remote in Azure (nicht lokal)

### 2.5 Pipeline-Variablen (49-76)

Dies sind Variablen, die Ihnen helfen, `azd` in CI/CD-Pipelines für die Automatisierung auszuführen.

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

Dieser Abschnitt definiert Umgebungsvariablen, die **während der Bereitstellung** verwendet werden, organisiert nach Kategorien:

- **Azure-Ressourcennamen (Zeilen 51-60)**:
      - Namen der Kern-Azure-Dienste, z. B. Resource Group, AI Hub, AI Project usw.- 
- **Feature-Flags (Zeilen 61-63)**:
      - Boolesche Variablen zum Aktivieren/Deaktivieren bestimmter Azure-Dienste
- **KI-Agenten-Konfiguration (Zeilen 64-71)**:
      - Konfiguration für den Haupt-KI-Agenten einschließlich Name, ID, Bereitstellungseinstellungen, Modelldetails- 
- **Einbettungs-Konfiguration (Zeilen 72-79)**:
      - Konfiguration für das Einbettungsmodell, das für die Vektorsuche verwendet wird
- **Suche und Überwachung (Zeilen 80-84)**:
      - Suchindexname, bestehende Ressourcen-IDs und Überwachungs-/Tracing-Einstellungen

---

## 3. Umgebungsvariablen kennen
Die folgenden Umgebungsvariablen steuern die Konfiguration und das Verhalten Ihrer Bereitstellung, organisiert nach ihrem Hauptzweck. Die meisten Variablen haben sinnvolle Standardwerte, aber Sie können sie an Ihre spezifischen Anforderungen oder vorhandenen Azure-Ressourcen anpassen.

### 3.1 Erforderliche Variablen 

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

### 3.2 Modellkonfiguration 
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

### 3.3 Feature-Toggle
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

### 3.4 KI-Projekt-Konfiguration 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Überprüfen Sie Ihre Variablen

Verwenden Sie die Azure Developer CLI, um Ihre Umgebungsvariablen anzuzeigen und zu verwalten:

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

