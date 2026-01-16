<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-24T22:46:28+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "fi"
}
-->
# 3. Purkaa mallin rakenne

!!! tip "TÄMÄN OSION LOPUSSA OSAAAT"

    - [ ] Kohde
    - [ ] Kohde
    - [ ] Kohde
    - [ ] **Lab 3:** 

---

AZD-mallien ja Azure Developer CLI:n (`azd`) avulla voimme nopeasti käynnistää AI-kehitysmatkamme standardoitujen arkistojen avulla, jotka sisältävät esimerkkikoodia, infrastruktuurin ja konfiguraatiotiedostoja - valmiina käyttöönotettavan _aloitusprojektin_ muodossa.

**Mutta nyt meidän täytyy ymmärtää projektin rakenne ja koodipohja - ja osata mukauttaa AZD-mallia - ilman aiempaa kokemusta tai ymmärrystä AZD:stä!**

---

## 1. Aktivoi GitHub Copilot

### 1.1 Asenna GitHub Copilot Chat

On aika tutustua [GitHub Copilotin Agent Mode -tilaan](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nyt voimme käyttää luonnollista kieltä kuvaamaan tehtäväämme yleisellä tasolla ja saada apua sen toteuttamisessa. Tässä laboratoriossa käytämme [Copilot Free -suunnitelmaa](https://github.com/github-copilot/signup), jossa on kuukausittainen rajoitus täydennyksille ja keskusteluille.

Laajennus voidaan asentaa markkinapaikalta, mutta sen pitäisi jo olla saatavilla Codespaces-ympäristössäsi. _Klikkaa `Open Chat` Copilot-kuvakkeen pudotusvalikosta - ja kirjoita kehotus, kuten `What can you do?`_ - sinua saatetaan pyytää kirjautumaan sisään. **GitHub Copilot Chat on valmis**.

### 1.2. Asenna MCP-palvelimet

Jotta Agent Mode olisi tehokas, sen täytyy päästä oikeisiin työkaluihin, jotka auttavat tiedon hakemisessa tai toimien suorittamisessa. Tässä MCP-palvelimet tulevat avuksi. Konfiguroimme seuraavat palvelimet:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Näiden aktivoimiseksi:

1. Luo tiedosto nimeltä `.vscode/mcp.json`, jos sitä ei ole olemassa
1. Kopioi seuraava sisältö tiedostoon - ja käynnistä palvelimet!
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

??? warning "Saatat saada virheilmoituksen, että `npx` ei ole asennettu (klikkaa laajentaaksesi korjausohjeet)"

      Korjataksesi tämän, avaa `.devcontainer/devcontainer.json` -tiedosto ja lisää tämä rivi ominaisuuksien osioon. Rakenna sitten kontti uudelleen. Sinulla pitäisi nyt olla `npx` asennettuna.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testaa GitHub Copilot Chat

**Käytä ensin `az login` -komentoa autentikoituaksesi Azureen VS Code -komentoriviltä.**

Sinun pitäisi nyt pystyä kysymään Azure-tilauksesi tilaa ja esittämään kysymyksiä käyttöönotetuista resursseista tai konfiguraatiosta. Kokeile näitä kehotuksia:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Voit myös kysyä kysymyksiä Azure-dokumentaatiosta ja saada vastauksia, jotka perustuvat Microsoft Docs MCP -palvelimeen. Kokeile näitä kehotuksia:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Tai voit pyytää koodiesimerkkejä tehtävän suorittamiseen. Kokeile tätä kehotusta:

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask`-tilassa tämä tarjoaa koodia, jonka voit kopioida ja kokeilla. `Agent`-tilassa tämä voi mennä askeleen pidemmälle ja luoda asiaankuuluvat resurssit puolestasi - mukaan lukien asennuskomentosarjat ja dokumentaatio - auttaakseen sinua tehtävän suorittamisessa.

**Olet nyt valmis tutkimaan mallin arkistoa**

---

## 2. Purkaa arkkitehtuuri

??? prompt "ASK: Selitä sovelluksen arkkitehtuuri tiedostossa docs/images/architecture.png yhdessä kappaleessa"

      Tämä sovellus on Azureen rakennettu tekoälypohjainen chat-sovellus, joka esittelee modernin agenttipohjaisen arkkitehtuurin. Ratkaisu keskittyy Azure Container Appiin, joka isännöi pääsovelluskoodia, käsittelee käyttäjän syötteitä ja tuottaa älykkäitä vastauksia tekoälyagentin avulla. 
      
      Arkkitehtuuri hyödyntää Azure AI Foundry Projectia tekoälyominaisuuksien perustana, yhdistäen Azure AI -palveluihin, jotka tarjoavat taustalla olevat kielimallit (kuten GPT-4o-mini) ja agenttitoiminnallisuuden. Käyttäjäinteraktiot kulkevat React-pohjaisen käyttöliittymän kautta FastAPI-taustajärjestelmään, joka kommunikoi tekoälyagenttipalvelun kanssa kontekstuaalisten vastausten tuottamiseksi. 
      
      Järjestelmä sisältää tiedonhakutoimintoja joko tiedostohakujen tai Azure AI Search -palvelun kautta, jolloin agentti voi käyttää ja viitata ladattuihin dokumentteihin. Operatiivisen erinomaisuuden varmistamiseksi arkkitehtuuri sisältää kattavan seurannan Application Insightsin ja Log Analytics Workspacen avulla jäljitystä, lokitusta ja suorituskyvyn optimointia varten. 
      
      Azure Storage tarjoaa blob-tallennustilan sovellustiedoille ja tiedostojen latauksille, kun taas Managed Identity varmistaa turvallisen pääsyn Azure-resurssien välillä ilman tunnistetietojen tallentamista. Koko ratkaisu on suunniteltu skaalautuvaksi ja ylläpidettäväksi, ja konttisoitu sovellus skaalautuu automaattisesti kysynnän mukaan tarjoten samalla sisäänrakennettua turvallisuutta, seurantaa ja CI/CD-ominaisuuksia Azuren hallittujen palveluiden ekosysteemin kautta.

![Arkkitehtuuri](../../../../../translated_images/fi/architecture.48d94861e6e6cdc0.png)

---

## 3. Arkiston rakenne

!!! prompt "ASK: Selitä mallin kansiorakenne. Aloita visuaalisella hierarkkisella diagrammilla."

??? info "VASTAUS: Visuaalinen hierarkkinen diagrammi"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguraatio ja asennus
      │   ├── azure.yaml                    # Azure Developer CLI -konfiguraatio
      │   ├── docker-compose.yaml           # Paikalliset kehityskontit
      │   ├── pyproject.toml                # Python-projektin konfiguraatio
      │   ├── requirements-dev.txt          # Kehityksen riippuvuudet
      │   └── .devcontainer/                # VS Code -kehityskontin asennus
      │
      ├── 🏗️ Infrastruktuuri (infra/)
      │   ├── main.bicep                    # Pääinfrastruktuurimalli
      │   ├── api.bicep                     # API-spesifiset resurssit
      │   ├── main.parameters.json          # Infrastruktuurin parametrit
      │   └── core/                         # Modulaariset infrastruktuurikomponentit
      │       ├── ai/                       # Tekoälypalvelujen konfiguraatiot
      │       ├── host/                     # Isännöintiinfrastruktuuri
      │       ├── monitor/                  # Seuranta ja lokitus
      │       ├── search/                   # Azure AI Search -asennus
      │       ├── security/                 # Turvallisuus ja identiteetti
      │       └── storage/                  # Tallennustilin konfiguraatiot
      │
      ├── 💻 Sovelluksen lähdekoodi (src/)
      │   ├── api/                          # Taustajärjestelmän API
      │   │   ├── main.py                   # FastAPI-sovelluksen aloitus
      │   │   ├── routes.py                 # API-reittien määrittelyt
      │   │   ├── search_index_manager.py   # Hakutoiminnallisuus
      │   │   ├── data/                     # API:n datan käsittely
      │   │   ├── static/                   # Staattiset verkkosisällöt
      │   │   └── templates/                # HTML-mallit
      │   ├── frontend/                     # React/TypeScript-käyttöliittymä
      │   │   ├── package.json              # Node.js-riippuvuudet
      │   │   ├── vite.config.ts            # Vite-rakennuskonfiguraatio
      │   │   └── src/                      # Käyttöliittymän lähdekoodi
      │   ├── data/                         # Esimerkkidatatiedostot
      │   │   └── embeddings.csv            # Esilasketut upotukset
      │   ├── files/                        # Tietopohjatiedostot
      │   │   ├── customer_info_*.json      # Asiakastietojen esimerkit
      │   │   └── product_info_*.md         # Tuotedokumentaatio
      │   ├── Dockerfile                    # Kontin konfiguraatio
      │   └── requirements.txt              # Python-riippuvuudet
      │
      ├── 🔧 Automaatio ja skriptit (scripts/)
      │   ├── postdeploy.sh/.ps1           # Käyttöönoton jälkeinen asennus
      │   ├── setup_credential.sh/.ps1     # Tunnistetietojen konfiguraatio
      │   ├── validate_env_vars.sh/.ps1    # Ympäristön validointi
      │   └── resolve_model_quota.sh/.ps1  # Mallin kiintiön hallinta
      │
      ├── 🧪 Testaus ja arviointi
      │   ├── tests/                        # Yksikkö- ja integraatiotestit
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agentin arviointikehys
      │   │   ├── evaluate.py               # Arvioinnin suorittaja
      │   │   ├── eval-queries.json         # Testikyselyt
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Kehityksen hiekkalaatikko
      │   │   ├── 1-quickstart.py           # Aloitusohjeet
      │   │   └── aad-interactive-chat.py   # Autentikointiesimerkit
      │   └── airedteaming/                 # Tekoälyn turvallisuuden arviointi
      │       └── ai_redteaming.py          # Red team -testaus
      │
      ├── 📚 Dokumentaatio (docs/)
      │   ├── deployment.md                 # Käyttöönotto-opas
      │   ├── local_development.md          # Paikallisen asennuksen ohjeet
      │   ├── troubleshooting.md            # Yleiset ongelmat ja korjaukset
      │   ├── azure_account_setup.md        # Azure-esivaatimukset
      │   └── images/                       # Dokumentaation kuvat
      │
      └── 📄 Projektin metatiedot
         ├── README.md                     # Projektin yleiskatsaus
         ├── CODE_OF_CONDUCT.md           # Yhteisön ohjeet
         ├── CONTRIBUTING.md              # Osallistumisohjeet
         ├── LICENSE                      # Lisenssiehdot
         └── next-steps.md                # Käyttöönoton jälkeiset ohjeet
      ```

### 3.1. Sovelluksen ydinarkkitehtuuri

Tämä malli noudattaa **täydellisen verkkosovelluksen** mallia, jossa on:

- **Taustajärjestelmä**: Python FastAPI Azure AI -integraatiolla
- **Käyttöliittymä**: TypeScript/React Vite-rakennusjärjestelmällä
- **Infrastruktuuri**: Azure Bicep -mallit pilviresursseille
- **Kontitus**: Docker yhtenäistä käyttöönottoa varten

### 3.2 Infrastruktuuri koodina (bicep)

Infrastruktuurikerros käyttää **Azure Bicep** -malleja, jotka on järjestetty modulaarisesti:

   - **`main.bicep`**: Orkestroi kaikki Azure-resurssit
   - **`core/`-moduulit**: Uudelleenkäytettävät komponentit eri palveluille
      - Tekoälypalvelut (Azure OpenAI, AI Search)
      - Konttien isännöinti (Azure Container Apps)
      - Seuranta (Application Insights, Log Analytics)
      - Turvallisuus (Key Vault, Managed Identity)

### 3.3 Sovelluksen lähdekoodi (`src/`)

**Taustajärjestelmän API (`src/api/`)**:

- FastAPI-pohjainen REST API
- Azure AI Agent -palvelun integrointi
- Hakutoiminnallisuuden hallinta
- Tiedostojen lataus ja käsittelyominaisuudet

**Käyttöliittymä (`src/frontend/`)**:

- Moderni React/TypeScript SPA
- Vite nopeaan kehitykseen ja optimoituihin rakennuksiin
- Chat-käyttöliittymä agentin vuorovaikutuksille

**Tietopohja (`src/files/`)**:

- Esimerkkiasiakas- ja tuotedata
- Demonstroi tiedostopohjaista tiedonhakua
- JSON- ja Markdown-muotoiset esimerkit

### 3.4 DevOps ja automaatio

**Skriptit (`scripts/`)**:

- Alustariippumattomat PowerShell- ja Bash-skriptit
- Ympäristön validointi ja asennus
- Käyttöönoton jälkeinen konfiguraatio
- Mallin kiintiön hallinta

**Azure Developer CLI -integraatio**:

- `azure.yaml`-konfiguraatio `azd`-työnkulkuihin
- Automaattinen provisiointi ja käyttöönotto
- Ympäristömuuttujien hallinta

### 3.5 Testaus ja laadunvarmistus

**Arviointikehys (`evals/`)**:

- Agentin suorituskyvyn arviointi
- Kysymys-vastauslaadun testaus
- Automaattinen arviointiputki

**Tekoälyn turvallisuus (`airedteaming/`)**:

- Red team -testaus tekoälyn turvallisuudelle
- Turvallisuusheikkouksien skannaus
- Vastuulliset tekoälykäytännöt

---

## 4. Onnittelut 🏆

Olet onnistuneesti käyttänyt GitHub Copilot Chatia MCP-palvelimien kanssa tutkiaksesi arkistoa.

- [X] Aktivoinut GitHub Copilotin Azurelle
- [X] Ymmärtänyt sovelluksen arkkitehtuurin
- [X] Tutkinut AZD-mallin rakenteen

Tämä antaa sinulle käsityksen _infrastruktuuri koodina_ -resursseista tässä mallissa. Seuraavaksi tarkastelemme AZD:n konfiguraatiotiedostoa.

---

