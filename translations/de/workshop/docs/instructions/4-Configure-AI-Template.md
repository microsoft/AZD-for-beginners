# 4. Eine Vorlage konfigurieren

!!! tip "AM ENDE DIESES MODULS SIND SIE IN DER LAGE"

    - [ ] Verstehen Sie den Zweck von `azure.yaml`
    - [ ] Verstehen Sie die Struktur von `azure.yaml`
    - [ ] Verstehen Sie den Wert der azd-Lebenszyklus-`hooks`
    - [ ] **Lab 4:** Umgebungsvariablen erkunden und ändern

---

!!! prompt "Was macht die `azure.yaml`-Datei? Verwenden Sie einen Codeblock und erklären Sie sie Zeile für Zeile"

      Die `azure.yaml`-Datei ist die **Konfigurationsdatei für Azure Developer CLI (azd)**. Sie definiert, wie Ihre Anwendung in Azure bereitgestellt werden soll, einschließlich Infrastruktur, Dienste, Bereitstellungshooks und Umgebungsvariablen.

---

## 1. Zweck und Funktionalität

Diese `azure.yaml`-Datei dient als **Bereitstellungsplan** für eine KI-Agent-Anwendung, die:

1. **Validiert die Umgebung** vor der Bereitstellung
2. **Stellt Azure AI-Dienste bereit** (AI Hub, AI Project, Search, etc.)
3. **Stellt eine Python-Anwendung bereit** in Azure Container Apps
4. **Konfiguriert KI-Modelle** für Chat- und Embedding-Funktionalität
5. **Richtet Überwachung und Tracing ein** für die KI-Anwendung
6. **Unterstützt sowohl neue als auch bestehende** Azure AI-Projekt-Szenarien

Die Datei ermöglicht die **Bereitstellung mit einem einzigen Befehl** (`azd up`) einer vollständigen KI-Agent-Lösung mit entsprechender Validierung, Bereitstellung und Nachbereitungs-Konfiguration.

??? info "Zum Anzeigen erweitern: `azure.yaml`"

      Die `azure.yaml`-Datei legt fest, wie die Azure Developer CLI diese KI-Agent-Anwendung in Azure bereitstellen und verwalten soll. Lassen Sie uns sie Zeile für Zeile aufschlüsseln.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

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

## 2. Die Datei aufschlüsseln

Gehen wir die Datei Abschnitt für Abschnitt durch, um zu verstehen, was sie tut und warum.

### 2.1 **Header und Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Zeile 1**: Bietet Schemavalidierung für den YAML Language Server zur IDE-Unterstützung und IntelliSense

### 2.2 Projekt-Metadaten (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Zeile 5**: Definiert den Projektnamen, der von der Azure Developer CLI verwendet wird
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

- **Zeilen 11-20**: **Pre-Deployment-Hook** - wird vor `azd up` ausgeführt

      - Unter Unix/Linux: Macht das Validierungsskript ausführbar und führt es aus
      - Unter Windows: Führt das PowerShell-Validierungsskript aus
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
- **Zeilen 21-30**: **Post-Provision-Hook** - wird ausgeführt, nachdem Azure-Ressourcen erstellt wurden

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
- **Zeilen 31-40**: **Post-Deploy-Hook** - wird nach der Bereitstellung der Anwendung ausgeführt

  - Führt abschließende Einrichtungs-Skripte aus
  - Setzt fort, auch wenn Skripte fehlschlagen

### 2.4 Service-Konfiguration (41-48)

Dies konfiguriert den Anwendungsdienst, den Sie bereitstellen.

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

- **Zeile 42**: Definiert einen Dienst mit dem Namen "api_and_frontend"
- **Zeile 43**: Verweist auf das Verzeichnis `./src` für den Quellcode
- **Zeile 44**: Gibt Python als Programmiersprache an
- **Zeile 45**: Verwendet Azure Container Apps als Hosting-Plattform
- **Zeilen 46-48**: Docker-Konfiguration

      - Verwendet "api_and_frontend" als Image-Namen
      - Baut das Docker-Image remote in Azure (nicht lokal)

### 2.5 Pipeline-Variablen (49-76)

Dies sind Variablen, die Ihnen helfen, `azd` in CI/CD-Pipelines zur Automatisierung auszuführen

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

Dieser Abschnitt definiert Umgebungsvariablen, die **während der Bereitstellung** verwendet werden, und ist nach Kategorien gegliedert:

- **Azure-Ressourcennamen (Zeilen 51-60)**:
      - Zentrale Azure-Dienstressourcennamen, z. B. Ressourcengruppe, AI Hub, AI Project usw.
