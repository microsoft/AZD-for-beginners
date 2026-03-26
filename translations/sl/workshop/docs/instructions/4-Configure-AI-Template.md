# 4. Configure a Template

!!! tip "NA KONCU TEGA MODULA BOSTE ZMOŽNI"

    - [ ] Razumeti namen `azure.yaml`
    - [ ] Razumeti strukturo `azure.yaml`
    - [ ] Razumeti vrednost azd življenjskega cikla `hooks`
    - [ ] **Lab 4:** Raziščite in uredite okoljske spremenljivke

---

!!! prompt "Kaj počne datoteka `azure.yaml`? Uporabite ogrodje kode in razložite vrstico za vrstico"

      Datoteka `azure.yaml` je **konfiguracijska datoteka za Azure Developer CLI (azd)**. Določa, kako naj bo vaša aplikacija razmestjena v Azure, vključno z infrastrukturo, storitvami, namestitvenimi hooki in okoljskimi spremenljivkami.

---

## 1. Purpose and Functionality

Ta `azure.yaml` datoteka služi kot **načrt razmestitve** za aplikacijo AI agenta, ki:

1. **Preveri okolje** pred razmestitvijo
2. **Ustvari Azure AI storitve** (AI Hub, AI Project, Search ipd.)
3. **Razmestitvi Python aplikacijo** v Azure Container Apps
4. **Konfigurira AI modele** za tako klepetalno kot vektorsko (embedding) funkcionalnost
5. **Nastavi nadzor in sledenje** za AI aplikacijo
6. **Obravnava tako nove kot obstoječe** scenarije Azure AI projektov

Datoteka omogoča **en ukazno razmestitev** (`azd up`) celovite rešitve AI agenta z ustreznim preverjanjem, zagotavljanjem virov in po-razmestitveno konfiguracijo.

??? info "Razširi za ogled: `azure.yaml`"

      Datoteka `azure.yaml` določa, kako naj Azure Developer CLI razmestí in upravlja to AI Agent aplikacijo v Azure. Razčlenimo jo vrstico za vrstico.

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

## 2. Deconstructing The File

Pojdimo skozi datoteko odseka po odsek, da razumemo kaj počne - in zakaj.

### 2.1 **Header and Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: Nudi preverjanje sheme za YAML language server, kar omogoča podporo v IDE in IntelliSense

### 2.2 Project Metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Določa ime projekta, ki ga uporablja Azure Developer CLI
- **Lines 6-7**: Navedeno je, da temelji na predlogi različice 1.0.2
- **Lines 8-9**: Zahteva Azure Developer CLI različico 1.14.0 ali novejšo

### 2.3 Deploy Hooks (11-40)

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

