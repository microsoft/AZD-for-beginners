# 3. Deconstruiți un șablon

!!! tip "LA FINALUL ACESTUI MODUL VEI PUTEA"

    - [ ] Activați GitHub Copilot cu serverele MCP pentru asistență Azure
    - [ ] Înțelegeți structura folderelor șablonului AZD și componentele
    - [ ] Explorați modele de organizare infrastructură-ca-cod (Bicep)
    - [ ] **Lab 3:** Folosiți GitHub Copilot pentru a explora și înțelege arhitectura depozitului 

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _proiect de start_.

**But now, we need to understand the project structure and codebase - and be able to customize the AZD template - without any prior experience or understanding of AZD!**

---

## 1. Activați GitHub Copilot

### 1.1 Instalați GitHub Copilot Chat

It's time to explore [GitHub Copilot în modul Agent](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [Copilot Free plan](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

The extension can be installed from the marketplace, and it is often already available in Codespaces or dev container environments. _Click `Open Chat` from the Copilot icon drop-down - and type a prompt like `What can you do?`_ - you may be prompted to log in. **GitHub Copilot Chat is ready**.

### 1.2. Instalați serverele MCP

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [Server MCP Azure](../../../../../workshop/docs/instructions)
1. [Server MCP Microsoft Docs](../../../../../workshop/docs/instructions)

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

??? warning "S-ar putea să primiți o eroare că `npx` nu este instalat (faceți clic pentru a extinde soluția)"

      Pentru a remedia, deschideți fișierul `.devcontainer/devcontainer.json` și adăugați această linie în secțiunea features. Apoi reconstruiți containerul. Ar trebui să aveți acum `npx` instalat.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```


---

### 1.3. Testați GitHub Copilot Chat

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

## 2. Deconstruiți arhitectura

??? prompt "ÎNTREBARE: Explică arhitectura aplicației din docs/images/architecture.png în 1 paragraf"

      Această aplicație este o aplicație de chat alimentată de AI construită pe Azure care prezintă o arhitectură modernă bazată pe agenți. Soluția se concentrează în jurul unei Azure Container App care găzduiește codul principal al aplicației, care procesează intrările utilizatorilor și generează răspunsuri inteligente prin intermediul unui agent AI. 
      
      Arhitectura valorifică Microsoft Foundry Project ca fundație pentru capabilitățile AI, conectându-se la Azure AI Services care oferă modelele de limbaj subiacente (cum ar fi gpt-4.1-mini) și funcționalitatea agenților. Interacțiunile utilizatorilor trec printr-un front-end bazat pe React către un backend FastAPI care comunică cu serviciul agent AI pentru a genera răspunsuri contextuale. 
      
      Sistemul încorporează capabilități de recuperare a cunoștințelor prin căutare în fișiere sau serviciul Azure AI Search, permițând agentului să acceseze și să citeze informații din documentele încărcate. Pentru excelență operațională, arhitectura include o monitorizare cuprinzătoare prin Application Insights și Log Analytics Workspace pentru trasare, logging și optimizare a performanței. 
      
      Azure Storage oferă stocare blob pentru datele aplicației și încărcările de fișiere, în timp ce Managed Identity asigură acces securizat între resursele Azure fără stocarea credentialelor. Întreaga soluție este proiectată pentru scalabilitate și întreținere, aplicația containerizată scalând automat în funcție de cerere și oferind funcționalități încorporate de securitate, monitorizare și CI/CD prin ecosistemul de servicii gestionate Azure.

![Arhitectură](../../../../../translated_images/ro/architecture.48d94861e6e6cdc0.webp)

---

## 3. Structura depozitului

!!! prompt "ÎNTREBARE: Explică structura folderelor șablonului. Începe cu un diagramă ierarhică vizuală."

??? info "RĂSPUNS: Diagramă ierarhică vizuală"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configurare și setări
      │   ├── azure.yaml                    # Configurație Azure Developer CLI
      │   ├── docker-compose.yaml           # Containere pentru dezvoltare locală
      │   ├── pyproject.toml                # Configurație proiect Python
      │   ├── requirements-dev.txt          # Dependențe pentru dezvoltare
      │   └── .devcontainer/                # Configurare dev container VS Code
      │
      ├── 🏗️ Infrastructură (infra/)
      │   ├── main.bicep                    # Șablon principal de infrastructură
      │   ├── api.bicep                     # Resurse specifice API-ului
      │   ├── main.parameters.json          # Parametri pentru infrastructură
      │   └── core/                         # Componente de infrastructură modulare
      │       ├── ai/                       # Configurări servicii AI
      │       ├── host/                     # Infrastructură de găzduire
      │       ├── monitor/                  # Monitorizare și logare
      │       ├── search/                   # Configurare Azure AI Search
      │       ├── security/                 # Securitate și identitate
      │       └── storage/                  # Configurări cont stocare
      │
      ├── 💻 Sursă aplicație (src/)
      │   ├── api/                          # API backend
      │   │   ├── main.py                   # Punctul de intrare al aplicației FastAPI
      │   │   ├── routes.py                 # Definiții rute API
      │   │   ├── search_index_manager.py   # Funcționalitate de căutare
      │   │   ├── data/                     # Gestionare date API
      │   │   ├── static/                   # Resurse web statice
      │   │   └── templates/                # Șabloane HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dependențe Node.js
      │   │   ├── vite.config.ts            # Configurare build Vite
      │   │   └── src/                      # Cod sursă frontend
      │   ├── data/                         # Fișiere de date exemplu
      │   │   └── embeddings.csv            # Embeddings precomputate
      │   ├── files/                        # Fișiere bază de cunoștințe
      │   │   ├── customer_info_*.json      # Exemple de date clienți
      │   │   └── product_info_*.md         # Documentație produs
      │   ├── Dockerfile                    # Configurare container
      │   └── requirements.txt              # Dependențe Python
      │
      ├── 🔧 Automatizare & Scripturi (scripts/)
      │   ├── postdeploy.sh/.ps1           # Configurație post-deployment
      │   ├── setup_credential.sh/.ps1     # Configurare credentiale
      │   ├── validate_env_vars.sh/.ps1    # Validare variabile de mediu
      │   └── resolve_model_quota.sh/.ps1  # Management cotă modele
      │
      ├── 🧪 Testare & Evaluare
      │   ├── tests/                        # Teste unitare și de integrare
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Cadru de evaluare a agenților
      │   │   ├── evaluate.py               # Runner evaluare
      │   │   ├── eval-queries.json         # Interogări de test
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Spațiu de dezvoltare
      │   │   ├── 1-quickstart.py           # Exemple de început
      │   │   └── aad-interactive-chat.py   # Exemple autentificare
      │   └── airedteaming/                 # Evaluare siguranță AI
      │       └── ai_redteaming.py          # Testare red team
      │
      ├── 📚 Documentație (docs/)
      │   ├── deployment.md                 # Ghid de deploy
      │   ├── local_development.md          # Instrucțiuni pentru configurare locală
      │   ├── troubleshooting.md            # Probleme comune și remedieri
      │   ├── azure_account_setup.md        # Precondiții Azure
      │   └── images/                       # Resurse documentație
      │
      └── 📄 Metadate proiect
         ├── README.md                     # Prezentare generală a proiectului
         ├── CODE_OF_CONDUCT.md           # Ghiduri comunitate
         ├── CONTRIBUTING.md              # Ghid de contribuție
         ├── LICENSE                      # Termeni licență
         └── next-steps.md                # Ghid post-deployment
      ```

