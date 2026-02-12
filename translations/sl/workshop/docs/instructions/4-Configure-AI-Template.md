# 4. Konfigurirajte predlogo

!!! tip "NA KONCU TEGA MODULA BOSTE ZMOGLI"

    - [ ] Razumeti namen datoteke `azure.yaml`
    - [ ] Razumeti strukturo datoteke `azure.yaml`
    - [ ] Razumeti pomen azd življenjskega cikla `hooks`
    - [ ] **Laboratorij 4:** Raziščite in spremenite spremenljivke okolja

---

!!! prompt "Kaj počne datoteka `azure.yaml`? Uporabite blok kode in razložite vrstico za vrstico"

      Datoteka `azure.yaml` je **konfiguracijska datoteka za Azure Developer CLI (azd)**. Določa, kako naj bo vaša aplikacija razporejena v Azure, vključno z infrastrukturo, storitvami, namestitvenimi sprožilci (hooks) in spremenljivkami okolja.

---

## 1. Namen in funkcionalnost

Ta datoteka `azure.yaml` služi kot **načrt za namestitev** za aplikacijo AI agenta, ki:

1. **Preveri okolje** pred namestitvijo
2. **Vzpostavi Azure AI storitve** (AI Hub, AI Project, Search itd.)
3. **Razporedi Python aplikacijo** v Azure Container Apps
4. **Konfigurira AI modele** tako za klepetalno kot za embedding funkcionalnost
5. **Vzpostavi nadzor in sledenje** za AI aplikacijo
6. **Obravnava tako nove kot obstoječe** scenarije Azure AI projektov

Datoteka omogoča **namestitev z enim ukazom** (`azd up`) celovite rešitve AI agenta z ustreznim preverjanjem, vzpostavitvijo in konfiguracijo po namestitvi.

??? info "Razširi za ogled: `azure.yaml`"

      Datoteka `azure.yaml` določa, kako naj Azure Developer CLI razporedi in upravlja to aplikacijo AI agenta v Azure. Razčlenimo jo vrstico za vrstico.

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

## 2. Razčlenjevanje datoteke

Pojdimo skozi datoteko odsek za odsekom, da razumemo, kaj počne - in zakaj.

### 2.1 **Glava in shema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Vrstica 1**: Nudi preverjanje sheme za YAML language server za podporo IDE in IntelliSense

### 2.2 Metapodatki projekta (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Vrstica 5**: Določa ime projekta, ki ga uporablja Azure Developer CLI
- **Vrstici 6-7**: Navezano na predlogo različice 1.0.2
- **Vrstici 8-9**: Zahteva različico Azure Developer CLI 1.14.0 ali novejšo

### 2.3 Namestitveni hooki (11-40)

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

- **Vrstice 11-20**: **Hook pred namestitvijo** - zažene se pred `azd up`

      - On Unix/Linux: Makes validation script executable and runs it
      - On Windows: Runs PowerShell validation script
      - Both are interactive and will stop deployment if they fail

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
- **Vrstice 21-30**: **Hook po vzpostavitvi (post-provision)** - zažene se, ko so Azure viri ustvarjeni

  - Izvede skripte za zapis spremenljivk okolja
  - Nadaljuje namestitev tudi če te skripte spod failajo (`continueOnError: true`)

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
- **Vrstice 31-40**: **Hook po namestitvi (post-deploy)** - zažene se po razporeditvi aplikacije

  - Izvede končne začetne skripte
  - Nadaljuje tudi če skripte spod failajo

### 2.4 Konfiguracija storitve (41-48)

To konfigurira aplikacijsko storitev, ki jo nameščate.

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

- **Vrstica 42**: Določa storitev z imenom "api_and_frontend"
- **Vrstica 43**: Kaže na imenik `./src` za izvorno kodo
- **Vrstica 44**: Navedeno je Python kot programski jezik
- **Vrstica 45**: Uporablja Azure Container Apps kot gostiteljsko platformo
- **Vrstici 46-48**: Docker konfiguracija

      - Uporablja "api_and_frontend" kot ime slike
      - Docker sliko gradi oddaljeno v Azure (ne lokalno)

### 2.5 Spremenljivke pipeline-a (49-76)

To so spremenljivke, ki vam pomagajo zagnati `azd` v CI/CD cevovodih za avtomatizacijo

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

Ta sekcija definira spremenljivke okolja, uporabljene **med namestitvijo**, organizirane po kategorijah:

