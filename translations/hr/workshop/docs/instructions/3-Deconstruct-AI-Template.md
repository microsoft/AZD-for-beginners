<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-25T02:29:26+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "hr"
}
-->
# 3. Raspakirajte predložak

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Stavka
    - [ ] Stavka
    - [ ] Stavka
    - [ ] **Laboratorij 3:** 

---

Uz AZD predloške i Azure Developer CLI (`azd`) možemo brzo započeti naš AI razvojni put koristeći standardizirane repozitorije koji pružaju uzorak koda, infrastrukturu i konfiguracijske datoteke - u obliku spremnog za implementaciju _početnog_ projekta.

**Ali sada, trebamo razumjeti strukturu projekta i kodnu bazu - te biti sposobni prilagoditi AZD predložak - bez ikakvog prethodnog iskustva ili razumijevanja AZD-a!**

---

## 1. Aktivirajte GitHub Copilot

### 1.1 Instalirajte GitHub Copilot Chat

Vrijeme je da istražimo [GitHub Copilot s Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Sada možemo koristiti prirodni jezik za opisivanje našeg zadatka na visokoj razini i dobiti pomoć u izvršenju. Za ovaj laboratorij koristit ćemo [Copilot Free plan](https://github.com/github-copilot/signup) koji ima mjesečno ograničenje za dovršetke i interakcije u chatu.

Ekstenzija se može instalirati iz marketplacea, ali bi već trebala biti dostupna u vašem Codespaces okruženju. _Kliknite `Open Chat` iz padajućeg izbornika Copilot ikone - i unesite upit poput `What can you do?`_ - možda ćete biti zatraženi da se prijavite. **GitHub Copilot Chat je spreman**.

### 1.2 Instalirajte MCP servere

Da bi Agent Mode bio učinkovit, treba mu pristup pravim alatima koji mu pomažu u dohvaćanju znanja ili izvršavanju radnji. Tu MCP serveri mogu pomoći. Konfigurirat ćemo sljedeće servere:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Za aktivaciju ovih servera:

1. Kreirajte datoteku pod nazivom `.vscode/mcp.json` ako ne postoji
1. Kopirajte sljedeće u tu datoteku - i pokrenite servere!
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

??? warning "Možda ćete dobiti grešku da `npx` nije instaliran (kliknite za proširenje i rješenje)"

      Da biste to riješili, otvorite datoteku `.devcontainer/devcontainer.json` i dodajte ovu liniju u sekciju značajki. Zatim ponovno izgradite container. Sada biste trebali imati instaliran `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 Testirajte GitHub Copilot Chat

**Prvo koristite `az login` za autentifikaciju s Azureom iz naredbenog retka VS Code-a.**

Sada biste trebali moći upitati status svoje Azure pretplate i postavljati pitanja o implementiranim resursima ili konfiguraciji. Isprobajte ove upite:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Također možete postavljati pitanja o Azure dokumentaciji i dobiti odgovore temeljene na Microsoft Docs MCP serveru. Isprobajte ove upite:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ili možete zatražiti isječke koda za dovršetak zadatka. Isprobajte ovaj upit:

1. `Give me a Python code example that uses AAD for an interactive chat client`

U `Ask` modu, ovo će pružiti kod koji možete kopirati i isprobati. U `Agent` modu, ovo može ići korak dalje i kreirati relevantne resurse za vas - uključujući skripte za postavljanje i dokumentaciju - kako bi vam pomoglo u izvršenju tog zadatka.

**Sada ste spremni za istraživanje repozitorija predloška**

---

## 2. Raspakirajte arhitekturu

??? prompt "PITAJ: Objasnite arhitekturu aplikacije u docs/images/architecture.png u jednom odlomku"

      Ova aplikacija je AI-pokretana aplikacija za chat izgrađena na Azureu koja demonstrira modernu arhitekturu temeljenu na agentima. Rješenje se fokusira na Azure Container App koji hostira glavni kod aplikacije, koji obrađuje korisnički unos i generira inteligentne odgovore putem AI agenta. 
      
      Arhitektura koristi Azure AI Foundry Project kao temelj za AI mogućnosti, povezujući se s Azure AI Services koje pružaju osnovne jezične modele (poput GPT-4o-mini) i funkcionalnost agenta. Korisničke interakcije prolaze kroz React-based frontend do FastAPI backend-a koji komunicira s AI agent servisom za generiranje kontekstualnih odgovora. 
      
      Sustav uključuje mogućnosti dohvaćanja znanja putem pretraživanja datoteka ili Azure AI Search servisa, omogućujući agentu pristup i citiranje informacija iz prenesenih dokumenata. Za operativnu izvrsnost, arhitektura uključuje sveobuhvatno praćenje putem Application Insights i Log Analytics Workspace za praćenje, zapisivanje i optimizaciju performansi. 
      
      Azure Storage pruža blob storage za podatke aplikacije i prijenos datoteka, dok Managed Identity osigurava siguran pristup između Azure resursa bez pohranjivanja vjerodajnica. Cijelo rješenje je dizajnirano za skalabilnost i održivost, s aplikacijom u containeru koja se automatski skalira prema potražnji dok pruža ugrađenu sigurnost, praćenje i CI/CD mogućnosti kroz Azureov ekosustav upravljanih usluga.

![Arhitektura](../../../../../translated_images/hr/architecture.48d94861e6e6cdc0.png)

---

## 3. Struktura repozitorija

!!! prompt "PITAJ: Objasnite strukturu mape predloška. Započnite s vizualnim hijerarhijskim dijagramom."

??? info "ODGOVOR: Vizualni hijerarhijski dijagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguracija i postavljanje
      │   ├── azure.yaml                    # Konfiguracija Azure Developer CLI-a
      │   ├── docker-compose.yaml           # Lokalni razvojni containeri
      │   ├── pyproject.toml                # Konfiguracija Python projekta
      │   ├── requirements-dev.txt          # Ovisnosti za razvoj
      │   └── .devcontainer/                # Postavljanje VS Code dev containera
      │
      ├── 🏗️ Infrastruktura (infra/)
      │   ├── main.bicep                    # Glavni infrastrukturni predložak
      │   ├── api.bicep                     # Resursi specifični za API
      │   ├── main.parameters.json          # Parametri infrastrukture
      │   └── core/                         # Modularne infrastrukturne komponente
      │       ├── ai/                       # Konfiguracije AI servisa
      │       ├── host/                     # Hosting infrastruktura
      │       ├── monitor/                  # Praćenje i zapisivanje
      │       ├── search/                   # Postavljanje Azure AI Search-a
      │       ├── security/                 # Sigurnost i identitet
      │       └── storage/                  # Konfiguracije storage računa
      │
      ├── 💻 Izvor aplikacije (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Ulazna točka FastAPI aplikacije
      │   │   ├── routes.py                 # Definicije API ruta
      │   │   ├── search_index_manager.py   # Funkcionalnost pretraživanja
      │   │   ├── data/                     # Obrada podataka API-ja
      │   │   ├── static/                   # Statički web resursi
      │   │   └── templates/                # HTML predlošci
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js ovisnosti
      │   │   ├── vite.config.ts            # Konfiguracija Vite build sustava
      │   │   └── src/                      # Izvorni kod frontenda
      │   ├── data/                         # Uzorci datoteka podataka
      │   │   └── embeddings.csv            # Pre-izračunati embeddings
      │   ├── files/                        # Datoteke baze znanja
      │   │   ├── customer_info_*.json      # Uzorci podataka o korisnicima
      │   │   └── product_info_*.md         # Dokumentacija proizvoda
      │   ├── Dockerfile                    # Konfiguracija containera
      │   └── requirements.txt              # Python ovisnosti
      │
      ├── 🔧 Automatizacija i skripte (scripts/)
      │   ├── postdeploy.sh/.ps1           # Postavljanje nakon implementacije
      │   ├── setup_credential.sh/.ps1     # Konfiguracija vjerodajnica
      │   ├── validate_env_vars.sh/.ps1    # Validacija okruženja
      │   └── resolve_model_quota.sh/.ps1  # Upravljanje kvotama modela
      │
      ├── 🧪 Testiranje i evaluacija
      │   ├── tests/                        # Jedinični i integracijski testovi
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Okvir za evaluaciju agenta
      │   │   ├── evaluate.py               # Pokretač evaluacije
      │   │   ├── eval-queries.json         # Testni upiti
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Igralište za razvoj
      │   │   ├── 1-quickstart.py           # Primjeri za početak
      │   │   └── aad-interactive-chat.py   # Primjeri autentifikacije
      │   └── airedteaming/                 # Evaluacija sigurnosti AI-a
      │       └── ai_redteaming.py          # Testiranje red tima
      │
      ├── 📚 Dokumentacija (docs/)
      │   ├── deployment.md                 # Vodič za implementaciju
      │   ├── local_development.md          # Upute za lokalno postavljanje
      │   ├── troubleshooting.md            # Uobičajeni problemi i rješenja
      │   ├── azure_account_setup.md        # Preduvjeti za Azure
      │   └── images/                       # Resursi za dokumentaciju
      │
      └── 📄 Metadata projekta
         ├── README.md                     # Pregled projekta
         ├── CODE_OF_CONDUCT.md           # Smjernice zajednice
         ├── CONTRIBUTING.md              # Vodič za doprinos
         ├── LICENSE                      # Uvjeti licenciranja
         └── next-steps.md                # Upute nakon implementacije
      ```

### 3.1. Osnovna arhitektura aplikacije

Ovaj predložak slijedi obrazac **full-stack web aplikacije** s:

- **Backend**: Python FastAPI s Azure AI integracijom
- **Frontend**: TypeScript/React s Vite build sustavom
- **Infrastruktura**: Azure Bicep predlošci za cloud resurse
- **Containerizacija**: Docker za dosljednu implementaciju

### 3.2 Infrastruktura kao kod (bicep)

Sloj infrastrukture koristi **Azure Bicep** predloške organizirane modularno:

   - **`main.bicep`**: Orkestrira sve Azure resurse
   - **`core/` moduli**: Ponovno upotrebljivi dijelovi za različite servise
      - AI servisi (Azure OpenAI, AI Search)
      - Hosting containera (Azure Container Apps)
      - Praćenje (Application Insights, Log Analytics)
      - Sigurnost (Key Vault, Managed Identity)

### 3.3 Izvor aplikacije (`src/`)

**Backend API (`src/api/`)**:

- REST API temeljen na FastAPI-u
- Integracija Azure AI Agent servisa
- Upravljanje indeksima pretraživanja za dohvaćanje znanja
- Mogućnosti prijenosa i obrade datoteka

**Frontend (`src/frontend/`)**:

- Moderni React/TypeScript SPA
- Vite za brzo razvijanje i optimizirane buildove
- Sučelje za chat s interakcijama agenta

**Baza znanja (`src/files/`)**:

- Uzorci podataka o korisnicima i proizvodima
- Demonstrira dohvaćanje znanja temeljenog na datotekama
- Primjeri u JSON i Markdown formatu

### 3.4 DevOps i automatizacija

**Skripte (`scripts/`)**:

- Skripte za PowerShell i Bash na više platformi
- Validacija i postavljanje okruženja
- Konfiguracija nakon implementacije
- Upravljanje kvotama modela

**Integracija Azure Developer CLI-a**:

- Konfiguracija `azure.yaml` za `azd` tijekove rada
- Automatizirano postavljanje i implementacija
- Upravljanje varijablama okruženja

### 3.5 Testiranje i osiguranje kvalitete

**Okvir za evaluaciju (`evals/`)**:

- Evaluacija performansi agenta
- Testiranje kvalitete upit-odgovor
- Automatizirani evaluacijski proces

**Sigurnost AI-a (`airedteaming/`)**:

- Testiranje red tima za sigurnost AI-a
- Skeniranje ranjivosti
- Prakse odgovornog AI-a

---

## 4. Čestitamo 🏆

Uspješno ste koristili GitHub Copilot Chat s MCP serverima za istraživanje repozitorija.

- [X] Aktivirali GitHub Copilot za Azure
- [X] Razumjeli arhitekturu aplikacije
- [X] Istražili strukturu AZD predloška

Ovo vam daje uvid u _infrastrukturu kao kod_ resurse za ovaj predložak. Sljedeće, pogledat ćemo konfiguracijsku datoteku za AZD.

---