### 3.1. Arhitectura principală a aplicației

This template follows a **aplicație web full-stack** pattern with:

- **Backend**: Python FastAPI cu integrare Azure AI
- **Frontend**: TypeScript/React cu sistem de build Vite
- **Infrastructure**: șabloane Azure Bicep pentru resurse cloud
- **Containerization**: Docker pentru deploy consistent

### 3.2 Infrastructură ca Cod (Bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: Orchestră toate resursele Azure
   - **`core/` modules**: Componente reutilizabile pentru diferite servicii
      - Servicii AI (Microsoft Foundry Models, AI Search)
      - Găzduire containere (Azure Container Apps)
      - Monitorizare (Application Insights, Log Analytics)
      - Securitate (Key Vault, Managed Identity)

### 3.3 Sursa aplicației (`src/`)

**API backend (`src/api/`)**:

- REST API bazat pe FastAPI
- Integrare cu Foundry Agents
- Gestionare index de căutare pentru recuperarea cunoștințelor
- Capabilități de încărcare și procesare fișiere

**Frontend (`src/frontend/`)**:

- SPA modern React/TypeScript
- Vite pentru dezvoltare rapidă și build-uri optimizate
- Interfață de chat pentru interacțiuni cu agentul

**Bază de cunoștințe (`src/files/`)**:

- Date de exemplu despre clienți și produse
- Demonstrează recuperarea cunoștințelor din fișiere
- Exemple în formatele JSON și Markdown


### 3.4 DevOps & Automatizare

**Scripts (`scripts/`)**:

- Scripturi PowerShell și Bash multi-platformă
- Validare și configurare mediu
- Configurare post-deploy
- Gestionare cotă modele

**Integrare Azure Developer CLI**:

- `azure.yaml` configuration for `azd` workflows
- Provisionare și deployment automatizate
- Gestionare variabile de mediu

### 3.5 Testare și Asigurarea Calității

**Cadru de evaluare (`evals/`)**:

- Evaluarea performanței agenților
- Testare calitate răspuns interogare
- Pipeline de evaluare automatizată

**Siguranța AI (`airedteaming/`)**:

- Testare red team pentru siguranța AI
- Scanare vulnerabilități de securitate
- Practici AI responsabile

---

## 4. Felicitări 🏆

You successfully used GitHub Copilot Chat with MCP servers, to explore the repository.

- [X] Ați activat GitHub Copilot pentru Azure
- [X] Ați înțeles arhitectura aplicației
- [X] Ați explorat structura șablonului AZD

This gives you a sense of the _infrastructură ca cod_ assets for this template. Next, we'll look at the configuration file for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu suntem răspunzători pentru eventuale neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->