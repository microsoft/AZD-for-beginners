# 3. Išardyti šabloną

!!! tip "MODULIO PABAIGOJE GALĖSITE"

    - [ ] Aktyvuoti GitHub Copilot su MCP serveriais Azure pagalbai
    - [ ] Suprasti AZD šablono aplankų struktūrą ir komponentus
    - [ ] Ištirti infrastruktūros kaip kodo (Bicep) organizavimo modelius
    - [ ] **Lab 3:** Naudoti GitHub Copilot norint ištirti ir suprasti saugyklos architektūrą 

---


Su AZD šablonais ir Azure Developer CLI (`azd`) galime greitai pradėti mūsų DI kūrimo kelionę su standartizuotomis saugyklomis, kurios suteikia pavyzdinį kodą, infrastruktūrą ir konfigūracijos failus - paruošto diegti _starter_ projekto pavidalu.

**Tačiau dabar turime suprasti projekto struktūrą ir kodo bazę - ir sugebėti pritaikyti AZD šabloną - be jokios ankstesnės patirties ar supratimo apie AZD!**

---

## 1. Aktyvuokite GitHub Copilot

### 1.1 Įdiekite GitHub Copilot Chat

Dabar laikas išbandyti [GitHub Copilot su Agent režimu](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Dabar galime natūralia kalba aprašyti mūsų užduotį aukštu lygiu ir gauti pagalbą vykdant. Šiai laboratorijai naudosime [Nemokamas Copilot planas](https://github.com/github-copilot/signup), kuriame yra mėnesinis užklausų ir pokalbių limitas.

Priedą galima įdiegti iš marketplace, ir jis dažnai jau yra prieinamas Codespaces arba dev container aplinkose. _Spustelėkite `Open Chat` iš Copilot piktogramos išskleidžiamojo meniu - ir įrašykite užklausą kaip `What can you do?`_ - gali būti paprašyta prisijungti. **GitHub Copilot Chat yra paruoštas**.

### 1.2. Įdiekite MCP serverius

Kad Agent režimas būtų veiksmingas, jam reikia prieigos prie tinkamų įrankių, kurie padėtų jam gauti žinias arba atlikti veiksmus. Čia gali padėti MCP serveriai. Konfigūruosime šiuos serverius:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Norėdami juos aktyvuoti:

1. Sukurkite failą pavadinimu `.vscode/mcp.json`, jei jo nėra
1. Nukopijuokite toliau pateiktą turinį į tą failą - ir paleiskite serverius!
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

??? warning "Gali pasirodyti klaida, kad `npx` nėra įdiegtas (spustelėkite, kad išplėstumėte pataisymą)"

      Norėdami tai ištaisyti, atidarykite `.devcontainer/devcontainer.json` failą ir pridėkite šią eilutę į features skiltį. Tada perstatykite konteinerį. Dabar turėtumėte turėti įdiegtą `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Išbandykite GitHub Copilot Chat

**Pirmiausia naudokite `azd auth login`, kad autentikuotumėtės prie Azure iš VS Code komandų eilutės. Taip pat naudokite `az login` tik jei ketinate vykdyti Azure CLI komandas tiesiogiai.**

Dabar turėtumėte galėti užklausti savo Azure prenumeratos būsenos ir užduoti klausimus apie išdiegtus išteklius ar konfigūraciją. Išbandykite šias užklausas:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Taip pat galite užduoti klausimus apie Azure dokumentaciją ir gauti atsakymus, pagrįstus Microsoft Docs MCP serveriu. Išbandykite šias užklausas:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Arba galite paprašyti kodo fragmentų užduočiai atlikti. Išbandykite šią užklausą.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Ask režime tai pateiks kodą, kurį galėsite nukopijuoti ir išbandyti. Agent režime tai gali nueiti dar toliau ir sukurti atitinkamus išteklius jums - įskaitant parengimo scenarijus ir dokumentaciją - kad padėtų įvykdyti užduotį.

**Dabar esate pasiruošę pradėti tyrinėti šablono saugyklą**

---

## 2. Išardyti architektūrą

??? prompt "PRAŠYMAS: Paaiškinkite programos architektūrą, esančią docs/images/architecture.png, vienoje pastraipoje"

      Ši programa yra DI-varoma pokalbių programėlė, sukurta Azure platformoje, kuri demonstruoja modernią agentais grįstą architektūrą. Sprendimas sukasi aplink Azure Container App, kuri talpina pagrindinį programos kodą, apdorojantį vartotojo įvestis ir generuojantį intelektualius atsakymus per DI agentą. 
      
      Architektūra remiasi Microsoft Foundry projektu kaip DI galimybių pagrindu, jungiantis prie Azure AI paslaugų, teikiančių pagrindinius kalbos modelius (tokius kaip gpt-4.1-mini) ir agentų funkcionalumą. Vartotojo sąveikos teka per React pagrindu sukurtą frontendą į FastAPI backendą, kuris bendrauja su DI agentų paslauga, kad generuotų kontekstualius atsakymus. 
      
      Sistema įtraukia žinių gavimo galimybes per failų paiešką arba Azure AI Search paslaugą, leidžiančią agentui pasiekti ir cituoti informaciją iš įkeltų dokumentų. Dėl veiklos priežiūros architektūra apima išsamią stebėseną per Application Insights ir Log Analytics Workspace, skirtą sekimui, žurnalui ir našumo optimizavimui. 
      
      Azure Storage suteikia blob saugyklą programos duomenims ir failų įkėlimams, o Managed Identity užtikrina saugų prieigos tarp Azure išteklių mechanizmą be kredencialų saugojimo. Visa sprendimas yra sukurtas mastelį keisti ir prižiūrėti, su konteinerizuota programa, kuri automatiškai plečiasi pagal poreikį, tuo pačiu teikdama integruotą saugumą, stebėjimą ir CI/CD galimybes per Azure valdomų paslaugų ekosistemą.

![Architektūra](../../../../../translated_images/lt/architecture.48d94861e6e6cdc0.webp)

---

## 3. Saugyklos struktūra

!!! prompt "PRAŠYMAS: Paaiškinkite šablono aplankų struktūrą. Pradėkite nuo vizualios hierarchinės diagramos."

??? info "ATSAKYMAS: Vizualinė hierarchinė diagrama"

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

### 3.1. Pagrindinė programos architektūra

Šis šablonas atitinka **pilno steko žiniatinklio programos** modelį su:

- **Backend**: Python FastAPI su Azure AI integracija
- **Frontend**: TypeScript/React su Vite build sistema
- **Infrastruktūra**: Azure Bicep šablonai debesų ištekliams
- **Konteinerizacija**: Docker už nuoseklų diegimą

### 3.2 Infrastruktūra kaip kodas (Bicep)

Infrastruktūros sluoksnis naudoja **Azure Bicep** šablonus, organizuotus modulių pagalba:

   - **`main.bicep`**: Koordinuoja visus Azure išteklius
   - **`core/` moduliai**: Pernaudojami komponentai skirtingoms paslaugoms
      - AI paslaugos (Microsoft Foundry modeliai, AI Search)
      - Konteinerių talpinimas (Azure Container Apps)
      - Stebėjimas (Application Insights, Log Analytics)
      - Saugumas (Key Vault, Managed Identity)

### 3.3 Programos šaltiniai (`src/`)

**Backend API (`src/api/`)**:

- REST API, paremtas FastAPI
- Foundry agentų integracija
- Paieškos indekso valdymas žinių gavimui
- Failų įkėlimo ir apdorojimo galimybės

**Frontend (`src/frontend/`)**:

- Moderni React/TypeScript SPA
- Vite greitam vystymui ir optimizuotiems buildams
- Pokalbių sąsaja agentų sąveikoms

**Žinių bazė (`src/files/`)**:

- Pavyzdiniai klientų ir produktų duomenys
- Demonstruoja žinių gavimą iš failų
- JSON ir Markdown formato pavyzdžiai


### 3.4 DevOps ir automatizavimas

**Scenarijai (`scripts/`)**:

- Kryžminės platformos PowerShell ir Bash scenarijai
- Aplinkos patikra ir konfigūracija
- Po diegimo konfigūracija
- Modelių kvotų valdymas

**Azure Developer CLI integracija**:

- `azure.yaml` konfigūracija `azd` darbo eigoms
- Automatizuotas išteklių paruošimas ir diegimas
- Aplinkos kintamųjų valdymas

### 3.5 Testavimas ir kokybės užtikrinimas

**Vertinimo sistema (`evals/`)**:

- Agentų našumo vertinimas
- Užklausų-atsakymų kokybės testavimas
- Automatizuota vertinimo grandinė

**DI saugumas (`airedteaming/`)**:

- Raudonųjų komandų (red team) testavimas DI saugumui
- Saugumo spragų skanavimas
- Atsakingos DI praktikos

---

## 4. Sveikiname 🏆

Sėkmingai panaudojote GitHub Copilot Chat su MCP serveriais, kad ištirtumėte saugyklą.

- [X] Aktyvavote GitHub Copilot Azure palaikymui
- [X] Supratote programos architektūrą
- [X] Ištirtėte AZD šablono struktūrą

Tai suteikia supratimą apie šio šablono _infrastruktūrą kaip kodą_ išteklius. Toliau peržiūrėsime AZD konfigūracijos failą.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->