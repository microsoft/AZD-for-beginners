# 3. Egy sablon felbontása

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Aktiválni a GitHub Copilotot MCP szerverekkel az Azure segítéséhez
    - [ ] Megérteni az AZD sablon mappaszerkezetét és összetevőit
    - [ ] Felfedezni az infrastruktúra-kód formájában (Bicep) szervezési mintákat
    - [ ] **Labor 3:** GitHub Copilot használata a tároló architektúrájának feltérképezéséhez és megértéséhez

---


Az AZD sablonokkal és az Azure Developer CLI-vel (`azd`) gyorsan elindíthatjuk AI fejlesztési utunkat szabványosított tárolókkal, amelyek minta kódot, infrastruktúrát és konfigurációs fájlokat nyújtanak - egy készen álló, telepíthető _starter_ projekt formájában.

**De most meg kell értenünk a projekt struktúráját és kódalapját - és képesnek kell lennünk az AZD sablon testreszabására - bármiféle előzetes tapasztalat vagy AZD ismeret nélkül!**

---

## 1. GitHub Copilot aktiválása

### 1.1 GitHub Copilot Chat telepítése

Ideje felfedezni a [GitHub Copilot Agent Móddal](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Most már természetes nyelven is leírhatjuk a feladatunkat magas szinten, és segítséget kaphatunk a végrehajtáshoz. Ehhez a laborhoz a [Copilot Free csomagot](https://github.com/github-copilot/signup) használjuk, amely havi korlátot szab a kérések és chat interakciók számára.

A bővítmény telepíthető a piactérről, de valószínűleg már elérhető a Codespaces környezetében. _Kattintson a Copilot ikon legördülő menüjében az `Open Chat` lehetőségre - és írjon be egy kérést, például `What can you do?`_ - előfordulhat, hogy bejelentkezést kér. **A GitHub Copilot Chat készen áll.**

### 1.2. MCP szerverek telepítése

Az Agent mód hatékony működéséhez hozzáférést kell biztosítanunk a megfelelő eszközökhöz, amelyek segítenek tudás lekérésében vagy műveletek végrehajtásában. Ebben segítenek az MCP szerverek. A következő szervereket állítjuk be:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Az aktiváláshoz:

1. Hozzon létre egy `.vscode/mcp.json` nevű fájlt, ha nem létezik
1. Másolja bele az alábbiakat - majd indítsa el a szervereket!
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

??? warning "Lehet, hogy hibaüzenetet kap, miszerint a `npx` nincs telepítve (a javításhoz kattintson a kibontáshoz)"

      A javításhoz nyissa meg a `.devcontainer/devcontainer.json` fájlt, és adja hozzá a következő sort a features szekcióhoz. Ezután építse újra a konténert. Most már telepítve lesz az `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. GitHub Copilot Chat tesztelése

**Először használja az `az login` parancsot, hogy hitelesítse magát az Azure-ba a VS Code parancssorból.**

Most már lekérdezheti Azure előfizetésének állapotát, és kérdéseket tehet fel telepített erőforrásokról vagy konfigurációról. Próbálja ki a következő kéréseket:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Továbbá kérdezhet az Azure dokumentációról, és válaszokat kaphat a Microsoft Docs MCP szerveren keresztül. Próbálja ki a következőket:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Vagy kérhet kódrészleteket egy feladat elvégzéséhez. Próbálja ki ezt a kérdést:

1. `Give me a Python code example that uses AAD for an interactive chat client`

Az `Ask` módban ez olyan kódot ad, amit bemásolhat és kipróbálhat. Az `Agent` módban ezt tovább viszi, és létrehozza a releváns erőforrásokat - beleértve az telepítési szkripteket és dokumentációt - hogy segítse a feladat végrehajtását.

**Most már felkészült arra, hogy felfedezze a sablon tárolót**

---

## 2. Architektúra felbontása

??? prompt "KÉRÉS: Magyarázza el a docs/images/architecture.png alkalmazás architektúráját 1 bekezdésben"

      Ez az alkalmazás egy Azure alapú, mesterséges intelligenciával működő chat alkalmazás, amely modern, agent alapú architektúrát demonstrál. A megoldás központjában egy Azure Container App áll, amely a fő alkalmazáskódot futtatja, feldolgozva a felhasználói inputot és intelligens válaszokat generálva egy AI agent segítségével. 
      
      Az architektúra a Microsoft Foundry Project-et használja az AI képességek alapjául, kapcsolódva az Azure AI Services-hez, amelyek az alapvető nyelvi modelleket (például gpt-4.1-mini) és az agent funkciókat biztosítják. A felhasználói interakciók egy React alapú frontendből egy FastAPI backendhez futnak, amely kommunikál az AI agent szolgáltatással a kontextuális válaszok generálására. 
      
      A rendszer tudáslekérési képességeket is magában foglal, akár fájlkeresés, akár Azure AI Search szolgáltatás révén, lehetővé téve az agent számára, hogy hozzáférjen és idézzen a feltöltött dokumentumokból. Az üzemeltetési kiválóság érdekében az architektúra átfogó monitorozást tartalmaz az Application Insights és Log Analytics Workspace használatával a nyomon követésre, naplózásra és teljesítményoptimalizálásra. 
      
      Az Azure Storage blob tárolást biztosít az alkalmazási adatok és fájlfeltöltések számára, míg a Managed Identity biztonságos hozzáférést garantál az Azure erőforrásai között anélkül, hogy hitelesítő adatokat kellene tárolni. A teljes megoldás skálázhatóságra és karbantarthatóságra tervezett, a konténerizált alkalmazás automatikusan skálázódik a kereslet alapján, miközben beépített biztonságot, monitorozást és CI/CD képességeket biztosít az Azure kezelt szolgáltatásain keresztül.

![Architektúra](../../../../../translated_images/hu/architecture.48d94861e6e6cdc0.webp)

---

## 3. Tárolószerkezet

!!! prompt "KÉRÉS: Magyarázza el a sablon mappaszerkezetét. Kezdje egy vizuális, hierarchikus diagrammal."

??? info "VÁLASZ: Vizuális hierarchikus diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguráció és beállítás
      │   ├── azure.yaml                    # Azure Developer CLI konfiguráció
      │   ├── docker-compose.yaml           # Helyi fejlesztési konténerek
      │   ├── pyproject.toml                # Python projekt konfiguráció
      │   ├── requirements-dev.txt          # Fejlesztési függőségek
      │   └── .devcontainer/                # VS Code fejlesztői konténer beállítás
      │
      ├── 🏗️ Infrastruktúra (infra/)
      │   ├── main.bicep                    # Fő infrastruktúra sablon
      │   ├── api.bicep                     # API-specifikus erőforrások
      │   ├── main.parameters.json          # Infrastrukturális paraméterek
      │   └── core/                         # Moduláris infrastruktúra komponensek
      │       ├── ai/                       # AI szolgáltatások konfigurációi
      │       ├── host/                     # Hosting infrastruktúra
      │       ├── monitor/                  # Monitorozás és naplózás
      │       ├── search/                   # Azure AI Search beállítás
      │       ├── security/                 # Biztonság és identitás
      │       └── storage/                  # Tárolófiók konfigurációk
      │
      ├── 💻 Alkalmazás forráskód (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI alkalmazás belépési pont
      │   │   ├── routes.py                 # API útvonal definíciók
      │   │   ├── search_index_manager.py   # Keresési funkciók
      │   │   ├── data/                     # API adatkezelés
      │   │   ├── static/                   # Statikus webes erőforrások
      │   │   └── templates/                # HTML sablonok
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js függőségek
      │   │   ├── vite.config.ts            # Vite build konfiguráció
      │   │   └── src/                      # Frontend forráskód
      │   ├── data/                         # Mintaadat fájlok
      │   │   └── embeddings.csv            # Előre számított beágyazások
      │   ├── files/                        # Tudásbázis fájlok
      │   │   ├── customer_info_*.json      # Ügyféladat mintafájlok
      │   │   └── product_info_*.md         # Termék dokumentáció
      │   ├── Dockerfile                    # Konténer konfiguráció
      │   └── requirements.txt              # Python függőségek
      │
      ├── 🔧 Automatizálás és szkriptek (scripts/)
      │   ├── postdeploy.sh/.ps1           # Telepítés utáni beállítások
      │   ├── setup_credential.sh/.ps1     # Hitelesítőadat konfiguráció
      │   ├── validate_env_vars.sh/.ps1    # Környezeti változók ellenőrzése
      │   └── resolve_model_quota.sh/.ps1  # Modell kvóta kezelése
      │
      ├── 🧪 Tesztelés és értékelés
      │   ├── tests/                        # Egység- és integrációs tesztek
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent értékelő keretrendszer
      │   │   ├── evaluate.py               # Értékelő futtató
      │   │   ├── eval-queries.json         # Teszt lekérdezések
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Fejlesztési játszótér
      │   │   ├── 1-quickstart.py           # Gyors kezdési példák
      │   │   └── aad-interactive-chat.py   # Hitelesítési példák
      │   └── airedteaming/                 # AI biztonsági értékelés
      │       └── ai_redteaming.py          # Red team tesztelés
      │
      ├── 📚 Dokumentáció (docs/)
      │   ├── deployment.md                 # Telepítési útmutató
      │   ├── local_development.md          # Helyi beállítási útmutató
      │   ├── troubleshooting.md            # Gyakori hibák és javításuk
      │   ├── azure_account_setup.md        # Azure előfeltételek
      │   └── images/                       # Dokumentációs erőforrások
      │
      └── 📄 Projekt metaadatok
         ├── README.md                     # Projekt áttekintése
         ├── CODE_OF_CONDUCT.md           # Közösségi irányelvek
         ├── CONTRIBUTING.md              # Hozzájárulási útmutató
         ├── LICENSE                      # Licencfeltételek
         └── next-steps.md                # Telepítés utáni iránymutatás
      ```

### 3.1. Alkalmazás magarchitektúrája

Ez a sablon egy **full-stack webalkalmazás** mintát követ:

- **Backend**: Python FastAPI Azure AI integrációval
- **Frontend**: TypeScript/React Vite build rendszerrel
- **Infrastruktúra**: Azure Bicep sablonok felhő erőforrásokhoz
- **Konténerizáció**: Docker az egységes telepítéshez

### 3.2 Infra kód formájában (bicep)

Az infrastruktúra réteg **Azure Bicep** sablonokat használ, modulárisan szervezve:

   - **`main.bicep`**: Minden Azure erőforrás összehangolása
   - **`core/` modulok**: Újrahasználható komponensek különböző szolgáltatásokhoz
      - AI szolgáltatások (Microsoft Foundry Modellek, AI Search)
      - Konténer hosting (Azure Container Apps)
      - Monitorozás (Application Insights, Log Analytics)
      - Biztonság (Key Vault, Managed Identity)

### 3.3 Alkalmazás forráskód (`src/`)

**Backend API (`src/api/`)**:

- FastAPI alapú REST API
- Foundry Agents integráció
- Keresési index kezelése tudáslekéréshez
- Fájlfeltöltési és feldolgozási képességek

**Frontend (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Vite a gyors fejlesztésért és optimalizált buildért
- Chat felület az agent interakciókhoz

**Tudásbázis (`src/files/`)**:

- Minta ügyfél- és termékadatok
- Fájlalapú tudáslekérés demonstrálása
- JSON és Markdown formátumú példák

### 3.4 DevOps és automatizálás

**Szkriptek (`scripts/`)**:

- Keresztplatformos PowerShell és Bash szkriptek
- Környezeti validáció és beállítás
- Telepítés utáni konfiguráció
- Modell kvóta kezelése

**Azure Developer CLI integráció**:

- `azure.yaml` konfiguráció az `azd` munkafolyamatokhoz
- Automatikus előkészítés és telepítés
- Környezeti változók kezelése

### 3.5 Tesztelés és minőségbiztosítás

**Értékelő keretrendszer (`evals/`)**:

- Agent teljesítmény értékelése
- Lekérdezés-válasz minőségtesztelés
- Automatizált értékelő pipeline

**AI biztonság (`airedteaming/`)**:

- Red team teszt az AI biztonságért
- Biztonsági sebezhetőség vizsgálat
- Felelős AI gyakorlatok

---

## 4. Gratulálunk 🏆

Sikeresen használtad a GitHub Copilot Chat-et MCP szerverekkel a tároló feltérképezéséhez.

- [X] Aktiváltad a GitHub Copilotot Azure-hoz
- [X] Megértetted az alkalmazás architektúráját
- [X] Feltérképezted az AZD sablon szerkezetét

Ez áttekintést ad az ehhez a sablonhoz tartozó _infrastruktúra-kód_ vagyonelemekről. Ezután megnézzük az AZD konfigurációs fájlját.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) mesterséges intelligencia fordító szolgáltatás használatával készült. Bár igyekszünk pontos fordítást biztosítani, kérjük, vegye figyelembe, hogy az automatikus fordítás hibákat vagy pontatlanságokat tartalmazhat. Az eredeti, anyanyelvű dokumentum tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítás igénybevétele. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->