- **Lines 11-20**: **Prednamestitveni hook** - se izvede pred `azd up`

      - Na Unix/Linux: naredi validacijsko skripto izvedljivo in jo zažene
      - Na Windows: zažene PowerShell validacijsko skripto
      - Obe sta interaktivni in bosta ustavili razmestitev, če ne uspešeta

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
- **Lines 21-30**: **Hook po zagotovitvi virov** - se izvede po ustvarjanju Azure virov

  - Izvede skripte za zapis okoljskih spremenljivk
  - Nadaljuje razmestitev tudi, če te skripte spodletijo (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - se izvede po razmestitvi aplikacije

  - Izvede končne namestitvene skripte
  - Nadaljuje tudi, če skripte spodletijo

### 2.4 Service Config (41-48)

Ta del konfigurira aplikacijsko storitev, ki jo razmestite.

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

- **Line 42**: Določi storitev z imenom "api_and_frontend"
- **Line 43**: Navezano na imenik `./src` za izvorno kodo
- **Line 44**: Navedem Python kot programski jezik
- **Line 45**: Uporablja Azure Container Apps kot gostiteljsko platformo
- **Lines 46-48**: Docker konfiguracija

      - Uporablja "api_and_frontend" kot ime slike
      - Sestavi Docker sliko na daljavo v Azure (ne lokalno)

### 2.5 Pipeline Variables (49-76)

To so spremenljivke, ki vam pomagajo poganjati `azd` v CI/CD cevovodih za avtomatizacijo

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

This section defines environment variables used **during deployment**, organized by category:

- **Azure Resource Names (Lines 51-60)**:
      - Glavna imena Azure storitev npr. Resource Group, AI Hub, AI Project itd.- 
- **Feature Flags (Lines 61-63)**:
      - Boolean spremenljivke za omogočanje/onemogočanje določenih Azure storitev
- **AI Agent Configuration (Lines 64-71)**:
      - Konfiguracija glavnega AI agenta vključno z imenom, ID, nastavitvami razmestitve in podrobnostmi modela- 
- **AI Embedding Configuration (Lines 72-79)**:
      - Konfiguracija za embedding model, uporabljen za vektorsko iskanje
- **Search and Monitoring (Lines 80-84)**:
      - Ime iskalnega indeksa, ID-ji obstoječih virov in nastavitve nadzora/sledenja

---

## 3. Know Env Variables
Naslednje okoljske spremenljivke nadzorujejo konfiguracijo in obnašanje vaše razmestitve, razdeljene po njihovem glavnem namenu. Večina spremenljivk ima smiselne privzete vrednosti, vendar jih lahko prilagodite, da ustrezajo vašim zahtevam ali obstoječim Azure virom.

### 3.1 Required Variables 

```bash title="" linenums="0"
# Osnovna konfiguracija Azure
AZURE_ENV_NAME                    # Ime okolja (uporablja se pri poimenovanju virov)
AZURE_LOCATION                    # Regija nameščanja
AZURE_SUBSCRIPTION_ID             # Ciljna naročnina
AZURE_RESOURCE_GROUP              # Ime skupine virov
AZURE_PRINCIPAL_ID                # Uporabniški principal za RBAC

# Imena virov (samodejno ustvarjena, če niso določena)
AZURE_AIHUB_NAME                  # Ime huba Microsoft Foundry
AZURE_AIPROJECT_NAME              # Ime AI projekta
AZURE_AISERVICES_NAME             # Ime računa za AI storitve
AZURE_STORAGE_ACCOUNT_NAME        # Ime računa za shranjevanje
AZURE_CONTAINER_REGISTRY_NAME     # Ime registra kontejnerjev
AZURE_KEYVAULT_NAME               # Ime Key Vaulta (če se uporablja)
```

### 3.2 Model Configuration 
```bash title="" linenums="0"
# Konfiguracija klepetalnega modela
AZURE_AI_AGENT_MODEL_NAME         # Privzeto: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Privzeto: OpenAI (ali Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Privzeto: najnovejše na voljo
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Ime postavitve za klepetalni model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Privzeto: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Privzeto: 80 (tisoč TPM)

# Konfiguracija modela za vdelave
AZURE_AI_EMBED_MODEL_NAME         # Privzeto: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Privzeto: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Privzeto: najnovejše na voljo
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Ime postavitve za vdelave
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Privzeto: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Privzeto: 50 (tisoč TPM)

# Konfiguracija agenta
AZURE_AI_AGENT_NAME               # Prikazno ime agenta
AZURE_EXISTING_AGENT_ID           # Uporabi obstoječega agenta (izbirno)
```

### 3.3 Feature Toggle
```bash title="" linenums="0"
# Neobvezne storitve
USE_APPLICATION_INSIGHTS         # Privzeto: omogočeno
USE_AZURE_AI_SEARCH_SERVICE      # Privzeto: onemogočeno
USE_CONTAINER_REGISTRY           # Privzeto: omogočeno

# Nadzor in sledenje
ENABLE_AZURE_MONITOR_TRACING     # Privzeto: onemogočeno
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Privzeto: onemogočeno

# Konfiguracija iskanja
AZURE_AI_SEARCH_INDEX_NAME       # Ime iskalnega indeksa
AZURE_SEARCH_SERVICE_NAME        # Ime iskalne storitve
```

### 3.4 AI Project Configuration 
```bash title="" linenums="0"
# Uporabi obstoječe vire
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Celoten ID vira obstoječega AI-projekta
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL končne točke obstoječega projekta
```

### 3.5 Check Your Variables

Uporabite Azure Developer CLI za ogled in upravljanje vaših okoljskih spremenljivk:

```bash title="" linenums="0"
# Prikaži vse spremenljivke okolja za trenutno okolje
azd env get-values

# Pridobi določeno okoljsko spremenljivko
azd env get-value AZURE_ENV_NAME

# Nastavi okoljsko spremenljivko
azd env set AZURE_LOCATION eastus

# Nastavi več spremenljivk iz datoteke .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvorni različici naj velja za uraden vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->