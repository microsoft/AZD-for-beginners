# 3. Changanua Kiolezo

!!! tip "MWISHO WA MODULI HII UTAWEZA"

    - [ ] Amsha GitHub Copilot kwa seva za MCP kwa msaada wa Azure
    - [ ] Elewa muundo wa folda ya kiolezo cha AZD na vipengele vyake
    - [ ] Chunguza mifumo ya kupanga miundombinu-kama-msimbo (Bicep)
    - [ ] **Klabu 3:** Tumia GitHub Copilot kuchunguza na kuelewa usanifu wa repozitori

---


Kwa kiolezo za AZD na Azure Developer CLI (`azd`) tunaweza kuanzisha kwa haraka safari yetu ya maendeleo ya AI kwa repozitori za kawaida zinazotoa mifano ya msimbo, miundombinu na faili za usanidi - kwa fomu ya mradi wa _starter_ tayari-kuwekewa.

**Lakini sasa, tunahitaji kuelewa muundo wa mradi na msimbo wa msingi - na kuwa na uwezo wa kubadilisha kiolezo cha AZD - bila uzoefu au uelewa wa AZD hapo awali!**

---

## 1. Amsha GitHub Copilot

### 1.1 Sakinisha GitHub Copilot Chat

Ni wakati wa kuchunguza [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Sasa, tunaweza kutumia lugha ya asili kuelezea kazi yetu kwa kiwango cha juu, na kupata msaada katika utekelezaji. Kwa maabara hii, tutatumia [Copilot Free plan](https://github.com/github-copilot/signup) ambayo ina kikomo cha kila mwezi kwa ukamilishaji na mwingiliano wa mazungumzo.

Upanuzi unaweza kusakinishwa kutoka kwenye marketplace, lakini inapaswa tayari kupatikana katika mazingira yako ya Codespaces. _Bonyeza `Open Chat` kutoka kwenye menyu ya ikoni ya Copilot - na andika ombi kama `What can you do?`_ - unaweza kuombwa kuingia. **GitHub Copilot Chat iko tayari**.

### 1.2. Sakinisha seva za MCP

Ili Agent mode iwe na ufanisi, inahitaji upatikanaji wa zana sahihi zitakazomsaidia kupata maarifa au kuchukua hatua. Hapa ndipo seva za MCP zinapoweza kusaidia. Tutasanidi seva zifuatazo:

1. [Seva ya MCP ya Azure](../../../../../workshop/docs/instructions)
1. [Seva ya MCP ya Microsoft Docs](../../../../../workshop/docs/instructions)

Ili kuamsha hizi:

1. Tengeneza faili iitwayo `.vscode/mcp.json` ikiwa haipo
1. Nakili yafuatayo ndani ya faili hiyo - na anzisha seva!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "Unaweza kupata kosa kwamba `npx` haijasakinishwa (bonyeza kupanua kwa suluhisho)"

      Ili kurekebisha hili, fungua faili `.devcontainer/devcontainer.json` na ongeza mstari huu sehemu ya features. Kisha jenga upya kontena. Sasa unapaswa kuwa na `npx` imewekwa.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Jaribu GitHub Copilot Chat

**Kwanza tumia `az login` kujiandikisha na Azure kutoka kwenye mstari wa amri wa VS Code.**

Unapaswa sasa kuwa unaweza kuuliza hali ya usajili wako wa Azure, na kuuliza maswali kuhusu rasilimali zilizowekwa au usanidi. Jaribu maombi haya:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Unaweza pia kuuliza maswali kuhusu nyaraka za Azure na kupata majibu yamehimizwa kwa seva ya Microsoft Docs MCP. Jaribu maombi haya:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Au unaweza kuomba nukuu za msimbo kukamilisha kazi. Jaribu ombi hili.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Katika mode ya `Ask`, hii itatoa msimbo ambao unaweza kunakili-kubandika na kujaribu. Katika mode ya `Agent`, hii inaweza kwenda hatua zaidi na kuunda rasilimali zinazohusiana - ikiwa ni pamoja na skripti za usanidi na nyaraka - kukusaidia kutekeleza kazi hiyo.

**Sasa umeandaliwa kuanza kuchunguza repozitori ya kiolezo**

---

## 2. Changanua Usanifu

??? prompt "ULIZA: Elezea usanifu wa programu katika docs/images/architecture.png kwa aya 1"

      Programu hii ni programu ya mazungumzo iliyopangwa na AI iliyojengwa kwenye Azure ambayo inaonyesha usanifu wa kisasa unaotegemea mawakala. Suluhisho linaizunguka Azure Container App inayohifadhi msimbo mkuu wa programu, ambao unasindika pembejeo za watumiaji na kutengeneza majibu ya busara kupitia wakala wa AI. 
      
      Usanifu hutumia Microsoft Foundry Project kama msingi wa uwezo wa AI, ukiunganishwa na Azure AI Services zinazoleta mifano ya lugha ya msingi (kama GPT-4o-mini) na utendaji wa wakala. Mwingiliano wa watumiaji hupitia frontend inayotegemea React hadi backend ya FastAPI inayowasiliana na huduma ya wakala wa AI kutengeneza majibu yenye muktadha. 
      
      Mfumo una uwezo wa kupata maarifa kupitia kutafuta faili au huduma ya Azure AI Search, ikimruhusu wakala kupata na kunukuu taarifa kutoka kwa nyaraka zilizopakiwa. Kwa ubora wa uendeshaji, usanifu unajumuisha ufuatiliaji wa kina kupitia Application Insights na Log Analytics Workspace kwa kufuatilia, kurekodi, na kuboresha utendaji. 
      
      Azure Storage hutoa uhifadhi wa blob kwa data za programu na upakiaji wa faili, wakati Managed Identity inahakikisha ufikiaji salama kati ya rasilimali za Azure bila kuhifadhi cheti za kuingia. Suluhisho zima limeundwa kwa ajili ya upanuaji na urahisishaji wa matengenezo, ambapo programu iliyokonteneriwa inapanuka kiotomatiki kulingana na mahitaji sambamba na kutoa usalama uliojengwa, ufuatiliaji, na uwezo wa CI/CD kupitia mazingira ya huduma zilizosimamiwa za Azure.

![Usanifu](../../../../../translated_images/sw/architecture.48d94861e6e6cdc0.webp)

---

## 3. Muundo wa Repozitori

!!! prompt "ULIZA: Elezea muundo wa folda ya kiolezo. Anza na mchoro wa muundo wa mfuatano."

??? info "JIBU: Mchoro wa Kimfumo"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI configuration
      │   ├── docker-compose.yaml           # Local development containers
      │   ├── pyproject.toml                # Python project configuration
      │   ├── requirements-dev.txt          # Development dependencies
      │   └── .devcontainer/                # VS Code dev container setup
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Main infrastructure template
      │   ├── api.bicep                     # API-specific resources
      │   ├── main.parameters.json          # Infrastructure parameters
      │   └── core/                         # Modular infrastructure components
      │       ├── ai/                       # AI service configurations
      │       ├── host/                     # Hosting infrastructure
      │       ├── monitor/                  # Monitoring and logging
      │       ├── search/                   # Azure AI Search setup
      │       ├── security/                 # Security and identity
      │       └── storage/                  # Storage account configs
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI application entry
      │   │   ├── routes.py                 # API route definitions
      │   │   ├── search_index_manager.py   # Search functionality
      │   │   ├── data/                     # API data handling
      │   │   ├── static/                   # Static web assets
      │   │   └── templates/                # HTML templates
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js dependencies
      │   │   ├── vite.config.ts            # Vite build configuration
      │   │   └── src/                      # Frontend source code
      │   ├── data/                         # Sample data files
      │   │   └── embeddings.csv            # Pre-computed embeddings
      │   ├── files/                        # Knowledge base files
      │   │   ├── customer_info_*.json      # Customer data samples
      │   │   └── product_info_*.md         # Product documentation
      │   ├── Dockerfile                    # Container configuration
      │   └── requirements.txt              # Python dependencies
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-deployment setup
      │   ├── setup_credential.sh/.ps1     # Credential configuration
      │   ├── validate_env_vars.sh/.ps1    # Environment validation
      │   └── resolve_model_quota.sh/.ps1  # Model quota management
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Unit and integration tests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent evaluation framework
      │   │   ├── evaluate.py               # Evaluation runner
      │   │   ├── eval-queries.json         # Test queries
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Development playground
      │   │   ├── 1-quickstart.py           # Getting started examples
      │   │   └── aad-interactive-chat.py   # Authentication examples
      │   └── airedteaming/                 # AI safety evaluation
      │       └── ai_redteaming.py          # Red team testing
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Deployment guide
      │   ├── local_development.md          # Local setup instructions
      │   ├── troubleshooting.md            # Common issues & fixes
      │   ├── azure_account_setup.md        # Azure prerequisites
      │   └── images/                       # Documentation assets
      │
      └── 📄 Project Metadata
         ├── README.md                     # Project overview
         ├── CODE_OF_CONDUCT.md           # Community guidelines
         ├── CONTRIBUTING.md              # Contribution guide
         ├── LICENSE                      # License terms
         └── next-steps.md                # Post-deployment guidance
      ```

### 3.1. Muundo wa Msingi wa Programu

Kiolezo hiki kinafuata mtindo wa **programu ya wavuti ya full-stack** yenye:

- **Backend**: Python FastAPI yenye uunganisho wa Azure AI
- **Frontend**: TypeScript/React na mfumo wa kujenga Vite
- **Infrastructure**: Azure Bicep templates kwa rasilimali za wingu
- **Containerization**: Docker kwa uenezaji wa kuaminika

### 3.2 Miundombinu Kama Msimbo (Bicep)

Tabaka la miundombinu linatumia kiolezo za **Azure Bicep** zilizopangwa kwa moduli:

   - **`main.bicep`**: Inayosimamia rasilimali zote za Azure
   - **`core/` moduli**: Vipengele vinavyoweza kutumika tena kwa huduma tofauti
      - Huduma za AI (Azure OpenAI, AI Search)
      - Ukaribishaji wa kontena (Azure Container Apps)
      - Ufuatiliaji (Application Insights, Log Analytics)
      - Usalama (Key Vault, Managed Identity)

### 3.3 Chanzo cha Programu (`src/`)

**Backend API (`src/api/`)**:

- REST API inayotegemea FastAPI
- Uunganisho wa Foundry Agents
- Usimamizi wa faharasa ya utafutaji kwa ajili ya kupata maarifa
- Uwezo wa upakiaji na usindikaji wa faili

**Frontend (`src/frontend/`)**:

- SPA ya kisasa ya React/TypeScript
- Vite kwa maendeleo ya haraka na kujenga zilizo bora
- Kiolesura cha mazungumzo kwa mwingiliano wa wakala

**Hifadhidata ya Maarifa (`src/files/`)**:

- Mifano ya data za wateja na bidhaa
- Inaonyesha kupata maarifa kwa kutumia faili
- Mifano ya muundo wa JSON na Markdown


### 3.4 DevOps & Uendeshaji Otomatiki

**Skiripti (`scripts/`)**:

- Skripti za PowerShell na Bash zinazofanya kazi kwenye majukwaa mbalimbali
- Uthibitisho wa mazingira na usanidi
- Usanidi baada ya uenezwaji
- Usimamizi wa kikomo cha modeli

**Muunganisho wa Azure Developer CLI**:

- `azure.yaml` usanidi kwa workflows za `azd`
- Utoaji na uenezwaji wa otomatiki
- Usimamizi wa vigezo vya mazingira

### 3.5 Upimaji & Uhakikisho wa Ubora

**Mfumo wa Tathmini (`evals/`)**:

- Tathmini ya utendaji wa wakala
- Upimaji wa ubora wa maswali-majibu
- Mlolongo wa tathmini wa otomatiki

**Usalama wa AI (`airedteaming/`)**:

- Upimaji wa red team kwa usalama wa AI
- Skanning ya udhaifu wa usalama
- Maadili ya AI yanayowajibika

---

## 4. Hongera 🏆

Umefanikiwa kutumia GitHub Copilot Chat na seva za MCP, kuchunguza repozitori.

- [X] Umeamsha GitHub Copilot kwa Azure
- [X] Umeelewa Usanifu wa Programu
- [X] Umechunguza muundo wa kiolezo cha AZD

Hii inakupa taswira ya mali za _infrastructure as code_ za kiolezo hiki. Ifuatayo, tutaangalia faili ya usanidi ya AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwa na dhamana:
Waraka huu umetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokamilika. Waraka asili katika lugha yake ya asili unapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya mtaalamu wa kibinadamu. Hatuwezi kuwajibika kwa uelewa au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->