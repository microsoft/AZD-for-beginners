# 3. Deconstruiește un Șablon

!!! tip "LA FINALUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Activezi GitHub Copilot cu serverele MCP pentru asistență Azure
    - [ ] Înțelegi structura folderelor și componentele template-ului AZD
    - [ ] Explorezi tiparele de organizare infrastructure-as-code (Bicep)
    - [ ] **Lab 3:** Folosește GitHub Copilot pentru a explora și înțelege arhitectura depozitului

---


Cu șabloanele AZD și Azure Developer CLI (`azd`) putem începe rapid călătoria noastră de dezvoltare AI cu depozite standardizate care oferă cod exemplu, infrastructură și fișiere de configurare - sub forma unui proiect _starter_ gata de implementat.

**Dar acum, trebuie să înțelegem structura proiectului și baza de cod - și să putem personaliza șablonul AZD - fără experiență sau cunoștințe anterioare despre AZD!**

---

## 1. Activează GitHub Copilot

### 1.1 Instalează GitHub Copilot Chat

Este timpul să explorăm [GitHub Copilot cu Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Acum putem utiliza limbajul natural pentru a descrie sarcina la nivel înalt și să primim asistență pentru executare. Pentru acest laborator, vom folosi planul [Copilot Free](https://github.com/github-copilot/signup) care are o limită lunară pentru completări și interacțiuni de chat.

Extensia poate fi instalată din marketplace, dar ar trebui să fie deja disponibilă în mediul tău Codespaces. _Apasă `Open Chat` din meniul derulant al pictogramei Copilot și scrie o comandă precum `What can you do?`_ - s-ar putea să fii rugat să te autentifici. **GitHub Copilot Chat este gata de utilizare**.

### 1.2. Instalează Serverele MCP

Pentru ca modul Agent să fie eficient, are nevoie de acces la uneltele potrivite pentru a obține cunoștințe sau a efectua acțiuni. Aici serverele MCP pot ajuta. Vom configura următoarele servere:

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

??? warning "Este posibil să primești o eroare că `npx` nu este instalat (click pentru soluție)"

      Pentru a rezolva, deschide fișierul `.devcontainer/devcontainer.json` și adaugă această linie în secțiunea features. Apoi reconstruiește containerul. Acum ar trebui să ai `npx` instalat.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testează GitHub Copilot Chat

**Folosește mai întâi `az login` pentru a te autentifica în Azure din linia de comandă VS Code.**

Acum ar trebui să poți interoga starea abonamentului tău Azure și să pui întrebări despre resursele implementate sau configurație. Încearcă aceste comenzi:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Poți, de asemenea, să pui întrebări despre documentația Azure și să primești răspunsuri bazate pe serverul Microsoft Docs MCP. Încearcă aceste comenzi:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Sau poți cere fragmente de cod pentru a îndeplini o sarcină. Încearcă această comandă.

1. `Give me a Python code example that uses AAD for an interactive chat client`

În modul `Ask`, aceasta va oferi cod pe care îl poți copia și încerca. În modul `Agent`, acest pas poate merge mai departe și creează resursele relevante pentru tine - incluzând scripturi de configurare și documentație - pentru a te ajuta să execuți acea sarcină.

**Ești acum echipat pentru a începe să explorezi depozitul șablonului**

---

## 2. Deconstruiește Arhitectura

??? prompt "ÎNTREABĂ: Explică arhitectura aplicației din docs/images/architecture.png în 1 paragraf"

      Această aplicație este o aplicație de chat bazată pe AI construită pe Azure care demonstrează o arhitectură modernă bazată pe agenți. Soluția este centrată în jurul unui Azure Container App care găzduiește codul principal al aplicației, ce procesează intrările utilizatorului și generează răspunsuri inteligente printr-un agent AI.
      
      Arhitectura folosește Microsoft Foundry Project ca bază pentru capabilitățile AI, conectându-se la serviciile Azure AI care oferă modelele lingvistice subiacente (cum ar fi gpt-4.1-mini) și funcționalitatea agentului.
      
      Interacțiunile utilizatorilor trec printr-un frontend bazat pe React către un backend FastAPI care comunică cu serviciul agentului AI pentru generarea răspunsurilor contextuale.
      
      Sistemul încorporează capabilități de extragere a cunoștințelor prin căutare în fișiere sau serviciul Azure AI Search, permițând agentului să acceseze și să citeze informații din documentele încărcate.
      
      Pentru excelență operațională, arhitectura include monitorizare completă prin Application Insights și Log Analytics Workspace pentru urmărire, înregistrare și optimizarea performanței.
      
      Azure Storage oferă stocare blob pentru datele aplicației și încărcările de fișiere, în timp ce Managed Identity asigură acces securizat între resursele Azure fără stocarea credentialelor.
      
      Întreaga soluție este proiectată pentru scalabilitate și mentenanță, cu aplicația containerizată care scalează automat în funcție de cerere, oferind în același timp securitate încorporată, monitorizare și capabilități CI/CD prin ecosistemul de servicii gestionate Azure.

![Architecture](../../../../../translated_images/ro/architecture.48d94861e6e6cdc0.webp)

---

## 3. Structura Depozitului

!!! prompt "ÎNTREABĂ: Explică structura folderelor șablonului. Începe cu un diagram ierarhic vizual."

??? info "RĂSPUNS: Diagram ierarhic vizual"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Configurare Azure Developer CLI
      │   ├── docker-compose.yaml           # Containere pentru dezvoltare locală
      │   ├── pyproject.toml                # Configurare proiect Python
      │   ├── requirements-dev.txt          # Dependențe pentru dezvoltare
      │   └── .devcontainer/                # Configurare container dezvoltare VS Code
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Șablon principal de infrastructură
      │   ├── api.bicep                     # Resurse specifice API-ului
      │   ├── main.parameters.json          # Parametri infrastructură
      │   └── core/                         # Componente modulare de infrastructură
      │       ├── ai/                       # Configurări servicii AI
      │       ├── host/                     # Infrastructură hosting
      │       ├── monitor/                  # Monitorizare și logare
      │       ├── search/                   # Configurare Azure AI Search
      │       ├── security/                 # Securitate și identitate
      │       └── storage/                  # Configurări cont stocare
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Punct de intrare aplicație FastAPI
      │   │   ├── routes.py                 # Definiții rute API
      │   │   ├── search_index_manager.py  # Funcționalitate de căutare
      │   │   ├── data/                     # Gestionare date API
      │   │   ├── static/                   # Resurse web statice
      │   │   └── templates/                # Șabloane HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dependențe Node.js
      │   │   ├── vite.config.ts            # Configurare build Vite
      │   │   └── src/                      # Cod sursă frontend
      │   ├── data/                         # Fișiere de date exemplu
      │   │   └── embeddings.csv            # Embeddings pre-computate
      │   ├── files/                        # Fișiere bază de cunoștințe
      │   │   ├── customer_info_*.json      # Exemplu date clienți
      │   │   └── product_info_*.md         # Documentație produs
      │   ├── Dockerfile                    # Configurare container
      │   └── requirements.txt              # Dependențe Python
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Setup post-deployment
      │   ├── setup_credential.sh/.ps1     # Configurare credentiale
      │   ├── validate_env_vars.sh/.ps1    # Validare variabile mediu
      │   └── resolve_model_quota.sh/.ps1  # Gestionare cotă modele
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Teste unitare și integrări
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Cadru de evaluare agent
      │   │   ├── evaluate.py               # Rularea evaluărilor
      │   │   ├── eval-queries.json         # Interogări test
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Spațiu de dezvoltare
      │   │   ├── 1-quickstart.py           # Exemple de început rapid
      │   │   └── aad-interactive-chat.py   # Exemple de autentificare
      │   └── airedteaming/                 # Evaluare siguranță AI
      │       └── ai_redteaming.py          # Testare echipa roșie
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Ghid de implementare
      │   ├── local_development.md          # Instrucțiuni configurare locală
      │   ├── troubleshooting.md            # Probleme comune și soluții
      │   ├── azure_account_setup.md        # Cerințe prealabile Azure
      │   └── images/                       # Resurse documentație
      │
      └── 📄 Project Metadata
         ├── README.md                     # Prezentare generală proiect
         ├── CODE_OF_CONDUCT.md           # Regulament comunitate
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

### 3.2 Infra Ca Cod (bicep)

Stratul de infrastructură folosește șabloane **Azure Bicep** organizate modular:

   - **`main.bicep`**: Ordonează toate resursele Azure
   - **module `core/`**: Componente reutilizabile pentru servicii diferite
      - Servicii AI (Modele Microsoft Foundry, AI Search)
      - Găzduire container (Azure Container Apps)
      - Monitorizare (Application Insights, Log Analytics)
      - Securitate (Key Vault, Managed Identity)

### 3.3 Sursa Aplicației (`src/`)

**API Backend (`src/api/`)**:

- API REST bazat pe FastAPI
- Integrare Foundry Agents
- Administrare index de căutare pentru extragerea cunoștințelor
- Capacități încărcare și procesare fișiere

**Frontend (`src/frontend/`)**:

- SPA modern React/TypeScript
- Vite pentru dezvoltare rapidă și build optimizat
- Interfață chat pentru interacțiuni agent

**Baza de cunoștințe (`src/files/`)**:

- Date de exemplu despre clienți și produse
- Demonstrează extragerea cunoștințelor din fișiere
- Exemple în formate JSON și Markdown


### 3.4 DevOps & Automatizare

**Scripturi (`scripts/`)**:

- Scripturi PowerShell și Bash multi-platformă
- Validare și configurare mediu
- Configurare post-implementare
- Gestionare cotă modele

**Integrare Azure Developer CLI**:

- Configurare `azure.yaml` pentru fluxuri `azd`
- Provisionare și implementare automatizată
- Management variabile de mediu

### 3.5 Testare & Asigurare Calitate

**Cadru de evaluare (`evals/`)**:

- Evaluare performanță agent
- Testare calitate răspunsuri interogări
- Pipeline automatizat de evaluare

**Siguranța AI (`airedteaming/`)**:

- Testare red team pentru siguranța AI
- Scanare vulnerabilități de securitate
- Practici responsabile AI

---

## 4. Felicitări 🏆

Ai folosit cu succes GitHub Copilot Chat cu serverele MCP pentru a explora depozitul.

- [X] Ai activat GitHub Copilot pentru Azure
- [X] Ai înțeles arhitectura aplicației
- [X] Ai explorat structura șablonului AZD

Aceasta îți oferă o perspectivă asupra activelor _infrastructure as code_ pentru acest șablon. Următorul pas este să analizăm fișierul de configurare pentru AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinarea responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->