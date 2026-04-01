# 3. Dekonstrueeri mall

!!! tip "SELLE MODUULI LÕPUS OLED VÕIMELINE"

    - [ ] Aktiveerima GitHub Copiloti koos MCP serveritega Azure abistamiseks
    - [ ] Mõistma AZD malli kaustastruktuuri ja komponente
    - [ ] Uurima infrastruktuuri kui koodi (Bicep) organiseerimismustreid
    - [ ] **Labor 3:** Kasutama GitHub Copiloti hoidla arhitektuuri uurimiseks ja mõistmiseks

---

AZD mallide ja Azure Developer CLI-ga (`azd`) saame kiiresti alustada oma AI arendusreisiga standardiseeritud hoidlate abil, mis pakuvad näidiskoodi, infrastruktuuri ja konfiguratsioonifaile - valmis juurutamiseks mõeldud _algus_ projektina.

**Kuid nüüd peame mõistma projekti struktuuri ja koodi baasi ning suutma kohandada AZD malli - ilma eelneva kogemuseta või AZD mõistmiseta!**

---

## 1. Aktiveeri GitHub Copilot

### 1.1 Installi GitHub Copilot Chat

On aeg uurida [GitHub Copiloti koos agentrežiimiga](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nüüd saame looduslikus keeles kirjeldada oma ülesannet kõrgel tasemel ja saada abi selle teostamisel. Selle labori jaoks kasutame [Copilot Free plaani](https://github.com/github-copilot/signup), millel on igakuine limiit täidete ja vestluste arvu kohta.

Laienduse saad installida turult ning see on tihti juba Codespaces'is või arenduskonteineri keskkonnas saadaval. _Klõpsa Copiloti ikooni rippmenüüst `Open Chat` ja kirjuta näiteks `What can you do?`_ - võib-olla palutakse sul sisse logida. **GitHub Copilot Chat on valmis.**

### 1.2. Installi MCP serverid

Agentrežiimi tõhusaks toimimiseks vajab see juurdepääsu õigele tööriistakomplektile, et aidata teadmiste hankimisel või toimingute tegemisel. Siin tulevad appi MCP serverid. Konfigureerime järgmised serverid:

1. [Azure MCP server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP server](../../../../../workshop/docs/instructions)

Nende aktiveerimiseks:

1. Loo fail nimega `.vscode/mcp.json`, juhul kui seda pole
1. Kopeeri faili järgmine sisu ja seejärel käivita serverid!
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

??? warning "Võid saada vea, et `npx` pole installitud (klõpsa laiendamiseks parandamiseks)"

      Parandamiseks ava `.devcontainer/devcontainer.json` fail ja lisa features jaotisesse see rida. Seejärel ehita konteiner uuesti. Nüüd peaks sul olema `npx` installitud.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testi GitHub Copilot Chati

**Kõigepealt kasuta `azd auth login`, et autentida Azure'i VS Code käsurealt. Kasuta ka `az login` ainult juhul, kui plaanid Azure CLI käske otse käivitada.**

Järgmisena peaksid saama pärida oma Azure tellimuse olekut ning küsida küsimusi juurutatud ressursside või konfiguratsiooni kohta. Proovi järgmisi päringuid:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Samuti võid küsida Azure dokumentatsiooni kohta ning saada vastuseid Microsoft Docs MCP serverist. Proovi neid päringuid:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Või võid küsida koodinäiteid mingi ülesande täitmiseks. Proovi seda päringut.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Küsimisrežiimis annab see koodi, mille saad kopeerida-kleebiks ja katsetada. Agentrežiimis võib see minna sammu edasi ja luua vajalikud ressursid sinu jaoks - sealhulgas seadistusskriptid ja dokumentatsiooni - et aidata ülesannet täita.

**Sa oled nüüd varustatud malli hoidla uurimise alustamiseks**

---

## 2. Arhitektuuri dekonstruerimine

??? prompt "KÜSI: Selgita rakenduse arhitektuuri docs/images/architecture.png failis ühe lõiguga"

      See rakendus on Azure’i-põhine tehisintellektil töötav vestlusrakendus, mis demonstreerib moodsat agentidel põhinevat arhitektuuri. Lahendus keskendub Azure Container Apile, mis majutab põhirakenduse koodi, mis töötleb kasutajasisestusi ja genereerib nutikaid vastuseid AI agendi kaudu.
      
      Arhitektuur kasutab Microsoft Foundry projekti kui aluspõhja AI võimekuse jaoks, ühendudes Azure AI teenustega, mis pakuvad aluseks olevaid keelemudeleid (nt gpt-4.1-mini) ja agentide funktsionaalsust.
      
      Kasutajate interaktsioonid liiguvad React-põhiselt kasutajaliideselt FastAPI taustteenusele, mis suhtleb AI agent teenusega kontekstuaalsete vastuste genereerimiseks.
      
      Süsteem sisaldab teadmiste hankimise võimekust kas failide otsingu või Azure AI Search teenuse kaudu, võimaldades agendil pääseda ligi ja tsiteerida üleslaaditud dokumentidest pärinevat teavet.
      
      Operatiivseks tipptasemeks sisaldab arhitektuur ulatuslikku jälgimist Application Insightsi ja Log Analytics Workspace’i kaudu jälgimiseks, logimiseks ja jõudluse optimeerimiseks.
      
      Azure Storage pakub rakendusandmete ja failide üleslaadimiseks blob-salvestuse võimalust, samal ajal kui Managed Identity tagab turvalise ligipääsu Azure ressursside vahel ilma mandaate salvestamata.
      
      Kogu lahendus on kujundatud skaleeritavaks ja hooldatavaks, kus konteineripõhine rakendus skaleerub automaatselt nõudluse põhjal, pakkudes samal ajal sisseehitatud turvalisust, jälgimist ja CI/CD võimalusi Azure hallatavate teenuste ökosüsteemiga.

![Arhitektuur](../../../../../translated_images/et/architecture.48d94861e6e6cdc0.webp)

---

## 3. Hoidla struktuur

!!! prompt "KÜSI: Selgita malli kaustastruktuuri. Alusta visuaalse hierarhilise diagrammiga."

??? info "VASTUS: Visuaalne hierarhiline diagramm"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguratsioon & Seadistus
      │   ├── azure.yaml                    # Azure Developer CLI konfiguratsioon
      │   ├── docker-compose.yaml           # Kohalikud arenduskonteinerid
      │   ├── pyproject.toml                # Python projekti konfiguratsioon
      │   ├── requirements-dev.txt          # Arenduse sõltuvused
      │   └── .devcontainer/                # VS Code arenduskonteineri seadistus
      │
      ├── 🏗️ Infrastruktuur (infra/)
      │   ├── main.bicep                    # Põhja infrastruktuuri mall
      │   ├── api.bicep                     # API-spetsiifilised ressursid
      │   ├── main.parameters.json          # Infrastruktuuri parameetrid
      │   └── core/                         # Modulaarseid infrastruktuuri komponente
      │       ├── ai/                       # AI teenuste konfiguratsioonid
      │       ├── host/                     # Hostimise infrastruktuur
      │       ├── monitor/                  # Jälgimine ja logimine
      │       ├── search/                   # Azure AI Search seadistused
      │       ├── security/                 # Turvalisus ja identiteet
      │       └── storage/                  # Salvestuskonto konfiguratsioonid
      │
      ├── 💻 Rakenduse lähtekood (src/)
      │   ├── api/                          # Tagapõhja API
      │   │   ├── main.py                   # FastAPI rakenduse sisendpunkt
      │   │   ├── routes.py                 # API marsruudi määratlused
      │   │   ├── search_index_manager.py   # Otsingufunktsioonid
      │   │   ├── data/                     # API andmetöötlus
      │   │   ├── static/                   # Staatilised veebivarad
      │   │   └── templates/                # HTML mallid
      │   ├── frontend/                     # React/TypeScript kasutajaliides
      │   │   ├── package.json              # Node.js sõltuvused
      │   │   ├── vite.config.ts            # Vite build konfiguratsioon
      │   │   └── src/                      # Kasutajaliidese lähtekood
      │   ├── data/                         # Näidisandmefailid
      │   │   └── embeddings.csv            # Ettevalmistatud embedimised
      │   ├── files/                        # Teadmistebaasi failid
      │   │   ├── customer_info_*.json      # Kliendiandmete näited
      │   │   └── product_info_*.md         # Toote dokumentatsioon
      │   ├── Dockerfile                    # Konteineri konfiguratsioon
      │   └── requirements.txt              # Pythoni sõltuvused
      │
      ├── 🔧 Automatiseerimine & Skriptid (scripts/)
      │   ├── postdeploy.sh/.ps1           # Pärast juurutust seadistus
      │   ├── setup_credential.sh/.ps1     # Mandaadi seadistus
      │   ├── validate_env_vars.sh/.ps1    # Keskkonnamuutujate valideerimine
      │   └── resolve_model_quota.sh/.ps1  # Mudeli kvoodi haldamine
      │
      ├── 🧪 Testimine & Hinnang
      │   ├── tests/                        # Ühik- ja integratsioonitestid
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agendi hindamisraamistik
      │   │   ├── evaluate.py               # Hindamise käivitaja
      │   │   ├── eval-queries.json         # Testiküsimused
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Arenduse mängumaa
      │   │   ├── 1-quickstart.py           # Kiire algus näited
      │   │   └── aad-interactive-chat.py   # Autentimise näited
      │   └── airedteaming/                 # AI ohutuse hindamine
      │       └── ai_redteaming.py          # Punase meeskonna testimine
      │
      ├── 📚 Dokumentatsioon (docs/)
      │   ├── deployment.md                 # Juurutamisjuhend
      │   ├── local_development.md          # Kohaliku arenduse juhised
      │   ├── troubleshooting.md            # Levinumad probleemid ja lahendused
      │   ├── azure_account_setup.md        # Azure eeldused
      │   └── images/                       # Dokumentatsiooni varad
      │
      └── 📄 Projekti metaandmed
         ├── README.md                     # Projekti ülevaade
         ├── CODE_OF_CONDUCT.md           # Kogukonna juhendid
         ├── CONTRIBUTING.md              # Panuse juhend
         ├── LICENSE                      # Litsentsitingimused
         └── next-steps.md                # Pärast juurutust juhised
      ```

### 3.1. Põhirakenduse arhitektuur

See mall järgib **täisvirna veebirakenduse** mustrit, kus on:

- **Tagapõhi**: Python FastAPI koos Azure AI integratsiooniga
- **Kasutajaliides**: TypeScript/React koos Vite build süsteemiga
- **Infrastruktuur**: Azure Bicep mallid pilveressursside jaoks
- **Konteineriseerimine**: Docker järjepidevaks juurutamiseks

### 3.2 Infrastruktuur kui kood (bicep)

Infrastruktuuri kiht kasutab **Azure Bicep** mudeleid modulaarseks organiseerimiseks:

   - **`main.bicep`**: Orkestreerib kõik Azure ressursid
   - **`core/` moodulid**: Taaskasutatavad komponendid erinevatele teenustele
      - AI teenused (Microsoft Foundry mudelid, AI Search)
      - Konteinerite hostimine (Azure Container Apps)
      - Jälgimine (Application Insights, Log Analytics)
      - Turvalisus (Key Vault, Managed Identity)

### 3.3 Rakenduse lähtekood (`src/`)

**Tagapõhja API (`src/api/`)**:

- FastAPI-põhine REST API
- Foundry Agenti integratsioon
- Otsingumootori haldus teadmiste hankimiseks
- Failide üleslaadimise ja töötlemise võimalused

**Kasutajaliides (`src/frontend/`)**:

- Moodne React/TypeScript SPA
- Vite kiire arendus ja optimeeritud buildid
- Vestlusliides agendi suheldamiseks

**Teadmistebaas (`src/files/`)**:

- Näidis kliendi- ja tooteteave
- Demonstreerib failipõhist teadmiste hankimist
- JSON ja Markdown formaadis näited

### 3.4 DevOps ja automatiseerimine

**Skriptid (`scripts/`)**:

- Platvormideülene PowerShell ja Bash skriptid
- Keskkonna valideerimine ja seadistus
- Pärast juurutust seadistamine
- Mudelikvoodi haldus

**Azure Developer CLI integratsioon**:

- `azure.yaml` konfiguratsioon `azd` töövoogude jaoks
- Automatiseeritud provisioning ja juurutus
- Keskkonnamuutujate haldus

### 3.5 Testimine ja kvaliteedi tagamine

**Hindamisraamistik (`evals/`)**:

- Agendi jõudluse hindamine
- Päring-vastus kvaliteedi testid
- Automatiseeritud hindamisprotsess

**AI ohutus (`airedteaming/`)**:

- Punase meeskonna testimine AI ohutuse tagamiseks
- Turvariskide skaneerimine
- Vastutustundliku AI praktikad

---

## 4. Palju õnne 🏆

Sa edukalt kasutasid GitHub Copilot Chati MCP serveritega, et uurida hoidlat.

- [X] Aktiveerisid GitHub Copiloti Azure jaoks
- [X] Mõistsid rakenduse arhitektuuri
- [X] Uurisin AZD malli struktuuri

See annab sulle aimu selle malli _infrastruktuur kui kood_ varadest. Järgmisena vaatame AZD konfiguratsioonifaili.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüame täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta käesoleva tõlke kasutamisest tingitud eksituste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->