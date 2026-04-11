# 3. Een sjabloon ontleden

!!! tip "AAN HET EINDE VAN DEZE MODULE ZUL JE IN STAAT ZIJN"

    - [ ] GitHub Copilot activeren met MCP-servers voor Azure-ondersteuning
    - [ ] Begrijp de mapstructuur en componenten van het AZD-sjabloon
    - [ ] Verken infrastructure-as-code (Bicep) organisatiepatronen
    - [ ] **Lab 3:** Gebruik GitHub Copilot om de repository-architectuur te verkennen en te begrijpen 

---


Met AZD-sjablonen en de Azure Developer CLI (`azd`) kunnen we snel onze AI-ontwikkelreis starten met gestandaardiseerde repositories die voorbeeldcode, infrastructuur en configuratiebestanden bieden - in de vorm van een kant-en-klaar te implementeren _starter_-project.

**Maar nu moeten we de projectstructuur en codebasis begrijpen - en in staat zijn het AZD-sjabloon aan te passen - zonder enige voorafgaande ervaring of kennis van AZD!**

---

## 1. GitHub Copilot activeren

### 1.1 Installeer GitHub Copilot Chat

Het is tijd om [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) te verkennen. Nu kunnen we natuurlijke taal gebruiken om onze taak op een hoog niveau te beschrijven en hulp te krijgen bij de uitvoering. Voor dit lab gebruiken we het [Copilot Free plan](https://github.com/github-copilot/signup) dat een maandelijks limiet heeft voor completions en chatinteracties.

De extensie kan worden geïnstalleerd vanuit de marketplace, en is vaak al beschikbaar in Codespaces of devcontainer-omgevingen. _Klik op `Open Chat` in het Copilot-pictogram drop-down - en typ een prompt zoals `What can you do?`_ - mogelijk wordt u gevraagd om in te loggen. **GitHub Copilot Chat is klaar voor gebruik**.

### 1.2. Installeer MCP-servers

Om Agent-modus effectief te laten zijn, heeft het toegang nodig tot de juiste tools om kennis op te halen of acties uit te voeren. Dit is waar MCP-servers kunnen helpen. We configureren de volgende servers:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Om deze te activeren:

1. Maak een bestand genaamd `.vscode/mcp.json` als het nog niet bestaat
1. Kopieer het volgende in dat bestand - en start de servers!
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

??? warning "U kunt een fout krijgen dat `npx` niet is geïnstalleerd (klik om de oplossing uit te klappen)"

      Om dit te verhelpen, open het bestand `.devcontainer/devcontainer.json` en voeg deze regel toe aan de features-sectie. Bouw daarna de container opnieuw. Je zou nu `npx` geïnstalleerd moeten hebben.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**Gebruik eerst `azd auth login` om te authenticeren bij Azure vanuit de VS Code-opdrachtregel. Gebruik ook `az login` alleen als je van plan bent Azure CLI-opdrachten rechtstreeks uit te voeren.**

Je zou nu in staat moeten zijn om de status van je Azure-abonnement op te vragen, en vragen te stellen over geïmplementeerde resources of configuratie. Probeer deze prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Je kunt ook vragen stellen over Azure-documentatie en antwoorden krijgen die zijn onderbouwd door de Microsoft Docs MCP-server. Probeer deze prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Of je kunt om codefragmenten vragen om een taak te voltooien. Probeer deze prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

In de `Ask`-modus levert dit code die je kunt kopiëren en plakken en uitproberen. In de `Agent`-modus kan dit een stap verder gaan en de relevante resources voor je aanmaken - inclusief setup-scripts en documentatie - om je te helpen die taak uit te voeren.

**Je bent nu uitgerust om het sjabloonrepository te verkennen**

---

## 2. Architectuur ontleden

??? prompt "VRAAG: Leg de applicatiearchitectuur in docs/images/architecture.png uit in 1 alinea"

      Deze applicatie is een door AI aangedreven chatapplicatie gebouwd op Azure die een moderne agentgebaseerde architectuur demonstreert. De oplossing draait rond een Azure Container App die de hoofdapplicatiecode host, welke gebruikersinvoer verwerkt en intelligente antwoorden genereert via een AI-agent. 
      
      De architectuur maakt gebruik van Microsoft Foundry Project als basis voor AI-mogelijkheden, en verbindt met Azure AI Services die de onderliggende taalmodellen (zoals gpt-4.1-mini) en agentfunctionaliteit leveren. Gebruikersinteracties lopen via een React-gebaseerde frontend naar een FastAPI-backend die communiceert met de AI-agentservice om contextuele antwoorden te genereren. 
      
      Het systeem bevat kennisophaalfunctionaliteit via zowel bestandszoeken als de Azure AI Search-service, waardoor de agent informatie uit geüploade documenten kan raadplegen en citeren. Voor operationele uitmuntendheid bevat de architectuur uitgebreide monitoring via Application Insights en Log Analytics Workspace voor tracing, logging en prestatieoptimalisatie. 
      
      Azure Storage biedt blobopslag voor applicatiegegevens en bestandsuploads, terwijl Managed Identity veilige toegang tussen Azure-resources garandeert zonder referenties op te slaan. De gehele oplossing is ontworpen voor schaalbaarheid en onderhoudbaarheid, waarbij de gecontaineriseerde applicatie automatisch schaalt op basis van vraag en tegelijkertijd ingebouwde beveiliging, monitoring en CI/CD-mogelijkheden biedt via Azure's ecosysteem van beheerde services.

![Architectuur](../../../../../translated_images/nl/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repositorystructuur

!!! prompt "VRAAG: Leg de sjabloonmapstructuur uit. Begin met een visueel hiërarchisch diagram."

??? info "ANTWOORD: Visueel hiërarchisch diagram"

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

### 3.1. Kernarchitectuur van de app

Dit sjabloon volgt een **full-stack webapplicatie**-patroon met:

- **Backend**: Python FastAPI met Azure AI-integratie
- **Frontend**: TypeScript/React met het Vite-buildsysteem
- **Infrastructuur**: Azure Bicep-sjablonen voor cloudresources
- **Containerisatie**: Docker voor consistente implementatie

### 3.2 Infra as Code (Bicep)

De infrastructuurlaag gebruikt **Azure Bicep**-sjablonen die modulair zijn georganiseerd:

   - **`main.bicep`**: Orkestreert alle Azure-resources
   - **`core/` modules**: Herbruikbare componenten voor verschillende services
      - AI-services (Microsoft Foundry Models, AI Search)
      - Containerhosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Beveiliging (Key Vault, Managed Identity)

### 3.3 Applicatiebron (`src/`)

**Backend API (`src/api/`)**:

- REST API gebaseerd op FastAPI
- Integratie met Foundry Agents
- Beheer van zoekindex voor kennisophaling
- Bestandsupload- en verwerkingsmogelijkheden

**Frontend (`src/frontend/`)**:

- Moderne React/TypeScript SPA
- Vite voor snelle ontwikkeling en geoptimaliseerde builds
- Chatinterface voor agentinteracties

**Knowledge Base (`src/files/`)**:

- Voorbeeld klant- en productgegevens
- Demonstreert op bestanden gebaseerde kennisophaling
- Voorbeelden in JSON- en Markdown-formaat


### 3.4 DevOps & automatisering

**Scripts (`scripts/`)**:

- Cross-platform PowerShell- en Bash-scripts
- Omgevingsvalidatie en -configuratie
- Post-deployment-configuratie
- Modelquota-beheer

**Integratie met Azure Developer CLI**:

- `azure.yaml`-configuratie voor `azd`-workflows
- Geautomatiseerde provisioning en implementatie
- Beheer van omgevingsvariabelen

### 3.5 Testen & kwaliteitswaarborging

**Evaluation Framework (`evals/`)**:

- Evaluatie van agentprestaties
- Kwaliteitstesten van query-antwoorden
- Geautomatiseerde beoordelingspijplijn

**AI Safety (`airedteaming/`)**:

- Red-teamtesten voor AI-veiligheid
- Scannen op beveiligingskwetsbaarheden
- Verantwoorde AI-praktijken

---

## 4. Gefeliciteerd 🏆

Je hebt met succes GitHub Copilot Chat gebruikt met MCP-servers om de repository te verkennen.

- [X] GitHub Copilot voor Azure geactiveerd
- [X] De applicatiearchitectuur begrepen
- [X] De structuur van het AZD-sjabloon verkend

Dit geeft je een beeld van de _infrastructure as code_-assets voor dit sjabloon. Vervolgens bekijken we het configuratiebestand voor AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vrijwaring**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel wij naar nauwkeurigheid streven, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->