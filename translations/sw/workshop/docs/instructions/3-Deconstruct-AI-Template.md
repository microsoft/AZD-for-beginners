# 3. Fumbua Kiolezo

!!! tip "MWISHO WA MODULI HII UTAWEZA"

    - [ ] Washa GitHub Copilot na seva za MCP kwa msaada wa Azure
    - [ ] Elewa muundo wa folda na vipengele vya kiolezo cha AZD
    - [ ] Chunguza mifumo ya kupanga miundombinu-kama-msimbo (Bicep)
    - [ ] **Maabara 3:** Tumia GitHub Copilot kuchunguza na kuelewa usanifu wa hazina

---


Kwa violezo vya AZD na Azure Developer CLI (`azd`) tunaweza kuanzisha haraka safari yetu ya maendeleo ya AI kwa hifadhi zilizo sanifu zinazotoa msimbo wa mfano, miundombinu na faili za usanidi - kwa njia ya mradi wa _starter_ tayari kwa kutumika.

**Lakini sasa, tunahitaji kuelewa muundo wa mradi na msimbo wa msingi - na kuweza kubadilisha kiolezo cha AZD - bila uzoefu wowote au uelewa wa AZD!**

---

## 1. Washa GitHub Copilot

### 1.1 Sakinisha GitHub Copilot Chat

