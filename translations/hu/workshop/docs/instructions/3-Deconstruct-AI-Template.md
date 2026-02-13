# 3. Egy sablon szétszedése

!!! tip "A TANFOLYAM VÉGÉRE KÉPES LESZ"

    - [ ] Aktiválni a GitHub Copilot-ot MCP szerverekkel az Azure támogatásához
    - [ ] Megérteni az AZD sablon mappaszerkezetét és összetevőit
    - [ ] Felfedezni az infrastruktúra-kód formátumú (Bicep) szervezési mintákat
    - [ ] **3. gyakorlat:** GitHub Copilot használata a tárházi architektúra felfedezéséhez és megértéséhez

---


AZD sablonokkal és az Azure Developer CLI-vel (`azd`) gyorsan elindíthatjuk AI fejlesztési utunkat szabványosított tárakkal, amelyek mintakódot, infrastruktúrát és konfigurációs fájlokat biztosítanak - egy telepítésre kész _indító_ projekt formájában.

**De most meg kell értenünk a projekt struktúráját és a kódbázist - és képesnek kell lennünk testreszabni az AZD sablont - előzetes tapasztalat vagy AZD ismerete nélkül!**

---

## 1. GitHub Copilot aktiválása

### 1.1 GitHub Copilot Chat telepítése

