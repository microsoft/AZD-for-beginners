# 3. Rastavi predložak

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Aktivirati GitHub Copilot s MCP poslužiteljima za Azure podršku
    - [ ] Razumjeti strukturu i komponente AZD predloška
    - [ ] Istražiti obrasce organizacije infrastrukture kao koda (Bicep)
    - [ ] **Lab 3:** Koristiti GitHub Copilot za istraživanje i razumijevanje arhitekture spremišta 

---


S AZD predlošcima i Azure Developer CLI-jem (`azd`) možemo brzo započeti naše AI razvojno putovanje sa standardiziranim spremištima koja pružaju primjerni kod, infrastrukturu i konfiguracijske datoteke - u obliku spremnog za implementaciju _starter_ projekta.

**Ali sada trebamo razumjeti strukturu projekta i kodnu bazu - te moći prilagoditi AZD predložak - bez ikakvog prethodnog iskustva ili poznavanja AZD-a!**

---

## 1. Aktiviraj GitHub Copilot

### 1.1 Instaliraj GitHub Copilot Chat

Vrijeme je za istraživanje [GitHub Copilot s Agent načinom](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Sad možemo koristiti prirodni jezik za opis zadatka na visokoj razini i dobiti pomoć pri izvršenju. Za ovaj laboratorij koristit ćemo [Copilot Free plan](https://github.com/github-copilot/signup) koji ima mjesečni limit za dovršetke i chat interakcije.

Ekstenziju možete instalirati s marketplacea, a često je već dostupna u Codespaces ili razvojnim kontejner okruženjima. _Kliknite `Open Chat` s padajućeg izbornika ikone Copilota – i upišite upit poput `What can you do?`_ – možda ćete biti upitani za prijavu. **GitHub Copilot Chat je spreman**.

### 1.2. Instaliraj MCP poslužitelje

Za učinkoviti Agent način, potrebno je da ima pristup pravim alatima za dohvat znanja ili poduzimanje akcija. Tu MCP poslužitelji pomažu. Konfigurirat ćemo sljedeće poslužitelje:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Za aktivaciju:

1. Kreirajte datoteku `.vscode/mcp.json` ako ne postoji
1. Kopirajte sljedeće u tu datoteku – i pokrenite poslužitelje!
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

??? warning "Možda ćete dobiti grešku da `npx` nije instaliran (kliknite za proširenje za popravak)"

      Za popravak, otvorite `.devcontainer/devcontainer.json` datoteku i dodajte ovaj redak u sekciju features. Zatim ponovno izgradite kontejner. Sada bi trebali imati instaliran `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testiraj GitHub Copilot Chat

**Prvo uporabi `azd auth login` za autentikaciju s Azureom iz VS Code komandne linije. Koristi `az login` samo ako planiraš direktno pokretati Azure CLI naredbe.**

Sada bi trebao moći upitivati stanje svoje Azure pretplate i postavljati pitanja o implementiranim resursima ili konfiguraciji. Isprobaj ove upite:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Također možeš postavljati pitanja o Azure dokumentaciji i dobiti odgovore temeljene na Microsoft Docs MCP poslužitelju. Isprobaj ove upite:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ili možeš zatražiti primjere koda za obavljanje zadatka. Isprobaj ovaj upit.

1. `Give me a Python code example that uses AAD for an interactive chat client`

U `Ask` načinu, ovo će pružiti kod koji možeš kopirati i isprobati. U `Agent` načinu, to može ići korak dalje i kreirati relevantne resurse za tebe – uključujući instalacijske skripte i dokumentaciju – kako bi ti pomogao u izvršenju tog zadatka.

**Sada si opremljen za početak istraživanja predložak spremišta**

---

## 2. Rastavi arhitekturu

??? prompt "PITANJE: Objasni arhitekturu aplikacije iz docs/images/architecture.png u jednom odlomku"

      Ova aplikacija je AI-pokretana chat aplikacija temeljena na Azureu koja demonstrira modernu arhitekturu zasnovanu na agentima. Rješenje se usredotočuje na Azure Container App koji hosta glavni kôd aplikacije, koji obrađuje korisnički unos i generira inteligentne odgovore putem AI agenta. 
      
      Arhitektura koristi Microsoft Foundry Project kao temelj AI mogućnosti, povezujući se s Azure AI Servisima koji pružaju osnovne jezične modele (kao što je gpt-4.1-mini) i funkcionalnost agenta. Korisničke interakcije prolaze kroz frontend baziran na Reactu do FastAPI backend-a koji komunicira s AI agent serviserom za generiranje kontekstualnih odgovora. 
      
      Sustav uključuje mogućnost dohvaćanja znanja putem pretraživanja datoteka ili Azure AI Search servisa, što omogućuje agentu pristup i citiranje informacija iz prenesenih dokumenata. Za operativnu izvrsnost, arhitektura uključuje sveobuhvatno praćenje kroz Application Insights i Log Analytics Workspace za praćenje, evidentiranje i optimizaciju performansi. 
      
      Azure Storage pruža blob pohranu za podatke aplikacije i prijenos datoteka, dok Managed Identity osigurava siguran pristup među Azure resursima bez pohrane vjerodajnica. Cijelo rješenje je dizajnirano za skalabilnost i održivost, s kontejneriziranom aplikacijom koja se automatski skalira prema potražnji i pruža ugrađene sigurnosne, nadzorne i CI/CD mogućnosti putem Azure-ovog upravljanog servisa ekosustava.

![Architecture](../../../../../translated_images/hr/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktura spremišta

!!! prompt "PITANJE: Objasni strukturu mape predloška. Počni s vizualnim hijerarhijskim dijagramom."

??? info "ODGOVOR: Vizualni hijerarhijski dijagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguracija i postavljanje
      │   ├── azure.yaml                    # Konfiguracija Azure Developer CLI
      │   ├── docker-compose.yaml           # Lokalni razvojni kontejneri
      │   ├── pyproject.toml                # Konfiguracija Python projekta
      │   ├── requirements-dev.txt          # Razvojne ovisnosti
      │   └── .devcontainer/                # Postavljanje VS Code razvojnog kontejnera
      │
      ├── 🏗️ Infrastruktura (infra/)
      │   ├── main.bicep                    # Glavni infrastrukturni predložak
      │   ├── api.bicep                     # API-specifični resursi
      │   ├── main.parameters.json          # Infrastrukturni parametri
      │   └── core/                         # Modularni infrastrukturni dijelovi
      │       ├── ai/                       # Konfiguracije AI servisa
      │       ├── host/                     # Hosting infrastruktura
      │       ├── monitor/                  # Praćenje i evidentiranje
      │       ├── search/                   # Azure AI Search postavljanje
      │       ├── security/                 # Sigurnost i identitet
      │       └── storage/                  # Konfiguracije računa za pohranu
      │
      ├── 💻 Izvor aplikacije (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Ulaz FastAPI aplikacije
      │   │   ├── routes.py                 # Definicije API ruta
      │   │   ├── search_index_manager.py   # Funkcionalnost pretraživanja
      │   │   ├── data/                     # Rukovanje API podacima
      │   │   ├── static/                   # Statička web imovina
      │   │   └── templates/                # HTML predlošci
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js ovisnosti
      │   │   ├── vite.config.ts            # Vite konfiguracija gradnje
      │   │   └── src/                      # Izvorni kod frontenda
      │   ├── data/                         # Primjeri podataka
      │   │   └── embeddings.csv            # Unaprijed izračunate ugrađenosti (embeddings)
      │   ├── files/                        # Datoteke baze znanja
      │   │   ├── customer_info_*.json      # Primjeri podataka o kupcima
      │   │   └── product_info_*.md         # Dokumentacija proizvoda
      │   ├── Dockerfile                    # Konfiguracija kontejnera
      │   └── requirements.txt              # Python ovisnosti
      │
      ├── 🔧 Automatizacija i skripte (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-implementacijsko postavljanje
      │   ├── setup_credential.sh/.ps1     # Konfiguracija vjerodajnica
      │   ├── validate_env_vars.sh/.ps1    # Validacija okruženja
      │   └── resolve_model_quota.sh/.ps1  # Upravljanje kvotom modela
      │
      ├── 🧪 Testiranje i evaluacija
      │   ├── tests/                        # Jedinični i integracijski testovi
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Okvir za evaluaciju agenata
      │   │   ├── evaluate.py               # Pokretač evaluacije
      │   │   ├── eval-queries.json         # Test upiti
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Razvojno igralište
      │   │   ├── 1-quickstart.py           # Primjeri za početak rada
      │   │   └── aad-interactive-chat.py   # Primjeri autentikacije
      │   └── airedteaming/                 # AI sigurnosna evaluacija
      │       └── ai_redteaming.py          # Testiranje Crvenog tima
      │
      ├── 📚 Dokumentacija (docs/)
      │   ├── deployment.md                 # Vodič za implementaciju
      │   ├── local_development.md          # Upute za lokalno postavljanje
      │   ├── troubleshooting.md            # Uobičajeni problemi i rješenja
      │   ├── azure_account_setup.md        # Preduvjeti za Azure
      │   └── images/                       # Dokumentacijska imovina
      │
      └── 📄 Metadata projekta
         ├── README.md                     # Pregled projekta
         ├── CODE_OF_CONDUCT.md           # Pravilnik zajednice
         ├── CONTRIBUTING.md              # Vodič za doprinos
         ├── LICENSE                      # Licencni uvjeti
         └── next-steps.md                # Upute nakon implementacije
      ```

### 3.1. Osnovna arhitektura aplikacije

Ovaj predložak slijedi obrazac **full-stack web aplikacije** sa:

- **Backend**: Python FastAPI s integracijom Azure AI
- **Frontend**: TypeScript/React s Vite build sustavom
- **Infrastruktura**: Azure Bicep predlošci za cloud resurse
- **Kontejnerizacija**: Docker za dosljednu implementaciju

### 3.2 Infra kao kod (bicep)

Infrastrukturni sloj koristi **Azure Bicep** predloške modularno organizirane:

   - **`main.bicep`**: Orkestrira sve Azure resurse
   - **`core/` moduli**: Ponovno upotrebljivi dijelovi za različite servise
      - AI servisi (Microsoft Foundry modeli, AI Search)
      - Hosting kontejnera (Azure Container Apps)
      - Praćenje (Application Insights, Log Analytics)
      - Sigurnost (Key Vault, Managed Identity)

### 3.3 Izvor aplikacije (`src/`)

**Backend API (`src/api/`)**:

- REST API baziran na FastAPI
- Integracija Foundry agenata
- Upravljanje indeksima pretraživanja za dohvat znanja
- Mogućnosti prijenosa i obrade datoteka

**Frontend (`src/frontend/`)**:

- Moderni React/TypeScript SPA
- Vite za brz razvoj i optimizirane buildove
- Chat sučelje za interakciju s agentom

**Baza znanja (`src/files/`)**:

- Primjeri podataka o kupcima i proizvodima
- Demonstrira dohvat znanja temeljen na datotekama
- Primjeri u JSON i Markdown formatu


### 3.4 DevOps i automatizacija

**Skripte (`scripts/`)**:

- Cross-platform PowerShell i Bash skripte
- Validacija i postavljanje okruženja
- Post-implementacijska konfiguracija
- Upravljanje kvotom modela

**Integracija s Azure Developer CLI**:

- Konfiguracija `azure.yaml` za `azd` radne tokove
- Automatizirano pripremanje i implementacija
- Upravljanje varijablama okruženja

### 3.5 Testiranje i osiguranje kvalitete

**Evaluacijski okvir (`evals/`)**:

- Evaluacija performansi agenta
- Testiranje kvalitete upit-odgovor
- Automatizirana procjena

**AI sigurnost (`airedteaming/`)**:

- Testiranje Crvenog tima za sigurnost AI-a
- Skener ranjivosti sigurnosti
- Prakse odgovornog AI-a

---

## 4. Čestitamo 🏆

Uspješno ste koristili GitHub Copilot Chat s MCP poslužiteljima za istraživanje spremišta.

- [X] Aktiviran GitHub Copilot za Azure
- [X] Razumljena arhitektura aplikacije
- [X] Istražena struktura AZD predloška

Ovo vam daje uvid u _infrastrukturu kao kod_ resurse za ovaj predložak. Sljedeće ćemo pogledati konfiguracijsku datoteku za AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden pomoću AI usluge prijevoda [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->