<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-25T02:27:31+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "ro"
}
-->
# 3. Deconstruiți un Șablon

!!! tip "LA SFÂRȘITUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Element
    - [ ] Element
    - [ ] Element
    - [ ] **Laborator 3:** 

---

Cu șabloanele AZD și Azure Developer CLI (`azd`), putem începe rapid călătoria noastră de dezvoltare AI cu depozite standardizate care oferă cod de exemplu, infrastructură și fișiere de configurare - sub forma unui proiect _starter_ gata de implementat.

**Dar acum, trebuie să înțelegem structura proiectului și baza de cod - și să fim capabili să personalizăm șablonul AZD - fără nicio experiență sau înțelegere prealabilă a AZD!**

---

## 1. Activarea GitHub Copilot

### 1.1 Instalarea GitHub Copilot Chat

Este timpul să explorăm [GitHub Copilot cu Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Acum, putem folosi limbaj natural pentru a descrie sarcina noastră la un nivel înalt și să primim asistență în execuție. Pentru acest laborator, vom folosi [planul gratuit Copilot](https://github.com/github-copilot/signup), care are o limită lunară pentru completări și interacțiuni de chat.

Extensia poate fi instalată din marketplace, dar ar trebui să fie deja disponibilă în mediul tău Codespaces. _Click pe `Open Chat` din meniul derulant al pictogramei Copilot - și tastează un prompt precum `What can you do?`_ - este posibil să ți se solicite să te autentifici. **GitHub Copilot Chat este gata**.

### 1.2. Instalarea Serverelor MCP

Pentru ca modul Agent să fie eficient, acesta are nevoie de acces la instrumentele potrivite pentru a-l ajuta să recupereze cunoștințe sau să ia măsuri. Aici intervin serverele MCP. Vom configura următoarele servere:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Pentru a le activa:

1. Creează un fișier numit `.vscode/mcp.json` dacă nu există
1. Copiază următorul conținut în acel fișier - și pornește serverele!
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

??? warning "Este posibil să primești o eroare că `npx` nu este instalat (click pentru a extinde soluția)"

      Pentru a rezolva, deschide fișierul `.devcontainer/devcontainer.json` și adaugă această linie în secțiunea de funcționalități. Apoi reconstruiește containerul. Acum ar trebui să ai `npx` instalat.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testarea GitHub Copilot Chat

**Mai întâi folosește `az login` pentru a te autentifica cu Azure din linia de comandă VS Code.**

Acum ar trebui să poți interoga starea abonamentului tău Azure și să pui întrebări despre resursele sau configurația implementată. Încearcă aceste prompturi:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

De asemenea, poți pune întrebări despre documentația Azure și să primești răspunsuri bazate pe serverul Microsoft Docs MCP. Încearcă aceste prompturi:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Sau poți solicita fragmente de cod pentru a finaliza o sarcină. Încearcă acest prompt:

1. `Give me a Python code example that uses AAD for an interactive chat client`

În modul `Ask`, acesta va oferi cod pe care îl poți copia și încerca. În modul `Agent`, acesta poate merge un pas mai departe și crea resursele relevante pentru tine - inclusiv scripturi de configurare și documentație - pentru a te ajuta să execuți acea sarcină.

**Acum ești pregătit să începi explorarea depozitului de șabloane**

---

## 2. Deconstruiți Arhitectura

??? prompt "ASK: Explică arhitectura aplicației din docs/images/architecture.png în 1 paragraf"

      Această aplicație este o aplicație de chat alimentată de AI, construită pe Azure, care demonstrează o arhitectură modernă bazată pe agenți. Soluția se concentrează pe o Azure Container App care găzduiește codul principal al aplicației, care procesează inputul utilizatorului și generează răspunsuri inteligente printr-un agent AI. 
      
      Arhitectura utilizează Azure AI Foundry Project ca fundație pentru capabilitățile AI, conectându-se la serviciile Azure AI care oferă modelele de limbaj de bază (cum ar fi GPT-4o-mini) și funcționalitatea agentului. Interacțiunile utilizatorului trec printr-un frontend bazat pe React către un backend FastAPI care comunică cu serviciul agentului AI pentru generarea răspunsurilor contextuale. 
      
      Sistemul încorporează capabilități de recuperare a cunoștințelor prin căutare de fișiere sau serviciul Azure AI Search, permițând agentului să acceseze și să citeze informații din documentele încărcate. Pentru excelență operațională, arhitectura include monitorizare cuprinzătoare prin Application Insights și Log Analytics Workspace pentru trasabilitate, jurnalizare și optimizarea performanței. 
      
      Azure Storage oferă stocare blob pentru datele aplicației și fișierele încărcate, în timp ce Managed Identity asigură accesul securizat între resursele Azure fără a stoca acreditive. Întreaga soluție este proiectată pentru scalabilitate și mentenabilitate, cu aplicația containerizată scalând automat în funcție de cerere, oferind în același timp securitate, monitorizare și capabilități CI/CD integrate prin ecosistemul de servicii gestionate Azure.

![Architecture](../../../../../translated_images/ro/architecture.48d94861e6e6cdc0.png)

---

## 3. Structura Depozitului

!!! prompt "ASK: Explică structura folderului șablonului. Începe cu un diagramă ierarhică vizuală."

??? info "ANSWER: Diagramă Ierarhică Vizuală"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configurare & Setup
      │   ├── azure.yaml                    # Configurare Azure Developer CLI
      │   ├── docker-compose.yaml           # Containere pentru dezvoltare locală
      │   ├── pyproject.toml                # Configurare proiect Python
      │   ├── requirements-dev.txt          # Dependențe pentru dezvoltare
      │   └── .devcontainer/                # Setup container VS Code
      │
      ├── 🏗️ Infrastructură (infra/)
      │   ├── main.bicep                    # Șablon principal de infrastructură
      │   ├── api.bicep                     # Resurse specifice API
      │   ├── main.parameters.json          # Parametri de infrastructură
      │   └── core/                         # Componente modulare de infrastructură
      │       ├── ai/                       # Configurări servicii AI
      │       ├── host/                     # Infrastructură de găzduire
      │       ├── monitor/                  # Monitorizare și jurnalizare
      │       ├── search/                   # Setup Azure AI Search
      │       ├── security/                 # Securitate și identitate
      │       └── storage/                  # Configurări cont de stocare
      │
      ├── 💻 Sursa Aplicației (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Intrare aplicație FastAPI
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
      │   │   └── embeddings.csv            # Embedding-uri pre-computate
      │   ├── files/                        # Fișiere bază de cunoștințe
      │   │   ├── customer_info_*.json      # Exemple date clienți
      │   │   └── product_info_*.md         # Documentație produse
      │   ├── Dockerfile                    # Configurare container
      │   └── requirements.txt              # Dependențe Python
      │
      ├── 🔧 Automatizare & Scripturi (scripts/)
      │   ├── postdeploy.sh/.ps1           # Setup post-implementare
      │   ├── setup_credential.sh/.ps1     # Configurare acreditive
      │   ├── validate_env_vars.sh/.ps1    # Validare mediu
      │   └── resolve_model_quota.sh/.ps1  # Gestionare cotă model
      │
      ├── 🧪 Testare & Evaluare
      │   ├── tests/                        # Teste unitare și de integrare
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Cadru de evaluare agent
      │   │   ├── evaluate.py               # Runner evaluare
      │   │   ├── eval-queries.json         # Interogări de test
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Teren de joacă pentru dezvoltare
      │   │   ├── 1-quickstart.py           # Exemple de început
      │   │   └── aad-interactive-chat.py   # Exemple de autentificare
      │   └── airedteaming/                 # Evaluare siguranță AI
      │       └── ai_redteaming.py          # Testare echipă roșie
      │
      ├── 📚 Documentație (docs/)
      │   ├── deployment.md                 # Ghid de implementare
      │   ├── local_development.md          # Instrucțiuni setup local
      │   ├── troubleshooting.md            # Probleme comune & soluții
      │   ├── azure_account_setup.md        # Prerechizite Azure
      │   └── images/                       # Resurse documentație
      │
      └── 📄 Metadata Proiect
         ├── README.md                     # Prezentare generală proiect
         ├── CODE_OF_CONDUCT.md           # Ghiduri comunitare
         ├── CONTRIBUTING.md              # Ghid contribuții
         ├── LICENSE                      # Termeni licență
         └── next-steps.md                # Ghid post-implementare
      ```

### 3.1. Arhitectura Principală a Aplicației

Acest șablon urmează un model de **aplicație web full-stack** cu:

- **Backend**: Python FastAPI cu integrare Azure AI
- **Frontend**: TypeScript/React cu sistem de build Vite
- **Infrastructură**: Șabloane Azure Bicep pentru resurse cloud
- **Containerizare**: Docker pentru implementare consistentă

### 3.2 Infrastructură ca Cod (bicep)

Stratul de infrastructură folosește șabloane **Azure Bicep** organizate modular:

   - **`main.bicep`**: Orchestrarea tuturor resurselor Azure
   - **Modulele `core/`**: Componente reutilizabile pentru diferite servicii
      - Servicii AI (Azure OpenAI, AI Search)
      - Găzduire container (Azure Container Apps)
      - Monitorizare (Application Insights, Log Analytics)
      - Securitate (Key Vault, Managed Identity)

### 3.3 Sursa Aplicației (`src/`)

**Backend API (`src/api/`)**:

- API REST bazat pe FastAPI
- Integrare cu serviciul agentului Azure AI
- Gestionarea indexului de căutare pentru recuperarea cunoștințelor
- Capacități de încărcare și procesare fișiere

**Frontend (`src/frontend/`)**:

- SPA modern React/TypeScript
- Vite pentru dezvoltare rapidă și build-uri optimizate
- Interfață de chat pentru interacțiuni cu agentul

**Bază de Cunoștințe (`src/files/`)**:

- Date exemplu despre clienți și produse
- Demonstrează recuperarea cunoștințelor bazată pe fișiere
- Exemple în format JSON și Markdown

### 3.4 DevOps & Automatizare

**Scripturi (`scripts/`)**:

- Scripturi cross-platform PowerShell și Bash
- Validare și configurare mediu
- Configurare post-implementare
- Gestionare cotă model

**Integrare Azure Developer CLI**:

- Configurare `azure.yaml` pentru fluxuri de lucru `azd`
- Provizionare și implementare automatizată
- Gestionare variabile de mediu

### 3.5 Testare & Asigurarea Calității

**Cadru de Evaluare (`evals/`)**:

- Evaluarea performanței agentului
- Testarea calității interogare-răspuns
- Pipeline de evaluare automatizată

**Siguranța AI (`airedteaming/`)**:

- Testare echipă roșie pentru siguranța AI
- Scanare vulnerabilități de securitate
- Practici responsabile AI

---

## 4. Felicitări 🏆

Ai utilizat cu succes GitHub Copilot Chat cu serverele MCP pentru a explora depozitul.

- [X] Activat GitHub Copilot pentru Azure
- [X] Înțeles Arhitectura Aplicației
- [X] Explorată structura șablonului AZD

Acest lucru îți oferă o idee despre activele _infrastructură ca cod_ pentru acest șablon. În continuare, vom analiza fișierul de configurare pentru AZD.

---

