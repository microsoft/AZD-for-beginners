# 4. Määritä mallipohja

!!! tip "TÄMÄN MODUULIN LOPPUUN MENNESSÄ OSAAT"

    - [ ] Ymmärtää `azure.yaml`-tiedoston tarkoituksen
    - [ ] Ymmärtää `azure.yaml`-tiedoston rakenteen
    - [ ] Ymmärtää azd-elinkaaren `hooks`-kohdan merkityksen
    - [ ] **Lab 4:** Tutki ja muokkaa ympäristömuuttujia

---

!!! prompt "Mitä `azure.yaml`-tiedosto tekee? Käytä koodilohkoa ja selitä se rivi riviltä"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. Tarkoitus ja toiminnallisuus

Tämä `azure.yaml`-tiedosto toimii **julkaisusuunnitelmana** AI-agenttisovellukselle, joka:

1. **Varmistaa ympäristön** ennen julkaisua
2. **Provisioi Azure AI -palvelut** (AI Hub, AI Project, Search jne.)
3. **Julkaisee Python-sovelluksen** Azure Container Appsiin
4. **Määrittelee AI-mallit** sekä chat- että upotustoiminnallisuuksiin
5. **Asettaa valvonnan ja jäljityksen** AI-sovellukselle
6. **Käsittelee sekä uusia että olemassa olevia** Azure AI -projektitilanteita

Tiedosto mahdollistaa **yhdellä komennolla julkaisemisen** (`azd up`) täydelliselle AI-agenttiratkaisulle oikealla validoinnilla, provisioinnilla ja jälkiasetuksilla.

??? info "Laajenna nähdäksesi: `azure.yaml`"

      The `azure.yaml` file defines how Azure Developer CLI should deploy and manage this AI Agent application in Azure. Let's break it down line-by-line.

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

## 2. Tiedoston purkaminen

Käydään tiedosto läpi osa kerrallaan, jotta ymmärrät mitä kukin osa tekee ja miksi.

### 2.1 **Otsikko ja skeema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Rivi 1**: Tarjoaa YAML-kielen palvelimen skeeman validoinnin IDE-tukea ja IntelliSenseä varten

### 2.2 Projektin metatiedot (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Rivi 5**: Määrittelee projektin nimen, jota Azure Developer CLI käyttää
- **Rivit 6-7**: Ilmoittaa, että tämä perustuu mallipohjaan versiossa 1.0.2
- **Rivit 8-9**: Vaatimus Azure Developer CLI -versiolle 1.14.0 tai uudempi

### 2.3 Julkaisukoukut (11-40)

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

- **Rivit 11-20**: **Ennakkotarkistus (pre-deployment hook)** - suoritetaan ennen `azd up`

      - Unix/Linux: Tekee validointiskriptistä suoritettavan ja suorittaa sen
      - Windows: Suorittaa PowerShell-validointiskriptin
      - Molemmat ovat interaktiivisia ja keskeyttävät julkaisun, jos ne epäonnistuvat

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
- **Rivit 21-30**: **Post-provision-hook** - suoritetaan sen jälkeen, kun Azure-resurssit on luotu

  - Suorittaa ympäristömuuttujien kirjoitusskriptit
  - Jatkaa julkaisua, vaikka nämä skriptit epäonnistuisivat (`continueOnError: true`)

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
- **Rivit 31-40**: **Post-deploy-hook** - suoritetaan sovelluksen julkaisun jälkeen

  - Suorittaa lopulliset asennusskriptit
  - Jatkaa, vaikka skriptit epäonnistuisivat

### 2.4 Palvelukonfiguraatio (41-48)

Tämä määrittelee sovelluspalvelun, jonka julkaiset.

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

- **Rivi 42**: Määrittelee palvelun nimeltä "api_and_frontend"
- **Rivi 43**: Viittaa `./src`-kansioon lähdekoodia varten
- **Rivi 44**: Määrittää Pythonin ohjelmointikieleksi
- **Rivi 45**: Käyttää Azure Container Apps -isännöintiä
- **Rivit 46-48**: Docker-konfiguraatio

      - Käyttää "api_and_frontend" kuvannimeä
      - Rakentaa Docker-kuvan etänä Azuressä (ei paikallisesti)

### 2.5 Putkilinjan muuttujat (49-76)

Nämä ovat muuttujia, jotka auttavat sinua suorittamaan `azd`-komentoja CI/CD-putkissa automaatiota varten

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

Tämä osio määrittelee julkaisun aikana käytettävät ympäristömuuttujat, järjestettynä kategorioittain:

- **Azure-resurssien nimet (Rivit 51-60)**:
      - Perus Azure -palvelujen resurssien nimet, esim. Resource Group, AI Hub, AI Project jne.
