# 3. Rozebrat šablonu

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Aktivovat GitHub Copilot s MCP servery pro asistenci Azure
    - [ ] Porozumět struktuře složek a komponentám AZD šablony
    - [ ] Prozkoumat vzory organizace infrastruktury jako kódu (Bicep)
    - [ ] **Cvičení 3:** Použít GitHub Copilot k prozkoumání a pochopení architektury repozitáře 

---


S pomocí AZD šablon a Azure Developer CLI (`azd`) můžeme rychle nastartovat naši AI vývojovou cestu se standardizovanými repozitáři, které poskytují ukázkový kód, infrastrukturu a konfigurační soubory - ve formě připraveného k nasazení _starter_ projektu.

**Ale nyní potřebujeme porozumět struktuře projektu a kódu - a umět upravovat AZD šablonu - bez předchozích zkušeností nebo znalostí AZD!**

---

## 1. Aktivovat GitHub Copilot

### 1.1 Nainstalovat GitHub Copilot Chat

Je čas prozkoumat [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nyní můžeme použít přirozený jazyk k popisu našeho úkolu na vysoké úrovni a získat pomoc při jeho provedení. Pro toto cvičení použijeme [Copilot Free plan](https://github.com/github-copilot/signup), který má měsíční limit pro dokončení a chatovací interakce.

Rozšíření lze nainstalovat z marketplace, ale mělo by být již dostupné ve vašem Codespaces prostředí. _Klikněte na `Open Chat` v rozbalovacím menu ikony Copilot - a napište prompt jako `What can you do?`_ - může být vyžadováno přihlášení. **GitHub Copilot Chat je připravený**.

### 1.2. Nainstalovat MCP servery

Aby byl Agent mode efektivní, potřebuje přístup k správným nástrojům, které mu pomohou získávat znalosti nebo provádět akce. Zde mohou pomoci MCP servery. Nakonfigurujeme následující servery:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Chcete-li je aktivovat:

1. Vytvořte soubor nazvaný `.vscode/mcp.json`, pokud neexistuje
1. Zkopírujte do něj následující obsah - a spusťte servery!
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

??? warning "Může se objevit chyba, že `npx` není nainstalováno (klikněte pro zobrazení opravy)"

      Pro opravu otevřete soubor `.devcontainer/devcontainer.json` a přidejte tento řádek do sekce features. Poté kontejner přestavte. Nyní by mělo být `npx` nainstalováno.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Otestovat GitHub Copilot Chat

**Nejprve použijte `az login` k autentizaci do Azure z příkazové řádky VS Code.**

Nyní byste měli být schopni dotazovat se na stav vašeho Azure předplatného a klást otázky o nasazených zdrojích nebo konfiguraci. Vyzkoušejte tyto promptingy:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Můžete také klást otázky ohledně dokumentace Azure a získávat odpovědi podložené Microsoft Docs MCP serverem. Vyzkoušejte tyto promptingy:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Nebo můžete požádat o ukázky kódu k dokončení úkolu. Vyzkoušejte tento prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

V režimu `Ask` to poskytne kód, který můžete zkopírovat a vyzkoušet. V režimu `Agent` to může jít o krok dál a vytvořit relevantní zdroje pro vás - včetně setup skriptů a dokumentace - aby vám pomohlo úkol provést.

**Nyní jste vybaveni k zahájení průzkumu repozitáře se šablonou**

---

## 2. Rozebrat architekturu

??? prompt "POŽADAVEK: Vysvětlete architekturu aplikace v docs/images/architecture.png v jednom odstavci"

      Tato aplikace je AI-poháněná chatovací aplikace postavená na Azure, která demonstruje moderní agent-based architekturu. Řešení se soustředí kolem Azure Container App, která hostuje hlavní aplikační kód, zpracovává vstup uživatele a generuje inteligentní odpovědi prostřednictvím AI agenta. 
      
      Architektura využívá Microsoft Foundry Project jako základ pro AI schopnosti a připojuje se k Azure AI Services, které poskytují základní jazykové modely (například gpt-4.1-mini) a agentní funkcionalitu. Interakce uživatele proudí přes frontend založený na Reactu do backendu ve FastAPI, který komunikuje se službou AI agenta pro generování kontextových odpovědí. 
      
      Systém zahrnuje schopnosti vyhledávání znalostí prostřednictvím buďhledání souborů nebo služby Azure AI Search, což umožňuje agentovi přistupovat k nahraným dokumentům a citovat informace. Pro provozní excelenci architektura obsahuje komplexní monitorování přes Application Insights a Log Analytics Workspace pro trasování, logování a optimalizaci výkonu. 
      
      Azure Storage poskytuje blob storage pro aplikační data a nahrávání souborů, zatímco Managed Identity zajišťuje bezpečný přístup mezi Azure zdroji bez ukládání přihlašovacích údajů. Celé řešení je navrženo pro škálovatelnost a udržovatelnost, kdy kontejnery aplikace automaticky škálují podle poptávky a poskytují vestavěné zabezpečení, monitorování a CI/CD schopnosti prostřednictvím Azure managed služeb ekosystému.

![Architektura](../../../../../translated_images/cs/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktura repozitáře

!!! prompt "POŽÁDEJTE: Vysvětlete strukturu složek šablony. Začněte vizuálním hierarchickým diagramem."

??? info "ODPOVĚĎ: Vizuální hierarchický diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurace a nastavení
      │   ├── azure.yaml                    # Konfigurace Azure Developer CLI
      │   ├── docker-compose.yaml           # Lokální vývojové kontejnery
      │   ├── pyproject.toml                # Konfigurace Python projektu
      │   ├── requirements-dev.txt          # Vývojové závislosti
      │   └── .devcontainer/                # Nastavení dev kontejneru VS Code
      │
      ├── 🏗️ Infrastruktura (infra/)
      │   ├── main.bicep                    # Hlavní šablona infrastruktury
      │   ├── api.bicep                     # Zdroje specifické pro API
      │   ├── main.parameters.json          # Parametry infrastruktury
      │   └── core/                         # Modulární infrastrukturní komponenty
      │       ├── ai/                       # Konfigurace AI služeb
      │       ├── host/                     # Hostingová infrastruktura
      │       ├── monitor/                  # Monitorování a logování
      │       ├── search/                   # Nastavení Azure AI Search
      │       ├── security/                 # Zabezpečení a identity
      │       └── storage/                  # Konfigurace úložiště
      │
      ├── 💻 Zdroj aplikace (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Vstupní bod aplikace FastAPI
      │   │   ├── routes.py                 # Definice API tras
      │   │   ├── search_index_manager.py   # Funkcionalita vyhledávání
      │   │   ├── data/                     # Zpracování dat API
      │   │   ├── static/                   # Statické webové zdroje
      │   │   └── templates/                # HTML šablony
      │   ├── frontend/                     # Frontend v React/TypeScriptu
      │   │   ├── package.json              # Závislosti Node.js
      │   │   ├── vite.config.ts            # Konfigurace buildování Vite
      │   │   └── src/                      # Zdrojový kód frontendu
      │   ├── data/                         # Ukázkové datové soubory
      │   │   └── embeddings.csv            # Předpočítané embeddingy
      │   ├── files/                        # Soubory znalostní báze
      │   │   ├── customer_info_*.json      # Ukázky zákaznických dat
      │   │   └── product_info_*.md         # Dokumentace produktů
      │   ├── Dockerfile                    # Konfigurace kontejneru
      │   └── requirements.txt              # Python závislosti
      │
      ├── 🔧 Automatizace a skripty (scripts/)
      │   ├── postdeploy.sh/.ps1           # Nastavení po nasazení
      │   ├── setup_credential.sh/.ps1     # Konfigurace přihlašovacích údajů
      │   ├── validate_env_vars.sh/.ps1    # Ověření proměnných prostředí
      │   └── resolve_model_quota.sh/.ps1  # Správa kvót modelu
      │
      ├── 🧪 Testování a vyhodnocení
      │   ├── tests/                        # Jednotkové a integrační testy
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Rámec pro vyhodnocení agentů
      │   │   ├── evaluate.py               # Spouštěč vyhodnocení
      │   │   ├── eval-queries.json         # Testovací dotazy
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Vývojové pískoviště
      │   │   ├── 1-quickstart.py           # Ukázky pro začátečníky
      │   │   └── aad-interactive-chat.py   # Příklady autentizace
      │   └── airedteaming/                 # Vyhodnocení bezpečnosti AI
      │       └── ai_redteaming.py          # Red team testování
      │
      ├── 📚 Dokumentace (docs/)
      │   ├── deployment.md                 # Průvodce nasazením
      │   ├── local_development.md          # Instrukce pro lokální nastavení
      │   ├── troubleshooting.md            # Běžné problémy a opravy
      │   ├── azure_account_setup.md        # Předpoklady pro Azure
      │   └── images/                       # Prostředky dokumentace
      │
      └── 📄 Metadata projektu
         ├── README.md                     # Přehled projektu
         ├── CODE_OF_CONDUCT.md           # Pravidla komunity
         ├── CONTRIBUTING.md              # Průvodce přispíváním
         ├── LICENSE                      # Licenční podmínky
         └── next-steps.md                # Následující kroky po nasazení
      ```

### 3.1. Základní architektura aplikace

Tato šablona následuje vzor **full-stack webové aplikace** s:

- **Backend**: Python FastAPI s integrací Azure AI
- **Frontend**: TypeScript/React s Vite build systémem
- **Infrastruktura**: Azure Bicep šablony pro cloudové zdroje
- **Containerizace**: Docker pro konzistentní nasazení

### 3.2 Infrastruktura jako kód (Bicep)

Vrstva infrastruktury používá **Azure Bicep** šablony organizované modulárně:

   - **`main.bicep`**: Koordinuje všechny Azure zdroje
   - **`core/` moduly**: Znovupoužitelné komponenty pro různé služby
      - AI služby (Microsoft Foundry Models, AI Search)
      - Hosting kontejnerů (Azure Container Apps)
      - Monitorování (Application Insights, Log Analytics)
      - Zabezpečení (Key Vault, Managed Identity)

### 3.3 Zdroj aplikace (`src/`)

**Backend API (`src/api/`)**:

- REST API založené na FastAPI
- Integrace Foundry agentů
- Správa indexu vyhledávání pro získávání znalostí
- Možnosti nahrávání a zpracování souborů

**Frontend (`src/frontend/`)**:

- Moderní SPA v React/TypeScriptu
- Vite pro rychlý vývoj a optimalizované sestavení
- Rozhraní chatu pro interakce s agentem

**Knowledge Base (`src/files/`)**:

- Ukázková data zákazníků a produktů
- Demonstruje získávání znalostí ze souborů
- Příklady ve formátu JSON a Markdown


### 3.4 DevOps a automatizace

**Skripty (`scripts/`)**:

- Skripty PowerShell a Bash napříč platformami
- Ověření a nastavení prostředí
- Konfigurace po nasazení
- Správa kvót modelů

**Integrace Azure Developer CLI**:

- Konfigurace `azure.yaml` pro workflow `azd`
- Automatizované poskytování prostředků a nasazení
- Správa proměnných prostředí

### 3.5 Testování a zajištění kvality

**Rámec pro vyhodnocení (`evals/`)**:

- Hodnocení výkonu agentů
- Testování kvality dotaz-odpověď
- Automatizovaný vyhodnocovací proces

**Bezpečnost AI (`airedteaming/`)**:

- Red team testování pro bezpečnost AI
- Skenování bezpečnostních zranitelností
- Praktiky zodpovědného AI

---

## 4. Gratulujeme 🏆

Úspěšně jste použili GitHub Copilot Chat s MCP servery k prozkoumání repozitáře.

- [X] Aktivovali GitHub Copilot pro Azure
- [X] Porozuměli architektuře aplikace
- [X] Prozkoumali strukturu šablony AZD

To vám dává představu o _infrastructure as code_ aktivech pro tuto šablonu. Dále se podíváme na konfigurační soubor pro AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, vezměte prosím na vědomí, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za případná nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->