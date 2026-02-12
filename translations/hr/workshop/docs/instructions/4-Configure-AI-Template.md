# 4. Konfigurirajte predložak

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Razumjeti svrhu `azure.yaml`
    - [ ] Razumjeti strukturu `azure.yaml`
    - [ ] Razumjeti vrijednost azd lifecycle `hooks`
    - [ ] **Laboratorij 4:** Istražite i izmijenite varijable okoline

---

!!! prompt "Čemu služi datoteka `azure.yaml`? Koristite blok koda i objasnite redak po redak"

      Datoteka `azure.yaml` je **konfiguracijska datoteka za Azure Developer CLI (azd)**. Definira kako se vaša aplikacija treba implementirati u Azure, uključujući infrastrukturu, usluge, hooks za implementaciju i varijable okoline.

---

## 1. Svrha i funkcionalnost

Ova datoteka `azure.yaml` služi kao **plan implementacije** za AI agent aplikaciju koja:

1. **Provjerava okruženje** prije implementacije
2. **Dodjeljuje Azure AI usluge** (AI Hub, AI Project, Search itd.)
3. **Implementira Python aplikaciju** na Azure Container Apps
4. **Konfigurira AI modele** za chat i embedding funkcionalnost
5. **Postavlja nadzor i praćenje** za AI aplikaciju
6. **Podržava nove i postojeće** scenarije Azure AI projekata

Datoteka omogućuje **implementaciju jednom naredbom** (`azd up`) kompletne AI agentske solucije s odgovarajućom provjerom, dodjelom i post-implementacijskom konfiguracijom.

??? info "Pokaži više: `azure.yaml`"

      Datoteka `azure.yaml` definira kako Azure Developer CLI treba implementirati i upravljati ovom AI Agent aplikacijom u Azure. Pogledajmo je redak po redak.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: trebaju li nam hooks? 
      # TODO: trebaju li nam sve varijable?

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

## 2. Analiza datoteke

Prođimo kroz datoteku dio po dio kako bismo razumjeli što radi – i zašto.

### 2.1 **Zaglavlje i shema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Redak 1**: Omogućava validaciju sheme YAML jezičnog poslužitelja za podršku u uređivaču i IntelliSense

### 2.2 Metapodaci projekta (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Redak 5**: Definira naziv projekta koji koristi Azure Developer CLI
- **Redci 6-7**: Navodi da se temelji na predlošku verzije 1.0.2
- **Redci 8-9**: Zahtijeva verziju Azure Developer CLI 1.14.0 ili noviju

### 2.3 Hooks za implementaciju (11-40)

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

- **Redci 11-20**: **Hook prije implementacije** - izvršava se prije `azd up`

      - Na Unix/Linux sustavima: Čini skriptu za provjeru varijabli okoline izvršnom i pokreće je
      - Na Windowsu: Pokreće PowerShell skriptu za provjeru
      - Oba su interaktivna i zaustavit će implementaciju ako ne uspiju

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
- **Redci 21-30**: **Hook nakon dodjele resursa** - izvršava se nakon stvaranja Azure resursa

  - Izvršava skripte za zapisivanje varijabli okoline
  - Nastavlja implementaciju čak i ako skripte zakažu (`continueOnError: true`)

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
- **Redci 31-40**: **Hook nakon implementacije** - izvršava se nakon implementacije aplikacije

  - Izvršava završne skripte postavljanja
  - Nastavlja čak i ako skripte zakažu

### 2.4 Konfiguracija usluge (41-48)

Ovo konfigurira uslugu aplikacije koju implementirate.

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

- **Redak 42**: Definira uslugu nazvanu "api_and_frontend"
- **Redak 43**: Upućuje na direktorij `./src` za izvorni kod
- **Redak 44**: Navodi Python kao programski jezik
- **Redak 45**: Koristi Azure Container Apps kao platformu za hosting
- **Redci 46-48**: Docker konfiguracija

      - Koristi ime slike "api_and_frontend"
      - Gradi Docker sliku udaljeno u Azure (ne lokalno)

### 2.5 Varijable cjevovoda (49-76)

Ovo su varijable koje olakšavaju korištenje `azd` u CI/CD cjevovodima za automatizaciju

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

Ovaj odjeljak definira varijable okoline koje se koriste **tijekom implementacije**, organizirane po kategorijama:

- **Nazivi Azure resursa (Redci 51-60)**:
      - Glavni nazivi Azure usluga npr. Resource Group, AI Hub, AI Project itd.
