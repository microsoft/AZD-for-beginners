# 4. Määritä malli

!!! tip "TÄMÄN MODUULIN LOPPUUN MENNESSÄ OSAAT"

    - [ ] Ymmärtää `azure.yaml`-tiedoston tarkoituksen
    - [ ] Ymmärtää `azure.yaml`-tiedoston rakenne
    - [ ] Ymmärtää azd-elinkaaren `hooks` merkityksen
    - [ ] **Lab 4:** Tutki ja muokkaa ympäristömuuttujia

---

!!! prompt "Mitä `azure.yaml`-tiedosto tekee? Käytä koodilohkoa ja selitä se rivi riviltä"

      `azure.yaml`-tiedosto on **Azure Developer CLI:n (azd) määritystiedosto**. Se määrittelee, miten sovelluksesi tulisi ottaa käyttöön Azureen, mukaan lukien infrastruktuuri, palvelut, käyttöönoton hookit ja ympäristömuuttujat.

---

## 1. Tarkoitus ja toiminnallisuus

Tämä `azure.yaml`-tiedosto toimii **käyttöönoton suunnitelmapohjana** AI-agenttisovellukselle, joka:

1. **Varmistaa ympäristön** ennen käyttöönottoa
2. **Ottaa käyttöön Azure AI -palvelut** (AI Hub, AI Project, Search, jne.)
3. **Ottaa käyttöön Python-sovelluksen** Azure Container Appsiin
4. **Määrittää AI-mallit** sekä chat- että upotuskäyttöä varten
5. **Ottaa käyttöön valvonnan ja jäljityksen** AI-sovellukselle
6. **Käsittelee sekä uusia että olemassa olevia** Azure AI -projektitilanteita

Tiedosto mahdollistaa **yhden komennon käyttöönoton** (`azd up`) täydelliselle AI-agenttiratkaisulle asianmukaisella tarkistuksella, provisioinnilla ja käyttöönoton jälkeisellä konfiguroinnilla.

??? info "Laajenna nähdäksesi: `azure.yaml`"

      `azure.yaml`-tiedosto määrittelee, miten Azure Developer CLI ottaa käyttöön ja hallinnoi tätä AI-agenttisovellusta Azureen. Käydään se läpi rivi riviltä.

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

Käydään tiedosto läpi osio kerrallaan, jotta ymmärrämme, mitä se tekee ja miksi.

### 2.1 **Otsikko ja skeema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Rivi 1**: Tarjoaa YAML-kielipalvelimen skeeman validoinnin IDE-tukea ja IntelliSenseä varten

### 2.2 Projektin metatiedot (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Rivi 5**: Määrittelee projektin nimen, jota Azure Developer CLI käyttää
- **Rivit 6-7**: Määrää, että tämä perustuu malliin versiolla 1.0.2
- **Rivit 8-9**: Vaatii Azure Developer CLI -version 1.14.0 tai uudemman

### 2.3 Käyttöönoton hookit (11-40)

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

- **Rivit 11-20**: **Ennen käyttöönottoa suoritettava hook** - suoritetaan ennen `azd up`

      - Unix/Linuxissa: Tekee validointiskriptistä suoritettavan ja suorittaa sen
      - Windowsissa: Suorittaa PowerShell-validointiskriptin
      - Molemmat ovat interaktiivisia ja keskeyttävät käyttöönoton, jos ne epäonnistuvat

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
- **Rivit 21-30**: **Provisionin jälkeinen hook** - suoritetaan sen jälkeen, kun Azure-resurssit on luotu

  - Suorittaa ympäristömuuttujia kirjoittavat skriptit
  - Jatkaa käyttöönottoa, vaikka nämä skriptit epäonnistuisivat (`continueOnError: true`)

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
- **Rivit 31-40**: **Käyttöönoton jälkeinen hook** - suoritetaan sovelluksen käyttöönoton jälkeen

  - Suorittaa lopulliset asetusskriptit
  - Jatkaa vaikka skriptit epäonnistuisivat

### 2.4 Palvelun asetukset (41-48)

Tämä määrittää sen sovelluspalvelun, jonka otat käyttöön.

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
- **Rivi 43**: Viittaa lähdekoodin hakemistoon `./src`
- **Rivi 44**: Määrittää Pythonin ohjelmointikieleksi
- **Rivi 45**: Käyttää Azure Container Appsia isännöintialustana
- **Rivit 46-48**: Dockerin konfigurointi

      - Käyttää "api_and_frontend" kuvanimenä
      - Rakentaa Docker-kuvan etänä Azurella (ei paikallisesti)

### 2.5 Putken muuttujat (49-76)

Nämä muuttujat auttavat ajamaan `azd`:ää CI/CD-putkissa automaatiota varten

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

Tämä osio määrittelee käyttöönoton aikana käytettävät ympäristömuuttujat, järjestettyinä kategorioittain:

