# 3. Rozebrání šablony

!!! tip "NA KONCI TOHOTO MODULU BUDETE UMĚT"

    - [ ] Aktivovat GitHub Copilot s MCP servery pro pomoc v Azure
    - [ ] Pochopit strukturu složek a komponenty šablony AZD
    - [ ] Prozkoumat vzory organizace infrastruktury jako kódu (Bicep)
    - [ ] **Lab 3:** Použít GitHub Copilot k průzkumu a pochopení architektury repozitáře

---


S šablonami AZD a Azure Developer CLI (`azd`) můžeme rychle nastartovat naši AI vývojovou cestu se standardizovanými repozitáři, které poskytují vzorový kód, infrastrukturu a konfigurační soubory - ve formě připraveného _startovacího_ projektu.

**Ale nyní potřebujeme porozumět struktuře projektu a kódu - a být schopni šablonu AZD přizpůsobit - bez jakýchkoliv předchozích zkušeností nebo znalostí AZD!**

---

## 1. Aktivace GitHub Copilot

### 1.1 Instalace GitHub Copilot Chat

Je čas prozkoumat [GitHub Copilot s Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nyní můžeme použít přirozený jazyk pro popis našeho úkolu na vysoké úrovni a získat pomoc při jeho vykonání. Pro tento lab budeme používat [Copilot Free plán](https://github.com/github-copilot/signup), který má měsíční limit pro dokončení a interakce v chatu.

Rozšíření lze nainstalovat z marketplace, často je již dostupné v Codespaces nebo vývojových kontejnerech. _Klikněte na `Open Chat` v rozbalovacím menu ikony Copilot - a napište příkaz například `What can you do?`_ - může se vyžadovat přihlášení. **GitHub Copilot Chat je připraven.**

### 1.2. Instalace MCP serverů

Aby byl Agent mode efektivní, musí mít přístup k správným nástrojům, které mu pomohou získávat znalosti nebo provádět akce. Zde přicházejí na pomoc MCP servery. Nastavíme následující servery:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Pro aktivaci:

1. Vytvořte soubor `.vscode/mcp.json`, pokud neexistuje
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

??? warning "Může se objevit chyba, že `npx` není nainstalováno (rozklikněte pro opravu)"

      Pro opravu otevřete soubor `.devcontainer/devcontainer.json` a přidejte tento řádek do sekce features. Poté kontejner znovu sestavte. Nyní by mělo být `npx` nainstalováno.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testování GitHub Copilot Chat

**Nejprve použijte `azd auth login` k autentizaci v Azure z příkazové řádky VS Code. Příkaz `az login` použijte pouze pokud plánujete spouštět příkazy Azure CLI přímo.**

Nyní byste měli být schopni vyhledat stav vašeho Azure předplatného a klást otázky o nasazených zdrojích nebo konfiguraci. Vyzkoušejte tyto příkazy:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Můžete také klást otázky o dokumentaci Azure a získat odpovědi založené na Microsoft Docs MCP serveru. Vyzkoušejte tyto příkazy:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Nebo si můžete vyžádat ukázky kódu pro dokončení úkolu. Vyzkoušejte tento příkaz:

1. `Give me a Python code example that uses AAD for an interactive chat client`

V režimu `Ask` toto poskytne kód, který můžete zkopírovat a vyzkoušet. V režimu `Agent` to může být dál a vytvoří odpovídající zdroje - včetně skriptů a dokumentace - aby vám pomohl úkol vykonat.

**Nyní jste vybaveni k průzkumu repozitáře šablony**

---

## 2. Rozebrání architektury

??? prompt "POPTÁVKA: Vysvětli architekturu aplikace v docs/images/architecture.png v 1 odstavci"

      Tato aplikace je AI-poháněná chatovací aplikace postavená na Azure, která demonstruje moderní architekturu založenou na agentech. Řešení je soustředěno kolem Azure Container App, jež hostuje hlavní aplikační kód, který zpracovává uživatelský vstup a generuje inteligentní odpovědi prostřednictvím AI agenta.

      Architektura využívá Microsoft Foundry Project jako základ pro AI schopnosti, napojující se na Azure AI Services, které poskytují základní jazykové modely (např. gpt-4.1-mini) a agentní funkce. Uživatelské interakce procházejí frontendem založeným na Reactu do backendu FastAPI, který komunikuje se službou AI agenta pro generování kontextových odpovědí.

      Systém zahrnuje schopnost vyhledávání znalostí buď přes hledání ve souborech, nebo službou Azure AI Search, což umožňuje agentovi přistupovat a citovat informace z nahraných dokumentů.

      Pro provozní excelenci architektura obsahuje komplexní monitorování pomocí Application Insights a Log Analytics Workspace pro trasování, logování a optimalizaci výkonu.

      Azure Storage poskytuje blob storage pro aplikační data a nahrávání souborů, zatímco Managed Identity zajišťuje bezpečný přístup mezi Azure zdroji bez ukládání přihlašovacích údajů. Celé řešení je navrženo pro škálovatelnost a udržovatelnost, přičemž kontejnerizovaná aplikace se automaticky škáluje podle potřeby a nabízí vestavěnou bezpečnost, monitorování a CI/CD schopnosti prostřednictvím ekosystému spravovaných služeb Azure.

![Architecture](../../../../../translated_images/cs/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktura repozitáře

!!! prompt "POPTÁVKA: Vysvětli strukturu složek šablony. Začni vizuálním hierarchickým diagramem."

??? info "ODPOVĚĎ: Vizuální hierarchický diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurace & Nastavení
      │   ├── azure.yaml                    # Konfigurace Azure Developer CLI
      │   ├── docker-compose.yaml           # Lokální vývojové kontejnery
      │   ├── pyproject.toml                # Konfigurace Python projektu
      │   ├── requirements-dev.txt          # Vývojové závislosti
      │   └── .devcontainer/                # Nastavení VS Code vývojového kontejneru
      │
      ├── 🏗️ Infrastruktura (infra/)
      │   ├── main.bicep                    # Hlavní šablona infrastruktury
      │   ├── api.bicep                     # Zdroje specifické pro API
      │   ├── main.parameters.json          # Parametry infrastruktury
      │   └── core/                         # Modulární komponenty infrastruktury
      │       ├── ai/                       # Konfigurace AI služeb
      │       ├── host/                     # Hosting infrastruktura
      │       ├── monitor/                  # Monitorování a logování
      │       ├── search/                   # Nastavení Azure AI Search
      │       ├── security/                 # Bezpečnost a identity
      │       └── storage/                  # Konfigurace úložiště
      │
      ├── 💻 Zdrojový kód aplikace (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Vstupní bod FastAPI aplikace
      │   │   ├── routes.py                 # Definice API tras
      │   │   ├── search_index_manager.py   # Funkce vyhledávání
      │   │   ├── data/                     # Zpracování dat pro API
      │   │   ├── static/                   # Statické webové zdroje
      │   │   └── templates/                # HTML šablony
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Node.js závislosti
      │   │   ├── vite.config.ts            # Konfigurace Vite buildu
      │   │   └── src/                      # Zdrojový kód frontendu
      │   ├── data/                         # Vzorové datové soubory
      │   │   └── embeddings.csv            # Předpočítané embeddings
      │   ├── files/                        # Soubory znalostní báze
      │   │   ├── customer_info_*.json      # Ukázky zákaznických dat
      │   │   └── product_info_*.md         # Dokumentace produktů
      │   ├── Dockerfile                    # Konfigurace kontejneru
      │   └── requirements.txt              # Python závislosti
      │
      ├── 🔧 Automatizace & Skripty (scripts/)
      │   ├── postdeploy.sh/.ps1           # Nastavení po nasazení
      │   ├── setup_credential.sh/.ps1     # Konfigurace přihlašovacích údajů
      │   ├── validate_env_vars.sh/.ps1    # Validace prostředí
      │   └── resolve_model_quota.sh/.ps1  # Správa kvót modelu
      │
      ├── 🧪 Testování & Hodnocení
      │   ├── tests/                        # Jednotkové a integrační testy
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework hodnocení agentů
      │   │   ├── evaluate.py               # Spouštěč hodnocení
      │   │   ├── eval-queries.json         # Testovací dotazy
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Vývojové hřiště
      │   │   ├── 1-quickstart.py           # Ukázky pro rychlý začátek
      │   │   └── aad-interactive-chat.py   # Ukázky autentizace
      │   └── airedteaming/                 # Hodnocení bezpečnosti AI
      │       └── ai_redteaming.py          # Testování red teamu
      │
      ├── 📚 Dokumentace (docs/)
      │   ├── deployment.md                 # Příručka nasazení
      │   ├── local_development.md          # Instrukce pro lokální nastavení
      │   ├── troubleshooting.md            # Časté problémy a řešení
      │   ├── azure_account_setup.md        # Požadavky na Azure účet
      │   └── images/                       # Assety dokumentace
      │
      └── 📄 Metadata projektu
         ├── README.md                     # Přehled projektu
         ├── CODE_OF_CONDUCT.md           # Pravidla komunity
         ├── CONTRIBUTING.md              # Průvodce příspěvky
         ├── LICENSE                      # Licenční podmínky
         └── next-steps.md                # Doporučení po nasazení
      ```

### 3.1. Základní architektura aplikace

Tato šablona následuje vzor **full-stack webové aplikace** s:

- **Backend**: Python FastAPI s integrací Azure AI
- **Frontend**: TypeScript/React s build systémem Vite
- **Infrastruktura**: Azure Bicep šablony pro cloudové zdroje
- **Kontejnerizace**: Docker pro konzistentní nasazení

### 3.2. Infra jako kód (bicep)

Vrstva infrastruktury využívá **Azure Bicep** šablony organizované modulárně:

   - **`main.bicep`**: Orchestrace všech Azure zdrojů
   - **`core/` moduly**: Znovupoužitelné komponenty pro různé služby
      - AI služby (Microsoft Foundry modely, AI Search)
      - Hosting kontejnerů (Azure Container Apps)
      - Monitorování (Application Insights, Log Analytics)
      - Bezpečnost (Key Vault, Managed Identity)

### 3.3. Zdrojový kód aplikace (`src/`)

**Backend API (`src/api/`)**:

- REST API založené na FastAPI
- Integrace Foundry Agentů
- Správa indexu vyhledávání pro získávání znalostí
- Schopnosti nahrávání a zpracování souborů

**Frontend (`src/frontend/`)**:

- Moderní React/TypeScript SPA
- Vite pro rychlý vývoj a optimalizované sestavení
- Chat rozhraní pro interakce agentů

**Znalostní báze (`src/files/`)**:

- Ukázkové zákaznické a produktové datové soubory
- Demonstruje získávání znalostí ze souborů
- Příklady ve formátech JSON a Markdown


### 3.4. DevOps & Automatizace

**Skripty (`scripts/`)**:

- PowerShell a Bash skripty multiplatformně
- Validace a nastavení prostředí
- Konfigurace po nasazení
- Správa kvót modelu

**Integrace Azure Developer CLI**:

- Konfigurace `azure.yaml` pro workflow `azd`
- Automatické provisioning a nasazení
- Správa proměnných prostředí

### 3.5. Testování & Zajištění kvality

**Framework hodnocení (`evals/`)**:

- Hodnocení výkonu agentů
- Testování kvality dotaz-odpověď
- Automatizovaný hodnotící pipeline

**Bezpečnost AI (`airedteaming/`)**:

- Red team testování bezpečnosti AI
- Skenování bezpečnostních zranitelností
- Odpovědné AI praktiky

---

## 4. Gratulujeme 🏆

Úspěšně jste použili GitHub Copilot Chat s MCP servery k průzkumu repozitáře.

- [X] Aktivovali GitHub Copilot pro Azure
- [X] Pochopili architekturu aplikace
- [X] Prozkoumali strukturu šablony AZD

Toto vám poskytuje přehled o aktivech _infrastruktury jako kódu_ pro tuto šablonu. Následně se podíváme na konfigurační soubor pro AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Upozornění**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo nesprávné výklady vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->