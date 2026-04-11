# 3. ஒரு வார்ப்புருவை பிளவுபடுத்துதல்

!!! tip "இந்த தொகுதியின் இறுதியில் நீங்கள் கீழ்க்கண்டவற்றைச் செய்யக் கூடியவராக இருப்பீர்கள்"

    - [ ] Azure உதவிக்காக MCP சர்வர்களுடன் GitHub Copilot ஐ செயல்படுத்தவும்
    - [ ] AZD வார்ப்புரு கோப்புறை அமைப்பு மற்றும் கூறுகளை புரிந்துகொள்ளவும்
    - [ ] இன்ஃப்ராஸ்ட்ரக்சர்-ஆஸ்-கோட் (Bicep) அமைப்பு மாதிரிகளை ஆய்வு செய்யவும்
    - [ ] **பயிற்சி 3:** GitHub Copilot ஐப் பயன்படுத்தி ரெப்போசிட்டரி கட்டமைப்பை ஆராய்ந்து புரிந்துகொள்ளவும் 

---


AZD வார்ப்புருக்கள் மற்றும் Azure Developer CLI (`azd`) மூலம், மாதிரி குறியீடு, இன்ஃப்ராஸ்ட்ரக்சர் மற்றும் உள்ளமைவு கோப்புகளை வழங்கும் ஸ்டான்டர்டைஸ் செய்யப்பட்ட ரெப்போசிடரிகளுடன் நாங்கள் எமது AI மேம்பாட்டுப் பயணத்தை விரைவாக துவக்கலாம் — deploy செய்ய தயார் _starter_ திட்டத்தின் வடிவத்தில்.

**ஆனாலும் இப்போது, நமக்கு திட்டத்தின் கட்டமைப்பையும் கோட்பேஸையும் புரிந்து கொள்ள தேவையுள்ளது - மேலும் AZD வார்ப்புருவை எந்த முன்னாள் அனுபவமும் இல்லாமல் தனிசெயல்படுத்தக் கூட வேண்டும்!**

---

## 1. GitHub Copilot ஐ இயக்குதல்

### 1.1 GitHub Copilot Chat ஐ நிறுவுதல்