- **Azure-resurssien nimet (Rivit 51-60)**:
      - Keskeiset Azure-palvelujen resurssinimet, esim. Resource Group, AI Hub, AI Project, jne.- 
- **Ominaisuuskytkimet (Rivit 61-63)**:
      - Totuusarvoiset muuttujat, jotka ottavat käytölle tai pois käytöstä tietyt Azure-palvelut
- **AI-agentin asetukset (Rivit 64-71)**:
      - Kokoonpano pää-AI-agentille mukaan lukien nimi, ID, käyttöönottoasetukset, mallin tiedot- 
- **AI-upotusasetukset (Rivit 72-79)**:
      - Kokoonpano upotusmallille, jota käytetään vektorihakua varten
- **Haku ja valvonta (Rivit 80-84)**:
      - Hakemiston nimi, olemassa olevien resurssien ID:t ja valvonta-/jäljitysasetus­tiedot

---

## 3. Tunne ympäristömuuttujat
Seuraavat ympäristömuuttujat ohjaavat käyttöönoton asetuksia ja käyttäytymistä, järjestetty pääasiallisen tarkoituksensa mukaan. Useimmilla muuttujilla on järkevät oletusarvot, mutta voit mukauttaa niitä vastaamaan omia vaatimuksiasi tai olemassa olevia Azure-resursseja.

### 3.1 Pakolliset muuttujat 

```bash title="" linenums="0"
# Azure-perusmääritykset
AZURE_ENV_NAME                    # Ympäristön nimi (käytetään resurssien nimeämisessä)
AZURE_LOCATION                    # Käyttöönottoalue
AZURE_SUBSCRIPTION_ID             # Kohdetilaus
AZURE_RESOURCE_GROUP              # Resurssiryhmän nimi
AZURE_PRINCIPAL_ID                # Käyttäjäpäämies RBAC:ia varten

# Resurssien nimet (luodaan automaattisesti, jos ei määritetty)
AZURE_AIHUB_NAME                  # Microsoft Foundry -hubin nimi
AZURE_AIPROJECT_NAME              # Tekoälyprojektin nimi
AZURE_AISERVICES_NAME             # AI-palvelutilin nimi
AZURE_STORAGE_ACCOUNT_NAME        # Tallennustilin nimi
AZURE_CONTAINER_REGISTRY_NAME     # Säiliörekisterin nimi
AZURE_KEYVAULT_NAME               # Key Vaultin nimi (jos käytössä)
```

### 3.2 Mallin asetukset 
```bash title="" linenums="0"
# Chat-mallin asetukset
AZURE_AI_AGENT_MODEL_NAME         # Oletus: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Oletus: OpenAI (tai Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Oletus: uusin saatavilla oleva
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Chat-mallin käyttöönoton nimi
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Oletus: Vakio
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Oletus: 80 (tuhansia TPM)

# Upotusmallin asetukset
AZURE_AI_EMBED_MODEL_NAME         # Oletus: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Oletus: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Oletus: uusin saatavilla oleva
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Upotusmallin käyttöönoton nimi
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Oletus: Vakio
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Oletus: 50 (tuhansia TPM)

# Agentin asetukset
AZURE_AI_AGENT_NAME               # Agentin näytettävä nimi
AZURE_EXISTING_AGENT_ID           # Käytä olemassa olevaa agenttia (valinnainen)
```

### 3.3 Ominaisuuksien kytkin
```bash title="" linenums="0"
# Valinnaiset palvelut
USE_APPLICATION_INSIGHTS         # Oletusarvo: true
USE_AZURE_AI_SEARCH_SERVICE      # Oletusarvo: false
USE_CONTAINER_REGISTRY           # Oletusarvo: true

# Seuranta ja jäljitys
ENABLE_AZURE_MONITOR_TRACING     # Oletusarvo: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Oletusarvo: false

# Hakuasetukset
AZURE_AI_SEARCH_INDEX_NAME       # Haun indeksin nimi
AZURE_SEARCH_SERVICE_NAME        # Hakupalvelun nimi
```

### 3.4 AI-projektin asetukset 
```bash title="" linenums="0"
# Käytä olemassa olevia resursseja
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Olemassa olevan tekoälyprojektin täydellinen resurssitunnus
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Olemassa olevan projektin päätepisteen URL-osoite
```

### 3.5 Tarkista muuttujasi

Käytä Azure Developer CLI:tä katsellaksesi ja hallitaksesi ympäristömuuttujiasi:

```bash title="" linenums="0"
# Näytä kaikki nykyisen ympäristön ympäristömuuttujat
azd env get-values

# Hae tietty ympäristömuuttuja
azd env get-value AZURE_ENV_NAME

# Aseta ympäristömuuttuja
azd env set AZURE_LOCATION eastus

# Aseta useita muuttujia .env-tiedostosta
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomaathan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulee pitää auktoritatiivisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskääntäjää. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinkäsityksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->