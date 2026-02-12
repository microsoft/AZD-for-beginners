# 3. Razčlenite predlogo

!!! tip "NA KONCU TEGA MODULA BOSTE MOGLI"

    - [ ] Aktivirati GitHub Copilot z MCP strežniki za pomoč pri Azure
    - [ ] Razumeti strukturo map in komponente AZD predloge
    - [ ] Raziskati vzorce organizacije infrastrukture kot kode (Bicep)
    - [ ] **Lab 3:** Uporabiti GitHub Copilot za raziskovanje in razumevanje arhitekture repozitorija 

---


Z AZD predlogami in Azure Developer CLI (`azd`) lahko hitro začnemo naše AI razvojno potovanje z standardiziranimi repozitoriji, ki zagotavljajo vzorčno kodo, infrastrukturo in konfiguracijske datoteke - v obliki projekta _starter_, pripravljenega za namestitev.

**Toda zdaj moramo razumeti strukturo projekta in kodo - ter biti sposobni prilagoditi AZD predlogo - brez predhodnih izkušenj ali razumevanja AZD!**

---

## 1. Aktivirajte GitHub Copilot

### 1.1 Namestite GitHub Copilot Chat

Čas je, da raziščemo [GitHub Copilot z Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Sedaj lahko s pomočjo naravnega jezika opišemo naše naloge na visokem nivoju in dobimo pomoč pri izvedbi. Za ta laboratorij bomo uporabili [Copilot Free plan](https://github.com/github-copilot/signup), ki ima mesečno omejitev za zaključke in klepetalne interakcije.

Razširitev lahko namestite iz trgovine, vendar bi morala biti že na voljo v vašem Codespaces okolju. _Kliknite `Open Chat` v spustnem meniju ikone Copilot - in vnesite poziv, npr. `What can you do?`_ - morda boste pozvani k prijavi. **GitHub Copilot Chat je pripravljen**.

### 1.2. Namestite MCP strežnike

Da bo Agent mode učinkovit, mora imeti dostop do pravih orodij, ki mu pomagajo pridobiti znanje ali izvesti dejanja. Tu lahko pomagajo MCP strežniki. Konfigurirali bomo naslednje strežnike:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Za aktivacijo teh:

1. Ustvarite datoteko `.vscode/mcp.json`, če ne obstaja
1. Kopirajte naslednje v to datoteko - in zaženite strežnike!
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

??? warning "Morda boste dobili napako, da `npx` ni nameščen (kliknite za razširitev z rešitvijo)"

      Za popravilo odprite datoteko `.devcontainer/devcontainer.json` in dodajte to vrstico v razdelek features. Nato ponovno zgradite kontejner. Zdaj bi morali imeti nameščen `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Preizkusite GitHub Copilot Chat

**Najprej uporabite `az login`, da se preverite pri Azure iz ukazne vrstice VS Code.**

Zdaj bi morali biti sposobni poizvedovati stanje vašega Azure naročnika in postavljati vprašanja o nameščenih virih ali konfiguraciji. Preizkusite te pozive:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Lahko tudi postavite vprašanja o Azure dokumentaciji in dobite odgovore, utemeljene na Microsoft Docs MCP strežniku. Preizkusite te pozive:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ali pa lahko zahtevate primere kode za dokončanje naloge. Poskusite ta poziv.

1. `Give me a Python code example that uses AAD for an interactive chat client`

V načinu "Ask" vam bo to zagotovilo kodo, ki jo lahko kopirate in preizkusite. V načinu "Agent" lahko gre korak dlje in ustvari ustrezne vire za vas - vključno z namestitvenimi skriptami in dokumentacijo - da vam pomaga izvesti to nalogo.

**Zdaj ste opremljeni za začetek raziskovanja repozitorija predloge**

---

## 2. Razčlenitev arhitekture

??? prompt "ZAPROSITE: Pojasnite arhitekturo aplikacije v docs/images/architecture.png v enem odstavku"

      Ta aplikacija je AI-pogonjena klepetalna aplikacija, zgrajena na Azure, ki prikazuje moderno arhitekturo na osnovi agentov. Rešitev se osredotoča na Azure Container App, ki gosti glavno aplikacijsko kodo, obdeluje uporabniški vnos in generira inteligentne odgovore preko AI agenta.
      
      Arhitektura izkorišča Microsoft Foundry Project kot temelj za AI zmogljivosti, povezuje se z Azure AI Services, ki nudijo osnovne jezikovne modele (kot na primer GPT-4o-mini) in funkcionalnost agentov. Uporabniške interakcije potekajo preko React-sprednjega dela do FastAPI-zaledja, ki komunicira z AI agentno storitvijo za generiranje kontekstualnih odgovorov.
      
      Sistem vključuje zmožnosti pridobivanja znanja preko iskanja po datotekah ali storitve Azure AI Search, kar agentu omogoča dostop do naloženih dokumentov in citiranje informacij. Za operativno odličnost arhitektura vključuje celovito nadzorovanje preko Application Insights in Log Analytics Workspace za sledenje, beleženje in optimizacijo zmogljivosti.
      
      Azure Storage zagotavlja blob shrambi za podatke aplikacije in nalaganje datotek, medtem ko Managed Identity zagotavlja varen dostop med Azure viri brez shranjevanja poverilnic. Celotna rešitev je zasnovana za skalabilnost in vzdrževanje, pri čemer se kontejnerizirana aplikacija samodejno skalira glede na povpraševanje in zagotavlja vgrajeno varnost, nadzorovanje in CI/CD zmogljivosti prek upravljanih Azure storitev.

![Arhitektura](../../../../../translated_images/sl/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktura repozitorija

!!! prompt "ZAPROSITE: Pojasnite strukturo map predloge. Začnite z vizualnim hierarhičnim diagramom."

??? info "ODGOVOR: Vizualni hierarhični diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguracija & Namestitev
      │   ├── azure.yaml                    # Konfiguracija Azure Developer CLI
      │   ├── docker-compose.yaml           # Lokalne razvojne kontejnere
      │   ├── pyproject.toml                # Konfiguracija Python projekta
      │   ├── requirements-dev.txt          # Razvojne odvisnosti
      │   └── .devcontainer/                # Nastavitev VS Code dev kontejnerja
      │
      ├── 🏗️ Infrastruktura (infra/)
      │   ├── main.bicep                    # Glavna predloga infrastrukture
      │   ├── api.bicep                     # Viri, specifični za API
      │   ├── main.parameters.json          # Parametri infrastrukture
      │   └── core/                         # Modularne komponente infrastrukture
      │       ├── ai/                       # Konfiguracije AI storitev
      │       ├── host/                     # Gostujoča infrastruktura
      │       ├── monitor/                  # Nadzor in beleženje
      │       ├── search/                   # Nastavitev Azure AI Search
      │       ├── security/                 # Varnost in identiteta
      │       └── storage/                  # Konfiguracije Storage računa
      │
      ├── 💻 Izvor aplikacije (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Vstopna točka FastAPI aplikacije
      │   │   ├── routes.py                 # Definicije API poti
      │   │   ├── search_index_manager.py   # Funkcionalnost iskanja
      │   │   ├── data/                     # Upravljanje podatkov API-ja
      │   │   ├── static/                   # Statične spletne vsebine
      │   │   └── templates/                # HTML predloge
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js odvisnosti
      │   │   ├── vite.config.ts            # Vite build konfiguracija
      │   │   └── src/                      # Izvorna koda frontenda
      │   ├── data/                         # Vzorec podatkovnih datotek
      │   │   └── embeddings.csv            # Predizračunane vektorske predstavitve
      │   ├── files/                        # Datoteke baze znanja
      │   │   ├── customer_info_*.json      # Vzorci podatkov o strankah
      │   │   └── product_info_*.md         # Dokumentacija o proizvodih
      │   ├── Dockerfile                    # Konfiguracija kontejnerja
      │   └── requirements.txt              # Python odvisnosti
      │
      ├── 🔧 Avtomatizacija & Skripte (scripts/)
      │   ├── postdeploy.sh/.ps1           # Nastavitev po nameščanju
      │   ├── setup_credential.sh/.ps1     # Konfiguracija poverilnic
      │   ├── validate_env_vars.sh/.ps1    # Preverjanje okolijskih spremenljivk
      │   └── resolve_model_quota.sh/.ps1  # Upravljanje kvot modelov
      │
      ├── 🧪 Testiranje & Evalvacija
      │   ├── tests/                        # Enote in integracijski testi
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Okvir za evalvacijo agentov
      │   │   ├── evaluate.py               # Zagon evalvacij
      │   │   ├── eval-queries.json         # Testni poizvedbeni nizi
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Razvojno igrišče
      │   │   ├── 1-quickstart.py           # Primeri za začetek
      │   │   └── aad-interactive-chat.py   # Primeri avtentikacije
      │   └── airedteaming/                 # Evalvacija varnosti AI
      │       └── ai_redteaming.py          # Testiranje rdeče ekipe
      │
      ├── 📚 Dokumentacija (docs/)
      │   ├── deployment.md                 # Vodnik za nameščanje
      │   ├── local_development.md          # Navodila za lokalno nastavitev
      │   ├── troubleshooting.md            # Pogoste težave in rešitve
      │   ├── azure_account_setup.md        # Predpogoji za Azure
      │   └── images/                       # Sredstva za dokumentacijo
      │
      └── 📄 Metapodatki projekta
         ├── README.md                     # Pregled projekta
         ├── CODE_OF_CONDUCT.md           # Pravila skupnosti
         ├── CONTRIBUTING.md              # Vodnik za prispevke
         ├── LICENSE                      # Licenčni pogoji
         └── next-steps.md                # Navodila po nameščanju
      ```

### 3.1. Osnovna arhitektura aplikacije

Ta predloga sledi vzorcu **full-stack spletne aplikacije** z:

- **Backend**: Python FastAPI z Azure AI integracijo
- **Frontend**: TypeScript/React z Vite build sistemom
- **Infrastruktura**: Azure Bicep predloge za oblačne vire
- **Kontejnerizacija**: Docker za konsistentno nameščanje

### 3.2 Infrastruktura kot koda (Bicep)

Plast infrastrukture uporablja **Azure Bicep** predloge, organizirane modularno:

   - **`main.bicep`**: Orkestrira vse Azure vire
   - **`core/` moduli**: Ponovno uporabne komponente za različne storitve
      - AI storitve (Azure OpenAI, AI Search)
      - Gostovanje kontejnerjev (Azure Container Apps)
      - Nadzor (Application Insights, Log Analytics)
      - Varnost (Key Vault, Managed Identity)

### 3.3 Izvor aplikacije (`src/`)

**Backend API (`src/api/`)**:

- REST API na osnovi FastAPI
- Integracija Foundry Agents
- Upravljanje iskalnih indeksov za pridobivanje znanja
- Možnosti nalaganja in obdelave datotek

**Frontend (`src/frontend/`)**:

- Moderne React/TypeScript SPA
- Vite za hiter razvoj in optimizirane gradnje
- Klepetalni vmesnik za interakcije z agentom

**Baza znanja (`src/files/`)**:

- Vzorčni podatki o strankah in izdelkih
- Prikaz pridobivanja znanja iz datotek
- Primeri v JSON in Markdown formatih


### 3.4 DevOps & Avtomatizacija

**Skripte (`scripts/`)**:

- Večplatformske PowerShell in Bash skripte
- Preverjanje in nastavitev okolja
- Konfiguracija po nameščanju
- Upravljanje kvot modelov

**Integracija z Azure Developer CLI**:

- `azure.yaml` konfiguracija za `azd` poteke
- Samodejno zagotavljanje in nameščanje
- Upravljanje okolijskih spremenljivk

### 3.5 Testiranje & Zagotavljanje kakovosti

**Okvir za evalvacijo (`evals/`)**:

- Evalvacija zmogljivosti agentov
- Preizkušanje kakovosti vprašanji-odgovorov
- Avtomatizirana ocenjevalna cevovodna integracija

**Varnost AI (`airedteaming/`)**:

- Testiranje rdeče ekipe za varnost AI
- Pregled ranljivosti in varnostno skeniranje
- Prakse odgovorne uporabe AI

---

## 4. Čestitke 🏆

Uspešno ste uporabili GitHub Copilot Chat z MCP strežniki za raziskovanje repozitorija.

- [X] Aktivirali GitHub Copilot za Azure
- [X] Razumeli arhitekturo aplikacije
- [X] Raziskali strukturo AZD predloge

To vam daje vpogled v _infrastrukturo kot kodo_ sredstva za to predlogo. Naslednji korak bo ogled konfiguracijske datoteke za AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo AI prevajalske storitve Co-op Translator (https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za pomembne informacije priporočamo strokovni prevod, opravljen s strani človeškega prevajalca. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki bi izhajale iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->