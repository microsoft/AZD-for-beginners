# 3. Een sjabloon ontleden

!!! tip "AAN HET EINDE VAN DEZE MODULE ZULT U IN STAAT ZIJN OM"

    - [ ] Activeer GitHub Copilot met MCP-servers voor Azure-ondersteuning
    - [ ] Begrijp de mapstructuur en componenten van de AZD-sjabloon
    - [ ] Verken organisatiepatronen voor infrastructure-as-code (Bicep)
    - [ ] **Lab 3:** Gebruik GitHub Copilot om de repository-architectuur te verkennen en te begrijpen

---


Met AZD-sjablonen en de Azure Developer CLI (`azd`) kunnen we snel ons AI-ontwikkelingstraject starten met gestandaardiseerde repositories die voorbeeldcode, infrastructuur en configuratiebestanden leveren - in de vorm van een kant-en-klaar inzetbaar _starterproject_.

**Maar nu moeten we de projectstructuur en codebasis begrijpen - en in staat zijn de AZD-sjabloon aan te passen - zonder enige eerdere ervaring of kennis van AZD!**

---

## 1. GitHub Copilot activeren

### 1.1 GitHub Copilot Chat installeren

Het is tijd om [GitHub Copilot met Agent-modus](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) te verkennen. Nu kunnen we natuurlijke taal gebruiken om onze taak op hoog niveau te beschrijven en assistentie te krijgen bij de uitvoering. Voor dit lab gebruiken we het [Gratis Copilot-plan](https://github.com/github-copilot/signup) dat een maandelijkse limiet heeft voor completions en chatinteracties.

De extensie kan vanuit de marketplace worden geïnstalleerd, maar zou al beschikbaar moeten zijn in je Codespaces-omgeving. _Klik op `Open Chat` in het keuzemenu van het Copilot-pictogram - en typ een prompt zoals `What can you do?`_ - mogelijk wordt je gevraagd in te loggen. **GitHub Copilot Chat is klaar voor gebruik**.

### 1.2. MCP-servers installeren

Om Agent-modus effectief te laten zijn, heeft het toegang nodig tot de juiste hulpmiddelen om kennis op te halen of acties uit te voeren. Hier kunnen MCP-servers helpen. We configureren de volgende servers:

1. [Azure MCP-server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP-server](../../../../../workshop/docs/instructions)

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

??? warning "Mogelijk krijgt u een foutmelding dat `npx` niet is geïnstalleerd (klik om de oplossing uit te vouwen)"

      Om dit te verhelpen, open het bestand `.devcontainer/devcontainer.json` en voeg deze regel toe aan de features-sectie. Bouw vervolgens de container opnieuw. Je zou nu `npx` geïnstalleerd moeten hebben.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**Gebruik eerst `az login` om vanaf de VS Code-opdrachtregel bij Azure te authenticeren.**

Je zou nu in staat moeten zijn om de status van je Azure-abonnement op te vragen en vragen te stellen over uitgerolde resources of configuratie. Probeer deze prompts:

1. `Lijst mijn Azure resourcegroepen`
1. `#foundry list my current deployments`

Je kunt ook vragen stellen over Azure-documentatie en antwoorden krijgen onderbouwd door de Microsoft Docs MCP-server. Probeer deze prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Of je kunt om codefragmenten vragen om een taak te voltooien. Probeer deze prompt.

1. `Geef me een Python-codevoorbeeld dat AAD gebruikt voor een interactieve chatclient`

In de `Ask`-modus levert dit code die je kunt kopiëren-plakken en uitproberen. In de `Agent`-modus kan dit een stap verder gaan en de relevante resources voor je aanmaken - inclusief setup-scripts en documentatie - om je te helpen die taak uit te voeren.

**Je bent nu uitgerust om de sjabloon-repository te gaan verkennen**

---

## 2. Architectuur ontleden

??? prompt "VRAAG: Leg de applicatiearchitectuur uit in docs/images/architecture.png in 1 alinea"

      Deze applicatie is een door AI aangedreven chatapplicatie gebouwd op Azure die een moderne agent-gebaseerde architectuur demonstreert. De oplossing draait rond een Azure Container App die de hoofdapplicatie-code host, welke gebruikersinvoer verwerkt en intelligente antwoorden genereert via een AI-agent. 
      
      De architectuur maakt gebruik van Microsoft Foundry Project als basis voor AI-mogelijkheden, en verbindt met Azure AI Services die de onderliggende taalmodellen leveren (zoals gpt-4.1-mini) en agentfunctionaliteit. Gebruikersinteracties stromen via een React-gebaseerde frontend naar een FastAPI-backend die communiceert met de AI-agentservice om contextuele antwoorden te genereren. 
      
      Het systeem bevat mogelijkheden voor kennisopvraging via bestandszoekfunctie of de Azure AI Search-service, waardoor de agent informatie uit geüploade documenten kan opvragen en citeren. Voor operationele excellentie omvat de architectuur uitgebreide monitoring via Application Insights en Log Analytics Workspace voor tracing, logging en prestatieoptimalisatie. 
      
      Azure Storage zorgt voor blobopslag voor applicatiegegevens en bestandsuploads, terwijl Managed Identity veilige toegang tussen Azure-resources waarborgt zonder het opslaan van referenties. De gehele oplossing is ontworpen voor schaalbaarheid en onderhoudbaarheid, waarbij de containerized applicatie automatisch schaalt op basis van vraag en ingebouwde beveiliging, monitoring en CI/CD-mogelijkheden biedt via Azure's managed services-ecosysteem.

![Architectuur](../../../../../translated_images/nl/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repositorystructuur

!!! prompt "VRAAG: Leg de mapstructuur van het sjabloon uit. Begin met een visueel hiërarchisch diagram."

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

### 3.1 Kernarchitectuur van de app

Deze sjabloon volgt een patroon voor **full-stack webapplicaties** met:

- **Backend**: FastAPI-gebaseerde REST-API met Azure AI-integratie
- **Frontend**: TypeScript/React met Vite-buildsysteem
- **Infrastructuur**: Azure Bicep-sjablonen voor cloudresources
- **Containerisatie**: Docker voor consistente implementatie

### 3.2 Infra-as-code (Bicep)

De infrastructuurlaag gebruikt **Azure Bicep**-sjablonen die modulair zijn georganiseerd:

   - **`main.bicep`**: Orkestreert alle Azure-resources
   - **`core/` modules**: Herbruikbare componenten voor verschillende services
      - AI-services (Microsoft Foundry Models, AI Search)
      - Containerhosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Beveiliging (Key Vault, Managed Identity)

### 3.3 Applicatiebron (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-gebaseerde REST-API
- Integratie met Foundry Agents
- Beheer van zoekindexen voor kennisopvraging
- Mogelijkheden voor bestandsupload en verwerking

**Frontend (`src/frontend/`)**:

- Moderne React/TypeScript SPA
- Vite voor snelle ontwikkeling en geoptimaliseerde builds
- Chatinterface voor agentinteracties

**Knowledge Base (`src/files/`)**:

- Voorbeeldgegevens van klanten en producten
- Demonstratie van op bestanden gebaseerde kennisopvraging
- Voorbeelden in JSON- en Markdown-indeling


### 3.4 DevOps & Automatisering

**Scripts (`scripts/`)**:

- Cross-platform PowerShell- en Bash-scripts
- Omgevingsvalidatie en -configuratie
- Post-deploy-configuratie
- Modelquota-beheer

**Integratie met Azure Developer CLI**:

- `azure.yaml`-configuratie voor `azd`-workflows
- Geautomatiseerde provisioning en deployment
- Beheer van omgevingsvariabelen

### 3.5 Testen & Kwaliteitsborging

**Evaluatiekader (`evals/`)**:

- Evaluatie van agentprestaties
- Kwaliteitstests van query-responsen
- Geautomatiseerde beoordelingspipeline

**AI-veiligheid (`airedteaming/`)**:

- Red-teamtesten voor AI-veiligheid
- Scannen op beveiligingskwetsbaarheden
- Verantwoordelijke AI-praktijken

---

## 4. Gefeliciteerd 🏆

Je hebt succesvol GitHub Copilot Chat met MCP-servers gebruikt om de repository te verkennen.

- [X] GitHub Copilot voor Azure geactiveerd
- [X] De applicatiearchitectuur begrepen
- [X] De AZD-sjabloonstructuur verkend

Dit geeft je een indruk van de _infrastructure as code_-assets voor dit sjabloon. Vervolgens bekijken we het configuratiebestand voor AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel wij streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor enige misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->