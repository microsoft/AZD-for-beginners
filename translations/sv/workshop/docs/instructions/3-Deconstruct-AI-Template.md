# 3. Dekonstruera en mall

!!! tip "I slutet av den här modulen kommer du att kunna"

    - [ ] Aktivera GitHub Copilot med MCP-servrar för Azure-stöd
    - [ ] Förstå AZD-mallens mappstruktur och komponenter
    - [ ] Utforska organisationsmönster för infrastruktur-som-kod (Bicep)
    - [ ] **Laboration 3:** Använd GitHub Copilot för att utforska och förstå repository-arkitekturen 

---


Med AZD-mallar och Azure Developer CLI (`azd`) kan vi snabbt kickstarta vår AI-utvecklingsresa med standardiserade repositories som tillhandahåller exempel på kod, infrastruktur och konfigurationsfiler - i form av ett färdigt att distribuera _startprojekt_.

**Men nu behöver vi förstå projektstrukturen och kodbasen - och kunna anpassa AZD-mallen - utan någon tidigare erfarenhet eller förståelse av AZD!**

---

## 1. Aktivera GitHub Copilot

### 1.1 Installera GitHub Copilot Chat

Det är dags att utforska [GitHub Copilot med Agent-läge](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nu kan vi använda naturligt språk för att beskriva vår uppgift på en hög nivå och få hjälp med att utföra den. För denna laboration kommer vi att använda [Copilot Free-planen](https://github.com/github-copilot/signup) som har en månatlig gräns för completioner och chattinteraktioner.

Extensionen kan installeras från marketplace, men borde redan finnas i din Codespaces-miljö. _Klicka på `Open Chat` från Copilot-ikonens rullgardinsmeny - och skriv en prompt som `What can you do?`_ - du kan bli ombedd att logga in. **GitHub Copilot Chat är redo**.

### 1.2. Installera MCP-servrar

För att Agent-läget ska vara effektivt behöver det åtkomst till rätt verktyg för att hämta kunskap eller utföra åtgärder. Här kan MCP-servrar hjälpa. Vi kommer att konfigurera följande servrar:

1. [Azure MCP-server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP-server](../../../../../workshop/docs/instructions)

För att aktivera dessa:

1. Skapa en fil som heter `.vscode/mcp.json` om den inte finns
1. Kopiera följande till den filen - och starta servrarna!
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

??? warning "Det kan hända att du får ett fel om att `npx` inte är installerat (klicka för att visa en lösning)"

      För att åtgärda detta, öppna filen `.devcontainer/devcontainer.json` och lägg till denna rad i features-sektionen. Bygg sedan om containern. Du bör nu ha `npx` installerat.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testa GitHub Copilot Chat

**Använd först `az login` för att autentisera mot Azure från VS Code:s kommandorad.**

Du bör nu kunna fråga om din Azure-prenumerationsstatus och ställa frågor om distribuerade resurser eller konfiguration. Prova dessa prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Du kan också ställa frågor om Azure-dokumentation och få svar förankrade i Microsoft Docs MCP-servern. Prova dessa prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Eller så kan du be om kodsnuttar för att slutföra en uppgift. Prova denna prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

I `Ask`-läge kommer detta att ge kod som du kan kopiera och testa. I `Agent`-läge kan detta gå ett steg längre och skapa relevanta resurser åt dig - inklusive installationsskript och dokumentation - för att hjälpa dig utföra uppgiften.

**Du är nu redo att börja utforska mall-repositoriet**

---

## 2. Dekonstruera arkitekturen

??? prompt "FRÅGA: Förklara applikationsarkitekturen i docs/images/architecture.png i ett stycke"

      Denna applikation är en AI-driven chattapplikation byggd på Azure som demonstrerar en modern agent-baserad arkitektur. Lösningen kretsar kring en Azure Container App som är värd för huvudapplikationskoden, som bearbetar användarinmatning och genererar intelligenta svar genom en AI-agent. 
      
      Arkitekturen utnyttjar Microsoft Foundry Project som grund för AI-funktionalitet och kopplar till Azure AI-tjänster som tillhandahåller underliggande språkmodeller (såsom gpt-4.1-mini) och agentfunktionalitet. Användarinteraktioner flödar genom en React-baserad frontend till en FastAPI-backend som kommunicerar med AI-agenttjänsten för att generera kontextuella svar. 
      
      Systemet inkluderar kunskapsåtervinningsfunktioner via antingen filsökning eller Azure AI Search-tjänsten, vilket tillåter agenten att få åtkomst till och citera information från uppladdade dokument. För driftssäkerhet inkluderar arkitekturen omfattande övervakning via Application Insights och Log Analytics Workspace för spårning, loggning och prestandaoptimering. 
      
      Azure Storage tillhandahåller blobblagring för applikationsdata och filuppladdningar, medan Managed Identity säkerställer säker åtkomst mellan Azure-resurser utan att lagra autentiseringsuppgifter. Hela lösningen är utformad för skalbarhet och underhållbarhet, där den containeriserade applikationen automatiskt skalar baserat på efterfrågan samtidigt som den erbjuder inbyggd säkerhet, övervakning och CI/CD-möjligheter genom Azures hanterade tjänster.

![Arkitektur](../../../../../translated_images/sv/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repositoriets struktur

!!! prompt "FRÅGA: Förklara mallens mappstruktur. Börja med ett visuellt hierarkiskt diagram."

??? info "SVAR: Visuellt hierarkiskt diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguration och uppsättning
      │   ├── azure.yaml                    # konfiguration för Azure Developer CLI
      │   ├── docker-compose.yaml           # lokala utvecklingscontainrar
      │   ├── pyproject.toml                # Python-projektkonfiguration
      │   ├── requirements-dev.txt          # utvecklingsberoenden
      │   └── .devcontainer/                # VS Code dev container-inställningar
      │
      ├── 🏗️ Infrastruktur (infra/)
      │   ├── main.bicep                    # huvudmall för infrastruktur
      │   ├── api.bicep                     # API-specifika resurser
      │   ├── main.parameters.json          # infrastrukturparametrar
      │   └── core/                         # modulära infrastrukturkomponenter
      │       ├── ai/                       # AI-tjänstkonfigurationer
      │       ├── host/                     # värdinfrastruktur
      │       ├── monitor/                  # övervakning och loggning
      │       ├── search/                   # Azure AI Search-setup
      │       ├── security/                 # säkerhet och identitet
      │       └── storage/                  # storagekonto-konfigurationer
      │
      ├── 💻 Applikationskällkod (src/)
      │   ├── api/                          # backend-API
      │   │   ├── main.py                   # FastAPI-applikationens ingångspunkt
      │   │   ├── routes.py                 # API-routedefinitioner
      │   │   ├── search_index_manager.py   # sökfunktionalitet
      │   │   ├── data/                     # API-datahantering
      │   │   ├── static/                   # statiska webbassets
      │   │   └── templates/                # HTML-mallar
      │   ├── frontend/                     # React/TypeScript-frontend
      │   │   ├── package.json              # Node.js-beroenden
      │   │   ├── vite.config.ts            # Vite-byggkonfiguration
      │   │   └── src/                      # frontendkällkod
      │   ├── data/                         # exempelfiler
      │   │   └── embeddings.csv            # förberäknade embeddings
      │   ├── files/                        # filer för kunskapsbasen
      │   │   ├── customer_info_*.json      # kunddataexempel
      │   │   └── product_info_*.md         # produktdokumentation
      │   ├── Dockerfile                    # containerkonfiguration
      │   └── requirements.txt              # Pythonberoenden
      │
      ├── 🔧 Automatisering & skript (scripts/)
      │   ├── postdeploy.sh/.ps1           # efterdistributionsinställning
      │   ├── setup_credential.sh/.ps1     # konfiguration av autentiseringsuppgifter
      │   ├── validate_env_vars.sh/.ps1    # miljövalidering
      │   └── resolve_model_quota.sh/.ps1  # modellkvotshantering
      │
      ├── 🧪 Testning & utvärdering
      │   ├── tests/                        # enhets- och integrationstester
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # agentutvärderingsramverk
      │   │   ├── evaluate.py               # utvärderingskörning
      │   │   ├── eval-queries.json         # testfrågor
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # utvecklingslekplats
      │   │   ├── 1-quickstart.py           # kom igång-exempel
      │   │   └── aad-interactive-chat.py   # autentiseringsexempel
      │   └── airedteaming/                 # AI-säkerhetsutvärdering
      │       └── ai_redteaming.py          # red team-testning
      │
      ├── 📚 Dokumentation (docs/)
      │   ├── deployment.md                 # distribueringsguide
      │   ├── local_development.md          # instruktioner för lokal uppsättning
      │   ├── troubleshooting.md            # vanliga problem & lösningar
      │   ├── azure_account_setup.md        # Azure-förutsättningar
      │   └── images/                       # dokumentationsresurser
      │
      └── 📄 Projektmetadata
         ├── README.md                     # projektöversikt
         ├── CODE_OF_CONDUCT.md           # riktlinjer för gemenskapen
         ├── CONTRIBUTING.md              # bidragsguide
         ├── LICENSE                      # licensvillkor
         └── next-steps.md                # vägledning efter distribution
      ```

### 3.1. Kärnappens arkitektur

Denna mall följer ett mönster för en **fullstack webbapplikation** med:

- **Backend**: Python FastAPI med integration mot Azure AI
- **Frontend**: TypeScript/React med Vite-byggsystem
- **Infrastruktur**: Azure Bicep-mallar för molnresurser
- **Containerisering**: Docker för konsekvent distribution

### 3.2 Infrastruktur som kod (Bicep)

Infrastrukturskiktet använder **Azure Bicep**-mallar organiserade modulärt:

   - **`main.bicep`**: Orkestrerar alla Azure-resurser
   - **`core/`-moduler**: Återanvändbara komponenter för olika tjänster
      - AI-tjänster (Microsoft Foundry-modeller, AI Search)
      - Containerhosting (Azure Container Apps)
      - Övervakning (Application Insights, Log Analytics)
      - Säkerhet (Key Vault, Managed Identity)

### 3.3 Applikationskällkod (`src/`)

**Backend-API (`src/api/`):**

- REST-API baserat på FastAPI
- Integration med Foundry-agenter
- Hantering av sökindex för kunskapsåtervinning
- Filuppladdning och bearbetningsmöjligheter

**Frontend (`src/frontend/`):**

- Modern React/TypeScript SPA
- Vite för snabb utveckling och optimerade byggen
- Chattgränssnitt för agentinteraktioner

**Kunskapsbas (`src/files/`):**

- Exempel på kund- och produktdata
- Demonstrerar filbaserad kunskapsåtervinning
- JSON- och Markdown-exempel

### 3.4 DevOps & automatisering

**Skript (`scripts/`):**

- Plattformoberoende PowerShell- och Bash-skript
- Miljövalidering och uppsättning
- Efter-distributionskonfiguration
- Hantering av modellkvoter

**Integration med Azure Developer CLI**:

- `azure.yaml`-konfiguration för `azd`-arbetsflöden
- Automatiserad provisioning och distribution
- Hantering av miljövariabler

### 3.5 Testning & kvalitetssäkring

**Utvärderingsramverk (`evals/`)**:

- Agentprestandautvärdering
- Testning av fråga-svar-kvalitet
- Automatiserat bedömningsflöde

**AI-säkerhet (`airedteaming/`)**:

- Red team-testning för AI-säkerhet
- Sårbarhetsskanningar
- Ansvarsfulla AI-praktiker

---

## 4. Grattis 🏆

Du använde framgångsrikt GitHub Copilot Chat med MCP-servrar för att utforska repositoryt.

- [X] Aktiverade GitHub Copilot för Azure
- [X] Förstod applikationsarkitekturen
- [X] Utforskade AZD-mallens struktur

Detta ger dig en känsla för _infrastruktur som kod_-resurserna i denna mall. Nästa steg är att titta på konfigurationsfilen för AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet i dess ursprungsspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->