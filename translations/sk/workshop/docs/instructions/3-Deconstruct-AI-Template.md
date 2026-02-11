# 3. Rozobrať šablónu

!!! tip "NA KONCI TOHTO MODULU BUDETE VEDIEŤ"

    - [ ] Aktivovať GitHub Copilot s MCP servermi pre pomoc s Azure
    - [ ] Pochopiť štruktúru priečinkov a komponentov AZD šablóny
    - [ ] Preskúmať vzory organizácie infraštruktúry ako kód (Bicep)
    - [ ] **Lab 3:** Použiť GitHub Copilot na preskúmanie a pochopenie architektúry repozitára 

---


S AZD šablónami a Azure Developer CLI (`azd`) môžeme rýchlo naštartovať našu AI vývojovú cestu so štandardizovanými repozitármi, ktoré poskytujú ukážkový kód, infraštruktúru a konfiguračné súbory - vo forme pripraveného na nasadenie _štartovacieho_ projektu.

**Ale teraz potrebujeme porozumieť štruktúre projektu a kódbáze - a vedieť prispôsobiť AZD šablónu - bez predchádzajúcich skúseností alebo znalostí AZD!**

---

## 1. Aktivovať GitHub Copilot

### 1.1 Inštalácia GitHub Copilot Chat

Je čas preskúmať [GitHub Copilot v Agent móde](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Teraz môžeme použiť prirodzený jazyk na opísanie našej úlohy na vysokej úrovni a získať pomoc pri vykonávaní. Pre tento lab použijeme [bezplatný plán Copilot](https://github.com/github-copilot/signup), ktorý má mesačný limit pre dokončenia a chat interakcie.

Rozšírenie je možné nainštalovať z marketplace, ale malo by byť už k dispozícii vo vašom Codespaces prostredí. _Kliknite na `Open Chat` v rozbaľovacom zozname ikony Copilot - a zadajte prompt ako `What can you do?`_ - môže byť vyžadované prihlásenie. **GitHub Copilot Chat je pripravený**.

### 1.2. Inštalácia MCP serverov

Aby bol Agent mód efektívny, potrebuje prístup k správnym nástrojom, ktoré mu pomôžu získavať vedomosti alebo vykonávať akcie. Tu môžu pomôcť MCP servery. Nakonfigurujeme nasledujúce servery:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Ak ich chcete aktivovať:

1. Vytvorte súbor s názvom `.vscode/mcp.json`, ak neexistuje
1. Skopírujte nasledujúce do toho súboru - a spustite servery!
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

??? warning "Môže sa zobraziť chyba, že `npx` nie je nainštalovaný (kliknite pre zobrazenie opravy)"

      Na opravu otvorte súbor `.devcontainer/devcontainer.json` a pridajte tento riadok do sekcie features. Potom znovu zostavte kontajner. Mali by ste mať teraz nainštalovaný `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ``` 

---

### 1.3. Testovanie GitHub Copilot Chat

**Najprv použite `az login` na autentifikáciu do Azure z príkazového riadku VS Code.**

Teraz by ste mali byť schopní zistiť stav vášho Azure predplatného a pýtať sa na nasadené prostriedky alebo konfiguráciu. Skúste tieto prompt-y:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Môžete sa tiež pýtať na dokumentáciu Azure a získať odpovede vystavané na Microsoft Docs MCP serveri. Skúste tieto prompt-y:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Alebo môžete požiadať o ukážky kódu na dokončenie úlohy. Skúste tento prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

V móde `Ask` to poskytne kód, ktorý môžete kopírovať a vyskúšať. V móde `Agent` to môže urobiť krok ďalej a vytvoriť relevantné prostriedky pre vás - vrátane inštalačných skriptov a dokumentácie - aby vám pomohlo vykonať túto úlohu.

**Teraz ste pripravení začať preskúmavať šablónový repozitár**

---

## 2. Rozobrať architektúru

??? prompt "POŽIADAVKA: Vysvetlite architektúru aplikácie v docs/images/architecture.png v jednom odstavci"

      Táto aplikácia je chatová aplikácia poháňaná AI postavená na Azure, ktorá demonštruje modernú agentnú architektúru. Riešenie je sústredené okolo Azure Container App, ktorá hosťuje hlavný aplikačný kód, ktorý spracováva vstup používateľa a generuje inteligentné odpovede prostredníctvom AI agenta. 
      
      Architektúra využíva Microsoft Foundry Project ako základ pre AI schopnosti, pripájajúc sa k Azure AI Services, ktoré poskytujú podkladové jazykové modely (ako napr. GPT-4o-mini) a agentnú funkcionalitu. Používateľské interakcie prechádzajú cez frontend založený na React smerom na backend vo FastAPI, ktorý komunikuje so službou AI agenta pre generovanie kontextových odpovedí. 
      
      Systém zahrnuje schopnosti vyhľadávania vedomostí buď cez prehľadávanie súborov alebo službu Azure AI Search, čo umožňuje agentovi pristupovať k informáciám a citovať zdroje z nahraných dokumentov. Pre prevádzkovú dokonalosť architektúra obsahuje komplexné monitorovanie cez Application Insights a Log Analytics Workspace pre trasovanie, logovanie a optimalizáciu výkonu. 
      
      Azure Storage zabezpečuje blob storage pre aplikačné dáta a nahrávanie súborov, zatiaľ čo Managed Identity zaisťuje bezpečný prístup medzi Azure prostriedkami bez ukladania prihlasovacích údajov. Celé riešenie je navrhnuté s dôrazom na škálovateľnosť a udržiavateľnosť, pričom kontajnerizovaná aplikácia sa automaticky škáluje podľa dopytu a zároveň poskytuje zabudované bezpečnostné, monitorovacie a CI/CD schopnosti cez Azure managed služby.

![Architektúra](../../../../../translated_images/sk/architecture.48d94861e6e6cdc0.webp)

---

## 3. Štruktúra repozitára

!!! prompt "POŽIADAVKA: Vysvetlite štruktúru priečinkov šablóny. Začnite vizuálnym hierarchickým diagramom."

??? info "ODPOVEĎ: Vizuálny hierarchický diagram"

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

### 3.1. Základná architektúra aplikácie

Táto šablóna nasleduje vzor **full-stack webovej aplikácie** s:

- **Backend**: Python FastAPI s integráciou Azure AI
- **Frontend**: TypeScript/React s build systémom Vite
- **Infrastruktúra**: Azure Bicep šablóny pre cloudové prostriedky
- **Kontejnerizácia**: Docker pre konzistentné nasadenie

### 3.2 Infra ako kód (bicep)

Vrstva infraštruktúry používa **Azure Bicep** šablóny organizované modulárne:

   - **`main.bicep`**: Orchestruje všetky Azure prostriedky
   - **`core/` moduly**: Znovupoužiteľné komponenty pre rôzne služby
      - AI služby (Azure OpenAI, AI Search)
      - Hosting kontajnerov (Azure Container Apps)
      - Monitorovanie (Application Insights, Log Analytics)
      - Bezpečnosť (Key Vault, Managed Identity)

### 3.3 Zdroj aplikácie (`src/`)

**Backend API (`src/api/`)**:

- REST API založené na FastAPI
- Integrácia Foundry Agents
- Správa search indexu pre získavanie vedomostí
- Funkcionalita nahrávania a spracovania súborov

**Frontend (`src/frontend/`)**:

- Moderné React/TypeScript SPA
- Vite pre rýchly vývoj a optimalizované buildy
- Chat rozhranie pre interakcie s agentom

**Vedomosťová báza (`src/files/`)**:

- Ukážkové zákaznícke a produktové dáta
- Demonštruje získavanie vedomostí zo súborov
- Príklady vo formáte JSON a Markdown


### 3.4 DevOps a automatizácia

**Skripty (`scripts/`)**:

- Naprieč platformové PowerShell a Bash skripty
- Validácia a nastavenie prostredia
- Post-deploy konfigurácia
- Správa kvót modelov

**Integrácia Azure Developer CLI**:

- `azure.yaml` konfigurácia pre `azd` workflowy
- Automatizované provisioning a nasadenie
- Správa premenných prostredia

### 3.5 Testovanie a zabezpečenie kvality

**Rámec hodnotenia (`evals/`)**:

- Hodnotenie výkonu agenta
- Testovanie kvality odpovedí na dotazy
- Automatizovaný hodnotiaci pipeline

**Bezpečnosť AI (`airedteaming/`)**:

- Red team testovanie pre bezpečnosť AI
- Skenovanie bezpečnostných zraniteľností
- Praktiky zodpovedného AI

---

## 4. Gratulujeme 🏆

Úspešne ste použili GitHub Copilot Chat s MCP servermi na preskúmanie repozitára.

- [X] Aktivovali GitHub Copilot pre Azure
- [X] Pochopili architektúru aplikácie
- [X] Preskúmali štruktúru AZD šablóny

Toto vám poskytuje prehľad o aktívach _infrastructure as code_ pre túto šablónu. Ďalej sa pozrieme na konfiguračný súbor pre AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou AI prekladateľskej služby Co-op Translator (https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by mal byť považovaný za rozhodujúci. Pre kritické informácie sa odporúča profesionálny preklad vykonaný človekom. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->