# 4. Konfigurirajte predložak

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Razumjeti svrhu datoteke `azure.yaml`
    - [ ] Razumjeti strukturu datoteke `azure.yaml`
    - [ ] Razumjeti vrijednost `hooks` u životnom ciklusu azd-a
    - [ ] **Lab 4:** Istražiti i modificirati varijable okoline

---

!!! prompt "Čemu služi datoteka `azure.yaml`? Koristite okvir za kod i objasnite redak po redak"

      Datoteka `azure.yaml` je **konfiguracijska datoteka za Azure Developer CLI (azd)**. Definira kako vaša aplikacija treba biti implementirana u Azure, uključujući infrastrukturu, usluge, pogone za implementaciju i varijable okoline.

---

## 1. Svrha i funkcionalnost

Ova datoteka `azure.yaml` služi kao **plan implementacije** za AI agent aplikaciju koja:

1. **Provjerava okolinu** prije implementacije
2. **Postavlja Azure AI usluge** (AI Hub, AI Projekt, Search itd.)
3. **Implementira Python aplikaciju** u Azure Container Apps
4. **Konfigurira AI modele** za funkcionalnost chata i integracije (embedding)
5. **Postavlja nadzor i praćenje** za AI aplikaciju
6. **Rukuje i novim i postojećim** scenarijima Azure AI projekta

Datoteka omogućuje **implementaciju jednom naredbom** (`azd up`) kompletne AI agent rješenja s ispravnom provjerom, postavljanjem i konfiguracijom nakon implementacije.

??? info "Proširi za prikaz: `azure.yaml`"

      Datoteka `azure.yaml` definira kako Azure Developer CLI treba implementirati i upravljati ovom AI Agent aplikacijom u Azureu. Pogledajmo je redak po redak.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: trebamo li hooks? 
      # TODO: trebamo li sve varijable?

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

## 2. Rastavljanje datoteke

Prođimo kroz datoteku i objasnimo njen sadržaj i svrhu.

### 2.1 **Zaglavlje i shema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Redak 1**: Pruža shemu za YAML jezični poslužitelj radi validacije i IntelliSense potpore u IDE-u

### 2.2 Metapodaci projekta (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Redak 5**: Definira naziv projekta za Azure Developer CLI
- **Retci 6-7**: Navodi da je projekt baziran na predlošku verzije 1.0.2
- **Retci 8-9**: Zahtijeva minimalnu verziju Azure Developer CLI 1.14.0 ili više

### 2.3 Hookovi za implementaciju (11-40)

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

- **Retci 11-20**: **Hook prije implementacije** - izvršava se prije `azd up`

      - Na Unix/Linux sustavima: Postavlja valjane dozvole i pokreće skriptu za validaciju
      - Na Windowsu: Pokreće PowerShell skriptu za validaciju
      - Oba su interaktivna i zaustavljaju implementaciju ako ne uspiju

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
- **Retci 21-30**: **Hook poslije provisioning-a** - izvršava se nakon što su Azure resursi kreirani

  - Izvršava skripte za pisanje varijabli okoline
  - Nastavlja s implementacijom čak i ako skripte ne uspiju (`continueOnError: true`)

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
- **Retci 31-40**: **Hook poslije implementacije** - izvršava se nakon deploy aplikacije

  - Izvršava završne skripte konfiguracije
  - Nastavlja čak i ako skripte ne uspiju

### 2.4 Konfiguracija usluge (41-48)

Ovdje se konfigurira aplikacijska usluga koju implementirate.

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
- **Redak 43**: Usmjerava na direktorij `./src` koji sadrži izvorni kod
- **Redak 44**: Navodi Python kao programski jezik
- **Redak 45**: Koristi Azure Container Apps kao platformu za hostanje
- **Retci 46-48**: Konfiguracija Dockera

      - Koristi ime slike "api_and_frontend"
      - Slika se gradi na daljinu u Azureu (ne lokalno)

### 2.5 Varijable pipeline-a (49-76)

Ove varijable pomažu u izvođenju `azd` u CI/CD pipelines za automatizaciju

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

Ovaj dio definira varijable okoline koje se koriste **tijekom implementacije**, organizirane po kategorijama:

- **Nazivi Azure resursa (Retci 51-60)**:
      - Nazivi ključnih Azure usluga poput Resource Group, AI Hub, AI Projekt, itd.
