# 4. Configureer een sjabloon

!!! tip "AAN HET EINDE VAN DEZE MODULE KUNT U"

    - [ ] Begrijpen van het doel van `azure.yaml`
    - [ ] Begrijpen van de structuur van `azure.yaml`
    - [ ] De waarde van azd-levenscyclus `hooks` begrijpen
    - [ ] **Lab 4:** Verken en wijzig omgevingsvariabelen

---

!!! prompt "Wat doet het `azure.yaml`-bestand? Gebruik een codeblok en leg het regel voor regel uit"

      Het `azure.yaml`-bestand is het **configuratiebestand voor Azure Developer CLI (azd)**. Het bepaalt hoe je applicatie naar Azure wordt uitgerold, inclusief infrastructuur, services, deployment hooks en omgevingsvariabelen.

---

## 1. Doel en functionaliteit

Dit `azure.yaml`-bestand dient als de **implementatieblauwdruk** voor een AI-agentapplicatie die:

1. **Valideert de omgeving** vóór implementatie
2. **Voorziet in Azure AI-services** (AI Hub, AI Project, Search, enz.)
3. **Rolt een Python-applicatie uit** naar Azure Container Apps
4. **Configureert AI-modellen** voor zowel chat- als embedding-functionaliteit
5. **Zet monitoring en tracing op** voor de AI-applicatie
6. **Ondersteunt zowel nieuwe als bestaande** Azure AI-projectscenario's

Het bestand maakt implementatie met één commando (`azd up`) mogelijk van een complete AI-agentoplossing met de juiste validatie, provisioning en post-deployconfiguratie.

??? info "Uitklappen om te bekijken: `azure.yaml`"

      Het `azure.yaml`-bestand definieert hoe Azure Developer CLI deze AI-agentapplicatie in Azure moet implementeren en beheren. Laten we het regel voor regel ontleden.

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

## 2. Het bestand ontleden

Laten we het bestand sectie voor sectie doornemen, om te begrijpen wat het doet - en waarom.

### 2.1 **Kop en schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Regel 1**: Biedt schema-validatie voor de YAML-taalserver voor IDE-ondersteuning en IntelliSense

### 2.2 Projectmetadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Regel 5**: Definieert de projectnaam die door Azure Developer CLI wordt gebruikt
- **Regels 6-7**: Geeft aan dat dit gebaseerd is op een sjabloonversie 1.0.2
- **Regels 8-9**: Vereist Azure Developer CLI versie 1.14.0 of hoger

### 2.3 Deploy-hooks (11-40)

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

- **Regels 11-20**: **Pre-deploy-hook** - wordt uitgevoerd vóór `azd up`

      - Op Unix/Linux: Maakt het validatiescript uitvoerbaar en voert het uit
      - Op Windows: Voert het PowerShell-validatiescript uit
      - Beide zijn interactief en stoppen de implementatie als ze falen

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
- **Regels 21-30**: **Post-provision-hook** - wordt uitgevoerd nadat Azure-resources zijn gemaakt

  - Voert scripts uit die omgevingsvariabelen wegschrijven
  - Gaat door met de implementatie, zelfs als deze scripts falen (`continueOnError: true`)

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
- **Regels 31-40**: **Post-deploy-hook** - wordt uitgevoerd na de applicatie-implementatie

  - Voert de laatste installatiescripts uit
  - Gaat door, zelfs als de scripts falen

### 2.4 Serviceconfiguratie (41-48)

Dit configureert de applicatieservice die je implementeert.

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

- **Regel 42**: Definieert een service met de naam "api_and_frontend"
- **Regel 43**: Verwijst naar de `./src`-map voor de broncode
- **Regel 44**: Geeft Python op als de programmeertaal
- **Regel 45**: Gebruikt Azure Container Apps als hostingplatform
- **Regels 46-48**: Docker-configuratie

      - Gebruikt "api_and_frontend" als afbeeldingsnaam
      - Bouwt de Docker-image op afstand in Azure (niet lokaal)

### 2.5 Pipelinevariabelen (49-76)

Dit zijn variabelen om je te helpen `azd` uit te voeren in CI/CD-pijplijnen voor automatisering

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

Deze sectie definieert omgevingsvariabelen die **tijdens implementatie** worden gebruikt, georganiseerd per categorie:

- **Azure-resourcenamen (Regels 51-60)**:
      - Kernnamen van Azure-services, bijv. Resource Group, AI Hub, AI Project, enz.
