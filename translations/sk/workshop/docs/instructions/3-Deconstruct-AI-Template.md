# 3. Rozloženie šablóny

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Aktivovať GitHub Copilot s MCP servermi pre pomoc s Azure
    - [ ] Pochopiť štruktúru a komponenty zložky šablóny AZD
    - [ ] Preskúmať vzory organizácie infraštruktúry ako kódu (Bicep)
    - [ ] **Laboratórium 3:** Použiť GitHub Copilot na preskúmanie a pochopenie architektúry repozitára

---


S AZD šablónami a Azure Developer CLI (`azd`) môžeme rýchlo začať našu AI vývojovú cestu so štandardizovanými repozitármi, ktoré poskytujú ukážkový kód, infraštruktúru a konfiguračné súbory - vo forme hotového _štartovacieho_ projektu pripraveného na nasadenie.

**Ale teraz potrebujeme pochopiť štruktúru projektu a kódovú základňu - a vedieť si prispôsobiť AZD šablónu - bez predchádzajúcich skúseností alebo znalostí AZD!**

---

## 1. Aktivujte GitHub Copilot

### 1.1 Inštalácia GitHub Copilot Chat

Je čas preskúmať [GitHub Copilot s Agent režimom](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Teraz môžeme použiť prirodzený jazyk na vysvetlenie našej úlohy na vysokej úrovni a získať asistenciu pri vykonaní. Pre toto laboratórium použijeme [bezplatný plán Copilot](https://github.com/github-copilot/signup), ktorý má mesačný limit pre dokončenia a chatovacie interakcie.

Rozšírenie je možné nainštalovať z marketplace a často je už dostupné v prostrediach Codespaces alebo vývojových kontajnerov. _Kliknite na `Open Chat` v rozbalovacej ponuke ikony Copilot - a zadajte prompt napr. `What can you do?`_ - môžete byť vyzvaní na prihlásenie. **GitHub Copilot Chat je pripravený**.

### 1.2. Inštalácia MCP serverov

Aby bol Agent režim efektívny, potrebuje prístup k správnym nástrojom, ktoré mu pomôžu získať vedomosti alebo vykonať akcie. Tu pomáhajú MCP servery. Nakonfigurujeme tieto servery:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Na ich aktiváciu:

1. Vytvorte súbor `.vscode/mcp.json`, ak ešte neexistuje
1. Skopírujte doň nasledujúci obsah - a spustite servery!
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

??? warning "Môžete dostať chybu, že `npx` nie je nainštalovaný (kliknite pre rozbalenie riešenia)"

      Na opravu otvorte `.devcontainer/devcontainer.json` a pridajte tento riadok do časti features. Potom obnovte kontajner. Mali by ste mať teraz nainštalovaný `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testovanie GitHub Copilot Chat

**Najskôr použite `azd auth login` na autentifikáciu do Azure z príkazového riadku VS Code. Použite tiež `az login` len ak plánujete spúšťať príkazy Azure CLI priamo.**

Teraz by ste mali byť schopní dotazovať sa na stav vašej Azure predplatného a klásť otázky o nasadených zdrojoch alebo konfigurácii. Vyskúšajte tieto prompti:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Môžete tiež klásť otázky o dokumentácii Azure a získať odpovede založené na Microsoft Docs MCP serveri. Vyskúšajte tieto prompti:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Alebo si môžete vyžiadať ukážky kódu na dokončenie úlohy. Vyskúšajte tento prompt:

1. `Give me a Python code example that uses AAD for an interactive chat client`

V móde `Ask` to poskytne kód, ktorý môžete skopírovať a vyskúšať. V móde `Agent` to môže urobiť krok ďalej a vytvoriť príslušné zdroje pre vás - vrátane setup skriptov a dokumentácie - aby vám pomohlo úlohu vykonať.

**Teraz ste vybavení na začatie preskúmania šablónového repozitára**

---

## 2. Rozloženie architektúry

??? prompt "OPÝTAJ SA: Vysvetlite aplikáciu architektúru na docs/images/architecture.png v jednom odstavci"

      Táto aplikácia je chat aplikácia poháňaná AI postavená na Azure, ktorá demonštruje modernú agentnú architektúru. Riešenie je zamerané na Azure Container App, ktorá hostí hlavný aplikačný kód, ktorý spracováva používateľský vstup a generuje inteligentné odpovede prostredníctvom AI agenta.
      
      Architektúra využíva Microsoft Foundry Project ako základ pre AI schopnosti, pripájajúc sa k Azure AI službám, ktoré poskytujú základné jazykové modely (ako gpt-4.1-mini) a agentnú funkcionalitu. Používateľské interakcie prechádzajú cez React frontend k FastAPI backendu, ktorý komunikuje so službou AI agenta na generovanie kontextových odpovedí.
      
      Systém zahŕňa schopnosť získavania vedomostí cez vyhľadávanie súborov alebo službu Azure AI Search, čo agentovi umožňuje pristupovať k informáciám a citovať ich z nahraných dokumentov.
      
      Pre prevádzkovú excelentnosť architektúra obsahuje komplexný monitoring cez Application Insights a Log Analytics Workspace pre trasovanie, logovanie a optimalizáciu výkonu.
      
      Azure Storage poskytuje blob storage pre aplikačné dáta a nahrávanie súborov, zatiaľ čo Managed Identity zabezpečuje bezpečný prístup medzi Azure zdrojmi bez ukladania prihlasovacích údajov. Celé riešenie je navrhnuté pre škálovateľnosť a udržiavateľnosť, pričom kontajnerová aplikácia sa automaticky škáluje podľa dopytu a zároveň poskytuje zabudovanú bezpečnosť, monitorovanie a CI/CD schopnosti cez Azure spravované služby.

![Architektúra](../../../../../translated_images/sk/architecture.48d94861e6e6cdc0.webp)

---

## 3. Štruktúra repozitára

!!! prompt "OPÝTAJ SA: Vysvetli štruktúru šablónovej zložky. Začni vizuálnym hierarchickým diagramom."

??? info "ODPOVEĎ: Vizuálny hierarchický diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurácia a nastavenie
      │   ├── azure.yaml                    # Konfigurácia Azure Developer CLI
      │   ├── docker-compose.yaml           # Lokálne vývojové kontajnery
      │   ├── pyproject.toml                # Konfigurácia Python projektu
      │   ├── requirements-dev.txt          # Vývojové závislosti
      │   └── .devcontainer/                # Nastavenie VS Code dev kontajnera
      │
      ├── 🏗️ Infraštruktúra (infra/)
      │   ├── main.bicep                    # Hlavná infraštruktúrna šablóna
      │   ├── api.bicep                     # Zdroje špecifické pre API
      │   ├── main.parameters.json          # Parametre infraštruktúry
      │   └── core/                         # Modulárne infraštruktúrne komponenty
      │       ├── ai/                       # Konfigurácie AI služieb
      │       ├── host/                     # Hosting infraštruktúra
      │       ├── monitor/                  # Monitorovanie a logovanie
      │       ├── search/                   # Nastavenie Azure AI Search
      │       ├── security/                 # Bezpečnosť a identita
      │       └── storage/                  # Konfigurácie storage účtov
      │
      ├── 💻 Zdrojový kód aplikácie (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Vstupný bod FastAPI aplikácie
      │   │   ├── routes.py                 # Definície API trás
      │   │   ├── search_index_manager.py   # Funkcionalita vyhľadávania
      │   │   ├── data/                     # Spracovanie dát API
      │   │   ├── static/                   # Statické webové zdroje
      │   │   └── templates/                # HTML šablóny
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Závislosti Node.js
      │   │   ├── vite.config.ts            # Konfigurácia build systému Vite
      │   │   └── src/                      # Zdrojový kód frontendu
      │   ├── data/                         # Ukážkové dátové súbory
      │   │   └── embeddings.csv            # Predpočítané vektory embeddingov
      │   ├── files/                        # Súbory vedomostnej databázy
      │   │   ├── customer_info_*.json      # Ukážky dát zákazníkov
      │   │   └── product_info_*.md         # Dokumentácia produktov
      │   ├── Dockerfile                    # Konfigurácia kontajnera
      │   └── requirements.txt              # Python závislosti
      │
      ├── 🔧 Automatizácia a Skripty (scripts/)
      │   ├── postdeploy.sh/.ps1           # Nastavenie po nasadení
      │   ├── setup_credential.sh/.ps1     # Konfigurácia poverení
      │   ├── validate_env_vars.sh/.ps1    # Validácia environment premenných
      │   └── resolve_model_quota.sh/.ps1  # Správa kvót modelov
      │
      ├── 🧪 Testovanie a Vyhodnocovanie
      │   ├── tests/                        # Jednotkové a integračné testy
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework na hodnotenie agentov
      │   │   ├── evaluate.py               # Spúšťač hodnotenia
      │   │   ├── eval-queries.json         # Testovacie dotazy
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Vývojové pieskovisko
      │   │   ├── 1-quickstart.py           # Príklady na rýchle naštartovanie
      │   │   └── aad-interactive-chat.py   # Príklady autentifikácie
      │   └── airedteaming/                 # Hodnotenie bezpečnosti AI
      │       └── ai_redteaming.py          # Red team testovanie
      │
      ├── 📚 Dokumentácia (docs/)
      │   ├── deployment.md                 # Návod na nasadenie
      │   ├── local_development.md          # Inštrukcie na lokálnu prípravu
      │   ├── troubleshooting.md            # Bežné problémy a riešenia
      │   ├── azure_account_setup.md        # Požiadavky na Azure účet
      │   └── images/                       # Dokumentačné obrázky
      │
      └── 📄 Metadáta projektu
         ├── README.md                     # Prehľad projektu
         ├── CODE_OF_CONDUCT.md           # Pravidlá komunity
         ├── CONTRIBUTING.md              # Príručka prispievateľa
         ├── LICENSE                      # Licenčné podmienky
         └── next-steps.md                # Pokyny po nasadení
      ```

### 3.1. Hlavná architektúra aplikácie

Táto šablóna nasleduje vzor **full-stack webovej aplikácie** s:

- **Backend**: Python FastAPI s integráciou Azure AI
- **Frontend**: TypeScript/React s build systémom Vite
- **Infraštruktúra**: Azure Bicep šablóny pre cloudové zdroje
- **Kontajnerizácia**: Docker pre konzistentné nasadenie

### 3.2 Infra ako kód (bicep)

Vrstva infraštruktúry používa **Azure Bicep** šablóny organizované modulárne:

   - **`main.bicep`**: Orchestruje všetky Azure zdroje
   - **`core/` moduly**: Znovupoužiteľné komponenty pre rôzne služby
      - AI služby (Microsoft Foundry modely, AI Search)
      - Hostovanie kontajnerov (Azure Container Apps)
      - Monitorovanie (Application Insights, Log Analytics)
      - Bezpečnosť (Key Vault, Managed Identity)

### 3.3 Zdrojový kód aplikácie (`src/`)

**Backend API (`src/api/`)**:

- REST API založené na FastAPI
- Integrácia Foundry agentov
- Správa vyhľadávacích indexov pre získavanie vedomostí
- Možnosti nahrávania a spracovania súborov

**Frontend (`src/frontend/`)**:

- Moderné React/TypeScript SPA
- Vite pre rýchly vývoj a optimalizované buildy
- Chat rozhranie pre interakcie s agentom

**Vedomosťová databáza (`src/files/`)**:

- Ukážkové údaje o zákazníkoch a produktoch
- Demonštrácia získavania vedomostí zo súborov
- Príklady vo formáte JSON a Markdown


### 3.4 DevOps a automatizácia

**Skripty (`scripts/`)**:

- PowerShell a Bash skripty pre viac platform
- Validácia a nastavenie prostredia
- Konfigurácia po nasadení
- Správa kvót modelov

**Integrácia Azure Developer CLI**:

- Konfigurácia `azure.yaml` pre workflow `azd`
- Automatické poskytovanie a nasadenie
- Správa environmentálnych premenných

### 3.5 Testovanie a kontrola kvality

**Hodnotiaci framework (`evals/`)**:

- Hodnotenie výkonu agentov
- Testovanie kvality odpovedí na dotazy
- Automatizované vyhodnocovacie procesy

**Bezpečnosť AI (`airedteaming/`)**:

- Red team testovanie bezpečnosti AI
- Skener zraniteľností bezpečnosti
- Zodpovedné praktiky AI

---

## 4. Blahoželáme 🏆

Úspešne ste použili GitHub Copilot Chat s MCP servermi na preskúmanie repozitára.

- [X] Aktivovaný GitHub Copilot pre Azure
- [X] Pochopená architektúra aplikácie
- [X] Preskúmaná štruktúra AZD šablóny

To vám dáva predstavu o _infrastruktúre ako kódu_ aktívach tejto šablóny. Ďalej sa pozrieme na konfiguračný súbor pre AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Upozornenie**:  
Tento dokument bol preložený pomocou AI prekladačskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, majte prosím na pamäti, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za prípadné nedorozumenia alebo nesprávne výklady vyplývajúce z používania tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->