Ideje felfedezni a [GitHub Copilot Agent Mode-al](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Most természetes nyelven írhatjuk le a feladatot magas szinten, és segítséget kapunk annak végrehajtásához. Ehhez a gyakorlathoz használjuk a [Copilot Ingyenes csomagot](https://github.com/github-copilot/signup), amely havi korlátozást tartalmaz a teljesítések és chat interakciók tekintetében.

A kiterjesztés telepíthető a piactérről, de a Codespaces környezetében már elérhető kell hogy legyen. _Kattintson a Copilot ikon legördülő menüjében az `Open Chat` lehetőségre - és írjon be egy parancsot, például `What can you do?`_ - előfordulhat, hogy bejelentkezést kér. **A GitHub Copilot Chat készen áll**.

### 1.2. MCP szerverek telepítése

Az Agent mód hatékony működéséhez hozzáférnie kell a megfelelő eszközökhöz a tudás lekéréséhez vagy műveletek végrehajtásához. Ebben segítenek az MCP szerverek. A következő szervereket konfiguráljuk:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Az aktiváláshoz:

1. Hozzon létre egy `.vscode/mcp.json` nevű fájlt, ha még nincs
1. Másolja be az alábbiakat ebbe a fájlba - majd indítsa el a szervereket!
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

??? warning "Előfordulhat, hogy hibát kap arról, hogy az `npx` nincs telepítve (kattintson a javításhoz)"

      Ehhez nyissa meg a `.devcontainer/devcontainer.json` fájlt, és adja hozzá ezt a sort a features szekcióhoz. Ezután építse újra a konténert. Most már az `npx` telepítve lesz.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. GitHub Copilot Chat tesztelése

**Először használja az `az login` parancsot az Azure-ba történő hitelesítéshez a VS Code parancssorában.**

Most már lekérdezheti Azure előfizetése állapotát, és kérdéseket tehet fel a telepített erőforrásokról vagy konfigurációról. Próbálja ki a következő parancsokat:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Kérdezhet az Azure dokumentációról is, és válaszokat kaphat a Microsoft Docs MCP szerver alapján. Próbálja ki ezeket:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Vagy kérhet kódrészleteket egy feladat elvégzéséhez. Próbálja ezt:

1. `Give me a Python code example that uses AAD for an interactive chat client`

Az `Ask` módban ez kódot ad, amit kimásolhat és kipróbálhat. Az `Agent` módban ez tovább mehet, és létrehozhatja a szükséges erőforrásokat is - beleértve beállító szkripteket és dokumentációt - hogy segítsen végrehajtani a feladatot.

**Most már fel vagy készülve, hogy elkezdd felfedezni a sablonraktárt**

---

## 2. Architektúra elemzése

??? prompt "KÉRÉS: Magyarázd el az alkalmazás architektúráját a docs/images/architecture.png fájlban 1 bekezdésben"

      Ez az alkalmazás egy Azure-on futó AI-alapú chatalkalmazás, amely modern agent-alapú architektúrát mutat be. A megoldás központjában egy Azure Container App áll, amely a fő alkalmazáskódot futtatja, feldolgozza a felhasználói bemenetet és intelligens válaszokat generál egy AI ügynökön keresztül.
      
      Az architektúra alapját a Microsoft Foundry Project képezi az AI képességek számára, kapcsolódva az Azure AI szolgáltatásokhoz, amelyek az alapjául szolgáló nyelvi modelleket (például GPT-4o-mini) és az ügynök funkciót biztosítják. A felhasználói interakciók egy React alapú frontendből áramlanak a FastAPI backendhez, amely kommunikál az AI ügynök szolgáltatással a kontextuális válaszok generálásához.
      
      A rendszer tudáslekérési képességeket is magába foglal fájlkereséssel vagy Azure AI Search szolgáltatással, lehetővé téve az ügynök számára a feltöltött dokumentumokból való információk elérését és hivatkozását.
      
      Az üzemeltetési kiválóság érdekében az architektúrában szerepel átfogó monitorozás az Application Insights és Log Analytics Workspace segítségével a nyomon követéshez, naplózáshoz és teljesítményoptimalizáláshoz.
      
      Az Azure Storage blob tárhelyet biztosít az alkalmazás adatai és fájlfeltöltések számára, míg a Managed Identity biztosítja a biztonságos hozzáférést az Azure erőforrások között hitelesítő adatok tárolása nélkül.
      
      Az egész megoldás skálázhatóságra és karbantarthatóságra lett tervezve, a konténerizált alkalmazás automatikusan méreteződik a kereslet alapján, miközben beépített biztonságot, monitorozást és CI/CD képességeket nyújt az Azure kezelt szolgáltatási ökoszisztémáján keresztül.

![Architektúra](../../../../../translated_images/hu/architecture.48d94861e6e6cdc0.webp)

---

## 3. Tárház szerkezete

!!! prompt "KÉRÉS: Magyarázd el a sablon mappaszerkezetét. Kezdd egy vizuális hierarchikus diagrammal."

??? info "VÁLASZ: Vizuális hierarchikus diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguráció és beállítás
      │   ├── azure.yaml                    # Azure Developer CLI konfiguráció
      │   ├── docker-compose.yaml           # Helyi fejlesztői konténerek
      │   ├── pyproject.toml                # Python projekt konfiguráció
      │   ├── requirements-dev.txt          # Fejlesztési függőségek
      │   └── .devcontainer/                # VS Code fejlesztői konténer beállítás
      │
      ├── 🏗️ Infrastruktúra (infra/)
      │   ├── main.bicep                    # Fő infrastruktúra sablon
      │   ├── api.bicep                     # API-specifikus erőforrások
      │   ├── main.parameters.json          # Infrastruktúra paraméterek
      │   └── core/                         # Moduláris infrastruktúra összetevők
      │       ├── ai/                       # AI szolgáltatás konfigurációk
      │       ├── host/                     # Hostoló infrastruktúra
      │       ├── monitor/                  # Monitorozás és naplózás
      │       ├── search/                   # Azure AI Search beállítás
      │       ├── security/                 # Biztonság és identitás
      │       └── storage/                  # Tároló fiók konfigurációk
      │
      ├── 💻 Alkalmazás forrás (src/)
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
      │   │   ├── customer_info_*.json      # Ügyféladat minták
      │   │   └── product_info_*.md         # Termék dokumentáció
      │   ├── Dockerfile                    # Konténer konfiguráció
      │   └── requirements.txt              # Python függőségek
      │
      ├── 🔧 Automatizálás és szkriptek (scripts/)
      │   ├── postdeploy.sh/.ps1           # Telepítés utáni beállítás
      │   ├── setup_credential.sh/.ps1     # Hitelesítő adatok konfigurálása
      │   ├── validate_env_vars.sh/.ps1    # Környezeti változók ellenőrzése
      │   └── resolve_model_quota.sh/.ps1  # Model kvóta kezelése
      │
      ├── 🧪 Tesztelés és értékelés
      │   ├── tests/                        # Egység- és integrációs tesztek
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Ügynök értékelési keretrendszer
      │   │   ├── evaluate.py               # Értékelő futtató
      │   │   ├── eval-queries.json         # Teszt lekérdezések
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Fejlesztői játszótér
      │   │   ├── 1-quickstart.py           # Kezdő példák
      │   │   └── aad-interactive-chat.py   # Hitelesítési példák
      │   └── airedteaming/                 # AI biztonsági értékelés
      │       └── ai_redteaming.py          # Red team tesztelés
      │
      ├── 📚 Dokumentáció (docs/)
      │   ├── deployment.md                 # Telepítési útmutató
      │   ├── local_development.md          # Helyi beállítási leírás
      │   ├── troubleshooting.md            # Gyakori hibák és megoldások
      │   ├── azure_account_setup.md        # Azure előfeltételek
      │   └── images/                       # Dokumentációs képek
      │
      └── 📄 Projekt metadata
         ├── README.md                     # Projekt áttekintés
         ├── CODE_OF_CONDUCT.md           # Közösségi irányelvek
         ├── CONTRIBUTING.md              # Hozzájárulási útmutató
         ├── LICENSE                      # Licenc feltételek
         └── next-steps.md                # Telepítés utáni tanácsok
      ```

### 3.1. Alkalmazás magarchitektúrája

Ez a sablon egy **full-stack webalkalmazás** mintát követ:

- **Backend**: Python FastAPI Azure AI integrációval
- **Frontend**: TypeScript/React Vite build rendszerrel
- **Infrastruktúra**: Azure Bicep sablonok felhőalapú erőforrásokhoz
- **Konténerizáció**: Docker az egységes telepítés érdekében

### 3.2 Infrastruktúra kódként (bicep)

Az infrastruktúra réteg **Azure Bicep** sablonokat használ moduláris szervezésben:

   - **`main.bicep`**: Az összes Azure erőforrás összehangolása
   - **`core/` modulok**: Újrahasználható komponensek különböző szolgáltatásokhoz
      - AI szolgáltatások (Azure OpenAI, AI Search)
      - Konténer hosztolás (Azure Container Apps)
      - Monitorozás (Application Insights, Log Analytics)
      - Biztonság (Key Vault, Managed Identity)

### 3.3 Alkalmazás forrás (`src/`)

**Backend API (`src/api/`)**:

- FastAPI alapú REST API
- Foundry Agents integráció
- Keresési index menedzsment tudáslekéréshez
- Fájl feltöltés és feldolgozás képességek

**Frontend (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Vite a gyors fejlesztéshez és optimalizált buildhez
- Chat interfész ügynök interakcióhoz

**Tudásbázis (`src/files/`)**:

- Minta ügyfél- és termékadatok
- Fájl alapú tudáslekérést demonstrál
- JSON és Markdown formátumú példák

### 3.4 DevOps és automatizálás

**Szkriptek (`scripts/`)**:

- Platformfüggetlen PowerShell és Bash szkriptek
- Környezeti beállítások és validáció
- Telepítés utáni konfiguráció
- Model kvóta kezelése

**Azure Developer CLI integráció**:

- `azure.yaml` konfiguráció az `azd` munkafolyamatokhoz
- Automatizált előállítás és telepítés
- Környezeti változók kezelése

### 3.5 Tesztelés és minőségbiztosítás

**Értékelési keretrendszer (`evals/`)**:

- Ügynök teljesítményének értékelése
- Lekérdezés-válasz minőség tesztelése
- Automatikus értékelési folyamat

**AI biztonság (`airedteaming/`)**:

- Red team tesztelés AI biztonságra
- Biztonsági sebezhetőségek keresése
- Felelős AI gyakorlatok

---

## 4. Gratulálunk 🏆

Sikeresen használtad a GitHub Copilot Chat-et MCP szerverekkel a tárház felfedezéséhez.

- [X] Aktiválva a GitHub Copilot Azure-hoz
- [X] Megértettük az alkalmazás architektúráját
- [X] Felfedeztük az AZD sablon szerkezetét

Ez betekintést ad az _infrastruktúra kód formátumú_ eszközeibe ennél a sablonnál. Ezután megnézzük az AZD konfigurációs fájlt.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ezt a dokumentumot az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk le. Bár igyekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, anyanyelvi dokumentum tekintendő a hiteles forrásnak. Kritikus információk esetén profi, emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->