- **Ominaisuuksien kytkimet (Rivit 61-63)**:
      - Boolean-tyyppiset muuttujat, joilla otetaan tietyt Azure-palvelut käyttöön tai pois päältä
- **AI-agentin konfiguraatio (Rivit 64-71)**:
      - Pää-AI-agentin asetusarvot, mukaan lukien nimi, ID, julkaisun asetukset ja mallin tiedot
- **AI-upotuskonfiguraatio (Rivit 72-79)**:
      - Upotusmallin konfiguraatio vektorihaulle
- **Haku ja valvonta (Rivit 80-84)**:
      - Hakemiston nimi, olemassa olevien resurssien ID:t ja valvonta/jäljitysasetukset

---

## 3. Tunne ympäristömuuttujat
Seuraavat ympäristömuuttujat ohjaavat julkaisusi konfiguraatiota ja käyttäytymistä, järjestetty pääasiallisen tarkoituksensa mukaan. Useimmilla muuttujilla on järkevät oletusarvot, mutta voit mukauttaa ne vastaamaan omia vaatimuksiasi tai olemassa olevia Azure-resursseja.

### 3.1 Pakolliset muuttujat 

```bash title="" linenums="0"
# Azurein peruskonfiguraatio
AZURE_ENV_NAME                    # Ympäristön nimi (käytetään resurssien nimeämisessä)
AZURE_LOCATION                    # Käyttöönottoalue
AZURE_SUBSCRIPTION_ID             # Kohdetilaus
AZURE_RESOURCE_GROUP              # Resurssiryhmän nimi
AZURE_PRINCIPAL_ID                # Käyttäjäprinsipaali RBAC:lle

# Resurssinimet (luodaan automaattisesti, jos ei määritetty)
AZURE_AIHUB_NAME                  # Microsoft Foundry -hubin nimi
AZURE_AIPROJECT_NAME              # Tekoälyprojektin nimi
AZURE_AISERVICES_NAME             # Tekoälypalvelutilin nimi
AZURE_STORAGE_ACCOUNT_NAME        # Tallennustilin nimi
AZURE_CONTAINER_REGISTRY_NAME     # Säilörekisterin nimi
AZURE_KEYVAULT_NAME               # Key Vaultin nimi (jos käytössä)
```

### 3.2 Mallin konfiguraatio 
```bash title="" linenums="0"
# Chat-mallin määritys
AZURE_AI_AGENT_MODEL_NAME         # Oletus: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Oletus: OpenAI (tai Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Oletus: uusin saatavilla oleva
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Chat-mallin käyttöönoton nimi
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Oletus: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Oletus: 80 (tuhansia TPM)

# Upotusmallin määritys
AZURE_AI_EMBED_MODEL_NAME         # Oletus: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Oletus: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Oletus: uusin saatavilla oleva
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Upotusmallin käyttöönoton nimi
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Oletus: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Oletus: 50 (tuhansia TPM)

# Agentin määritys
AZURE_AI_AGENT_NAME               # Agentin näyttönimi
AZURE_EXISTING_AGENT_ID           # Käytä olemassa olevaa agenttia (valinnainen)
```

### 3.3 Ominaisuuksien kytkin
```bash title="" linenums="0"
# Valinnaiset palvelut
USE_APPLICATION_INSIGHTS         # Oletus: true
USE_AZURE_AI_SEARCH_SERVICE      # Oletus: false
USE_CONTAINER_REGISTRY           # Oletus: true

# Seuranta ja jäljitys
ENABLE_AZURE_MONITOR_TRACING     # Oletus: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Oletus: false

# Hakuasetukset
AZURE_AI_SEARCH_INDEX_NAME       # Haun indeksin nimi
AZURE_SEARCH_SERVICE_NAME        # Haun palvelun nimi
```

### 3.4 AI-projektin konfiguraatio 
```bash title="" linenums="0"
# Käytä olemassa olevia resursseja
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Olemassa olevan tekoälyprojektin täydellinen resurssi-ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Olemassa olevan projektin päätepisteen URL-osoite
```

### 3.5 Tarkista muuttujasi

Käytä Azure Developer CLI:tä tarkastellaksesi ja hallitaksesi ympäristömuuttujiasi:

```bash title="" linenums="0"
# Näytä kaikki nykyisen ympäristön ympäristömuuttujat
azd env get-values

# Hae tietty ympäristömuuttuja
azd env get-value AZURE_ENV_NAME

# Aseta ympäristömuuttuja
azd env set AZURE_LOCATION eastus

# Aseta useita ympäristömuuttujia .env-tiedostosta
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla Co-op Translator (https://github.com/Azure/co-op-translator). Pyrimme tarkkuuteen, mutta huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää määräävänä lähteenä. Tärkeää tietoa varten suositellaan ammattimaista ihmiskääntäjän tekemää käännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->