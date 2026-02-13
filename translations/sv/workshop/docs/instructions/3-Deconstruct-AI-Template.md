# 3. Dekonstruera en mall

!!! tip "I SLUTET AV DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Aktivera GitHub Copilot med MCP-servrar för Azure-stöd
    - [ ] Förstå AZD-mallens mappstruktur och komponenter
    - [ ] Utforska infrastruktur-som-kod (Bicep) organisationsmönster
    - [ ] **Lab 3:** Använd GitHub Copilot för att utforska och förstå repositoriets arkitektur 

---


Med AZD-mallar och Azure Developer CLI (`azd`) kan vi snabbt kickstarta vår AI-utvecklingsresa med standardiserade repositorier som tillhandahåller exempel på kod, infrastruktur och konfigurationsfiler - i form av ett färdigt att distribuera _startprojekt_.

**Men nu behöver vi förstå projektstrukturen och kodbasen - och kunna anpassa AZD-mallen - utan någon tidigare erfarenhet eller förståelse av AZD!**

---

## 1. Aktivera GitHub Copilot

### 1.1 Installera GitHub Copilot Chat

Det är dags att utforska [GitHub Copilot med Agent-läge](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nu kan vi använda naturligt språk för att beskriva vår uppgift på en hög nivå och få hjälp med genomförandet. För detta labb använder vi [Copilot Free-planen](https://github.com/github-copilot/signup) som har en månatlig gräns för kompletteringar och chattinteraktioner.

Tillägget kan installeras från marketplace, men bör redan finnas tillgängligt i din Codespaces-miljö. _Klicka på `Open Chat` från Copilot-ikonens rullgardinsmeny - och skriv en prompt som `What can you do?`_ - du kan bli ombedd att logga in. **GitHub Copilot Chat är redo**.

### 1.2. Installera MCP Servers

För att Agent-läget ska vara effektivt behöver det tillgång till rätt verktyg för att hjälpa till att hämta kunskap eller utföra åtgärder. Här kan MCP-servrar hjälpa till. Vi kommer att konfigurera följande servrar:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

För att aktivera dessa:

1. Skapa en fil som heter `.vscode/mcp.json` om den inte finns
1. Kopiera följande till den filen - och starta serverarna!
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

??? warning "Du kan få ett felmeddelande om att `npx` inte är installerat (klicka för att öppna för lösning)"

      För att åtgärda detta, öppna filen `.devcontainer/devcontainer.json` och lägg till denna rad i features-sektionen. Bygg sedan om containern. Du bör nu ha `npx` installerat.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testa GitHub Copilot Chat

**Använd först `az login` för att autentisera mot Azure från VS Code-kommandoraden.**

Du bör nu kunna fråga om din Azure-prenumerationsstatus och ställa frågor om distribuerade resurser eller konfiguration. Prova dessa prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Du kan också ställa frågor om Azure-dokumentation och få svar som grundas i Microsoft Docs MCP-servern. Prova dessa prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Eller så kan du be om kodsnuttar för att slutföra en uppgift. Prova denna prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

I `Ask`-läge kommer detta att ge kod som du kan kopiera och prova. I `Agent`-läge kan detta gå ett steg längre och skapa relevanta resurser åt dig - inklusive installationsskript och dokumentation - för att hjälpa dig genomföra uppgiften.

**Du är nu redo att börja utforska mallens repository**

---

## 2. Dekonstruera arkitekturen

??? prompt "FRÅGA: Förklara applikationsarkitekturen i docs/images/architecture.png i 1 stycke"

      Denna applikation är en AI-driven chattapplikation byggd på Azure som demonstrerar en modern agentbaserad arkitektur. Lösningen kretsar kring en Azure Container App som innehåller huvudapplikationskoden, vilken bearbetar användarinmatning och genererar intelligenta svar via en AI-agent. 
      
      Arkitekturen använder Microsoft Foundry Project som grund för AI-funktionalitet och kopplar till Azure AI-tjänster som tillhandahåller underliggande språkmodeller (såsom GPT-4o-mini) och agentfunktionalitet. Användarinteraktioner flödar genom en React-baserad frontend till en FastAPI-backend som kommunicerar med AI-agenttjänsten för att generera kontextuella svar. 
      
      Systemet inkluderar kunskapsåtervinningsmöjligheter genom antingen filsökning eller Azure AI Search-tjänsten, vilket tillåter agenten att få åtkomst till och citera information från uppladdade dokument. För driftsexcellens innefattar arkitekturen omfattande övervakning via Application Insights och Log Analytics Workspace för spårning, loggning och prestandaoptimering. 
      
      Azure Storage tillhandahåller blobblagring för applikationsdata och filuppladdningar, medan Managed Identity säkerställer säker åtkomst mellan Azure-resurser utan att lagra autentiseringsuppgifter. Hela lösningen är utformad för skalbarhet och underhållbarhet, där den containeriserade applikationen automatisk skalas baserat på efterfrågan samtidigt som den erbjuder inbyggd säkerhet, övervakning och CI/CD-funktioner genom Azures hanterade tjänsteekosystem.

![Arkitektur](../../../../../translated_images/sv/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repositoriets struktur

!!! prompt "FRÅGA: Förklara mallens mappstruktur. Börja med ett visuellt hierarkiskt diagram."

??? info "SVAR: Visuellt hierarkiskt diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguration & installation
      │   ├── azure.yaml                    # Azure Developer CLI-konfiguration
      │   ├── docker-compose.yaml           # Lokala utvecklingscontainrar
      │   ├── pyproject.toml                # Python-projektkonfiguration
      │   ├── requirements-dev.txt          # Utvecklingsberoenden
      │   └── .devcontainer/                # Inställning för VS Code devcontainer
      │
      ├── 🏗️ Infrastruktur (infra/)
      │   ├── main.bicep                    # Huvudinfrastrukturmall
      │   ├── api.bicep                     # API-specifika resurser
      │   ├── main.parameters.json          # Infrastrukturparametrar
      │   └── core/                         # Modulära infrastrukturskomponenter
      │       ├── ai/                       # AI-tjänstkonfigurationer
      │       ├── host/                     # Hosting-infrastruktur
      │       ├── monitor/                  # Övervakning och loggning
      │       ├── search/                   # Azure AI Search-inställning
      │       ├── security/                 # Säkerhet och identitet
      │       └── storage/                  # Konfigurationer för lagringskonto
      │
      ├── 💻 Applikationskällkod (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI-appens ingångspunkt
      │   │   ├── routes.py                 # API-routedefinitioner
      │   │   ├── search_index_manager.py   # Sökningsfunktionalitet
      │   │   ├── data/                     # API-databehandling
      │   │   ├── static/                   # Statisk webbinnehåll
      │   │   └── templates/                # HTML-mallar
      │   ├── frontend/                     # React/TypeScript-frontend
      │   │   ├── package.json              # Node.js-beroenden
      │   │   ├── vite.config.ts            # Vite-byggekonfiguration
      │   │   └── src/                      # Frontend-källkod
      │   ├── data/                         # Exempelfiler
      │   │   └── embeddings.csv            # Förberäknade embeddings
      │   ├── files/                        # Kunskapsdatabasfiler
      │   │   ├── customer_info_*.json      # Kunddataexempel
      │   │   └── product_info_*.md         # Produktdokumentation
      │   ├── Dockerfile                    # Containerkonfiguration
      │   └── requirements.txt              # Python-beroenden
      │
      ├── 🔧 Automatisering & Skript (scripts/)
      │   ├── postdeploy.sh/.ps1           # Konfiguration efter distribution
      │   ├── setup_credential.sh/.ps1     # Konfiguration av autentiseringsuppgifter
      │   ├── validate_env_vars.sh/.ps1    # Validering av miljövariabler
      │   └── resolve_model_quota.sh/.ps1  # Hantering av modellkvoter
      │
      ├── 🧪 Testning & utvärdering
      │   ├── tests/                        # Enhets- och integrationstester
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agentutvärderingsramverk
      │   │   ├── evaluate.py               # Körning av utvärdering
      │   │   ├── eval-queries.json         # Testfrågor
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Utvecklingslekplats
      │   │   ├── 1-quickstart.py           # Kom igång-exempel
      │   │   └── aad-interactive-chat.py   # Autentiseringsexempel
      │   └── airedteaming/                 # Utvärdering av AI-säkerhet
      │       └── ai_redteaming.py          # Red team-testning
      │
      ├── 📚 Dokumentation (docs/)
      │   ├── deployment.md                 # Guide för distribution
      │   ├── local_development.md          # Lokala installationsinstruktioner
      │   ├── troubleshooting.md            # Vanliga problem och lösningar
      │   ├── azure_account_setup.md        # Förutsättningar för Azure
      │   └── images/                       # Dokumentationsresurser
      │
      └── 📄 Projektmetadata
         ├── README.md                     # Projektöversikt
         ├── CODE_OF_CONDUCT.md           # Riktlinjer för communityn
         ├── CONTRIBUTING.md              # Bidragsguide
         ├── LICENSE                      # Licensvillkor
         └── next-steps.md                # Vägledning efter distribution
      ```

### 3.1. Kärnappens arkitektur

Denna mall följer ett **fullstack webbapplikations**-mönster med:

- **Backend**: Python FastAPI med integration med Azure AI
- **Frontend**: TypeScript/React med Vite-byggsystem
- **Infrastruktur**: Azure Bicep-mallar för molnresurser
- **Containerisering**: Docker för konsekvent distribution

### 3.2 Infrastruktur som kod (Bicep)

Infrastrukturlagret använder **Azure Bicep**-mallar organiserade modulärt:

   - **`main.bicep`**: Orkestrerar alla Azure-resurser
   - **`core/` modules**: Återanvändbara komponenter för olika tjänster
      - AI-tjänster (Azure OpenAI, AI Search)
      - Containerhosting (Azure Container Apps)
      - Övervakning (Application Insights, Log Analytics)
      - Säkerhet (Key Vault, Managed Identity)

### 3.3 Applikationskod (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-baserat REST API
- Integrering med Foundry Agents
- Hantering av sökindex för kunskapsåtervinning
- Funktioner för filuppladdning och bearbetning

**Frontend (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Vite för snabb utveckling och optimerade byggen
- Chattgränssnitt för agentinteraktioner

**Kunskapsbas (`src/files/`)**:

- Exempel på kund- och produktdata
- Demonstrerar filsbaserad kunskapsåtervinning
- Exempel i JSON- och Markdown-format


### 3.4 DevOps & automatisering

**Skript (`scripts/`)**:

- Plattformöverskridande PowerShell- och Bash-skript
- Validering och konfigurering av miljö
- Konfiguration efter distribution
- Hantering av modellkvoter

**Integration med Azure Developer CLI**:

- `azure.yaml`-konfiguration för `azd`-arbetsflöden
- Automatiserad provisionering och distribution
- Hantering av miljövariabler

### 3.5 Testning & kvalitetssäkring

**Utvärderingsramverk (`evals/`)**:

- Utvärdering av agents prestanda
- Testning av fråga-svar-kvalitet
- Automatisk bedömningspipeline

**AI-säkerhet (`airedteaming/`)**:

- Red team-testning för AI-säkerhet
- Sårbarhetsskanning
- Ansvarsfulla AI-praktiker

---

## 4. Grattis 🏆

Du har framgångsrikt använt GitHub Copilot Chat med MCP-servrar för att utforska repositoriet.

- [X] Aktiverade GitHub Copilot för Azure
- [X] Förstod applikationsarkitekturen
- [X] Utforskade AZD-mallens struktur

Detta ger dig en bild av _infrastruktur som kod_-resurserna för denna mall. Nästa tittar vi på konfigurationsfilen för AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess ursprungsspråk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas en professionell översättning utförd av en mänsklig översättare. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår genom användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->