# 4. Configurează un Șablon

!!! tip "LA SFÂRȘITUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Înțelegi scopul fișierului `azure.yaml`
    - [ ] Înțelegi structura fișierului `azure.yaml`
    - [ ] Înțelegi valoarea hook-urilor din ciclul de viață azd
    - [ ] **Laborator 4:** Explorează și modifică variabilele de mediu

---

!!! prompt "Ce face fișierul `azure.yaml`? Folosește un cod și explică rând cu rând"

      Fișierul `azure.yaml` este **fișierul de configurare pentru Azure Developer CLI (azd)**. El definește cum trebuie să fie implementată aplicația ta în Azure, inclusiv infrastructura, serviciile, hook-urile de implementare și variabilele de mediu.

---

## 1. Scop și Funcționalitate

Acest fișier `azure.yaml` servește ca **plan de implementare** pentru o aplicație agent AI care:

1. **Validează mediul** înainte de implementare
2. **Provisionează servicii Azure AI** (AI Hub, Proiect AI, Căutare etc.)
3. **Implementează o aplicație Python** în Azure Container Apps
4. **Configurează modelele AI** pentru funcționalități de chat și embedding
5. **Configurează monitorizarea și urmărirea** pentru aplicația AI
6. **Gestionează atât scenarii noi, cât și existente** de proiect AI în Azure

Fișierul permite implementarea completă a unei soluții agent AI cu o singură comandă (`azd up`), cu validare adecvată, provisioning și configurare post-implementare.

??? info "Extinde pentru vizualizare: `azure.yaml`"

      Fișierul `azure.yaml` definește modul în care Azure Developer CLI ar trebui să implementeze și să gestioneze această aplicație Agent AI în Azure. Să îl desfășurăm rând cu rând.

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

## 2. Dezasamblarea Fișierului

Hai să parcurgem fișierul secțiune cu secțiune, pentru a înțelege ce face și de ce.

### 2.1 **Antet și Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Rândul 1**: Oferă validare schema YAML pentru suport IDE și IntelliSense

### 2.2 Metadate Proiect (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Rândul 5**: Definește numele proiectului folosit de Azure Developer CLI
- **Rândurile 6-7**: Specifică că este bazat pe un șablon versiunea 1.0.2
- **Rândurile 8-9**: Necesită versiunea 1.14.0 sau mai mare a Azure Developer CLI

### 2.3 Hook-uri de implementare (11-40)

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

- **Rândurile 11-20**: **Hook pre-implementare** - rulează înainte de `azd up`

      - Pe Unix/Linux: Face scriptul de validare executabil și îl rulează
      - Pe Windows: Rulează scriptul PowerShell de validare
      - Ambele sunt interactive și opresc implementarea dacă eșuează

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
- **Rândurile 21-30**: **Hook post-provisionare** - rulează după ce resursele Azure sunt create

  - Execută scripturile de scriere a variabilelor de mediu
  - Continuă implementarea chiar dacă aceste scripturi eșuează (`continueOnError: true`)

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
- **Rândurile 31-40**: **Hook post-implementare** - rulează după implementarea aplicației

  - Execută scripturile finale de configurare
  - Continuă chiar dacă scripturile eșuează

### 2.4 Configurație serviciu (41-48)

Aceasta configurează serviciul aplicației pe care îl implementezi.

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

- **Rândul 42**: Definește un serviciu numit "api_and_frontend"
- **Rândul 43**: Indică directorul `./src` pentru codul sursă
- **Rândul 44**: Specifică Python ca limbaj de programare
- **Rândul 45**: Folosește Azure Container Apps ca platformă de hosting
- **Rândurile 46-48**: Configurație Docker

      - Folosește "api_and_frontend" ca nume de imagine
      - Construiește imaginea Docker remote în Azure (nu local)

### 2.5 Variabile Pipeline (49-76)

Acestea sunt variabile care te ajută să rulezi `azd` în pipeline-uri CI/CD pentru automatizare

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

Această secțiune definește variabilele de mediu folosite **în timpul implementării**, organizate pe categorii:

- **Nume Resurse Azure (Rândurile 51-60)**:
      - Nume importante pentru resurse Azure, ex: Grup de Resurse, AI Hub, Proiect AI etc.
