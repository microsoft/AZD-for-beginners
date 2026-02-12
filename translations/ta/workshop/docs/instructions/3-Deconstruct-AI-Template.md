# 3. ஒரு டெம்ப்ளேட் பகுக்குதல்

!!! tip "இந்த மாடியூலின் முடிவில் நீங்கள் இதைச் செய்ய இயல்வீர்கள்"

    - [ ] Azure உதவிக்காக MCP சர்வர்களுடன் GitHub Copilot ஐ செயல்படுத்தவும்
    - [ ] AZD வார்ப்புரு கோப்புறை அமைப்பு மற்றும் கூறுகளைப் புரிந்துகொள்ளவும்
    - [ ] Infrastructure-as-code (Bicep) அமைப்பு முறைகளை ஆராயவும்
    - [ ] **லேப் 3:** GitHub Copilot ஐ பயன்படுத்தி ரெப்பொசிடரி கட்டமைப்பை ஆராய்ந்து புரிந்துகொள்ளவும் 

---


AZD வார்ப்புருகள் மற்றும் Azure Developer CLI (`azd`) மூலம், மாதிரி குறியீடு, அமைப்பு மற்றும் கட்டமைப்பு கோப்புகளை வழங்கும் முறைப்படுத்தப்பட்ட ரெப்பொசிடரிகளைப் பயன்படுத்தி ஒரு உடனடி-நடைமுறை தொடங்கக்கூடிய _starter_ திட்டத்துடன் நாம் எளிதாக நமது AI மேம்பாட்டுக் பயணத்தை துவக்கலாம்.

**ஆனால் இப்போது, پروژه அமைப்பையும் குறியீட்டு அடையாளத்தையும் புரிந்து கொண்டு - AZD வார்ப்புருவை எந்த முன் அனுபவமோ AZD பற்றிய புரிதலோ இல்லாமல் - தனிப்பயன்பாட்டிற்கு ஏற்ப மாற்றக்கூடியவாறு செய்யக் கற்றுக்கொள்வது அவசியம்!**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