Ni wakati wa kuchunguza [GitHub Copilot na Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Sasa, tunaweza kutumia lugha ya asili kuelezea kazi yetu kwa kiwango cha juu, na kupata msaada katika utekelezaji. Kwa maabara hii, tutatumia [Mpango wa Copilot Bila Malipo](https://github.com/github-copilot/signup) ambao una kikomo cha kila mwezi kwa utekelezaji na mwingiliano wa gumzo.

Kiendelezi kinaweza kusakinishwa kutoka kwenye marketplace, na mara nyingi tayari kinapatikana katika Codespaces au mazingira ya dev container. _Bonyeza `Open Chat` kutoka kwenye ikon ya Copilot iliyodondoshwa - na andika ombi kama `What can you do?`_ - huenda utakapoombwa uingie kwa kutumia akaunti. **GitHub Copilot Chat iko tayari**.

### 1.2. Sakinisha seva za MCP

Ili Agent mode iwe na ufanisi, inahitaji ufikiaji wa zana sahihi zitakazoiwezesha kupata maarifa au kuchukua hatua. Hapa ndipo seva za MCP zinapoweza kusaidia. Tutasanidi seva zifuatazo:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Ili kuziwezesha hizi:

1. Unda faili iitwayo `.vscode/mcp.json` ikiwa haipo
1. Nakili yafuatayo ndani ya faili hiyo - kisha anza seva hizi!
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

??? warning "Unaweza kupata kosa kwamba `npx` haijawekwa (bonyeza ili kupanua suluhisho)"

      Ili kurekebisha hili, fungua faili `.devcontainer/devcontainer.json` na ongeza mstari huu kwenye sehemu ya features. Kisha jenga tena kontena. Sasa utakuwa na `npx` imewekwa.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Jaribu GitHub Copilot Chat

**Kwanza tumia `azd auth login` kujiathentisha na Azure kutoka kwa mstari wa amri wa VS Code. Tumia pia `az login` tu ikiwa unapanga kuendesha amri za Azure CLI moja kwa moja.**

Sasa unapaswa kuweza kuuliza hali ya usajili wako wa Azure, na kuuliza maswali kuhusu rasilimali zilizowekwa au usanidi. Jaribu maombi haya:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Unaweza pia kuuliza maswali kuhusu nyaraka za Azure na kupata majibu yenye msingi kwenye Microsoft Docs MCP server. Jaribu maombi haya:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Au unaweza kuomba vipande vya msimbo kukamilisha kazi. Jaribu ombi hili.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Katika hali ya `Ask`, hili litatupa msimbo ambao unaweza kunakili-kubandika na kujaribu. Katika hali ya `Agent`, hili linaweza kuchukua hatua zaidi na kuunda rasilimali zinazofaa kwako - pamoja na script za usanidi na nyaraka - kukusaidia kutekeleza kazi hiyo.

**Sasa umewekwa kuanza kuchunguza hazina ya kiolezo**

---

## 2. Fumbua Usanifu wa Mfumo

??? prompt "OMBA: Eleza usanifu wa programu katika docs/images/architecture.png kwa aya 1"

      Programu hii ni programu ya gumzo inayotumia AI iliyojengwa kwenye Azure inayonyesha usanifu wa kisasa wa msingi wa mawakala. Suluhisho linajikita kwenye Azure Container App inayoweka msimbo mkuu wa programu, ambao unachakata pembejeo za mtumiaji na kuzalisha majibu yenye akili kupitia wakala wa AI.
      
      Usanifu unatumia Microsoft Foundry Project kama msingi wa uwezo wa AI, ukiunganishwa na Azure AI Services zinazotoa mifano ya lugha (kama gpt-4.1-mini) na utendaji wa mawakala. Mwingiliano wa watumiaji hupitia frontend inayotegemea React hadi backend ya FastAPI ambayo inazungumza na huduma ya wakala wa AI kwa ajili ya uzalishaji wa majibu ya muktadha.
      
      Mfumo unajumuisha uwezo wa kupata maarifa kupitia utafutaji wa faili au huduma ya Azure AI Search, ikiruhusu wakala kupata na kunukuu taarifa kutoka kwa nyaraka zilizopakuliwa. Kwa ubora wa uendeshaji, usanifu unajumuisha ufuatiliaji kamili kupitia Application Insights na Log Analytics Workspace kwa ufuatiliaji, uandishi wa kumbukumbu, na uboreshaji wa utendaji.
      
      Azure Storage hutoa uhifadhi wa blob kwa data za programu na upakuaji wa faili, wakati Managed Identity inahakikisha ufikiaji salama kati ya rasilimali za Azure bila kuhifadhi nywila. Suluhisho lote limebuniwa kwa uwezo wa kupanuka na utunzaji, na programu iliyokonteneriwa inapanuka moja kwa moja kulingana na mahitaji wakati ikitoa usalama uliojengwa, ufuatiliaji, na uwezo wa CI/CD kupitia ekosistemu ya huduma zilizosimamiwa za Azure.

![Usanifu](../../../../../translated_images/sw/architecture.48d94861e6e6cdc0.webp)

---

## 3. Muundo wa Hazina

!!! prompt "OMBA: Eleza muundo wa folda wa kiolezo. Anza na mchoro wa muundo wa ngazi wa kuona."

??? info "JIBU: Mchoro wa Kimtazamo wa Muundo wa Ngazi"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Mipangilio na Usanidi
      │   ├── azure.yaml                    # Usanidi wa Azure Developer CLI
      │   ├── docker-compose.yaml           # Makontena ya maendeleo ya ndani
      │   ├── pyproject.toml                # Usanidi wa mradi wa Python
      │   ├── requirements-dev.txt          # Vitegemezi vya maendeleo
      │   └── .devcontainer/                # Usanidi wa dev container wa VS Code
      │
      ├── 🏗️ Miundombinu (infra/)
      │   ├── main.bicep                    # Kiolezo kikuu cha miundombinu
      │   ├── api.bicep                     # Rasilimali maalum za API
      │   ├── main.parameters.json          # Vigezo vya miundombinu
      │   └── core/                         # Vipengele vya moduli za miundombinu
      │       ├── ai/                       # Usanidi wa huduma za AI
      │       ├── host/                     # Miundombinu ya mwenyeji
      │       ├── monitor/                  # Ufuatiliaji na uandishi wa kumbukumbu
      │       ├── search/                   # Usanidi wa Azure AI Search
      │       ├── security/                 # Usalama na utambulisho
      │       └── storage/                  # Usanidi wa akaunti za kuhifadhi
      │
      ├── 💻 Chanzo cha Programu (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Kuingia kwa programu ya FastAPI
      │   │   ├── routes.py                 # Ufafanuzi wa njia za API
      │   │   ├── search_index_manager.py   # Kazi za utafutaji
      │   │   ├── data/                     # Usindikaji wa data za API
      │   │   ├── static/                   # Mali imara za wavuti
      │   │   └── templates/                # Kiolezo za HTML
      │   ├── frontend/                     # Mwisho wa mbele wa React/TypeScript
      │   │   ├── package.json              # Vitegemezi za Node.js
      │   │   ├── vite.config.ts            # Usanidi wa ujenzi wa Vite
      │   │   └── src/                      # Chanzo cha frontend
      │   ├── data/                         # Faili za data za mfano
      │   │   └── embeddings.csv            # Embeddings zilizohesabiwa awali
      │   ├── files/                        # Faili za msingi wa maarifa
      │   │   ├── customer_info_*.json      # Sampuli za data za wateja
      │   │   └── product_info_*.md         # Nyaraka za bidhaa
      │   ├── Dockerfile                    # Usanidi wa kontena
      │   └── requirements.txt              # Vitegemezi vya Python
      │
      ├── 🔧 Uendeshaji & Skripti (scripts/)
      │   ├── postdeploy.sh/.ps1           # Usanidi baada ya utumaji
      │   ├── setup_credential.sh/.ps1     # Usanidi wa vitambulisho
      │   ├── validate_env_vars.sh/.ps1    # Uhakiki wa mazingira
      │   └── resolve_model_quota.sh/.ps1  # Usimamizi wa kigezo cha modeli
      │
      ├── 🧪 Upimaji & Tathmini
      │   ├── tests/                        # Majaribio ya kitengo na ujumuishaji
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Mfumo wa tathmini ya wakala
      │   │   ├── evaluate.py               # Mwendeshaji wa tathmini
      │   │   ├── eval-queries.json         # Maswali ya mtihani
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Uwanja wa majaribio wa maendeleo
      │   │   ├── 1-quickstart.py           # Mifano ya kuanza haraka
      │   │   └── aad-interactive-chat.py   # Mifano ya uthibitishaji
      │   └── airedteaming/                 # Tathmini ya usalama wa AI
      │       └── ai_redteaming.py          # Majaribio ya timu nyekundu
      │
      ├── 📚 Nyaraka (docs/)
      │   ├── deployment.md                 # Mwongozo wa utumaji
      │   ├── local_development.md          # Maelekezo ya usanidi wa ndani
      │   ├── troubleshooting.md            # Masuala ya kawaida & suluhisho
      │   ├── azure_account_setup.md        # Masharti ya Azure
      │   └── images/                       # Mali za nyaraka
      │
      └── 📄 Metadata ya Mradi
         ├── README.md                     # Muhtasari wa mradi
         ├── CODE_OF_CONDUCT.md           # Miongozo ya jamii
         ├── CONTRIBUTING.md              # Mwongozo wa michango
         ├── LICENSE                      # Masharti ya leseni
         └── next-steps.md                # Mwongozo baada ya utumaji
      ```

### 3.1. Usanifu wa App Msingi

Kiolezo hiki kinafuata muundo wa **programu ya wavuti kamili** na:

- **Backend**: FastAPI ya Python yenye muunganisho na Azure AI
- **Frontend**: TypeScript/React na mfumo wa ujenzi wa Vite
- **Infrastructure**: Violezo vya Azure Bicep kwa rasilimali za wingu
- **Containerization**: Docker kwa utumaji thabiti

### 3.2 Miundombinu kama Msimbo (bicep)

Safu ya miundombinu inatumia violezo vya **Azure Bicep** vilivyopangwa kwa moduli:

   - **`main.bicep`**: Inaendesha rasilimali zote za Azure
   - **`core/` modules**: Vipengele vinavyotumika tena kwa huduma mbalimbali
      - Huduma za AI (Microsoft Foundry Models, AI Search)
      - Uendeshaji wa makontena (Azure Container Apps)
      - Ufuatiliaji (Application Insights, Log Analytics)
      - Usalama (Key Vault, Managed Identity)

### 3.3 Chanzo cha Programu (`src/`)

**Backend API (`src/api/`)**:

- API ya REST inayotokana na FastAPI
- Muunganisho na Foundry Agents
- Usimamizi wa index ya utafutaji kwa ajili ya upokezaji maarifa
- Uwezo wa kupakia faili na usindikaji

**Frontend (`src/frontend/`)**:

- SPA ya kisasa ya React/TypeScript
- Vite kwa maendeleo ya haraka na ujenzi ulioboreshwa
- Kiolesura cha gumzo kwa mwingiliano wa wakala

**Msingi wa Maarifa (`src/files/`)**:

- Sampuli za data za wateja na bidhaa
- Inaonyesha upokezaji wa maarifa kwa kutumia faili
- Mifano ya muundo wa JSON na Markdown


### 3.4 DevOps & Uendeshaji Otomatiki

**Skripti (`scripts/`)**:

- Skripti za PowerShell na Bash zinazoendana na mifumo mbalimbali
- Uhakiki wa mazingira na usanidi
- Usanidi baada ya utumaji
- Usimamizi wa kigezo cha modeli

**Muunganisho wa Azure Developer CLI**:

- Usanidi wa `azure.yaml` kwa mtiririko wa kazi wa `azd`
- Upangaji na utumaji uliot automatishwa
- Usimamizi wa vigezo vya mazingira

### 3.5 Upimaji & Udhibiti wa Ubora

**Mfumo wa Tathmini (`evals/`)**:

- Tathmini ya utendaji wa wakala
- Upimaji wa ubora wa majibu ya maswali
- Mstari wa tathmini uliot automatishwa

**Usalama wa AI (`airedteaming/`)**:

- Majaribio ya timu nyekundu kwa usalama wa AI
- Skanningu ya udhaifu wa usalama
- Mazoezi ya AI yenye kuwajibika

---

## 4. Hongera 🏆

Umetumia kwa mafanikio GitHub Copilot Chat na seva za MCP, kuchunguza hazina.

- [X] Umewashwa GitHub Copilot kwa Azure
- [X] Umeelewa Usanifu wa Programu
- [X] Umechunguza muundo wa kiolezo cha AZD

Hii inakupa hisia ya mali za _miundombinu kama msimbo_ kwa kiolezo hiki. Ifuatayo, tutaangalia faili ya usanidi ya AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Onyo**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya kutafsiri kwa AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au zisizo sahihi. Nyaraka ya asili katika lugha yake inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inashauriwa. Hatuwajibiki kwa kutoelewana au tafsiri mbaya zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->