- **Prekidači značajki (Retci 61-63)**:
      - Boolean varijable za uključivanje/isključivanje određenih Azure usluga
- **Konfiguracija AI agenta (Retci 64-71)**:
      - Postavke za glavnog AI agenta uključujući ime, ID, postavke implementacije, detalje modela
- **Konfiguracija AI integracije (Embedding) (Retci 72-79)**:
      - Postavke za embedding model koji se koristi za vektorsku pretragu
- **Pretraživanje i nadzor (Retci 80-84)**:
      - Naziv indeksa pretraživanja, postojeći ID-ovi resursa i postavke nadzora/praćenja

---

## 3. Upoznajte varijable okoline
Sljedeće varijable okoline upravljaju konfiguracijom i ponašanjem vaše implementacije, organizirane po glavnoj svrsi. Većina varijabli ima smislene zadane vrijednosti, ali ih možete prilagoditi kako bi odgovarale vašim specifičnim zahtjevima ili postojećim Azure resursima.

### 3.1 Obavezne varijable 

```bash title="" linenums="0"
# Osnovna Azure konfiguracija
AZURE_ENV_NAME                    # Naziv okoline (koristi se u imenovanju resursa)
AZURE_LOCATION                    # Regija za implementaciju
AZURE_SUBSCRIPTION_ID             # Cilj pretplate
AZURE_RESOURCE_GROUP              # Naziv grupe resursa
AZURE_PRINCIPAL_ID                # Korisnički glavni za RBAC

# Nazivi resursa (automatski generirani ako nisu navedeni)
AZURE_AIHUB_NAME                  # Naziv Microsoft Foundry centra
AZURE_AIPROJECT_NAME              # Naziv AI projekta
AZURE_AISERVICES_NAME             # Naziv računa za AI usluge
AZURE_STORAGE_ACCOUNT_NAME        # Naziv računa za pohranu
AZURE_CONTAINER_REGISTRY_NAME     # Naziv registra kontejnera
AZURE_KEYVAULT_NAME               # Naziv Key Vaulta (ako se koristi)
```

### 3.2 Konfiguracija modela 
```bash title="" linenums="0"
# Konfiguracija chat modela
AZURE_AI_AGENT_MODEL_NAME         # Zadano: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Zadano: OpenAI (ili Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Zadano: najnovije dostupno
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Ime implementacije za chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Zadano: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Zadano: 80 (tisuća TPM)

# Konfiguracija modela ugradnje
AZURE_AI_EMBED_MODEL_NAME         # Zadano: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Zadano: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Zadano: najnovije dostupno
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Ime implementacije za ugradnje
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Zadano: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Zadano: 50 (tisuća TPM)

# Konfiguracija agenta
AZURE_AI_AGENT_NAME               # Prikazano ime agenta
AZURE_EXISTING_AGENT_ID           # Koristi postojećeg agenta (opcionalno)
```

### 3.3 Prekidač značajki
```bash title="" linenums="0"
# Opcionalne usluge
USE_APPLICATION_INSIGHTS         # Zadano: istina
USE_AZURE_AI_SEARCH_SERVICE      # Zadano: netočno
USE_CONTAINER_REGISTRY           # Zadano: istina

# Nadzor i praćenje
ENABLE_AZURE_MONITOR_TRACING     # Zadano: netočno
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Zadano: netočno

# Konfiguracija pretraživanja
AZURE_AI_SEARCH_INDEX_NAME       # Naziv indeksa pretraživanja
AZURE_SEARCH_SERVICE_NAME        # Naziv usluge pretraživanja
```

### 3.4 Konfiguracija AI projekta 
```bash title="" linenums="0"
# Koristite postojeće resurse
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Puni ID resursa postojećeg AI projekta
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL krajnje točke postojećeg projekta
```

### 3.5 Provjerite svoje varijable

Koristite Azure Developer CLI za pregled i upravljanje svojim varijablama okoline:

```bash title="" linenums="0"
# Prikaži sve varijable okoline za trenutno okruženje
azd env get-values

# Dohvati specifičnu varijablu okoline
azd env get-value AZURE_ENV_NAME

# Postavi varijablu okoline
azd env set AZURE_LOCATION eastus

# Postavi više varijabli iz .env datoteke
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->