- **Flag-uri Funcționalitate (Rândurile 61-63)**:
      - Variabile booleene pentru activare/dezactivare servicii specifice Azure
- **Configurare Agent AI (Rândurile 64-71)**:
      - Configurarea agentului AI principal inclusiv nume, ID, setări de implementare, detalii modele
- **Configurare Embedding AI (Rândurile 72-79)**:
      - Configurarea modelului embedding folosit pentru căutarea vectorială
- **Căutare și Monitorizare (Rândurile 80-84)**:
      - Numele indexului de căutare, ID-uri pentru resurse existente și setări de monitorizare/urmărire

---

## 3. Cunoaște Variabilele de Mediu
Următoarele variabile de mediu controlează configurația și comportamentul implementării tale, organizate după scopul principal. Majoritatea variabilelor au valori implicite rezonabile, dar le poți personaliza pentru a se potrivi cerințelor tale specifice sau resurselor Azure existente.

### 3.1 Variabile Obligatorii

```bash title="" linenums="0"
# Configurare Azure de bază
AZURE_ENV_NAME                    # Numele mediului (folosit la denumirea resurselor)
AZURE_LOCATION                    # Regiunea de implementare
AZURE_SUBSCRIPTION_ID             # Abonamentul țintă
AZURE_RESOURCE_GROUP              # Numele grupului de resurse
AZURE_PRINCIPAL_ID                # Utilizator principal pentru RBAC

# Numele resurselor (generate automat dacă nu sunt specificate)
AZURE_AIHUB_NAME                  # Numele hub-ului Microsoft Foundry
AZURE_AIPROJECT_NAME              # Numele proiectului AI
AZURE_AISERVICES_NAME             # Numele contului pentru serviciile AI
AZURE_STORAGE_ACCOUNT_NAME        # Numele contului de stocare
AZURE_CONTAINER_REGISTRY_NAME     # Numele registrului de containere
AZURE_KEYVAULT_NAME               # Numele Key Vault (dacă este folosit)
```

### 3.2 Configurare Model 

```bash title="" linenums="0"
# Configurarea modelului de chat
AZURE_AI_AGENT_MODEL_NAME         # Implicit: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Implicit: OpenAI (sau Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Implicit: cea mai recentă disponibilă
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Numele implementării pentru modelul de chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Implicit: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Implicit: 80 (mii de TPM)

# Configurarea modelului de încorporare
AZURE_AI_EMBED_MODEL_NAME         # Implicit: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Implicit: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Implicit: cea mai recentă disponibilă
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Numele implementării pentru încorporări
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Implicit: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Implicit: 50 (mii de TPM)

# Configurarea agentului
AZURE_AI_AGENT_NAME               # Numele de afișare al agentului
AZURE_EXISTING_AGENT_ID           # Folosește agentul existent (opțional)
```

### 3.3 Activare/Dezactivare Funcționalități

```bash title="" linenums="0"
# Servicii opționale
USE_APPLICATION_INSIGHTS         # Implicit: adevărat
USE_AZURE_AI_SEARCH_SERVICE      # Implicit: fals
USE_CONTAINER_REGISTRY           # Implicit: adevărat

# Monitorizare și trasare
ENABLE_AZURE_MONITOR_TRACING     # Implicit: fals
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Implicit: fals

# Configurare căutare
AZURE_AI_SEARCH_INDEX_NAME       # Numele indexului de căutare
AZURE_SEARCH_SERVICE_NAME        # Numele serviciului de căutare
```

### 3.4 Configurare Proiect AI 

```bash title="" linenums="0"
# Folosește resursele existente
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID-ul complet al resursei proiectului AI existent
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL-ul punctului final al proiectului existent
```

### 3.5 Verifică Variabilele Tale

Folosește Azure Developer CLI pentru a vizualiza și gestiona variabilele tale de mediu:

```bash title="" linenums="0"
# Vizualizați toate variabilele de mediu pentru mediul curent
azd env get-values

# Obțineți o variabilă de mediu specifică
azd env get-value AZURE_ENV_NAME

# Setați o variabilă de mediu
azd env set AZURE_LOCATION eastus

# Setați mai multe variabile dintr-un fișier .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă o traducere profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->