இப்போது [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) ஐ ஆய்வு செய்ய நேரம்தானே. இப்போது, நாங்கள் இயல்புநிலை மொழியைப் பயன்படுத்தி எங்கள் பணியை உயர் மட்டத்தில் விளக்கி, அதனை செயல்படுத்த உதவி பெறலாம். இந்த பயிற்சிக்காக, மாதாந்திர முடிவுகள் மற்றும் உரையாடல் தொடர்புகளுக்கு வரம்பு கொண்ட [Copilot Free plan](https://github.com/github-copilot/signup) ஐ நாம் பயன்படுத்தவுள்ளோம்.

விரிவாக்கத்தை marketplace இல் இருந்து நிறுவலாம், Codespaces அல்லது dev container சுற்றுப்புறங்களில் அது பலமுறை ஏற்கனவே கிடைக்கும். _Copilot ஐகானின் drop-down இல் இருந்து `Open Chat` ஐ கிளிக் செய்யவும் - மற்றும் `What can you do?` போன்ற ஒரு prompt-type ஐ தட்டச்சு செய்யவும்_ - உங்களிடம் உள்நுழைவதற்கு கேட்டுக்கொள்ளலாம். **GitHub Copilot Chat தயாராக உள்ளது**.

### 1.2. MCP சர்வர்களை நிறுவல்

Agent முறை பாவனையானது இருக்கும் பொருட்டு, அறிவை ஈடு செய்தல் அல்லது செயல்களை மேற்கொள்ள தேவையான சரியான கருவிகள் காணக்கூடியிருக்க வேண்டும். இதுதான் MCP சர்வர்கள் உதவும் இடம். நாங்கள் பின்வரும் சர்வர்களை அமைப்போம்:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

இவற்றை செயல்படுத்த:

1. `.vscode/mcp.json` என்ற கோப்பை உருவாக்குங்கள், அது இல்லையெனில்
1. அக்கோப்பில் கீழ்காண்வதை நகலெடுத்து பதிக்கவும் - மற்றும் சர்வர்களைத் தொடங்குங்கள்!
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

??? warning "நீங்கள் `npx` நிறுவப்படவில்லை என்ற பிழையைப் பெறலாம் (திருத்தத்திற்காக விரித்து பார்க்கச் சொடுக்கவும்)"

      இதை சரிசெய்வதற்கு, `.devcontainer/devcontainer.json` கோப்பைத் திறந்து features பிரிவில் இந்த வரியைச் சேர்க்கவும். பின்னர் container ஐ மறுநிர்மாணிக்கவும். இப்போது `npx` நிறுவப்பட்டிருக்கும்.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. GitHub Copilot Chat ஐ சோதனை செய்தல்

**முதலில் VS Code கமாண்ட் லைனில் Azure உடன் அங்கீகாரம் பெற `azd auth login` ஐ பயன்படுத்தவும். நேரடியாக Azure CLI கட்டளைகளை இயக்க திட்டமிட்டால் மட்டுமே `az login` ஐவும் பயன்படுத்தவும்.**

இப்போது உங்கள் Azure சந்தாவை_Query செய்து, triểnப்பட்ட வளங்கள் அல்லது கட்டமைப்புகள் பற்றிய கேள்விகள் கேட்க முடியும். இந்த prompts ஐ முயற்சிக்கவும்:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

நீங்கள் Azure ஆவணங்களைப் பற்றியும் கேள்விகள் கேட்கலாம், மற்றும் Microsoft Docs MCP சர்வரில் அடிப்படையாக்கப்பட்ட பதில்களைப் பெறலாம். இந்த prompts ஐ முயற்சிக்கவும்:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

அல்லது ஒரு கடவுச்செய்தியை நிறைவேற்றக் குறியீட்டு எடுத்துக்காட்டுகளை கேட்கலாம். இந்த prompt ஐ முயற்சிக்கவும்.

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` முறையில், இது நீங்கள் நகலெடுத்து முயற்சிக்கக்கூடிய குறியீடுகளை வழங்கும். `Agent` முறையில், இது மேலும் ஒரு படி முன்னேறி, ilgili வளங்களை உருவாக்கக்கூடும் - அமைப்பு ஸ்கிரிப்டுகள் மற்றும் ஆவணங்களை உட்பட - அந்த பணியை நீங்கள் செயல்படுத்த உதவி.

**இப்போது நீங்கள் வார்ப்புரு ரெப்போசிட்டரியை ஆராயத் தொடங்கத் தயாராக இருக்கிறீர்கள்**

---

## 2. கட்டமைப்பை பிளவுபடுத்துதல்

??? prompt "ASK: docs/images/architecture.png-இல் பயன்பாட்டு கட்டமைப்பை ஒரு பத்தியில் விளக்கவும்"

      இந்த பயன்பாடு Azure இல் கட்டமைக்கப்பட்ட AI-அதிவெளி உரையாடல் செயலியாகும் மற்றும் நவீன ஏஜென்ட் அடிப்படையிலான கட்டமைப்பைக் காட்டுுகிறது. தீர்வு மையமாக ஒரு Azure Container App ஐ கொண்டு செயலி குறியீட்டை ஹோஸ்ட் செய்து, பயனர் உள்ளீடுகளை پروசஸ்சு செய்து AI ஏஜென்டின் மூலம் புத்திசாலியான பதில்களை உருவாக்குகிறது.
      
      கட்டமைப்பு Microsoft Foundry Project ஐ AI திறனுக்கான அடித்தளமாக பயன்படுத்துகிறது, மற்றும் gpt-4.1-mini போன்ற மொழி மாதிரிகள் மற்றும் ஏஜென்ட் செயல்பாட்டை வழங்கும் Azure AI சேவைகளுடன் இணைக்கிறது. பயனர் தொடர்புகள் React அடிப்படையிலான முன்புறத்திலிருந்து FastAPI பின்புறத்திற்கு ஓடுகின்றன, அங்கு AI ஏஜென்ட் சேவையுடன் தொடர்பு கொண்டு விளக்கமான பதில்களை உருவாக்குகிறது.
      
      அமைப்பு கோப்பு தேடல் அல்லது Azure AI Search சேவையின் மூலம் அறிவு மீட்டெடுக்கும் திறன்களைச் சேர்த்துள்ளது, ஏனெனில் ஏஜென்ட் பதிவேற்றப்பட்ட ஆவணங்களிலிருந்து தகவலை அணுகி மேற்கோள் இட முடியும். செயல்திறன் மற்றும் கண்காணிப்புக்கு Application Insights மற்றும் Log Analytics Workspace மூலம் விரிவான கண்காணிப்பு நடைமுறைகள் உள்ளன.
      
      Azure Storage பயன்பாட்டு தரவுகளுக்கும் கோப்பு பதிவேற்றத்திற்குமான blob சேமிப்பை வழங்குகிறது, மற்றும் Managed Identity மூலம் Azure வளங்களுக்கு படிவ credentials இல்லாமல் பாதுகாப்பான அணுகலை உறுதிசெய்கிறது. இந்த முழு தீர்வு அளவளவாகவும் பராமரிக்கக்கூடியதாகவும் வடிவமைக்கப்பட்டுள்ளது, கட்டினரைஸ் செய்யப்பட்ட செயலி கோரிக்கைக்கு ஏற்ப தானாக விரிவடைந்து, Azure இன் நிர்வகிக்கப்பட்ட சேவைகள் வழியாக ஏற்கனவே உள்ள பாதுகாப்பு, கண்காணிப்பு மற்றும் CI/CD திறன்களை வழங்குகிறது.

![கட்டமைப்பு](../../../../../translated_images/ta/architecture.48d94861e6e6cdc0.webp)

---

## 3. ரெப்போசிட்டரி அமைப்பு

!!! prompt "ASK: வார்ப்புரு கோப்புறை அமைப்பை விளக்கவும். முதலில் ஒரு காட்சி அடுக்குமுறை வரைபடத்துடன் துவங்கவும்."

??? info "பதில்: காட்சி அடுக்குமுறை வரைபடம்"

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

### 3.1. மூல செயலி கட்டமைப்பு

இந்த வார்ப்புரு இணைந்த **full-stack வலை செயலி** மாதிரியை பின்பற்றுகிறது, இதில்:

- **பின்புறம்**: Python FastAPI மற்றும் Azure AI ஒருங்கிணைப்பு
- **முன்புறம்**: TypeScript/React மற்றும் Vite கட்டமைப்பு
- **அடித்தள கட்டமைப்பு**: மேக வளங்களுக்கான Azure Bicep வார்ப்புருக்கள்
- **கொண்டெய்னரைசேஷன்**: ஒரே மாதிரியான நீட்டிப்பிற்கு Docker

### 3.2 இன்ஃப்ராஸ்ட்ரக்சர்-கோடு (Bicep)

இன்ஃப்ராஸ்ட்ரக்சர் அடுக்கு மொட்யூல்களாக ஒழுங்கமைக்கப்பட்ட **Azure Bicep** வார்ப்புருக்களைப் பயன்படுத்துகிறது:

   - **`main.bicep`**: அனைத்து Azure வளங்களையும் ஒருங்கிணைக்கிறது
   - **`core/` மொட்யூல்கள்**: வெவ்வேறு சேவைகளுக்காக மீண்டும் பயன்படுத்தக்கூடிய கூறுகள்
      - AI சேவைகள் (Microsoft Foundry Models, AI Search)
      - Container ஹோஸ்டிங் (Azure Container Apps)
      - கண்காணிப்பு (Application Insights, Log Analytics)
      - பாதுகாப்பு (Key Vault, Managed Identity)

### 3.3 செயலி மூலக்கோப்பு (`src/`)

**பின்புற API (`src/api/`)**:

- FastAPI அடிப்படையிலான REST API
- Foundry Agents ஒருங்கிணைப்பு
- அறிவு மீட்டெடுக்கும் தேடல் குறியீட்டு மேலாண்மை
- கோப்பு பதிவேற்றம் மற்றும் செயலாக்க திறன்கள்

**முன்புறம் (`src/frontend/`)**:

- நவீன React/TypeScript SPA
- வேகமான வளர்ச்சிக்கான மற்றும் சீரமைக்கப்பட்ட கட்டளைகளுக்கான Vite
- ஏஜென்ட் தொடர்புகளுக்கான உரையாடல் இடைமுகம்

**அறிவு தளம் (`src/files/`)**:

- மாதிரி வாடிக்கையாளர் மற்றும் தயாரிப்பு தரவுகள்
- கோப்பு-அடிப்படையிலான அறிவு மீட்டெடுப்பை விளக்குகிறது
- JSON மற்றும் Markdown வடிவ உதாரணங்கள்


### 3.4 DevOps மற்றும் தானியக்கமாண்மை

**ஸ்கிரிப்டுகள் (`scripts/`)**:

- பல்வேறு பிளாட்ஃபாரத்திற்கான PowerShell மற்றும் Bash ஸ்கிரிப்டுகள்
- சூழல் சரிபார்ப்பு மற்றும் அமைப்பு
- இடைநிறுத்தத்திற்குப் பின் உள்ளமைவு
- மாடல் கோட்டா மேலாண்மை

**Azure Developer CLI ஒருங்கிணைப்பு**:

- `azd` பணிக்கான `azure.yaml` அமைப்பு
- தானியங்கி வழங்கல் மற்றும் பயன்படுத்துதல்
- சூழல் மாறிலி மேலாண்மை

### 3.5 சோதனை மற்றும் தர நம்பிக்கைத்தன்மை

**மதிப்பீட்டு சீரமைப்பு (`evals/`)**:

- ஏஜென்ட் செயல்திறன் மதிப்பீடு
- கேள்வி-பதில் தரம் சோதனை
- தானியங்கி மதிப்பீட்டு குழாய்

**AI பாதுகாப்பு (`airedteaming/`)**:

- AI பாதுகாப்பிற்கான ரெட் டீம் சோதனை
- பாதுகாப்பு பலவீனங்கள் ஸ்கேன் செய்வது
- பொறுப்பான AI நடைமுறைகள்

---

## 4. வாழ்த்துகள் 🏆

நீங்கள் MCP சர்வர்களுடன் GitHub Copilot Chat ஐ வெற்றிகரமாகப் பயன்படுத்தி, ரெப்போசிட்டரியை ஆராய்ந்தீர்கள்.

- [X] Azure க்காக GitHub Copilot ஐ செயல்படுத்தினீர்கள்
- [X] பயன்பாட்டு கட்டமைப்பை புரிந்துகொண்டீர்கள்
- [X] AZD வார்ப்புரு அமைப்பை ஆய்வு செய்தீர்கள்

இது இந்த வார்ப்புருக்கான _infrastructure as code_ சொத்துகளின் ஒரு உணர்வை உங்களுக்கு வழங்குகிறது. அடுத்த கட்டத்தில், AZD க்கான கட்டமைப்பு கோப்பை பார்ப்போம்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**: இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயலுகிறோம் என்றாலும், தானியங்கி மொழிபெயர்ப்புகள் பிழைகள் அல்லது தவறுகள் கொண்டிருக்கலாம் என்பதனை கவனத்தில் கொள்ளவும். சொந்த மொழியில் உள்ள அசல் ஆவணம் அதிகாரப்பூர்வ மூலமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதனால் ஏற்படும் எந்தவொரு தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்க மாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->