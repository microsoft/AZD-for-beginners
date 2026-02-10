# 3. Pura mallipohja

!!! tip "TÄMÄN MODUULIN LOPPUUN MENNESSÄ OSAAT"

    - [ ] Activate GitHub Copilot with MCP servers for Azure assistance
    - [ ] Ymmärtää AZD-mallipohjan kansiorakenne ja komponentit
    - [ ] Tutustua infra-as-code (Bicep) -järjestelymalleihin
    - [ ] **Lab 3:** Käytä GitHub Copilotia tutkiaksesi ja ymmärtääksesi repositorion arkkitehtuuria

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _starter_ project.

**Mutta nyt meidän täytyy ymmärtää projektin rakenne ja koodikanta — ja pystyä mukauttamaan AZD-mallia — ilman aiempaa kokemusta tai ymmärrystä AZD:stä!**

---

## 1. Aktivoi GitHub Copilot

### 1.1 Asenna GitHub Copilot Chat

It's time to explore [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [Copilot Free plan](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

The extension can be installed from the marketplace, but should already be available in your Codespaces environment. _Napsauta `Open Chat` from the Copilot icon drop-down - and type a prompt like `What can you do?`_ - you may be prompted to log in. **GitHub Copilot Chat on valmis**.

### 1.2. Asenna MCP-palvelimet

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

??? warning "Saatat nähdä virheilmoituksen, että `npx` ei ole asennettu (laajenna korjausta varten)"

      Korjataksesi tämän avaa `.devcontainer/devcontainer.json` -tiedosto ja lisää tämä rivi features-osioon. Rakenna sitten säilö uudelleen. Sinulla pitäisi nyt olla `npx` asennettuna.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testaa GitHub Copilot Chat

**Käytä ensin `az login` to authenticate with Azure from VS Code command line.**

You should now be able to query your Azure subscription status, and ask questions about deployed resources or configuration. Try these prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

You can also ask questions about Azure documentation and get responses grounded in the Microsoft Docs MCP server. Try these prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Or you can ask for code snippets to complete a task. Try this prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

In `Ask` mode, this will provide code that you can copy-paste and try out. In `Agent` mode, this might go a step further and create the relevant resources for you - including setup scripts and documentation - to help you execute that task.

**Olet nyt varustautunut aloittamaan mallipohjarepositorion tutkimisen**

---

## 2. Pura arkkitehtuuri

??? prompt "KYSY: Selitä sovelluksen arkkitehtuuri tiedostossa docs/images/architecture.png yhdellä kappaleella"

      Tämä sovellus on Azureen rakennettu tekoälyllä tehostettu chat-sovellus, joka demonstroi modernia agenttipohjaista arkkitehtuuria. Ratkaisu keskittyy Azure Container Appiin, joka isännöi pääsovelluskoodia, käsittelee käyttäjän syötteitä ja tuottaa älykkäitä vastauksia AI-agentin kautta.
      
      Arkkitehtuuri hyödyntää Microsoft Foundry -projektia tekoälykyvykkyyksien perustana, yhdistäen Azure AI Services -palveluihin, jotka tarjoavat taustalla olevat kielimallit (kuten GPT-4o-mini) ja agenttitoiminnallisuuden. Käyttäjän vuorovaikutus kulkee React-pohjaisen front-endin kautta FastAPI-backendiin, joka kommunikoi AI-agenttipalvelun kanssa kontekstuaalisten vastausten luomiseksi.
      
      Järjestelmä sisältää tiedonhakukyvykkyyksiä joko tiedostohakujen tai Azure AI Search -palvelun kautta, jolloin agentti voi käyttää ja viitata ladattuihin dokumentteihin. Operatiivisen erinomaisuuden varmistamiseksi arkkitehtuuri sisältää kattavan valvonnan Application Insightsin ja Log Analytics Workspacen kautta jäljitystä, lokitusta ja suorituskyvyn optimointia varten.
      
      Azure Storage tarjoaa blob-tallennuksen sovellustiedoille ja tiedostolatauksille, kun taas Managed Identity varmistaa turvallisen pääsyn Azure-resurssien välillä ilman salasanojen tallentamista. Koko ratkaisu on suunniteltu skaalautuvaksi ja ylläpidettäväksi; konttisoitu sovellus skaalaa automaattisesti kuormituksen mukaan tarjoten samalla sisäänrakennetun turvallisuuden, valvonnan ja CI/CD-ominaisuudet Azuren hallittujen palvelujen ekosysteemin kautta.

