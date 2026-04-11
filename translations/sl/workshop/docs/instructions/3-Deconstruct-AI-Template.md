# 3. Razstavite predlogo

!!! tip "DO KONCA TEGA MODULA BOSTE ZMOGLI"

    - [ ] Aktivirati GitHub Copilot z MCP strežniki za pomoč pri Azure
    - [ ] Razumeti strukturo map in komponente AZD predloge
    - [ ] Raziskati vzorce organizacije infrastructure-as-code (Bicep)
    - [ ] **Laboratorij 3:** Uporabiti GitHub Copilot za raziskovanje in razumevanje arhitekture repozitorija 

---


Z AZD predlogami in Azure Developer CLI (`azd`) lahko hitro začnemo naše AI razvojno potovanje s standardiziranimi repozitoriji, ki vsebujejo primer kode, infrastrukturo in konfiguracijske datoteke - v obliki projekta _starter_, pripravljenega za distribucijo.

**Zdaj pa moramo razumeti strukturo projekta in kodo ter biti sposobni prilagoditi AZD predlogo - brez predhodnih izkušenj ali poznavanja AZD!**

---

## 1. Aktivirajte GitHub Copilot

### 1.1 Namestite GitHub Copilot Chat

Čas je, da raziskujemo [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Zdaj lahko v naravnem jeziku opišemo nalogo na visoki ravni in dobimo pomoč pri izvedbi. Za ta laboratorij bomo uporabili [Copilot Free plan](https://github.com/github-copilot/signup), ki ima mesečno omejitev za dokončanja in klepetalne interakcije.

Razširitev lahko namestite iz marketplace-a, pogosto pa je že na voljo v Codespaces ali dev container okoljih. _Kliknite `Open Chat` iz spustnega menija ikone Copilot - in vtipkajte poziv, na primer `What can you do?`_ - morda boste morali opraviti prijavo. **GitHub Copilot Chat je pripravljen**.

### 1.2. Namestite MCP strežnike

Za učinkovito delovanje Agent moda potrebuje dostop do pravih orodij, ki mu pomagajo pridobiti znanje ali izvesti dejanja. Tu lahko pomagajo MCP strežniki. Konfigurirali bomo naslednje strežnike:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Za aktivacijo teh:

1. Ustvarite datoteko z imenom `.vscode/mcp.json`, če ne obstaja
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

??? warning "You may get an error that `npx` is not installed (click to expand for fix)"

      Za popravilo odprite datoteko `.devcontainer/devcontainer.json` in v razdelek features dodajte to vrstico. Nato ponovno zgradite container. Sedaj bi morali imeti nameščen `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Preizkusite GitHub Copilot Chat

**Najprej uporabite `azd auth login` za avtorizacijo z Azure iz ukazne vrstice VS Code. Uporabite tudi `az login`, samo če nameravate neposredno izvajati Azure CLI ukaze.**

Zdaj bi morali biti sposobni poizvedovati stanje vaše Azure naročnine in postavljati vprašanja o nameščenih virih ali konfiguraciji. Preizkusite te pozive:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Lahko tudi postavite vprašanja o Azure dokumentaciji in dobite odgovore, utemeljene v Microsoft Docs MCP strežniku. Preizkusite te pozive:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ali pa lahko zaprosite za odseke kode za dokončanje naloge. Preizkusite ta poziv.

1. `Give me a Python code example that uses AAD for an interactive chat client`

V načinu "Ask" vam bo to zagotovilo kodo, ki jo lahko kopirate in preizkusite. V načinu "Agent" pa lahko to stori še korak dlje in ustvari ustrezne vire za vas - vključno z namestitvenimi skriptami in dokumentacijo - da vam pomaga izvesti nalogo.

**Zdaj ste opremljeni za začetek raziskovanja predloge repozitorija**

---

## 2. Razstavite arhitekturo

??? prompt "POZIV: Razložite arhitekturo aplikacije v docs/images/architecture.png v enem odstavku"

      Ta aplikacija je klepetalna aplikacija z elementi AI, zgrajena na Azure, ki prikazuje sodobno arhitekturo, temelječo na agentih. Rešitev se osredotoča na Azure Container App, ki gosti glavno kodo aplikacije in obdeluje uporabniški vnos ter generira inteligentne odgovore preko AI agenta. 
      
      Arhitektura izkorišča Microsoft Foundry Project kot temelj za AI zmogljivosti in se povezuje z Azure AI Services, ki nudijo osnovne jezikovne modele (kot je gpt-4.1-mini) in funkcionalnost agentov. Uporabniške interakcije potekajo skozi frontend, zgrajen v Reactu, do backend-a na FastAPI, ki komunicira s storitvijo AI agentov za generiranje kontekstualnih odgovorov. 
      
      Sistem vključuje zmogljivosti pridobivanja znanja preko iskanja po datotekah ali storitve Azure AI Search, kar agentu omogoča dostop do naloženih dokumentov in navajanje virov. Za operativno odličnost arhitektura vključuje celovito sledenje preko Application Insights in Log Analytics Workspace za sledenje, beleženje in optimizacijo zmogljivosti. 
      
      Azure Storage zagotavlja blob shrambo za podatke aplikacije in nalaganje datotek, medtem ko Managed Identity zagotavlja varen dostop med Azure viri brez shranjevanja poverilnic. Celotna rešitev je zasnovana za razširljivost in vzdrževanje, aplikacija v kontejnerju pa se samodejno razširi glede na povpraševanje in nudi vgrajeno varnost, spremljanje in CI/CD zmožnosti preko upravljanih Azure storitev.

![Arhitektura](../../../../../translated_images/sl/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktura repozitorija

!!! prompt "ASK: Explain the template folder structure. Start with a visual hierarchical diagram."

??? info "ODGOVOR: Vizualna hierarhična shema"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Konfiguracija Azure Developer CLI
      │   ├── docker-compose.yaml           # Lokalni razvojni containerji
      │   ├── pyproject.toml                # Konfiguracija Python projekta
      │   ├── requirements-dev.txt          # Odvisnosti za razvoj
      │   └── .devcontainer/                # Nastavitev VS Code dev container
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Glavna infrastrukturna predloga
      │   ├── api.bicep                     # Viri specifični za API
      │   ├── main.parameters.json          # Infrastrukturni parametri
      │   └── core/                         # Modularne infrastrukturne komponente
      │       ├── ai/                       # Konfiguracije AI storitev
      │       ├── host/                     # Gostujoča infrastruktura
      │       ├── monitor/                  # Spremljanje in beleženje
      │       ├── search/                   # Nastavitev Azure AI Search
      │       ├── security/                 # Varnost in identiteta
      │       └── storage/                  # Konfiguracije Storage accountov
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Vhodna točka FastAPI aplikacije
      │   │   ├── routes.py                 # Definicije API poti
      │   │   ├── search_index_manager.py   # Funkcionalnost iskanja
      │   │   ├── data/                     # Obdelava podatkov API-ja
      │   │   ├── static/                   # Statične spletne sredice
      │   │   └── templates/                # HTML predloge
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js odvisnosti
      │   │   ├── vite.config.ts            # Vite konfiguracija gradnje
      │   │   └── src/                      # Izvorna koda frontenda
      │   ├── data/                         # Primeri podatkovnih datotek
      │   │   └── embeddings.csv            # Predhodno izračunane vektorske predstavitve
      │   ├── files/                        # Datoteke baze znanja
      │   │   ├── customer_info_*.json      # Primeri podatkov o strankah
      │   │   └── product_info_*.md         # Dokumentacija izdelkov
      │   ├── Dockerfile                    # Konfiguracija kontejnerja
      │   └── requirements.txt              # Python odvisnosti
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Nastavitve po implementaciji
      │   ├── setup_credential.sh/.ps1     # Konfiguracija poverilnic
      │   ├── validate_env_vars.sh/.ps1    # Validacija okoljskih spremenljivk
      │   └── resolve_model_quota.sh/.ps1  # Upravljanje kvot modelov
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Unit in integracijski testi
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Okvir za ocenjevanje agentov
      │   │   ├── evaluate.py               # Zagon evalvacij
      │   │   ├── eval-queries.json         # Testni poizvedbeni primeri
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Razvojno igrišče
      │   │   ├── 1-quickstart.py           # Primeri za začetek
      │   │   └── aad-interactive-chat.py   # Primeri avtorizacije
      │   └── airedteaming/                 # Evalvacija AI varnosti
      │       └── ai_redteaming.py          # Red team testiranje
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Vodnik za implementacijo
      │   ├── local_development.md          # Navodila za lokalno nastavitev
      │   ├── troubleshooting.md            # Pogoste težave in rešitve
      │   ├── azure_account_setup.md        # Predpogoji za Azure račun
      │   └── images/                       # Sredstva dokumentacije
      │
      └── 📄 Project Metadata
         ├── README.md                     # Pregled projekta
         ├── CODE_OF_CONDUCT.md           # Smernice skupnosti
         ├── CONTRIBUTING.md              # Vodnik za prispevanje
         ├── LICENSE                      # Pogoji licence
         └── next-steps.md                # Navodila po implementaciji
      ```

### 3.1. Osnovna arhitektura aplikacije

Ta predloga sledi vzorcu **full-stack spletne aplikacije** z:

- **Backend**: Python FastAPI z integracijo Azure AI
- **Frontend**: TypeScript/React z Vite build sistemom
- **Infrastruktura**: Azure Bicep predloge za oblačne vire
- **Kontenerizacija**: Docker za konsistentno distribucijo

### 3.2 Infra As Code (bicep)

Plast infrastrukture uporablja **Azure Bicep** predloge organizirane modularno:

   - **`main.bicep`**: Orkestrira vse Azure vire
   - **`core/` moduli**: Znovuporabne komponente za različne storitve
      - AI storitve (Microsoft Foundry Models, AI Search)
      - Gostovanje kontejnerjev (Azure Container Apps)
      - Spremljanje (Application Insights, Log Analytics)
      - Varnost (Key Vault, Managed Identity)

### 3.3 Izvor aplikacije (`src/`)

**Backend API (`src/api/`)**:

- REST API na osnovi FastAPI
- Integracija Foundry Agentov
- Upravljanje iskalnih indeksov za pridobivanje znanja
- Nalaganje datotek in obdelava

**Frontend (`src/frontend/`)**:

- Sodobna React/TypeScript SPA
- Vite za hitro razvijanje in optimizirane gradnje
- Klepetalni vmesnik za interakcije z agentom

**Baza znanja (`src/files/`)**:

- Primeri podatkov o strankah in izdelkih
- Prikazuje pridobivanje znanja iz datotek
- Primeri v JSON in Markdown formatu


### 3.4 DevOps in avtomatizacija

**Skripte (`scripts/`)**:

- Večplatformne PowerShell in Bash skripte
- Validacija in nastavitev okolja
- Konfiguracija po implementaciji
- Upravljanje kvot za modele

**Integracija z Azure Developer CLI**:

- `azure.yaml` konfiguracija za `azd` delovne tokove
- Avtomatizirano zagotavljanje in implementacija
- Upravljanje okoljskih spremenljivk

### 3.5 Testiranje in zagotavljanje kakovosti

**Okvir za evalvacijo (`evals/`)**:

- Evalvacija zmogljivosti agentov
- Testiranje kakovosti odzivov na poizvedbe
- Avtomatiziran ocenjevalni pipeline

**AI varnost (`airedteaming/`)**:

- Red team testiranje za varnost AI
- Skeniranje varnostnih ranljivosti
- Prakse odgovorne uporabe AI

---

## 4. Čestitke 🏆

Uspešno ste uporabili GitHub Copilot Chat z MCP strežniki za raziskovanje repozitorija.

- [X] Aktivirali GitHub Copilot za Azure
- [X] Razumeli arhitekturo aplikacije
- [X] Raziskali strukturo AZD predloge

To vam daje vpogled v _infrastrukturo kot kodo_ sredstva za to predlogo. Naslednje si bomo ogledali konfiguracijsko datoteko za AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za kakršne koli nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->