- **Zastavice značajki (Redci 61-63)**:
      - Booleanske varijable za uključivanje/isključivanje specifičnih Azure usluga
- **Konfiguracija AI agenta (Redci 64-71)**:
      - Konfiguracija glavnog AI agenta uključujući ime, ID, postavke implementacije, detalje modela
- **Konfiguracija AI embeddinga (Redci 72-79)**:
      - Konfiguracija za embedding model koji se koristi za vektorsko pretraživanje
- **Pretraživanje i nadzor (Redci 80-84)**:
      - Ime indeksa za pretraživanje, postojeći ID resursa i postavke nadzora i praćenja

---

## 3. Upoznajte varijable okoline
Sljedeće varijable okoline kontroliraju konfiguraciju i ponašanje vaše implementacije, organizirane prema njihovoj primarnoj svrsi. Većina varijabli ima razumne zadane vrijednosti, ali ih možete prilagoditi kako bi odgovarale vašim posebnim zahtjevima ili postojećim Azure resursima.

### 3.1 Obvezne varijable 

```bash title="" linenums="0"
# Osnovna konfiguracija Azure
AZURE_ENV_NAME                    # Ime okruženja (koristi se u imenovanju resursa)
AZURE_LOCATION                    # Regija implementacije
AZURE_SUBSCRIPTION_ID             # Ciljna pretplata
AZURE_RESOURCE_GROUP              # Ime grupe resursa
AZURE_PRINCIPAL_ID                # Korisnički glavni račun za RBAC

# Imena resursa (automatski generirano ako nije navedeno)
AZURE_AIHUB_NAME                  # Ime Microsoft Foundry središta
AZURE_AIPROJECT_NAME              # Ime AI projekta
AZURE_AISERVICES_NAME             # Ime računa AI usluga
AZURE_STORAGE_ACCOUNT_NAME        # Ime računa za pohranu
AZURE_CONTAINER_REGISTRY_NAME     # Ime registra spremnika
AZURE_KEYVAULT_NAME               # Ime Key Vault-a (ako se koristi)
```

### 3.2 Konfiguracija modela 
```bash title="" linenums="0"
# Konfiguracija chat modela
AZURE_AI_AGENT_MODEL_NAME         # Zadano: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Zadano: OpenAI (ili Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Zadano: najnovije dostupno
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Ime implementacije za chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Zadano: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Zadano: 80 (tisuća TPM)

# Konfiguracija modela za ugradnju
AZURE_AI_EMBED_MODEL_NAME         # Zadano: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Zadano: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Zadano: najnovije dostupno
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Ime implementacije za ugradnje
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Zadano: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Zadano: 50 (tisuća TPM)

# Konfiguracija agenta
AZURE_AI_AGENT_NAME               # Prikazno ime agenta
AZURE_EXISTING_AGENT_ID           # Koristi postojećeg agenta (opcionalno)
```

### 3.3 Prekidač značajki
```bash title="" linenums="0"
# Opcionalne usluge
USE_APPLICATION_INSIGHTS         # Zadano: istina
USE_AZURE_AI_SEARCH_SERVICE      # Zadano: netočno
USE_CONTAINER_REGISTRY           # Zadano: istina

# Praćenje i traganje
ENABLE_AZURE_MONITOR_TRACING     # Zadano: netočno
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Zadano: netočno

# Konfiguracija pretraživanja
AZURE_AI_SEARCH_INDEX_NAME       # Naziv indeksa za pretraživanje
AZURE_SEARCH_SERVICE_NAME        # Naziv usluge pretraživanja
```

### 3.4 Konfiguracija AI projekta 
```bash title="" linenums="0"
# Koristi postojeće resurse
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Puni ID resursa postojećeg AI projekta
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL krajnje točke postojećeg projekta
```

### 3.5 Provjerite svoje varijable

Koristite Azure Developer CLI za pregled i upravljanje varijablama okoline:

```bash title="" linenums="0"
# Prikaz svih varijabli okoline za trenutnu okolinu
azd env get-values

# Dohvati određenu varijablu okoline
azd env get-value AZURE_ENV_NAME

# Postavi varijablu okoline
azd env set AZURE_LOCATION eastus

# Postavi više varijabli iz .env datoteke
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument preveden je korištenjem AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne odgovaramo za bilo kakve nesporazume ili pogrešna tumačenja proizašla iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->