![Arkkitehtuuri](../../../../../translated_images/fi/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repositorion rakenne

!!! prompt "KYSY: Selitä mallipohjan kansiorakenne. Aloita visuaalisella hierarkkisella kaaviolla."

??? info "VASTAUS: Visuaalinen hierarkkinen kaavio"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurointi ja asetukset
      │   ├── azure.yaml                    # Azure Developer CLI -määritykset
      │   ├── docker-compose.yaml           # Paikalliset kehityskontit
      │   ├── pyproject.toml                # Python-projektin määritykset
      │   ├── requirements-dev.txt          # Kehitysriippuvuudet
      │   └── .devcontainer/                # VS Code devcontainer -asetukset
      │
      ├── 🏗️ Infrastruktuuri (infra/)
      │   ├── main.bicep                    # Pääinfrastruktuurimalli
      │   ├── api.bicep                     # API-kohtaiset resurssit
      │   ├── main.parameters.json          # Infrastruktuurin parametrit
      │   └── core/                         # Modulaariset infrastruktuurikomponentit
      │       ├── ai/                       # AI-palvelukonfiguraatiot
      │       ├── host/                     # Isännöinti-infrastruktuuri
      │       ├── monitor/                  # Valvonta ja lokitus
      │       ├── search/                   # Azure AI Search -asetukset
      │       ├── security/                 # Suojaus ja identiteetti
      │       └── storage/                  # Tallennustilin asetukset
      │
      ├── 💻 Sovelluslähde (src/)
      │   ├── api/                          # Backend-API
      │   │   ├── main.py                   # FastAPI-sovelluksen sisäänmeno
      │   │   ├── routes.py                 # API-reittien määrittelyt
      │   │   ├── search_index_manager.py   # Hakutoiminnallisuus
      │   │   ├── data/                     # API:n datankäsittely
      │   │   ├── static/                   # Staattiset web-resurssit
      │   │   └── templates/                # HTML-mallit
      │   ├── frontend/                     # React/TypeScript-frontend
      │   │   ├── package.json              # Node.js-riippuvuudet
      │   │   ├── vite.config.ts            # Vite-rakennuskonfiguraatio
      │   │   └── src/                      # Frontend-lähdekoodi
      │   ├── data/                         # Esimerkkidatatiedostot
      │   │   └── embeddings.csv            # Esilasketut upotukset
      │   ├── files/                        # Tietopohjan tiedostot
      │   │   ├── customer_info_*.json      # Asiakastiedon näytteet
      │   │   └── product_info_*.md         # Tuotedokumentaatio
      │   ├── Dockerfile                    # Konttikonfiguraatio
      │   └── requirements.txt              # Python-riippuvuudet
      │
      ├── 🔧 Automaatiot & skriptit (scripts/)
      │   ├── postdeploy.sh/.ps1           # Julkaisun jälkeiset asetukset
      │   ├── setup_credential.sh/.ps1     # Tunnistetietojen konfigurointi
      │   ├── validate_env_vars.sh/.ps1    # Ympäristömuuttujien validointi
      │   └── resolve_model_quota.sh/.ps1  # Mallin kiintiöhallinta
      │
      ├── 🧪 Testaus ja arviointi
      │   ├── tests/                        # Yksikkö- ja integraatiotestit
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agentin arviointikehys
      │   │   ├── evaluate.py               # Arvioinnin suorittaja
      │   │   ├── eval-queries.json         # Testikyselyt
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Kehitysalusta
      │   │   ├── 1-quickstart.py           # Aloitusesimerkit
      │   │   └── aad-interactive-chat.py   # Todennusesimerkit
      │   └── airedteaming/                 # AI-turvallisuuden arviointi
      │       └── ai_redteaming.py          # Red team -testaus
      │
      ├── 📚 Dokumentaatio (docs/)
      │   ├── deployment.md                 # Julkaisun opas
      │   ├── local_development.md          # Paikallisen kehityksen asennusohjeet
      │   ├── troubleshooting.md            # Yleiset ongelmat & korjaukset
      │   ├── azure_account_setup.md        # Azuren esivaatimukset
      │   └── images/                       # Dokumentaation resurssit
      │
      └── 📄 Projektin metatiedot
         ├── README.md                     # Projektin yleiskatsaus
         ├── CODE_OF_CONDUCT.md           # Yhteisön ohjeet
         ├── CONTRIBUTING.md              # Osallistumisohje
         ├── LICENSE                      # Lisenssiehdot
         └── next-steps.md                # Julkaisun jälkeiset ohjeet
      ```

### 3.1. Ydinapplikaation arkkitehtuuri

This template follows a **full-stack web application** pattern with:

- **Backend**: Python FastAPI with Azure AI integration
- **Frontend**: TypeScript/React with Vite build system
- **Infrastructure**: Azure Bicep templates for cloud resources
- **Containerization**: Docker for consistent deployment

### 3.2 Infra-as-code (Bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: Orchestrates all Azure resources
   - **`core/` modules**: Reusable components for different services
      - AI services (Azure OpenAI, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Sovelluslähdekoodi (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-pohjainen REST-API
- Foundry Agents -integraatio
- Hakemistoindeksin hallinta tiedonhakuun
- Tiedostojen lataus- ja käsittelymahdollisuudet

**Frontend (`src/frontend/`)**:

- Moderni React/TypeScript SPA
- Vite nopeaan kehitykseen ja optimoituihin rakennuksiin
- Chat-käyttöliittymä agentin vuorovaikutuksiin

**Tietopohja (`src/files/`)**:

- Esimerkkiasiakas- ja tuotetiedot
- Havainnollistaa tiedostopohjaista tiedonhakua
- JSON- ja Markdown-esimerkit


### 3.4 DevOps & automaatio

**Skriptit (`scripts/`)**:

- Monialustaiset PowerShell- ja Bash-skriptit
- Ympäristön validointi ja määritys
- Julkaisun jälkeiset asetukset
- Mallin kiintiöhallinta

**Azure Developer CLI -integraatio**:

- `azure.yaml` konfiguraatio `azd`-työnkuluille
- Automaattinen provisiointi ja julkaisu
- Ympäristömuuttujien hallinta

### 3.5 Testaus & laadunvarmistus

**Arviointikehys (`evals/`)**:

- Agentin suorituskyvyn arviointi
- Kysely-vastauslaadun testaus
- Automaattinen arviointiputki

**AI-turvallisuus (`airedteaming/`)**:

- Red team -testaus AI-turvallisuutta varten
- Tietoturva-aukkojen skannaus
- Vastuullisen tekoälyn käytännöt

---

## 4. Onnittelut 🏆

Käytit onnistuneesti GitHub Copilot Chatia MCP-palvelimien kanssa tutkiaksesi repositoriota.

- [X] Aktivoi GitHub Copilot for Azure
- [X] Ymmärsit sovelluksen arkkitehtuurin
- [X] Tutkit AZD-mallipohjan rakenteen

Tämä antaa sinulle käsityksen tästä mallipohjasta löytyvistä _infrastructure as code_ -resursseista. Seuraavaksi tarkastelemme AZD:n konfiguraatiotiedostoa.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, automatisoiduissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisessä kielessä tulee pitää auktoritatiivisena lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaisen ihmiskääntäjän käyttöä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->