- **Featurevlaggen (Regels 61-63)**:
      - Booleaanse variabelen om specifieke Azure-services in of uit te schakelen
- **AI-agentconfiguratie (Regels 64-71)**:
      - Configuratie voor de hoofd-AI-agent inclusief naam, ID, implementatie-instellingen, modelgegevens
- **AI-embeddingconfiguratie (Regels 72-79)**:
      - Configuratie voor het embedding-model dat wordt gebruikt voor vectorzoekopdrachten
- **Zoeken en bewaking (Regels 80-84)**:
      - Zoekindexnaam, bestaande resource-IDs, en instellingen voor monitoring/tracing

---

## 3. Ken de omgevingsvariabelen
De volgende omgevingsvariabelen bepalen de configuratie en het gedrag van je implementatie, georganiseerd naar hun belangrijkste doel. De meeste variabelen hebben redelijke standaardwaarden, maar je kunt ze aanpassen om aan je specifieke vereisten of bestaande Azure-resources te voldoen.

### 3.1 Vereiste variabelen 

```bash title="" linenums="0"
# Kern Azure-configuratie
AZURE_ENV_NAME                    # Omgevingsnaam (gebruikt bij resourcebenaming)
AZURE_LOCATION                    # Implementatieregio
AZURE_SUBSCRIPTION_ID             # Doelabonnement
AZURE_RESOURCE_GROUP              # Naam van de resourcegroep
AZURE_PRINCIPAL_ID                # Gebruikersprincipal voor rolgebaseerde toegangscontrole (RBAC)

# Resourcenamen (automatisch gegenereerd als niet opgegeven)
AZURE_AIHUB_NAME                  # Naam van de Microsoft Foundry-hub
AZURE_AIPROJECT_NAME              # AI-projectnaam
AZURE_AISERVICES_NAME             # Naam van het AI-servicesaccount
AZURE_STORAGE_ACCOUNT_NAME        # Opslagaccountnaam
AZURE_CONTAINER_REGISTRY_NAME     # Naam van de containerregistry
AZURE_KEYVAULT_NAME               # Naam van de Key Vault (indien gebruikt)
```

### 3.2 Modelconfiguratie 
```bash title="" linenums="0"
# Chatmodelconfiguratie
AZURE_AI_AGENT_MODEL_NAME         # Standaard: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Standaard: OpenAI (of Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Standaard: meest recent beschikbaar
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Naam van de implementatie voor het chatmodel
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Standaard: Standaard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Standaard: 80 (duizenden TPM)

# Embeddingmodelconfiguratie
AZURE_AI_EMBED_MODEL_NAME         # Standaard: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Standaard: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Standaard: meest recent beschikbaar
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Naam van de implementatie voor embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Standaard: Standaard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Standaard: 50 (duizenden TPM)

# Agentconfiguratie
AZURE_AI_AGENT_NAME               # Weergavenaam van de agent
AZURE_EXISTING_AGENT_ID           # Bestaande agent gebruiken (optioneel)
```

### 3.3 Feature-toggle
```bash title="" linenums="0"
# Optionele services
USE_APPLICATION_INSIGHTS         # Standaard: waar
USE_AZURE_AI_SEARCH_SERVICE      # Standaard: onwaar
USE_CONTAINER_REGISTRY           # Standaard: waar

# Monitoring en tracering
ENABLE_AZURE_MONITOR_TRACING     # Standaard: onwaar
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Standaard: onwaar

# Zoekconfiguratie
AZURE_AI_SEARCH_INDEX_NAME       # Naam van de zoekindex
AZURE_SEARCH_SERVICE_NAME        # Naam van de zoekservice
```

### 3.4 AI-projectconfiguratie 
```bash title="" linenums="0"
# Bestaande bronnen gebruiken
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Volledige resource-ID van bestaand AI-project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint-URL van bestaand project
```

### 3.5 Controleer je variabelen

Gebruik de Azure Developer CLI om je omgevingsvariabelen te bekijken en te beheren:

```bash title="" linenums="0"
# Bekijk alle omgevingsvariabelen voor de huidige omgeving
azd env get-values

# Haal een specifieke omgevingsvariabele op
azd env get-value AZURE_ENV_NAME

# Stel een omgevingsvariabele in
azd env set AZURE_LOCATION eastus

# Stel meerdere variabelen in vanuit een .env-bestand
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, wees u ervan bewust dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor enige misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->