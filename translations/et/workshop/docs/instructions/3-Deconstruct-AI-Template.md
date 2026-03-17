# 3. Templaadi lahtivõtmine

!!! tip "SELLE MÕÕDULI LÕPUS OLED VÕIMALIK"

    - [ ] Aktiveeri GitHub Copilot MCP-serveritega Azure abiks
    - [ ] Mõista AZD templaadi kaustastruktuuri ja komponente
    - [ ] Uuri infrastruktuuri kui koodi (Bicep) organiseerimisvõtteid
    - [ ] **Lab 3:** Kasuta GitHub Copiloti, et avastada ja mõista hoidla arhitektuuri

---


AZD mallide ja Azure Developer CLI (`azd`) abil saame kiiresti alustada oma teekonda AI arenduses standardiseeritud hoidlatega, mis pakuvad näidiskoodi, infrastruktuuri ja konfiguratsioonifaile - valmiskasutuseks _starter_ projektina.

**Kuid nüüd peame mõistma projekti struktuuri ja koodi ning suutma kohandada AZD mallide templit - ilma eelneva kogemuseta AZD-ga!**

---

## 1. Aktiveeri GitHub Copilot

### 1.1 Paigalda GitHub Copilot Chat

On aeg uurida [GitHub Copilot Agentrežiimis](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nüüd saame loomulikus keeles ülesannet kirjeldada kõrgetasemeliselt ja saada abi selle täitmisel. Selle labori jaoks kasutame [Copilot Free plaani](https://github.com/github-copilot/signup), millel on kuupõhine täitmiste ja vestluste limiit.

Laienduse saab paigaldada turult, kuid see peaks juba olema saadaval teie Codespaces keskkonnas. _Klõpsake Copiloti ikooni rippmenüüst `Open Chat` ja tippige näiteks `What can you do?`_ - võib-olla palutakse sisse logida. **GitHub Copilot Chat on valmis**.

### 1.2 MCP serverite paigaldamine

Selleks, et Agentrežiim töötaks tõhusalt, vajab see ligipääsu õigetele tööriistadele teadmiste leidmiseks või toimingute tegemiseks. Siin tulevad appi MCP serverid. Me konfigureerime järgmised serverid:

1. [Azure MCP server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP server](../../../../../workshop/docs/instructions)

Nende aktiveerimiseks:

1. Loo fail `.vscode/mcp.json`, kui seda pole olemas
1. Kopeeri faili järgmine sisu - ja käivita serverid!
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

??? warning "Võid saada vea, et `npx` pole paigaldatud (laienda paranduse nägemiseks)"

      Parandamiseks ava `.devcontainer/devcontainer.json` fail ja lisa see rida funktsioonide sektsiooni. Seejärel ehita konteiner uuesti. Nüüd peaks `npx` olema paigaldatud.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 Testi GitHub Copilot Chati

**Kõigepealt kasuta `az login`, et autentida Azure'isse VS Code käsurealt.**

Nüüd peaksid saama pärida oma Azure tellimuse olekut ning küsida küsimusi juurutatud ressursside või konfiguratsiooni kohta. Proovi järgmisi päringuid:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Sa võid küsida ka Azure dokumentatsiooni kohta ning saada vastuseid, mis põhinevad Microsoft Docs MCP serveril. Proovi järgmisi päringuid:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Või võid küsida koodinäiteid mingi ülesande täitmiseks. Proovi näiteks järgmist päringut.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Režiimis `Ask` pakutakse sulle koodi, mida saad kopeerida-kleebitud viisil proovida. Režiimis `Agent` võib see astuda sammu edasi ja luua vajalikud ressursid sinu eest - sealhulgas seadistusskriptid ja dokumentatsiooni - et abistada ülesande täitmisel.

**Nüüd oled valmis uurima malli hoidlat**

---

## 2. Arhitektuuri lahtivõtmine

??? prompt "KÜSI: Selgita rakenduse arhitektuuri pildil docs/images/architecture.png ühe lõiguga"

      See rakendus on Azure'il põhinev tehisintellektil põhinev vestlusrakendus, mis demonstreerib kaasaegset agentidel põhinevat arhitektuuri.
      
      Lahendus keskendub Azure Container Applikatsioonile, kus majutatakse põhikood, mis töötleb kasutaja sisendit ja genereerib AI agendi kaudu intelligentseid vastuseid.
      
      Arhitektuur kasutab Microsoft Foundry projekti AI võimete aluseks, ühendudes Azure AI teenustega, mis pakuvad põhjakeeli (nt gpt-4.1-mini) ja agendi funktsionaalsust. Kasutajaliides toimib Reactil põhineva frontendina, mis suhtleb FastAPI backend-iga, mis omakorda suhtleb AI agendi teenusega kontekstipõhiste vastuste genereerimiseks.
      
      Süsteem sisaldab teadmiste otsimise funktsionaalsust läbi failiotsingu või Azure AI Search teenuse, võimaldades agendil pääseda juurde ja viidata üles laaditud dokumentidele.
      
      Operatiivseks tipptaseme tagamiseks kasutatakse arhitektuuris Application Insightsi ja Log Analytics Workspace´i jälgimiseks, logimiseks ja jõudluse optimeerimiseks.
      
      Azure Storage pakub blob-salvestust rakenduse andmetele ja failide üleslaadimiseks ning Managed Identity tagab turvalise juurdepääsu Azure ressursside vahel ilma kasutajatunnuseid hoidmata. Kogu lahendus on disainitud skaleeritavaks ja hooldatavaks, kus konteinerpõhine rakendus skaleerub automaatselt nõudluse järgi, pakkudes lisaks sisseehitatud turvalisust, jälgimist ja CI/CD võimekust Azure haldussüsteemide kaudu.

![Architecture](../../../../../translated_images/et/architecture.48d94861e6e6cdc0.webp)

---

## 3. Hoidla struktuur

!!! prompt "KÜSI: Selgita templi kaustastruktuuri. Alusta visuaalse hierarhilise skeemiga."

??? info "VASTUS: Visuaalne hierarhiline skeem"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguratsioon ja seadistus
      │   ├── azure.yaml                    # Azure Developer CLI konfiguratsioon
      │   ├── docker-compose.yaml           # Kohalikud arenduskonteinerid
      │   ├── pyproject.toml                # Python projekti konfiguratsioon
      │   ├── requirements-dev.txt          # Arendussõltuvused
      │   └── .devcontainer/                # VS Code devcontainer seadistus
      │
      ├── 🏗️ Infrastruktuur (infra/)
      │   ├── main.bicep                    # Peamine infrastruktuuri mall
      │   ├── api.bicep                     # API-spetsiifilised ressursid
      │   ├── main.parameters.json          # Infrastruktuuri parameetrid
      │   └── core/                         # Moodulipõhised infrastruktuurikomponendid
      │       ├── ai/                       # AI teenuste konfiguratsioonid
      │       ├── host/                     # Hosting infrastruktuur
      │       ├── monitor/                  # Jälgimine ja logimine
      │       ├── search/                   # Azure AI Search seadistus
      │       ├── security/                 # Turvalisus ja identiteet
      │       └── storage/                  # Salvestuskontode konfiguratsioonid
      │
      ├── 💻 Rakenduse lähtekood (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI rakenduse sisenemispunkt
      │   │   ├── routes.py                 # API marsruutide definitsioonid
      │   │   ├── search_index_manager.py   # Otsingu funktsionaalsus
      │   │   ├── data/                     # API andmetöötlus
      │   │   ├── static/                   # Staatilised veebivara
      │   │   └── templates/                # HTML mallid
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js sõltuvused
      │   │   ├── vite.config.ts            # Vite ehituse konfiguratsioon
      │   │   └── src/                      # Frontendi lähtekood
      │   ├── data/                         # Näidisandmefailid
      │   │   └── embeddings.csv            # Eelnevalt arvutatud embeddingud
      │   ├── files/                        # Teadmistebaasi failid
      │   │   ├── customer_info_*.json      # Kliendiandmete näited
      │   │   └── product_info_*.md         # Toote dokumentatsioon
      │   ├── Dockerfile                    # Konteineri konfiguratsioon
      │   └── requirements.txt              # Python sõltuvused
      │
      ├── 🔧 Automatiseerimine ja skriptid (scripts/)
      │   ├── postdeploy.sh/.ps1           # Pärast juurutust seadistamine
      │   ├── setup_credential.sh/.ps1     # Autentimiskonfiguratsioon
      │   ├── validate_env_vars.sh/.ps1    # Keskkonnamuutujate valideerimine
      │   └── resolve_model_quota.sh/.ps1  # Mudeli kvota haldamine
      │
      ├── 🧪 Testimine ja hindamine
      │   ├── tests/                        # Ühik- ja integratsioonitestid
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agendi hindamisraamistik
      │   │   ├── evaluate.py               # Hindamise käivitaja
      │   │   ├── eval-queries.json         # Testpäringud
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Arenduse mänguväljak
      │   │   ├── 1-quickstart.py           # Kiirkäivitusnäited
      │   │   └── aad-interactive-chat.py   # Autentimisnäited
      │   └── airedteaming/                 # AI ohutuse hindamine
      │       └── ai_redteaming.py          # Punase meeskonna testimine
      │
      ├── 📚 Dokumentatsioon (docs/)
      │   ├── deployment.md                 # Juurutuse juhend
      │   ├── local_development.md          # Kohaliku seadistuse juhendid
      │   ├── troubleshooting.md            # Levinumad probleemid ja lahendused
      │   ├── azure_account_setup.md        # Azure eeltingimused
      │   └── images/                       # Dokumentatsiooni pildid
      │
      └── 📄 Projekti metaandmed
         ├── README.md                     # Projekti ülevaade
         ├── CODE_OF_CONDUCT.md           # Kogukonna käitumisreeglid
         ├── CONTRIBUTING.md              # Panustamise juhend
         ├── LICENSE                      # Litsentsitingimused
         └── next-steps.md                # Pärast juurutust juhised
      ```

### 3.1. Põhirakenduse arhitektuur

See mall järgib **täisstack veebirakenduse** mustrit koos:

- **Backend**: Python FastAPI koos Azure AI integreerimisega
- **Frontend**: TypeScript/React koos Vite ehitussüsteemiga
- **Infrastruktuur**: Azure Bicep mallid pilveressursside jaoks
- **Konteineriseerimine**: Docker järjepidevaks juurutuseks

### 3.2 Infra nagu kood (bicep)

Infrastruktuuri kiht kasutab **Azure Bicep** malle moodulipõhiselt organiseerituna:

   - **`main.bicep`**: Koordineerib kõiki Azure ressursse
   - **`core/` moodulid**: Taaskasutatavad komponendid erinevatele teenustele
      - AI teenused (Microsoft Foundry mudelid, AI Search)
      - Konteineri majutus (Azure Container Apps)
      - Jälgimine (Application Insights, Log Analytics)
      - Turvalisus (Key Vault, Managed Identity)

### 3.3 Rakenduse lähtekood (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-põhine REST API
- Foundry agentide integratsioon
- Otsinguindeksihalduse funktsioon teadmiste hankimiseks
- Failide üleslaadimise ja töötlemise võimalus

**Frontend (`src/frontend/`)**:

- Kaasaegne React/TypeScript SPA
- Vite kiireks arenduseks ja optimeeritud ehituseks
- Vestlusliides agendi interaktsioonide jaoks

**Teadmistebaas (`src/files/`)**:

- Näidis kliendi- ja tooteteave
- Näitab failipõhist teadmiste hankimist
- JSON ja Markdown formaadis näited


### 3.4 DevOps ja automatiseerimine

**Skriptid (`scripts/`)**:

- Platvormideülesed PowerShell ja Bash skriptid
- Keskkonna valideerimine ja seadistus
- Pärast juurutust konfiguratsioon
- Mudelikvota haldamine

**Azure Developer CLI integratsioon**:

- `azure.yaml` konfiguratsioon `azd` töövoogude jaoks
- Automatiseeritud ressursi loomine ja juurutus
- Keskkonnamuutujate haldus

### 3.5 Testimine ja kvaliteedi tagamine

**Hindamisraamistik (`evals/`)**:

- Agendi jõudluse hindamine
- Päring-vastus kvaliteedi testimine
- Automatiseeritud hindamistoru

**AI ohutus (`airedteaming/`)**:

- Punase meeskonna testimine AI ohutuseks
- Turvaaukude skaneerimine
- Vastutustundlik AI praktikad

---

## 4. Palju õnne 🏆

Sa kasutasid edukalt GitHub Copilot Chati MCP serveritega, et uurida hoidlat.

- [X] Aktiveerisid GitHub Copiloti Azure jaoks
- [X] Mõistsid rakendus arhitektuuri
- [X] Uurisin AZD templi struktuuri

See annab sulle tunde sellest malli _infrastruktuurist koodina_. Järgmises osas vaatame AZD konfiguratsioonifaili.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüame tagada täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle emakeeles tuleb pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->