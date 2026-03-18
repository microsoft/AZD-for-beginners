# 3. Išardyti šabloną

!!! tip "ŠIO MODULIO PABAIGOJE GALĖSITE"

    - [ ] Įjungti GitHub Copilot su MCP serveriais Azure pagalbai
    - [ ] Suprasti AZD šablono katalogo struktūrą ir komponentus
    - [ ] Išnagrinėti infrastruktūros kaip kodo (Bicep) organizavimo modelius
    - [ ] **Laboratorija 3:** Naudoti GitHub Copilot tyrinėti ir suprasti saugyklos architektūrą 

---


Su AZD šablonais ir Azure Developer CLI (`azd`) galime greitai pradėti mūsų DI kūrimo kelionę su standartizuotomis saugyklomis, kurios suteikia pavyzdinį kodą, infrastruktūrą ir konfigūracijos failus — pasirengusį diegimui _starter_ projektu.

**Bet dabar turime suprasti projekto struktūrą ir kodo bazę — ir sugebėti suasmeninti AZD šabloną — neturint jokios ankstesnės patirties ar supratimo apie AZD!**

---

## 1. Įjungti GitHub Copilot

### 1.1 Įdiegti GitHub Copilot Chat

Laikas išbandyti [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Dabar galime natūralia kalba aprašyti užduotį aukštu lygiu ir gauti pagalbą jos vykdyme. Šiai laboratorijai naudosime [Copilot Free plan](https://github.com/github-copilot/signup), kuris turi mėnesinį ribojimą užbaigimams ir pokalbių sąveikoms.

Praplėtimas gali būti įdiegtas iš marketplace, tačiau jis turėtų jau būti pasiekiamas jūsų Codespaces aplinkoje. _Spustelėkite `Open Chat` iš Copilot ikonėlės išskleidžiamojo meniu - ir įveskite užklausą, pvz., `What can you do?`_ - gali būti paprašyta prisijungti. **GitHub Copilot Chat paruoštas**.

### 1.2. Įdiegti MCP serverius

Kad Agent režimas būtų efektyvus, jam reikia prieigos prie tinkamų įrankių, kad galėtų gauti žinias arba atlikti veiksmus. Čia MCP serveriai gali padėti. Konfigūruosime šiuos serverius:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Norėdami juos suaktyvinti:

1. Sukurkite failą pavadinimu `.vscode/mcp.json`, jei jis neegzistuoja
1. Nukopijuokite žemiau pateiktą turinį į tą failą - ir paleiskite serverius!
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

??? warning "Gali kilti klaida, kad `npx` nėra įdiegtas (spustelėkite, kad išvystytumėte sprendimą)"

      Norėdami ištaisyti, atidarykite failą `.devcontainer/devcontainer.json` ir pridėkite šią eilutę į features skyrių. Tada perstatykite konteinerį. Dabar turėtumėte turėti įdiegtą `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Išbandyti GitHub Copilot Chat

**Pirmiausia naudokite `az login`, kad autentifikuotumėtės su Azure iš VS Code komandų eilutės.**

Dabar turėtumėte galėti užklausti apie savo Azure prenumeratos būseną ir užduoti klausimus apie išdėstytus išteklius ar konfigūraciją. Išbandykite šias užklausas:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Taip pat galite užduoti klausimus apie Azure dokumentaciją ir gauti atsakymus, pagrįstus Microsoft Docs MCP serveriu. Išbandykite šias užklausas:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Arba galite paprašyti kodo fragmentų užduočiai užbaigti. Išbandykite šią užklausą.

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` režime tai pateiks kodą, kurį galite nukopijuoti-ir-įklijuoti ir išbandyti. `Agent` režime tai gali žengti žingsnį toliau ir sukurti atitinkamus išteklius už jus — įskaitant paruošimo scenarijus ir dokumentaciją — kad padėtų įvykdyti užduotį.

**Dabar esate pasiruošę pradėti tyrinėti šablono saugyklą**

---

## 2. Išanalizuoti architektūrą

??? prompt "PRAŠYMAS: Paaiškinkite programos architektūrą faile docs/images/architecture.png vienoje pastraipoje"

      Ši programa yra DI pagrįsta pokalbių programa, sukurta Azure aplinkoje, kuri demonstruoja modernią agentų pagrindu sukurtą architektūrą. Sprendimas sukasi aplink Azure Container App, kuri talpina pagrindinį programos kodą, apdorojantį vartotojo įvestį ir generuojantį intelektualius atsakymus per DI agentą. 
      
      Architektūra naudoja Microsoft Foundry Project kaip pagrindą DI galimybėms, jungdama prie Azure AI paslaugų, kurios tiekia pagrindinius kalbos modelius (pvz., gpt-4.1-mini) ir agentų funkcionalumą. Vartotojo sąveikos teka per React pagrindu sukurtą frontendą į FastAPI backendą, kuris bendrauja su DI agento paslauga kontekstiniams atsakymams generuoti. 
      
      Sistema integruoja žinių gavimo galimybes per failų paiešką arba Azure AI Search paslaugą, leidžiančią agentui pasiekti ir cituoti informaciją iš įkeltų dokumentų. Operacinės veiklos užtikrinimui architektūroje yra išsamus stebėjimas per Application Insights ir Log Analytics Workspace trasoms, žurnalams ir našumo optimizavimui. 
      
      Azure Storage teikia blob saugyklą programos duomenims ir failų įkėlimams, o Managed Identity užtikrina saugų prieigą tarp Azure išteklių be kredencialų saugojimo. Visas sprendimas sukurtas skalavimui ir palaikymui, konteinerizuota programa automatiškai skalauja pagal paklausą ir teikia įmontuotą saugumą, stebėjimą ir CI/CD galimybes per Azure valdomų paslaugų ekosistemą.

![Architektūra](../../../../../translated_images/lt/architecture.48d94861e6e6cdc0.webp)

---

## 3. Saugyklos struktūra

!!! prompt "PRAŠYMAS: Paaiškinkite šablono katalogo struktūrą. Pradėkite nuo vizualios hierarchinės diagramos."

??? info "ATSAKYMAS: Vizualinė hierarchinė diagrama"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigūracija ir nustatymas
      │   ├── azure.yaml                    # Azure Developer CLI konfigūracija
      │   ├── docker-compose.yaml           # Vietiniai kūrimo konteineriai
      │   ├── pyproject.toml                # Python projekto konfigūracija
      │   ├── requirements-dev.txt          # Kūrimo priklausomybės
      │   └── .devcontainer/                # VS Code dev konteinerio nustatymas
      │
      ├── 🏗️ Infrastruktūra (infra/)
      │   ├── main.bicep                    # Pagrindinis infrastruktūros šablonas
      │   ├── api.bicep                     # API specifiniai ištekliai
      │   ├── main.parameters.json          # Infrastruktūros parametrai
      │   └── core/                         # Moduliniai infrastruktūros komponentai
      │       ├── ai/                       # AI paslaugų konfigūracijos
      │       ├── host/                     # Talpinimo infrastruktūra
      │       ├── monitor/                  # Stebėjimas ir žurnalavimas
      │       ├── search/                   # Azure AI Search nustatymas
      │       ├── security/                 # Saugumas ir tapatybė
      │       └── storage/                  # Saugojimo paskyros konfigūracija
      │
      ├── 💻 Programos šaltinis (src/)
      │   ├── api/                          # Serverio API
      │   │   ├── main.py                   # FastAPI programos įvesties taškas
      │   │   ├── routes.py                 # API maršrutų apibrėžimai
      │   │   ├── search_index_manager.py   # Paieškos funkcionalumas
      │   │   ├── data/                     # API duomenų tvarkymas
      │   │   ├── static/                   # Statiniai žiniatinklio ištekliai
      │   │   └── templates/                # HTML šablonai
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js priklausomybės
      │   │   ├── vite.config.ts            # Vite build konfigūracija
      │   │   └── src/                      # Frontend šaltinio kodas
      │   ├── data/                         # Pavyzdiniai duomenų failai
      │   │   └── embeddings.csv            # Iš anksto apskaičiuoti embeddings
      │   ├── files/                        # Žinių bazės failai
      │   │   ├── customer_info_*.json      # Klientų duomenų pavyzdžiai
      │   │   └── product_info_*.md         # Produkto dokumentacija
      │   ├── Dockerfile                    # Konteinerio konfigūracija
      │   └── requirements.txt              # Python priklausomybės
      │
      ├── 🔧 Automatizavimas ir skriptai (scripts/)
      │   ├── postdeploy.sh/.ps1           # Po diegimo nustatymas
      │   ├── setup_credential.sh/.ps1     # Kredencialų konfiguracija
      │   ├── validate_env_vars.sh/.ps1    # Aplinkos kintamųjų patikra
      │   └── resolve_model_quota.sh/.ps1  # Modelio kvotos valdymas
      │
      ├── 🧪 Testavimas ir vertinimas
      │   ├── tests/                        # Vienetiniai ir integraciniai testai
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agento vertinimo sistema
      │   │   ├── evaluate.py               # Vertinimo vykdytojas
      │   │   ├── eval-queries.json         # Testo užklausos
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Kūrimo bandymų zona
      │   │   ├── 1-quickstart.py           # Pradžios pavyzdžiai
      │   │   └── aad-interactive-chat.py   # Autentifikacijos pavyzdžiai
      │   └── airedteaming/                 # DI saugumo vertinimas
      │       └── ai_redteaming.py          # Raudonosios komandos testavimas
      │
      ├── 📚 Dokumentacija (docs/)
      │   ├── deployment.md                 # Diegimo vadovas
      │   ├── local_development.md          # Vietinio nustatymo instrukcijos
      │   ├── troubleshooting.md            # Dažnos problemos ir sprendimai
      │   ├── azure_account_setup.md        # Azure išankstinės sąlygos
      │   └── images/                       # Dokumentacijos ištekliai
      │
      └── 📄 Projekto metaduomenys
         ├── README.md                     # Projekto apžvalga
         ├── CODE_OF_CONDUCT.md           # Bendruomenės taisyklės
         ├── CONTRIBUTING.md              # Prisidėjimo gairės
         ├── LICENSE                      # Licencijos sąlygos
         └── next-steps.md                # Gairės po diegimo
      ```

### 3.1. Pagrindinė programos architektūra

Šis šablonas seka **pilno kaupimo žiniatinklio programos** modelį su:

- **Backend**: Python FastAPI su Azure AI integracija
- **Frontend**: TypeScript/React su Vite build sistema
- **Infrastruktūra**: Azure Bicep šablonai debesų ištekliams
- **Konteinerizacija**: Docker nuosekliam diegimui

### 3.2 Infrastruktūra kaip kodas (bicep)

Infrastruktūros sluoksnis naudoja **Azure Bicep** šablonus, organizuotus moduliškai:

   - **`main.bicep`**: Koordinuoja visus Azure išteklius
   - **`core/` moduliai**: Pakartotinai naudojami komponentai skirtingoms paslaugoms
      - AI paslaugos (Microsoft Foundry Models, AI Search)
      - Konteinerių talpinimas (Azure Container Apps)
      - Stebėjimas (Application Insights, Log Analytics)
      - Saugumas (Key Vault, Managed Identity)

### 3.3 Programos šaltinis (`src/`)

**Serverio API (`src/api/`)**:

- REST API, paremtas FastAPI
- Foundry agentų integracija
- Paieškos indekso valdymas žinių gavimui
- Failų įkėlimo ir apdorojimo galimybės

**Frontend (`src/frontend/`)**:

- Modernus React/TypeScript SPA
- Vite greitam vystymui ir optimizuotiems buildams
- Pokalbių sąsaja agentų sąveikai

**Žinių bazė (`src/files/`)**:

- Pavyzdiniai klientų ir produktų duomenys
- Demonstruoja žinių gavimą iš failų
- JSON ir Markdown formato pavyzdžiai


### 3.4 DevOps ir automatizavimas

**Skriptai (`scripts/`)**:

- Kryžminės platformos PowerShell ir Bash skriptai
- Aplinkos patikra ir nustatymas
- Po diegimo konfigūracija
- Modelio kvotos valdymas

**Integracija su Azure Developer CLI**:

- `azure.yaml` konfigūracija `azd` darbo eigoms
- Automatizuotas resursų suteikimas ir diegimas
- Aplinkos kintamųjų valdymas

### 3.5 Testavimas ir kokybės užtikrinimas

**Vertinimo sistema (`evals/`)**:

- Agento veikimo vertinimas
- Užklausų–atsakymų kokybės testavimas
- Automatizuota vertinimo eiga

**DI saugumas (`airedteaming/`)**:

- Raudonosios komandos testavimas DI saugumui
- Saugumo pažeidžiamumo skenavimas
- Atsakingos DI praktikos

---

## 4. Sveikiname 🏆

Pavyko panaudoti GitHub Copilot Chat su MCP serveriais, kad ištirtumėte saugyklą.

- [X] Aktyvavote GitHub Copilot Azure
- [X] Supratote programos architektūrą
- [X] Išnagrinėjote AZD šablono struktūrą

Tai suteikia jums supratimą apie _infrastruktūra kaip kodas_ išteklius šiame šablone. Toliau peržiūrėsime AZD konfigūracijos failą.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Jei informacija yra kritinė, rekomenduojamas profesionalus žmogiškasis vertimas. Neatsakome už jokius nesusipratimus ar neteisingą aiškinimą, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->