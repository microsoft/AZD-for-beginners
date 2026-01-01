<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-10-11T15:47:34+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "et"
}
-->
# 3. Malli lahtivõtmine

!!! tip "PÄRAST SELLE MODULI LÄBIMIST OLED VÕIMELINE"

    - [ ] Üksus
    - [ ] Üksus
    - [ ] Üksus
    - [ ] **Lab 3:** 

---

AZD mallide ja Azure Developer CLI (`azd`) abil saame kiiresti alustada oma AI arendusprotsessi standardiseeritud repositooriumidega, mis sisaldavad näidiskoodi, infrastruktuuri ja konfiguratsioonifaile - valmis _starter_ projekti kujul.

**Kuid nüüd peame mõistma projekti struktuuri ja koodibaasi - ning olema võimelised AZD malli kohandama - ilma eelneva kogemuse või AZD mõistmiseta!**

---

## 1. Aktiveeri GitHub Copilot

### 1.1 Paigalda GitHub Copilot Chat

On aeg uurida [GitHub Copilot Agent Mode'iga](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nüüd saame kasutada loomulikku keelt, et kirjeldada oma ülesannet üldisel tasemel ja saada abi selle täitmisel. Selle labori jaoks kasutame [Copilot Free plaani](https://github.com/github-copilot/signup), millel on igakuine piirang täitmistele ja vestluste interaktsioonidele.

Laienduse saab paigaldada turult, kuid see peaks juba olema saadaval teie Codespaces keskkonnas. _Klõpsake `Open Chat` Copilot ikooni rippmenüüst - ja sisestage käsk nagu `What can you do?`_ - teilt võidakse küsida sisselogimist. **GitHub Copilot Chat on valmis**.

### 1.2 Paigalda MCP serverid

Agent Mode'i tõhusaks kasutamiseks on vaja õigeid tööriistu, mis aitavad teadmisi hankida või toiminguid teha. Siin tulevad appi MCP serverid. Konfigureerime järgmised serverid:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Nende aktiveerimiseks:

1. Looge fail nimega `.vscode/mcp.json`, kui seda veel ei eksisteeri
1. Kopeerige järgmine kood sellesse faili - ja käivitage serverid!
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

??? warning "Võite saada vea, et `npx` pole paigaldatud (klõpsake, et näha parandust)"

      Selle parandamiseks avage `.devcontainer/devcontainer.json` fail ja lisage see rida funktsioonide sektsiooni. Seejärel ehitage konteiner uuesti. Nüüd peaks `npx` olema paigaldatud.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 Testi GitHub Copilot Chat'i

**Kõigepealt kasutage `az login`, et autentida Azure'iga VS Code käsurealt.**

Nüüd peaksite saama pärida oma Azure'i tellimuse staatust ja esitada küsimusi juurutatud ressursside või konfiguratsiooni kohta. Proovige järgmisi käske:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Samuti saate esitada küsimusi Azure'i dokumentatsiooni kohta ja saada vastuseid, mis põhinevad Microsoft Docs MCP serveril. Proovige järgmisi käske:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Või saate küsida koodinäiteid ülesande täitmiseks. Proovige seda käsku:

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` režiimis pakutakse koodi, mida saate kopeerida ja proovida. `Agent` režiimis võib see minna sammu kaugemale ja luua asjakohased ressursid - sealhulgas seadistusskriptid ja dokumentatsioon - et aidata teil ülesannet täita.

**Nüüd olete valmis alustama mallirepositooriumi uurimist**

---

## 2. Arhitektuuri lahtivõtmine

??? prompt "KÜSI: Selgita rakenduse arhitektuuri dokumendis/images/architecture.png ühe lõiguga"

      See rakendus on Azure'il põhinev AI-toega vestlusrakendus, mis demonstreerib kaasaegset agentipõhist arhitektuuri. Lahendus keskendub Azure Container App'ile, mis majutab peamist rakenduskoodi, mis töötleb kasutaja sisendit ja genereerib intelligentseid vastuseid AI agendi kaudu. 
      
      Arhitektuur kasutab Azure AI Foundry projekti AI võimekuste alusena, ühendudes Azure AI teenustega, mis pakuvad aluseks olevaid keelemudeleid (näiteks GPT-4o-mini) ja agenti funktsionaalsust. Kasutaja interaktsioonid voolavad React-põhisest esiosast FastAPI tagaserva, mis suhtleb AI agendi teenusega kontekstuaalsete vastuste genereerimiseks. 
      
      Süsteem sisaldab teadmiste hankimise võimekust kas failide otsingu või Azure AI Search teenuse kaudu, võimaldades agendil pääseda juurde ja viidata teabele üleslaaditud dokumentidest. Operatiivse tipptaseme saavutamiseks sisaldab arhitektuur põhjalikku jälgimist Application Insights'i ja Log Analytics Workspace'i kaudu jälgimise, logimise ja jõudluse optimeerimiseks. 
      
      Azure Storage pakub blob-salvestust rakenduse andmete ja failide üleslaadimiseks, samas kui Managed Identity tagab turvalise juurdepääsu Azure'i ressursside vahel ilma mandaate salvestamata. Kogu lahendus on loodud skaleeritavuse ja hooldatavuse jaoks, konteineriseeritud rakendus skaleerub automaatselt vastavalt nõudlusele, pakkudes samal ajal sisseehitatud turvalisust, jälgimist ja CI/CD võimekust Azure'i hallatud teenuste ökosüsteemi kaudu.

![Arhitektuur](../../../../../translated_images/architecture.48d94861e6e6cdc0.et.png)

---

## 3. Repositooriumi struktuur

!!! prompt "KÜSI: Selgita malli kaustastruktuuri. Alusta visuaalse hierarhilise diagrammiga."

??? info "VASTUS: Visuaalne hierarhiline diagramm"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguratsioon ja seadistamine
      │   ├── azure.yaml                    # Azure Developer CLI konfiguratsioon
      │   ├── docker-compose.yaml           # Kohalikud arenduskonteinerid
      │   ├── pyproject.toml                # Python projekti konfiguratsioon
      │   ├── requirements-dev.txt          # Arenduse sõltuvused
      │   └── .devcontainer/                # VS Code arenduskonteineri seadistus
      │
      ├── 🏗️ Infrastruktuur (infra/)
      │   ├── main.bicep                    # Peamine infrastruktuuri mall
      │   ├── api.bicep                     # API-spetsiifilised ressursid
      │   ├── main.parameters.json          # Infrastruktuuri parameetrid
      │   └── core/                         # Modulaarne infrastruktuuri komponendid
      │       ├── ai/                       # AI teenuste konfiguratsioonid
      │       ├── host/                     # Majutuse infrastruktuur
      │       ├── monitor/                  # Jälgimine ja logimine
      │       ├── search/                   # Azure AI Search seadistus
      │       ├── security/                 # Turvalisus ja identiteet
      │       └── storage/                  # Salvestuskonto konfiguratsioonid
      │
      ├── 💻 Rakenduse lähtekood (src/)
      │   ├── api/                          # Tagaserv API
      │   │   ├── main.py                   # FastAPI rakenduse alguspunkt
      │   │   ├── routes.py                 # API marsruutide määratlus
      │   │   ├── search_index_manager.py   # Otsingufunktsionaalsus
      │   │   ├── data/                     # API andmete töötlemine
      │   │   ├── static/                   # Staatilised veebivarad
      │   │   └── templates/                # HTML mallid
      │   ├── frontend/                     # React/TypeScript esiosa
      │   │   ├── package.json              # Node.js sõltuvused
      │   │   ├── vite.config.ts            # Vite ehituse konfiguratsioon
      │   │   └── src/                      # Esiosa lähtekood
      │   ├── data/                         # Näidisandmefailid
      │   │   └── embeddings.csv            # Eelnevalt arvutatud vektorid
      │   ├── files/                        # Teadmistebaasi failid
      │   │   ├── customer_info_*.json      # Kliendiandmete näidised
      │   │   └── product_info_*.md         # Tootedokumentatsioon
      │   ├── Dockerfile                    # Konteineri konfiguratsioon
      │   └── requirements.txt              # Python sõltuvused
      │
      ├── 🔧 Automatiseerimine ja skriptid (scripts/)
      │   ├── postdeploy.sh/.ps1           # Järgneva juurutuse seadistus
      │   ├── setup_credential.sh/.ps1     # Mandaatide konfiguratsioon
      │   ├── validate_env_vars.sh/.ps1    # Keskkonna valideerimine
      │   └── resolve_model_quota.sh/.ps1  # Mudeli kvoodi haldamine
      │
      ├── 🧪 Testimine ja hindamine
      │   ├── tests/                        # Üksuse ja integratsiooni testid
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agendi hindamise raamistik
      │   │   ├── evaluate.py               # Hindamise käivitaja
      │   │   ├── eval-queries.json         # Testpäringud
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Arenduse mänguväljak
      │   │   ├── 1-quickstart.py           # Kiire alustamise näited
      │   │   └── aad-interactive-chat.py   # Autentimise näited
      │   └── airedteaming/                 # AI turvalisuse hindamine
      │       └── ai_redteaming.py          # Red team testimine
      │
      ├── 📚 Dokumentatsioon (docs/)
      │   ├── deployment.md                 # Juurutamise juhend
      │   ├── local_development.md          # Kohaliku seadistuse juhised
      │   ├── troubleshooting.md            # Levinud probleemid ja lahendused
      │   ├── azure_account_setup.md        # Azure'i eeldused
      │   └── images/                       # Dokumentatsiooni varad
      │
      └── 📄 Projekti metaandmed
         ├── README.md                     # Projekti ülevaade
         ├── CODE_OF_CONDUCT.md           # Kogukonna juhised
         ├── CONTRIBUTING.md              # Panustamise juhend
         ├── LICENSE                      # Litsentsitingimused
         └── next-steps.md                # Järgneva juurutuse juhised
      ```

### 3.1 Põhirakenduse arhitektuur

See mall järgib **täisstack veebirakenduse** mustrit:

- **Tagaserv**: Python FastAPI koos Azure AI integratsiooniga
- **Esiosa**: TypeScript/React koos Vite ehitussüsteemiga
- **Infrastruktuur**: Azure Bicep mallid pilveressursside jaoks
- **Konteineriseerimine**: Docker järjepidevaks juurutamiseks

### 3.2 Infrastruktuur kui kood (bicep)

Infrastruktuuri kiht kasutab **Azure Bicep** malle, mis on organiseeritud modulaarseks:

   - **`main.bicep`**: Orkestreerib kõik Azure'i ressursid
   - **`core/` moodulid**: Taaskasutatavad komponendid erinevate teenuste jaoks
      - AI teenused (Azure OpenAI, AI Search)
      - Konteinerite majutamine (Azure Container Apps)
      - Jälgimine (Application Insights, Log Analytics)
      - Turvalisus (Key Vault, Managed Identity)

### 3.3 Rakenduse lähtekood (`src/`)

**Tagaserv API (`src/api/`)**:

- FastAPI-põhine REST API
- Azure AI agendi teenuse integratsioon
- Otsinguindeksi haldamine teadmiste hankimiseks
- Failide üleslaadimise ja töötlemise võimalused

**Esiosa (`src/frontend/`)**:

- Kaasaegne React/TypeScript SPA
- Vite kiireks arenduseks ja optimeeritud ehituseks
- Vestlusliides agendi interaktsioonide jaoks

**Teadmistebaas (`src/files/`)**:

- Näidiskliendi ja tooteandmed
- Näitab failipõhist teadmiste hankimist
- JSON ja Markdown formaadi näited

### 3.4 DevOps ja automatiseerimine

**Skriptid (`scripts/`)**:

- Platvormidevahelised PowerShelli ja Bashi skriptid
- Keskkonna valideerimine ja seadistamine
- Järgneva juurutuse konfiguratsioon
- Mudeli kvoodi haldamine

**Azure Developer CLI integratsioon**:

- `azure.yaml` konfiguratsioon `azd` töövoogude jaoks
- Automatiseeritud ressurside loomine ja juurutamine
- Keskkonnamuutujate haldamine

### 3.5 Testimine ja kvaliteedi tagamine

**Hindamisraamistik (`evals/`)**:

- Agendi jõudluse hindamine
- Päring-vastus kvaliteedi testimine
- Automatiseeritud hindamispipeline

**AI turvalisus (`airedteaming/`)**:

- Red team testimine AI turvalisuse jaoks
- Turvahaavatavuste skaneerimine
- Vastutustundliku AI praktikad

---

## 4. Palju õnne 🏆

Sa kasutasid edukalt GitHub Copilot Chat'i koos MCP serveritega, et uurida repositooriumi.

- [X] Aktiveerisid GitHub Copilot'i Azure'i jaoks
- [X] Mõistsid rakenduse arhitektuuri
- [X] Uurisid AZD malli struktuuri

See annab sulle ülevaate selle malli _infrastruktuur kui kood_ varadest. Järgmisena vaatame AZD konfiguratsioonifaili.

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.