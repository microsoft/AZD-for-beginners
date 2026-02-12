# 3. Rastavi predložak

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Aktivirati GitHub Copilot s MCP serverima za Azure pomoć
    - [ ] Razumjeti strukturu i komponente AZD predloška
    - [ ] Istražiti obrasce organizacije infrastrukture kao koda (Bicep)
    - [ ] **Lab 3:** Koristiti GitHub Copilot za istraživanje i razumijevanje arhitekture repozitorija

---


Uz AZD predloške i Azure Developer CLI (`azd`) možemo brzo započeti naš AI razvojni put sa standardiziranim repozitorijima koji pružaju uzorke koda, infrastrukturu i konfiguracijske datoteke - u obliku spremnog za implementaciju _starter_ projekta.

**Ali sada moramo razumjeti strukturu projekta i kodnu bazu - te biti u mogućnosti prilagoditi AZD predložak - bez prethodnog iskustva ili razumijevanja AZD!**

---

## 1. Aktiviraj GitHub Copilot

### 1.1 Instaliraj GitHub Copilot Chat

Vrijeme je za istraživanje [GitHub Copilot s Agent načinom](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Sada možemo koristiti prirodni jezik za opis zadatka na višoj razini i dobiti pomoć u izvršavanju. Za ovaj lab koristit ćemo [Copilot Free plan](https://github.com/github-copilot/signup) koji ima mjesečno ograničenje za dovršenja i chat interakcije.

Proširenje se može instalirati s marketplacea, ali bi već trebalo biti dostupno u vašem Codespaces okruženju. _Kliknite `Open Chat` u padajućem izborniku Copilot ikone - i upišite upit poput `What can you do?`_ - možda će biti potrebno da se prijavite. **GitHub Copilot Chat je spreman**.

### 1.2. Instaliraj MCP Servere

Da bi Agent način bio učinkovit, potrebno mu je pristup pravim alatima koji mu pomažu dohvatiti znanje ili poduzeti radnje. Ovdje mogu pomoći MCP serveri. Konfigurirat ćemo sljedeće servere:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Za aktivaciju:

1. Kreirajte datoteku `.vscode/mcp.json` ako ne postoji
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

??? warning "Možda ćete dobiti grešku da `npx` nije instaliran (kliknite za proširenje i popravak)"

      Za popravak, otvorite `.devcontainer/devcontainer.json` datoteku i dodajte ovaj redak u sekciju features. Zatim ponovno izgradite kontejner. Sada bi `npx` trebao biti instaliran.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testiraj GitHub Copilot Chat

**Prvo upotrijebite `az login` za autentifikaciju u Azure iz VS Code terminala.**

Sada biste trebali moći ispitivati status vaše Azure pretplate i postavljati pitanja o implementiranim resursima ili konfiguraciji. Isprobajte ove upite:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Također možete postavljati pitanja o Azure dokumentaciji i dobivati odgovore temeljene na Microsoft Docs MCP serveru. Isprobajte ove upite:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ili možete zatražiti primjere koda za dovršetak zadatka. Isprobajte ovaj upit.

1. `Give me a Python code example that uses AAD for an interactive chat client`

U `Ask` načinu, ovo će dati kod koji možete kopirati i isprobati. U `Agent` načinu, ovo može otići korak dalje i kreirati relevantne resurse za vas - uključujući skripte za postavljanje i dokumentaciju - da vam pomogne izvršiti taj zadatak.

**Sada ste opremljeni za početak istraživanja predložaka repozitorija**

---

## 2. Rastavi arhitekturu

??? prompt "PITANJE: Objasi arhitekturu aplikacije na docs/images/architecture.png u jednom odlomku"

      Ova aplikacija je chat aplikacija pokretana umjetnom inteligencijom izgrađena na Azureu koja demonstrira modernu arhitekturu temeljenu na agentima. Rješenje se fokusira na Azure Container App koji hosta glavni aplikacijski kod, koji obrađuje korisnički unos i generira inteligentne odgovore putem AI agenta.
      
      Arhitektura koristi Microsoft Foundry Project kao temelj za AI mogućnosti, povezujući se s Azure AI Services koji pružaju temeljne jezične modele (kao što je GPT-4o-mini) i funkcionalnost agenata. Korisničke interakcije prolaze kroz React-based frontend do FastAPI backenda koji komunicira s AI agent servisom za generiranje kontekstualnih odgovora.
      
      Sustav uključuje mogućnosti dohvaćanja znanja putem pretraživanja datoteka ili Azure AI Search servisa, dopuštajući agentu pristup i citiranje informacija iz učitanih dokumenata.
      
      Za operativnu izvrsnost, arhitektura uključuje sveobuhvatni nadzor putem Application Insights i Log Analytics Workspace za praćenje, zapisivanje i optimizaciju performansi.
      
      Azure Storage pruža pohranu objekata za podatke aplikacije i učitane datoteke, dok Managed Identity osigurava siguran pristup između Azure resursa bez pohrane vjerodajnica. Cijelo rješenje je dizajnirano za skalabilnost i održivost, pri čemu se kontejnerizirana aplikacija automatski skalira na temelju potražnje dok pruža ugrađenu sigurnost, nadzor i CI/CD mogućnosti kroz Azure upravljani uslužni ekosustav.

![Arhitektura](../../../../../translated_images/hr/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktura repozitorija

!!! prompt "PITANJE: Objasni strukturu mapa predloška. Počni s vizualnim hijerarhijskim dijagramom."

??? info "ODGOVOR: Vizualni hijerarhijski dijagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguracija & Postavljanje
      │   ├── azure.yaml                    # Konfiguracija Azure Developer CLI
      │   ├── docker-compose.yaml           # Lokalni kontejneri za razvoj
      │   ├── pyproject.toml                # Konfiguracija Python projekta
      │   ├── requirements-dev.txt          # Ovisnosti za razvoj
      │   └── .devcontainer/                # VS Code razvojno kontejnersko okruženje
      │
      ├── 🏗️ Infrastruktura (infra/)
      │   ├── main.bicep                    # Glavni infrastrukturni predložak
      │   ├── api.bicep                     # API-specifični resursi
      │   ├── main.parameters.json          # Parametri infrastrukture
      │   └── core/                         # Modularne komponente infrastrukture
      │       ├── ai/                       # Konfiguracije AI servisa
      │       ├── host/                     # Infrastruktura hostinga
      │       ├── monitor/                  # Praćenje i zapisivanje
      │       ├── search/                   # Postavljanje Azure AI Search
      │       ├── security/                 # Sigurnost i identitet
      │       └── storage/                  # Konfiguracije računa za pohranu
      │
      ├── 💻 Izvor aplikacije (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Ulazna točka FastAPI aplikacije
      │   │   ├── routes.py                 # Definicije ruta API-ja
      │   │   ├── search_index_manager.py  # Funkcionalnost pretraživanja
      │   │   ├── data/                     # Obrada podataka API-ja
      │   │   ├── static/                   # Statičke web datoteke
      │   │   └── templates/                # HTML predlošci
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js ovisnosti
      │   │   ├── vite.config.ts            # Vite konfiguracija izgradnje
      │   │   └── src/                      # Izvorni frontend kod
      │   ├── data/                         # Primjeri podataka
      │   │   └── embeddings.csv            # Prethodno izračunate ugrađenosti
      │   ├── files/                        # Datoteke baze znanja
      │   │   ├── customer_info_*.json     # Primjeri korisničkih podataka
      │   │   └── product_info_*.md        # Dokumentacija proizvoda
      │   ├── Dockerfile                    # Konfiguracija kontejnera
      │   └── requirements.txt              # Python ovisnosti
      │
      ├── 🔧 Automatizacija & Skripte (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-implementacijsko postavljanje
      │   ├── setup_credential.sh/.ps1     # Konfiguracija vjerodajnica
      │   ├── validate_env_vars.sh/.ps1    # Validacija okruženja
      │   └── resolve_model_quota.sh/.ps1  # Upravljanje kvotama modela
      │
      ├── 🧪 Testiranje & Evaluacija
      │   ├── tests/                        # Jedinični i integracijski testovi
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Okvir za evaluaciju agenata
      │   │   ├── evaluate.py               # Pokretač evaluacije
      │   │   ├── eval-queries.json         # Test upiti
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Razvojno igralište
      │   │   ├── 1-quickstart.py           # Primjeri za početak rada
      │   │   └── aad-interactive-chat.py   # Primjeri autentifikacije
      │   └── airedteaming/                 # Evaluacija AI sigurnosti
      │       └── ai_redteaming.py          # Testiranje crvenog tima
      │
      ├── 📚 Dokumentacija (docs/)
      │   ├── deployment.md                 # Vodič za implementaciju
      │   ├── local_development.md          # Upute za lokalno postavljanje
      │   ├── troubleshooting.md           # Najčešći problemi i popravci
      │   ├── azure_account_setup.md        # Azure preduvjeti
      │   └── images/                       # Dokumentacijska sredstva
      │
      └── 📄 Projektni metapodaci
         ├── README.md                     # Pregled projekta
         ├── CODE_OF_CONDUCT.md            # Smjernice zajednice
         ├── CONTRIBUTING.md               # Vodič za doprinose
         ├── LICENSE                      # Licencni uvjeti
         └── next-steps.md                # Smjernice nakon implementacije
      ```

### 3.1. Osnovna arhitektura aplikacije

Ovaj predložak slijedi obrazac **full-stack web aplikacije** s:

- **Backend**: Python FastAPI s Azure AI integracijom
- **Frontend**: TypeScript/React s Vite sustavom izgradnje
- **Infrastruktura**: Azure Bicep predlošci za cloud resurse
- **Kontejnerizacija**: Docker za dosljednu implementaciju

### 3.2 Infrastruktura kao kod (bicep)

Infrastrukturni sloj koristi **Azure Bicep** predloške organizirane modularno:

   - **`main.bicep`**: Orkestrira sve Azure resurse
   - **`core/` moduli**: Ponovno upotrebljivi dijelovi za različite servise
      - AI servisi (Azure OpenAI, AI Search)
      - Hosting kontejnera (Azure Container Apps)
      - Nadzor (Application Insights, Log Analytics)
      - Sigurnost (Key Vault, Managed Identity)

### 3.3 Izvor aplikacije (`src/`)

**Backend API (`src/api/`)**:

- REST API baziran na FastAPI-u
- Integracija Foundry Agenata
- Upravljanje indeksima pretraživanja za dohvat znanja
- Mogućnosti učitavanja i obrade datoteka

**Frontend (`src/frontend/`)**:

- Moderni React/TypeScript SPA
- Vite za brzi razvoj i optimizirane buildove
- Chat sučelje za interakcije s agentima

**Baza znanja (`src/files/`)**:

- Primjeri korisničkih i proizvodnih podataka
- Prikaz dohvaćanja znanja iz datoteka
- Primjeri u JSON i Markdown formatu


### 3.4 DevOps & Automatizacija

**Skripte (`scripts/`)**:

- Cross-platform PowerShell i Bash skripte
- Validacija i postavljanje okruženja
- Konfiguracija nakon implementacije
- Upravljanje kvotama modela

**Integracija Azure Developer CLI**:

- `azure.yaml` konfiguracija za `azd` tijekove rada
- Automatska priprema i implementacija
- Upravljanje varijablama okruženja

### 3.5 Testiranje & Kontrola kvalitete

**Okvir za evaluaciju (`evals/`)**:

- Evaluacija performansi agenata
- Testiranje kvalitete upit-odgovor
- Automatizirana pipeline evaluacija

**Sigurnost AI (`airedteaming/`)**:

- Testovi crvenog tima za AI sigurnost
- Skener ranjivosti
- Odgovorne AI prakse

---

## 4. Čestitamo 🏆

Uspješno ste koristili GitHub Copilot Chat s MCP serverima za istraživanje repozitorija.

- [X] Aktivirali GitHub Copilot za Azure
- [X] Razumjeli arhitekturu aplikacije
- [X] Istražili strukturu AZD predloška

Ovo vam daje osjećaj za _infrastrukturu kao kod_ resurse za ovaj predložak. Sljedeće ćemo pogledati konfiguracijsku datoteku za AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o odricanju odgovornosti**:
Ovaj je dokument preveden pomoću AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili nepravilne interpretacije koje proizlaze iz upotrebe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->