இப்போது [Agent Mode உடன் GitHub Copilot](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) ஐ ஆராயும் நேரம். இப்போது, நாம் இயற்கை மொழியைப் பயன்படுத்தி உயர் நிலைபார்வையில் எமது பணியை விவரித்து, அதை நிறைவேற்ற உதவியைப் பெறலாம். இந்த பயிற்சிக்காக, மாதாந்திர முடிவுகள் மற்றும் உரையாடல் தொடர்புகளுக்கான வரம்பு உடைய [Copilot இலவச திட்டத்தை](https://github.com/github-copilot/signup) பயன்படுத்துவோம்.

The extension can be installed from the marketplace, but should already be available in your Codespaces environment. _Click `Open Chat` from the Copilot icon drop-down - and type a prompt like `What can you do?`_ - you may be prompted to log in. **GitHub Copilot Chat is ready**.

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

??? warning "நீங்கள் `npx` நிறுவப்படவில்லை என்று ஒரு பிழையைப் பெறலாம் (சொடுக்கத்தை விரிவாக காணப்போக கிளிக் செய்க)"

      இதை சரிசெய்ய, `.devcontainer/devcontainer.json` கோப்பை திறத்து features பகுதியில் இந்த வரியை சேர்க்கவும். பின்னர் கன்டெய்னரை மறுபடச் செய்யவும். இப்போது உங்கள் கணினியில் `npx` நிறுவப்படும்.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**முதலில் `az login` ஐ பயன்படுத்தி VS Code கட்டளை வரிசை மூலம் Azure இல் அங்கீகாரம் பெற்றுக்கொள்ளுங்கள்.**

இப்பொழுது நீங்கள் உங்கள் Azure subscription நிலையை கேட்டு, பரவலாக்கப்பட்ட வளங்கள் அல்லது கட்டமைப்புகளைப் பற்றிய கேள்விகளைக் கேட்க முடியும். இந்த வழிகளைக் முயற்சிக்கவும்:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

நீங்கள் மேலும் Azure ஆவணங்களைப் பற்றி கேட்டு Microsoft Docs MCP சர்வரில் அடிப்படை பதில்களைப் பெறலாம். இந்த வழிகளைக் முயற்சிக்கவும்:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

அல்லது ஒரு பணியை முடிக்க குறியீட்டு முன்மாதிரிகளை கேட்கலாம். இந்தக் கேள்வியை முயற்சிக்கவும்.

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` முறைமையில், இது நகலெடுத்து முயற்சிக்கக்கூடிய குறியீட்டை வழங்கும். `Agent` முறைமையில், இது ஒரு படி மேலும் செல்லலாம் மற்றும் உங்களுக்கு தேவையான வளங்களை உருவாக்கலாம் - செட்டப் ஸ்கிரிப்டுகள் மற்றும் ஆவணங்களை உட்பட - அந்த பணியை நிறைவேற்ற உதவுவதற்காக.

**நீங்கள் இப்பொழுது வார்ப்புரி ரெப்பொசிடரியை ஆராயத் தொடங்கும் விண்ணப்பத்துடன் சுழற்சி செய்யப்பட்டுள்ளீர்கள்**

---

## 2. கட்டமைப்பை பகுப்பாய்வு

??? prompt "ASK: docs/images/architecture.png உள்ள பயன்பாட்டு கட்டமைப்பை 1 பத்தியில் விளக்கவும்"

      இந்த பயன்பாடு Azure இல் கட்டப்பட்ட ஓர் AI-ஆதாரம் கொண்ட உரையாடல் பயன்பாடாகும் மற்றும் ஒரு நவீன ஏஜென்ட்-ஆதார்முறை கட்டமைப்பைக் காண்பிக்கிறது. தீர்வு மையமாக Azure Container App ஒன்றைக் கொண்டுள்ளது, இது பயனர் உள்ளீட்டைக் செயலாக்கி AI ஏஜென்ட் மூலம் அறிவு சார்ந்து பதில்களை உருவாக்குகிறது. 
      
      கட்டமைப்பு Microsoft Foundry Project ஐ AI திறன்களுக்கான அடிப்படையாக பயன்படுத்துகிறது, மற்றும் அடிப்படை மொழி மாதிரிகள் (உதாரணத்திற்கு GPT-4o-mini) மற்றும் ஏஜென்ட் செயல்பாட்டிற்கு Azure AI சேவைகளுடன் இணைக்கிறது. பயனர் தொடர்புகள் React அடிப்படையிலான முன்முகத்திலிருந்து FastAPI பின்னணி வரை ஓடுகின்றன, பின்னணி AI ஏஜென்ட் சேவையுடன் தொடர்பு கொள்ளும் மூலம் சூழல் சார்ந்த பதில்களை உருவாக்குகிறது. 
      
      இந்த அமைப்பு கோப்புத் தேடல் அல்லது Azure AI Search சேவையின் மூலம் அறிவுத் மீட்டெடுப்பை ஒருங்கிணைக்கிறது, ஏஜென்ட்டிற்கு பதிவேற்றப்பட்ட ஆவணங்களில் இருந்து தகவலை அணுகி மேற்கோள் காட்ட அனுமதிக்கிறது. செயல்பாட்டுத் திறன் மேம்பாட்டிற்காக, கட்டமைப்பில் Application Insights மற்றும் Log Analytics Workspace உடன் விரிவான கண்காணிப்பு உள்ளடக்கப்பட்டுள்ளது. 
      
      Azure Storage பயன்பாட்டு தரவு மற்றும் கோப்பு பதிவேற்றங்களுக்கு ப்லாப் சேமிப்பை வழங்குகிறது, Managed Identity மூலம் Azure வளங்களுக்கு கடவுச்சொற்களை சேமிக்காமல் பாதுகாப்பான அணுகலை உறுதி செய்கிறது. முழு தீர்வு சாதாரணமாக விரிவாக்கக்கூடியதும் பராமரிக்கக்கூடியதுமாக வடிவமைக்கப்பட்டுள்ளது, கன்டெய்னரைச செய்யப்பட்ட பயன்பாடு தேவையின் அடிப்படையில் தானாக பரிமாணம் பெறும் போதும் Azure இன் மேலாண்மைச் சேவைகள் மூலமாக கட்டுப்பாடு, கண்காணிப்பு மற்றும் CI/CD திறன்களை வழங்குகிறது.

![கட்டமைப்பு](../../../../../translated_images/ta/architecture.48d94861e6e6cdc0.webp)

---

## 3. ரெப்பொசிடரி அமைப்பு

!!! prompt "ASK: டெம்ப்ளேட் கோப்புறை அமைப்பை விளக்கவும். ஒரு காட்சி மரப் படிமத்தைத் தொடங்கி காண்பிக்கவும்."

??? info "ANSWER: காட்சி மர அமைப்பு வரைபடம்"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 கட்டமைப்பு மற்றும் அமைப்பு
      │   ├── azure.yaml                    # Azure Developer CLI கட்டமைப்பு
      │   ├── docker-compose.yaml           # உள்ளூர் மேம்பாட்டு கன்டெய்னர்கள்
      │   ├── pyproject.toml                # Python திட்டக் கட்டமைப்பு
      │   ├── requirements-dev.txt          # மேம்பாட்டு சார்புகள்
      │   └── .devcontainer/                # VS Code dev container அமைப்பு
      │
      ├── 🏗️ இன்ஃப்ராஸ்ட்ரக்சர் (infra/)
      │   ├── main.bicep                    # பிரதான இன்ஃப்ராஸ்ட்ரக்சர் வார்ப்புரு
      │   ├── api.bicep                     # API-சார்ந்த வளங்கள்
      │   ├── main.parameters.json          # இன்ஃப்ராஸ்ட்ரக்சர் அளவுருக்கள்
      │   └── core/                         # மாடுலார் இன்ஃப்ராஸ்ட்ரக்சர் கூறுகள்
      │       ├── ai/                       # AI சேவை உள்ளமைவுகள்
      │       ├── host/                     # ஹோஸ்டிங் இன்ஃப்ராஸ்ட்ரக்சர்
      │       ├── monitor/                  # கண்காணிப்பு மற்றும் பதிவேடு
      │       ├── search/                   # Azure AI Search அமைப்பு
      │       ├── security/                 # பாதுகாப்பு மற்றும் அடையாளம்
      │       └── storage/                  # சேமிப்பு கணக்கு அமைப்புகள்
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # பின்னடைவு API
      │   │   ├── main.py                   # FastAPI பயன்பாட்டின் நுழைவு
      │   │   ├── routes.py                 # API பாதை வரையறைகள்
      │   │   ├── search_index_manager.py   # தேடல் செயல்பாடு
      │   │   ├── data/                     # API தரவின் கையாள்தல்
      │   │   ├── static/                   # நிலையான வலைச் சொத்துகள்
      │   │   └── templates/                # HTML வார்ப்புருக்கள்
      │   ├── frontend/                     # React/TypeScript முன்முகப்புப் பகுதி
      │   │   ├── package.json              # Node.js சார்புகள்
      │   │   ├── vite.config.ts            # Vite கட்டமைப்பு
      │   │   └── src/                      # முன்முகப்பு மூலக் குறியீடு
      │   ├── data/                         # மாதிரி தரவுக் கோப்புகள்
      │   │   └── embeddings.csv            # முன்கணிக்கப்பட்ட எம்பெடிங்குகள்
      │   ├── files/                        # அறிவுத்தள கோப்புகள்
      │   │   ├── customer_info_*.json      # வாடிக்கையாளர் தரவு மாதிரிகள்
      │   │   └── product_info_*.md         # தயாரிப்பு ஆவணங்கள்
      │   ├── Dockerfile                    # கன்டெய்னர் கட்டமைப்பு
      │   └── requirements.txt              # Python சார்புகள்
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # பரவலாக்கம் பிற்கால அமைப்பு
      │   ├── setup_credential.sh/.ps1     # அங்கீகாரக் கட்டமைப்பு
      │   ├── validate_env_vars.sh/.ps1    # சூழல் மாறிகள் சரிபார்த்தல்
      │   └── resolve_model_quota.sh/.ps1  # மாதிரி கொட்டா நிர்வாகம்
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # யூனிட் மற்றும் ஒருங்கிணைப்பு சோதனைகள்
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # ஏஜென்ட் மதிப்பீடு கட்டமைப்பு
      │   │   ├── evaluate.py               # மதிப்பீட்டு இயக்கி
      │   │   ├── eval-queries.json         # சோதனை விசாரணைகள்
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # மேம்பாட்டு விளையாட்டு
      │   │   ├── 1-quickstart.py           # தொடக்கம் எடுத்துக்காட்டுகள்
      │   │   └── aad-interactive-chat.py   # அங்கீகார எடுத்துக்காட்டுகள்
      │   └── airedteaming/                 # AI பாதுகாப்பு மதிப்பீடு
      │       └── ai_redteaming.py          # ரெட்-டீம் சோதனை
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # பரவலாக்க வழிகாட்டி
      │   ├── local_development.md          # உள்ளூர் அமைப்பு வழிமுறைகள்
      │   ├── troubleshooting.md            # பொதுவான பிரச்சினைகள் மற்றும் தீர்வுகள்
      │   ├── azure_account_setup.md        # Azure முன்னோடிய தேவைகள்
      │   └── images/                       # ஆவண சொத்துகள்
      │
      └── 📄 Project Metadata
         ├── README.md                     # திட்டத்தின் மேற்பார்வை
         ├── CODE_OF_CONDUCT.md           # சமூக வழிகாட்டுதல்கள்
         ├── CONTRIBUTING.md              # பங்களிப்பு வழிகாட்டி
         ├── LICENSE                      # உரிமம் விதிகள்
         └── next-steps.md                # பரவலாக்க பிந்தைய வழிகாட்டி
      ```

### 3.1. மைய பயன்பாட்டுக் கட்டமைப்பு

This template follows a **full-stack web application** pattern with:

- **Backend**: Python FastAPI மற்றும் Azure AI ஒருங்கிணைப்பு
- **Frontend**: TypeScript/React மற்றும் Vite கட்டமைப்பு
- **Infrastructure**: Azure Bicep வார்ப்புருக்கள் மூலம் மேக வளங்கள்
- **Containerization**: நிலையான பரவலாக்கத்துக்காக Docker

### 3.2 இன்ஃப்ராஸ்ட்ரக்சர் அசு கோடு (Bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: அனைத்து Azure வளங்களையும் ஒருங்கிணைக்கிறது
   - **`core/` modules**: பல்வேறு சேவைகளுக்கான மறுபயன்படுத்தக்கூடிய கூறுகள்
      - AI சேவைகள் (Azure OpenAI, AI Search)
      - கன்டெய்னர் ஹோஸ்டிங் (Azure Container Apps)
      - கண்காணிப்பு (Application Insights, Log Analytics)
      - பாதுகாப்பு (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI அடிப்படையிலான REST API
- Foundry Agents ஒருங்கிணைப்பு
- அறிவுத்தகவு மீட்டெடுப்பிற்கான தேடல் குறியீட்டு மேலாண்மை
- கோப்பு பதிவேற்றம் மற்றும் செயலாக்க திறன்கள்

**Frontend (`src/frontend/`)**:

- நவீன React/TypeScript ஒரே-பக்க பயன்பாடு (SPA)
- வேகமான மேம்பாடு மற்றும் சிறந்த கட்டமைப்புகளுக்கான Vite
- ஏஜென்ட் தொடர்புகளுக்கான உரையாடல் இடைமுகம்

**Knowledge Base (`src/files/`)**:

- மாதிரி வாடிக்கையாளர் மற்றும் தயாரிப்பு தரவு
- கோப்பு-அடிப்படையிலான அறிவு மீட்டெடுப்பு செயல்பாட்டைக் காட்டுகிறது
- JSON மற்றும் Markdown வடிவ உதாரணங்கள்


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- பலத் தளமான PowerShell மற்றும் Bash ஸ்கிரிப்ட்கள்
- சூழல் சரிபார்த்தல் மற்றும் அமைப்பு
- பரவலாக்க பின்வரிசை կազմமைப்பு
- மாதிரி கொட்டா நிர்வாகம்

**Azure Developer CLI Integration**:

- `azure.yaml` `azd` பணிச்செயல்முறைகளுக்கான கட்டமைப்பு
- தானியங்கி வழங்கல் மற்றும் பரவலாக்கம்
- சூழல் மாறி நிர்வாகம்

### 3.5 Testing & Quality Assurance

**Evaluation Framework (`evals/`)**:

- ஏஜென்ட் செயல்திறன் மதிப்பீடு
- விசாரணை-பதில் தர சோதனை
- தானியங்கி மதிப்பீட்டு பைப்பலைன்

**AI Safety (`airedteaming/`)**:

- AI பாதுகாப்புக்கான ரெட்-டீம் சோதனை
- பாதுகாப்பு பாதிப்பு ஸ்கேனிங்
- பொறுப்பு வற்றிய AI நடைமுறைகள்

---

## 4. வாழ்த்துக்கள் 🏆

நீங்கள் MCP சர்வர்களுடன் GitHub Copilot Chat ஐ வெற்றிகரமாக பயன்படுத்தி ரெப்பொசிடரியை ஆராய்ந்துள்ளீர்கள்.

- [X] GitHub Copilot ஐ Azure க்காக செயல்படுத்தினீர்கள்
- [X] பயன்பாட்டு கட்டமைப்பை புரிந்துகொண்டீர்கள்
- [X] AZD வார்ப்புரு அமைப்பை ஆராய்ந்தீர்கள்

இது இந்த வார்ப்புருவுக்கான _infrastructure as code_ சொத்துக்கள் பற்றி ஒரு உணர்வை வழங்குகிறது. அடுத்ததாக, நாங்கள் AZD க்கான கட்டமைப்பு கோப்பைப் பார்க்கப்போகிறோம்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான Co‑op Translator (https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியம் நோக்கி முயன்றாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதைக் கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் இயல்பு மொழியில் இருப்பதே அதிகாரபூர்வ மூலமாக கருதப்பட வேண்டும். மிக முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்பாளர் மூலம் செய்யப்பட்ட மொழிபெயர்ப்பு பரிந்துரிக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதன் காரணமாக ஏற்படும் எந்த தவறான புரிதலும் அல்லது தவறான பொருள் எடுத்துக்கொள்ளலுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->