- **Feature-Flags (Zeilen 61-63)**:
      - Boolesche Variablen zum Aktivieren/Deaktivieren bestimmter Azure-Dienste
- **KI-Agent-Konfiguration (Zeilen 64-71)**:
      - Konfiguration für den Haupt-KI-Agenten, einschließlich Name, ID, Bereitstellungseinstellungen, Modelldetails
- **KI-Embedding-Konfiguration (Zeilen 72-79)**:
      - Konfiguration für das Embedding-Modell, das für die Vektorsuche verwendet wird
- **Suche und Überwachung (Zeilen 80-84)**:
      - Name des Suchindex, vorhandene Ressourcen-IDs sowie Überwachungs-/Tracing-Einstellungen

---

## 3. Umgebungsvariablen kennen
Die folgenden Umgebungsvariablen steuern die Konfiguration und das Verhalten Ihrer Bereitstellung und sind nach ihrem Hauptzweck geordnet. Die meisten Variablen haben sinnvolle Standardwerte, Sie können sie jedoch an Ihre spezifischen Anforderungen oder vorhandene Azure-Ressourcen anpassen.

### 3.1 Erforderliche Variablen 

```bash title="" linenums="0"
# Kernkonfiguration für Azure
AZURE_ENV_NAME                    # Umgebungsname (wird bei der Ressourcenbenennung verwendet)
AZURE_LOCATION                    # Bereitstellungsregion
AZURE_SUBSCRIPTION_ID             # Zielabonnement
AZURE_RESOURCE_GROUP              # Name der Ressourcengruppe
AZURE_PRINCIPAL_ID                # Benutzerprinzipal für RBAC

# Ressourcennamen (falls nicht angegeben automatisch generiert)
AZURE_AIHUB_NAME                  # Name des Microsoft Foundry-Hubs
AZURE_AIPROJECT_NAME              # Name des KI-Projekts
AZURE_AISERVICES_NAME             # Name des Kontos für KI-Dienste
AZURE_STORAGE_ACCOUNT_NAME        # Name des Speicherkontos
AZURE_CONTAINER_REGISTRY_NAME     # Name der Container-Registry
AZURE_KEYVAULT_NAME               # Name des Key Vaults (falls verwendet)
```

### 3.2 Modellkonfiguration 
```bash title="" linenums="0"
# Konfiguration des Chat-Modells
AZURE_AI_AGENT_MODEL_NAME         # Standard: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Standard: OpenAI (oder Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Standard: neueste verfügbare
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Bereitstellungsname für das Chat-Modell
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Standard: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Standard: 80 (Tausende TPM)

# Konfiguration des Embedding-Modells
AZURE_AI_EMBED_MODEL_NAME         # Standard: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Standard: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Standard: neueste verfügbare
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Bereitstellungsname für Embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Standard: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Standard: 50 (Tausende TPM)

# Agentenkonfiguration
AZURE_AI_AGENT_NAME               # Anzeigename des Agenten
AZURE_EXISTING_AGENT_ID           # Vorhandenen Agenten verwenden (optional)
```

### 3.3 Feature-Toggle
```bash title="" linenums="0"
# Optionale Dienste
USE_APPLICATION_INSIGHTS         # Standard: true
USE_AZURE_AI_SEARCH_SERVICE      # Standard: false
USE_CONTAINER_REGISTRY           # Standard: true

# Überwachung und Tracing
ENABLE_AZURE_MONITOR_TRACING     # Standard: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Standard: false

# Suchkonfiguration
AZURE_AI_SEARCH_INDEX_NAME       # Name des Suchindex
AZURE_SEARCH_SERVICE_NAME        # Name des Suchdienstes
```

### 3.4 KI-Projektkonfiguration 
```bash title="" linenums="0"
# Vorhandene Ressourcen verwenden
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Vollständige Ressourcen-ID des bestehenden KI-Projekts
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpunkt-URL des bestehenden Projekts
```

### 3.5 Überprüfen Sie Ihre Variablen

Verwenden Sie die Azure Developer CLI, um Ihre Umgebungsvariablen anzuzeigen und zu verwalten:

```bash title="" linenums="0"
# Alle Umgebungsvariablen der aktuellen Umgebung anzeigen
azd env get-values

# Eine bestimmte Umgebungsvariable abrufen
azd env get-value AZURE_ENV_NAME

# Eine Umgebungsvariable festlegen
azd env set AZURE_LOCATION eastus

# Mehrere Variablen aus einer .env-Datei setzen
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Originalsprache gilt als maßgebliche Quelle. Bei kritischen Informationen empfehlen wir eine professionelle menschliche Übersetzung. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->