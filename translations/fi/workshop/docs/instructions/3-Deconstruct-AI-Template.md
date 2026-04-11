# 3. Deconstruct a Template

!!! tip "TÄMÄN MODUULIN LOPPUUN MENNESSÄ OSAAT"

    - [ ] Activate GitHub Copilot with MCP servers for Azure assistance
    - [ ] Understand the AZD template folder structure and components
    - [ ] Explore infrastructure-as-code (Bicep) organization patterns
    - [ ] **Lab 3:** Käytä GitHub Copilotia tutkiaksesi ja ymmärtääksesi repositorion arkkitehtuuria 

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _starter_ project.

**But now, we need to understand the project structure and codebase - and be able to customize the AZD template - without any prior experience or understanding of AZD!**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

It's time to explore [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [Copilot Free plan](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

The extension can be installed from the marketplace, and it is often already available in Codespaces or dev container environments. _Click `Open Chat` from the Copilot icon drop-down - and type a prompt like `What can you do?`_ - you may be prompted to log in. **GitHub Copilot Chat is ready**.

### 1.2. Install MCP Servers

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

To activate these:

1. Create a file called `.vscode/mcp.json` if it does not exist
1. Copy the following into that file - and start the servers!
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

??? warning "Saatat saada virheilmoituksen, että `npx` ei ole asennettuna (laajenna nähdäksesi korjauksen)"

      Korjataksesi tämän, avaa `.devcontainer/devcontainer.json`-tiedosto ja lisää tämä rivi features-osioon. Rakenna sitten säiliö uudelleen. Sinulla pitäisi nyt olla `npx` asennettuna.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**First use `azd auth login` to authenticate with Azure from the VS Code command line. Use `az login` as well only if you plan to run Azure CLI commands directly.**

You should now be able to query your Azure subscription status, and ask questions about deployed resources or configuration. Try these prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

You can also ask questions about Azure documentation and get responses grounded in the Microsoft Docs MCP server. Try these prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Or you can ask for code snippets to complete a task. Try this prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

In `Ask` mode, this will provide code that you can copy-paste and try out. In `Agent` mode, this might go a step further and create the relevant resources for you - including setup scripts and documentation - to help you execute that task.

**You are now equipped to start exploring the template repository**

---

## 2. Deconstruct Architecture

??? prompt "KYSYMYS: Selitä sovelluksen arkkitehtuuri tiedostossa docs/images/architecture.png yhdellä kappaleella"

      Tämä sovellus on Azureen rakennettu tekoälyllä tehostettu chat-sovellus, joka havainnollistaa modernia agenttipohjaista arkkitehtuuria. Ratkaisun keskiössä on Azure Container App, joka isännöi pääsovelluskoodia; se käsittelee käyttäjän syötteitä ja tuottaa älykkäitä vastauksia tekoälyagentin avulla. 
      
      Arkkitehtuuri hyödyntää Microsoft Foundry Projectia tekoälykyvykkyyksien perustana ja yhdistää Azure AI Services -palveluihin, jotka tarjoavat taustalla olevat kielimallit (kuten gpt-4.1-mini) ja agenttitoiminnot. Käyttäjän vuorovaikutus kulkee React-pohjaisesta käyttöliittymästä FastAPI-backendiin, joka kommunikoi tekoälyagenttipalvelun kanssa tuottaakseen kontekstuaalisia vastauksia. 
      
      Järjestelmä sisältää tiedonhakutoiminnallisuuksia joko tiedostohakuina tai Azure AI Search -palvelun kautta, jolloin agentti voi käyttää ja viitata ladattuihin dokumentteihin. Operatiivisen erinomaisuuden vuoksi arkkitehtuuriin kuuluu kattava monitorointi Application Insightsin ja Log Analytics Workspacen kautta seurantaa, lokitusta ja suorituskyvyn optimointia varten. 
      
      Azure Storage tarjoaa blob-tallennustilan sovellustiedoille ja tiedostolatauksille, ja Managed Identity varmistaa turvallisen pääsyn Azure-resurssien välillä ilman salasanojen tallentamista. Koko ratkaisu on suunniteltu skaalautuvaksi ja ylläpidettäväksi, ja kontitettua sovellusta skaalaataan automaattisesti kysynnän mukaan tarjoten samalla sisäänrakennetun tietoturvan, monitoroinnin ja CI/CD-ominaisuudet Azuren hallitun palveluympäristön kautta.

