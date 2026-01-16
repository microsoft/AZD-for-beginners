<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-25T02:26:57+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "sk"
}
-->
# 3. Rozloženie šablóny

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Položka
    - [ ] Položka
    - [ ] Položka
    - [ ] **Lab 3:** 

---

S AZD šablónami a Azure Developer CLI (`azd`) môžeme rýchlo začať našu AI vývojovú cestu so štandardizovanými repozitármi, ktoré poskytujú ukážkový kód, infraštruktúru a konfiguračné súbory - vo forme pripraveného _štartovacieho_ projektu.

**Teraz však potrebujeme pochopiť štruktúru projektu a kódovú základňu - a byť schopní prispôsobiť AZD šablónu - bez akýchkoľvek predchádzajúcich skúseností alebo znalostí AZD!**

---

## 1. Aktivácia GitHub Copilot

### 1.1 Inštalácia GitHub Copilot Chat

Je čas preskúmať [GitHub Copilot s Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Teraz môžeme používať prirodzený jazyk na opis našej úlohy na vysokej úrovni a získať pomoc pri jej vykonávaní. Pre tento lab použijeme [Copilot Free plan](https://github.com/github-copilot/signup), ktorý má mesačný limit na dokončenia a interakcie v chate.

Rozšírenie je možné nainštalovať z marketplace, ale malo by byť už dostupné vo vašom prostredí Codespaces. _Kliknite na `Open Chat` z rozbaľovacieho menu ikony Copilot - a zadajte výzvu ako `What can you do?`_ - môže sa od vás vyžadovať prihlásenie. **GitHub Copilot Chat je pripravený**.

### 1.2. Inštalácia MCP serverov

Aby bol Agent Mode efektívny, potrebuje prístup k správnym nástrojom, ktoré mu pomôžu získavať znalosti alebo vykonávať akcie. Tu prichádzajú na rad MCP servery. Konfigurujeme nasledujúce servery:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Na ich aktiváciu:

1. Vytvorte súbor `.vscode/mcp.json`, ak neexistuje
1. Skopírujte nasledujúce do tohto súboru - a spustite servery!
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

??? warning "Môžete dostať chybu, že `npx` nie je nainštalovaný (kliknite na rozbalenie pre opravu)"

      Na opravu otvorte súbor `.devcontainer/devcontainer.json` a pridajte tento riadok do sekcie features. Potom znovu zostavte kontajner. Teraz by ste mali mať nainštalovaný `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testovanie GitHub Copilot Chat

**Najprv použite `az login` na autentifikáciu s Azure z príkazového riadku VS Code.**

Teraz by ste mali byť schopní dotazovať sa na stav vášho Azure predplatného a klásť otázky o nasadených zdrojoch alebo konfigurácii. Vyskúšajte tieto výzvy:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Môžete tiež klásť otázky o dokumentácii Azure a získať odpovede založené na Microsoft Docs MCP serveri. Vyskúšajte tieto výzvy:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Alebo môžete požiadať o ukážky kódu na dokončenie úlohy. Vyskúšajte túto výzvu:

1. `Give me a Python code example that uses AAD for an interactive chat client`

V režime `Ask` vám poskytne kód, ktorý môžete skopírovať a vyskúšať. V režime `Agent` môže ísť o krok ďalej a vytvoriť relevantné zdroje pre vás - vrátane skriptov na nastavenie a dokumentácie - aby vám pomohol vykonať túto úlohu.

**Teraz ste pripravení začať skúmať šablónový repozitár**

---

## 2. Rozloženie architektúry

??? prompt "ASK: Vysvetlite architektúru aplikácie v docs/images/architecture.png v 1 odseku"

      Táto aplikácia je AI-poháňaná chatovacia aplikácia postavená na Azure, ktorá demonštruje modernú architektúru založenú na agentoch. Riešenie sa sústreďuje okolo Azure Container App, ktorý hostí hlavný aplikačný kód, spracováva vstupy používateľov a generuje inteligentné odpovede prostredníctvom AI agenta. 
      
      Architektúra využíva Azure AI Foundry Project ako základ pre AI schopnosti, pričom sa pripája k Azure AI Services, ktoré poskytujú základné jazykové modely (ako GPT-4o-mini) a funkcie agenta. Interakcie používateľov prechádzajú cez frontend založený na React do backendu FastAPI, ktorý komunikuje so službou AI agenta na generovanie kontextových odpovedí. 
      
      Systém zahŕňa schopnosti získavania znalostí buď prostredníctvom vyhľadávania súborov alebo služby Azure AI Search, čo umožňuje agentovi prístup k informáciám z nahraných dokumentov a ich citovanie. Pre operačnú dokonalosť architektúra zahŕňa komplexné monitorovanie prostredníctvom Application Insights a Log Analytics Workspace na sledovanie, logovanie a optimalizáciu výkonu. 
      
      Azure Storage poskytuje blob storage pre aplikačné dáta a nahrané súbory, zatiaľ čo Managed Identity zabezpečuje bezpečný prístup medzi Azure zdrojmi bez ukladania poverení. Celé riešenie je navrhnuté pre škálovateľnosť a udržateľnosť, pričom kontajnerizovaná aplikácia sa automaticky škáluje na základe dopytu a poskytuje zabudovanú bezpečnosť, monitorovanie a CI/CD schopnosti prostredníctvom ekosystému spravovaných služieb Azure.

![Architektúra](../../../../../translated_images/sk/architecture.48d94861e6e6cdc0.webp)

---

## 3. Štruktúra repozitára

!!! prompt "ASK: Vysvetlite štruktúru priečinkov šablóny. Začnite vizuálnym hierarchickým diagramom."

??? info "ODPOVEĎ: Vizuálny hierarchický diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurácia a nastavenie
      │   ├── azure.yaml                    # Konfigurácia Azure Developer CLI
      │   ├── docker-compose.yaml           # Kontajnery pre lokálny vývoj
      │   ├── pyproject.toml                # Konfigurácia Python projektu
      │   ├── requirements-dev.txt          # Závislosti pre vývoj
      │   └── .devcontainer/                # Nastavenie dev kontajnera pre VS Code
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
      │       └── storage/                  # Konfigurácie úložiska
      │
      ├── 💻 Zdroj aplikácie (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Vstup aplikácie FastAPI
      │   │   ├── routes.py                 # Definície API trás
      │   │   ├── search_index_manager.py   # Funkcionalita vyhľadávania
      │   │   ├── data/                     # Spracovanie dát API
      │   │   ├── static/                   # Statické webové zdroje
      │   │   └── templates/                # HTML šablóny
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Závislosti Node.js
      │   │   ├── vite.config.ts            # Konfigurácia build systému Vite
      │   │   └── src/                      # Zdrojový kód frontendu
      │   ├── data/                         # Ukážkové dátové súbory
      │   │   └── embeddings.csv            # Predpočítané embeddings
      │   ├── files/                        # Súbory znalostnej bázy
      │   │   ├── customer_info_*.json      # Ukážkové dáta zákazníkov
      │   │   └── product_info_*.md         # Dokumentácia produktov
      │   ├── Dockerfile                    # Konfigurácia kontajnera
      │   └── requirements.txt              # Závislosti Pythonu
      │
      ├── 🔧 Automatizácia a skripty (scripts/)
      │   ├── postdeploy.sh/.ps1           # Nastavenie po nasadení
      │   ├── setup_credential.sh/.ps1     # Konfigurácia poverení
      │   ├── validate_env_vars.sh/.ps1    # Validácia prostredia
      │   └── resolve_model_quota.sh/.ps1  # Správa kvót modelov
      │
      ├── 🧪 Testovanie a hodnotenie
      │   ├── tests/                        # Jednotkové a integračné testy
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Rámec hodnotenia agenta
      │   │   ├── evaluate.py               # Spúšťač hodnotenia
      │   │   ├── eval-queries.json         # Testovacie dotazy
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Vývojové ihrisko
      │   │   ├── 1-quickstart.py           # Ukážky pre začiatok
      │   │   └── aad-interactive-chat.py   # Ukážky autentifikácie
      │   └── airedteaming/                 # Hodnotenie bezpečnosti AI
      │       └── ai_redteaming.py          # Testovanie red teamu
      │
      ├── 📚 Dokumentácia (docs/)
      │   ├── deployment.md                 # Príručka nasadenia
      │   ├── local_development.md          # Pokyny pre lokálne nastavenie
      │   ├── troubleshooting.md            # Bežné problémy a opravy
      │   ├── azure_account_setup.md        # Predpoklady Azure
      │   └── images/                       # Dokumentačné zdroje
      │
      └── 📄 Metadata projektu
         ├── README.md                     # Prehľad projektu
         ├── CODE_OF_CONDUCT.md           # Pravidlá komunity
         ├── CONTRIBUTING.md              # Príručka prispievania
         ├── LICENSE                      # Licenčné podmienky
         └── next-steps.md                # Pokyny po nasadení
      ```

### 3.1. Architektúra hlavnej aplikácie

Táto šablóna nasleduje vzor **full-stack webovej aplikácie** s:

- **Backend**: Python FastAPI s integráciou Azure AI
- **Frontend**: TypeScript/React s build systémom Vite
- **Infraštruktúra**: Azure Bicep šablóny pre cloudové zdroje
- **Kontajnerizácia**: Docker pre konzistentné nasadenie

### 3.2 Infra ako kód (bicep)

Vrstva infraštruktúry používa **Azure Bicep** šablóny organizované modulárne:

   - **`main.bicep`**: Orchestruje všetky Azure zdroje
   - **`core/` moduly**: Znovu použiteľné komponenty pre rôzne služby
      - AI služby (Azure OpenAI, AI Search)
      - Hosting kontajnerov (Azure Container Apps)
      - Monitorovanie (Application Insights, Log Analytics)
      - Bezpečnosť (Key Vault, Managed Identity)

### 3.3 Zdroj aplikácie (`src/`)

**Backend API (`src/api/`)**:

- REST API založené na FastAPI
- Integrácia služby Azure AI Agent
- Správa indexu vyhľadávania pre získavanie znalostí
- Funkcie nahrávania a spracovania súborov

**Frontend (`src/frontend/`)**:

- Moderný React/TypeScript SPA
- Vite pre rýchly vývoj a optimalizované buildy
- Chatovacie rozhranie pre interakcie s agentom

**Znalostná báza (`src/files/`)**:

- Ukážkové dáta zákazníkov a produktov
- Demonštruje získavanie znalostí zo súborov
- Príklady vo formáte JSON a Markdown

### 3.4 DevOps a automatizácia

**Skripty (`scripts/`)**:

- Skripty pre PowerShell a Bash na rôznych platformách
- Validácia a nastavenie prostredia
- Konfigurácia po nasadení
- Správa kvót modelov

**Integrácia Azure Developer CLI**:

- Konfigurácia `azure.yaml` pre workflow `azd`
- Automatizované zriaďovanie a nasadenie
- Správa environmentálnych premenných

### 3.5 Testovanie a zabezpečenie kvality

**Rámec hodnotenia (`evals/`)**:

- Hodnotenie výkonu agenta
- Testovanie kvality dotazov a odpovedí
- Automatizovaný hodnotiaci pipeline

**Bezpečnosť AI (`airedteaming/`)**:

- Testovanie red teamu pre bezpečnosť AI
- Skenovanie zraniteľností
- Praktiky zodpovednej AI

---

## 4. Gratulujeme 🏆

Úspešne ste použili GitHub Copilot Chat s MCP servermi na preskúmanie repozitára.

- [X] Aktivovali ste GitHub Copilot pre Azure
- [X] Pochopili ste architektúru aplikácie
- [X] Preskúmali ste štruktúru šablóny AZD

Toto vám poskytuje predstavu o _infraštruktúre ako kód_ pre túto šablónu. Ďalej sa pozrieme na konfiguračný súbor pre AZD.

---