- **Imena Azure virov (Vrstice 51-60)**:
      - Jedrna imena Azure storitev npr, Resource Group, AI Hub, AI Project itd.- 
- **Preklop funkcij (Vrstice 61-63)**:
      - Boolean spremenljivke za vklop/izklop določenih Azure storitev
- **Konfiguracija AI agenta (Vrstice 64-71)**:
      - Konfiguracija glavnega AI agenta vključno z imenom, ID-jem, nastavitvami razporeditve in podrobnostmi modela- 
- **Konfiguracija AI embedding modela (Vrstice 72-79)**:
      - Konfiguracija embedding modela, ki se uporablja za vektorsko iskanje
- **Iskanje in nadzor (Vrstice 80-84)**:
      - Ime iskalnega indeksa, obstoječi ID-ji virov in nastavitve nadzora/sledenja

---

## 3. Spoznajte spremenljivke okolja
Naslednje spremenljivke okolja nadzorujejo konfiguracijo in vedenje vaše namestitve, organizirane po njihovem glavnem namenu. Večina spremenljivk ima smiselne privzete vrednosti, vendar jih lahko prilagodite tako, da ustrezajo vašim specifičnim zahtevam ali obstoječim Azure virom.

### 3.1 Zahtevane spremenljivke 

```bash title="" linenums="0"
# Osnovna konfiguracija Azure
AZURE_ENV_NAME                    # Ime okolja (uporablja se pri poimenovanju virov)
AZURE_LOCATION                    # Regija nameščanja
AZURE_SUBSCRIPTION_ID             # Ciljna naročnina
AZURE_RESOURCE_GROUP              # Ime skupine virov
AZURE_PRINCIPAL_ID                # Uporabniški principal za RBAC

# Imena virov (samodejno ustvarjena, če niso določena)
AZURE_AIHUB_NAME                  # Ime središča Microsoft Foundry
AZURE_AIPROJECT_NAME              # Ime AI projekta
AZURE_AISERVICES_NAME             # Ime računa za AI storitve
AZURE_STORAGE_ACCOUNT_NAME        # Ime računa za shranjevanje
AZURE_CONTAINER_REGISTRY_NAME     # Ime registra kontejnerjev
AZURE_KEYVAULT_NAME               # Ime Key Vaulta (če se uporablja)
```

### 3.2 Konfiguracija modela 
```bash title="" linenums="0"
# Konfiguracija klepetalnega modela
AZURE_AI_AGENT_MODEL_NAME         # Privzeto: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Privzeto: OpenAI (ali Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Privzeto: najnovejše razpoložljivo
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Ime nameščanja za klepetalni model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Privzeto: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Privzeto: 80 (tisoč TPM)

# Konfiguracija modela za vdelave
AZURE_AI_EMBED_MODEL_NAME         # Privzeto: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Privzeto: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Privzeto: najnovejše razpoložljivo
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Ime nameščanja za vdelave
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Privzeto: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Privzeto: 50 (tisoč TPM)

# Konfiguracija agenta
AZURE_AI_AGENT_NAME               # Prikazno ime agenta
AZURE_EXISTING_AGENT_ID           # Uporabi obstoječega agenta (neobvezno)
```

### 3.3 Preklop funkcij
```bash title="" linenums="0"
# Izbirne storitve
USE_APPLICATION_INSIGHTS         # Privzeto: true
USE_AZURE_AI_SEARCH_SERVICE      # Privzeto: false
USE_CONTAINER_REGISTRY           # Privzeto: true

# Spremljanje in sledenje
ENABLE_AZURE_MONITOR_TRACING     # Privzeto: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Privzeto: false

# Konfiguracija iskanja
AZURE_AI_SEARCH_INDEX_NAME       # Ime iskalnega indeksa
AZURE_SEARCH_SERVICE_NAME        # Ime iskalne storitve
```

### 3.4 Konfiguracija AI projekta 
```bash title="" linenums="0"
# Uporabi obstoječe vire
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Celoten ID vira obstoječega AI-projekta
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL končne točke obstoječega projekta
```

### 3.5 Preverite svoje spremenljivke

Uporabite Azure Developer CLI za ogled in upravljanje vaših spremenljivk okolja:

```bash title="" linenums="0"
# Prikaži vse okoljske spremenljivke za trenutno okolje
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
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco Co-op Translator (https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas opozarjamo, da avtomatski prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku je treba šteti za zavezujoči vir. Za pomembne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->