![Arkkitehtuuri](../../../../../translated_images/fi/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository Structure

!!! prompt "KYSYMYS: Selitä mallihakemiston rakenne. Aloita visuaalisella hierarkkisella kaaviolla."

??? info "VASTAUS: Visuaalinen hierarkkinen kaavio"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurointi ja asennus
      │   ├── azure.yaml                    # Azure Developer CLI -konfiguraatio
      │   ├── docker-compose.yaml           # Paikalliset kehityskontit
      │   ├── pyproject.toml                # Python-projektin konfiguraatio
      │   ├── requirements-dev.txt          # Kehitysriippuvuudet
      │   └── .devcontainer/                # VS Code devcontainer-asetukset
      │
      ├── 🏗️ Infrastruktuuri (infra/)
      │   ├── main.bicep                    # Pääinfrastruktuurimalli
      │   ├── api.bicep                     # API-kohtaiset resurssit
      │   ├── main.parameters.json          # Infrastruktuurin parametrit
      │   └── core/                         # Modulaariset infrastruktuurikomponentit
      │       ├── ai/                       # AI-palvelujen määritykset
      │       ├── host/                     # Isännöintiin liittyvä infrastruktuuri
      │       ├── monitor/                  # Valvonta ja lokitus
      │       ├── search/                   # Azure AI Search -asetukset
      │       ├── security/                 # Tietoturva ja identiteetti
      │       └── storage/                  # Tallennustilin asetukset
      │
      ├── 💻 Sovelluksen lähdekoodi (src/)
      │   ├── api/                          # Backend-API
      │   │   ├── main.py                   # FastAPI-sovelluksen lähtöpiste
      │   │   ├── routes.py                 # API-reittien määrittelyt
      │   │   ├── search_index_manager.py   # Hakutoiminnallisuus
      │   │   ├── data/                     # API:n datankäsittely
      │   │   ├── static/                   # Staattiset web-resurssit
      │   │   └── templates/                # HTML-mallit
      │   ├── frontend/                     # React/TypeScript-käyttöliittymä
      │   │   ├── package.json              # Node.js-riippuvuudet
      │   │   ├── vite.config.ts            # Vite-rakennuskonfiguraatio
      │   │   └── src/                      # Frontendin lähdekoodi
      │   ├── data/                         # Esimerkkidata
      │   │   └── embeddings.csv            # Ennakkoon lasketut embeddingit
      │   ├── files/                        # Tietopohjan tiedostot
      │   │   ├── customer_info_*.json      # Asiakasdatan esimerkit
      │   │   └── product_info_*.md         # Tuotedokumentaatio
      │   ├── Dockerfile                    # Konttikonfiguraatio
      │   └── requirements.txt              # Python-riippuvuudet
      │
      ├── 🔧 Automaatio & skriptit (scripts/)
      │   ├── postdeploy.sh/.ps1           # Jälkiasennuksen määritykset
      │   ├── setup_credential.sh/.ps1     # Tunnistetietojen asetukset
      │   ├── validate_env_vars.sh/.ps1    # Ympäristömuuttujien tarkastus
      │   └── resolve_model_quota.sh/.ps1  # Mallien määrärajojen hallinta
      │
      ├── 🧪 Testaus & arviointi
      │   ├── tests/                        # Yksikkö- ja integraatiotestit
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agentin arviontikehys
      │   │   ├── evaluate.py               # Arvioinnin ajaja
      │   │   ├── eval-queries.json         # Testikyselyt
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Kehitysalusta
      │   │   ├── 1-quickstart.py           # Aloittamis-esimerkit
      │   │   └── aad-interactive-chat.py   # Autentikointiesimerkit
      │   └── airedteaming/                 # AI-turvallisuuden arviointi
      │       └── ai_redteaming.py          # Red-tiimin testaus
      │
      ├── 📚 Dokumentaatio (docs/)
      │   ├── deployment.md                 # Käyttöönotto-opas
      │   ├── local_development.md          # Paikallisen kehityksen ohjeet
      │   ├── troubleshooting.md            # Yleisimmät ongelmat ja korjaukset
      │   ├── azure_account_setup.md        # Azure-esivaatimukset
      │   └── images/                       # Dokumentaation resurssit
      │
      └── 📄 Projektin metatiedot
         ├── README.md                     # Projektin yleiskatsaus
         ├── CODE_OF_CONDUCT.md           # Yhteisön ohjeet
         ├── CONTRIBUTING.md              # Ohjeet osallistumiseen
         ├── LICENSE                      # Lisenssiehdot
         └── next-steps.md                # Jälkiasennuksen ohjeet
      ```

### 3.1. Core App Architecture

This template follows a **full-stack web application** pattern with:

- **Backend**: Python FastAPI with Azure AI integration
- **Frontend**: TypeScript/React with Vite build system
- **Infrastructure**: Azure Bicep templates for cloud resources
- **Containerization**: Docker for consistent deployment

### 3.2 Infra As Code (bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: Orchestrates all Azure resources
   - **`core/` modules**: Reusable components for different services
      - AI services (Microsoft Foundry Models, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-based REST API
- Foundry Agents integration
- Search index management for knowledge retrieval
- File upload and processing capabilities

**Frontend (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Vite for fast development and optimized builds
- Chat interface for agent interactions

**Knowledge Base (`src/files/`)**:

- Sample customer and product data
- Demonstrates file-based knowledge retrieval
- JSON and Markdown format examples


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- Cross-platform PowerShell and Bash scripts
- Environment validation and setup
- Post-deployment configuration
- Model quota management

**Azure Developer CLI Integration**:

- `azure.yaml` configuration for `azd` workflows
- Automated provisioning and deployment
- Environment variable management

### 3.5 Testing & Quality Assurance

**Evaluation Framework (`evals/`)**:

- Agent performance evaluation
- Query-response quality testing
- Automated assessment pipeline

**AI Safety (`airedteaming/`)**:

- Red team testing for AI safety
- Security vulnerability scanning
- Responsible AI practices

---

## 4. Congratulations 🏆

You successfully used GitHub Copilot Chat with MCP servers, to explore the repository.

- [X] GitHub Copilot aktivoitu Azurea varten
- [X] Ymmärsit sovelluksen arkkitehtuurin
- [X] Tutustuit AZD-mallin rakenteeseen

This gives you a sense of the _infrastructure as code_ assets for this template. Next, we'll look at the configuration file for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, tulee huomioida, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä on pidettävä määräävänä lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->