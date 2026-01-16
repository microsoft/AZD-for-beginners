<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-24T21:32:37+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "sv"
}
-->
# 3. Demontera en mall

!!! tip "VID SLUTET AV DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Punkt
    - [ ] Punkt
    - [ ] Punkt
    - [ ] **Lab 3:** 

---

Med AZD-mallar och Azure Developer CLI (`azd`) kan vi snabbt påbörja vår AI-utvecklingsresa med standardiserade arkiv som innehåller exempel på kod, infrastruktur och konfigurationsfiler - i form av ett färdigt att distribuera _startprojekt_.

**Men nu behöver vi förstå projektstrukturen och kodbasen - och kunna anpassa AZD-mallen - utan någon tidigare erfarenhet eller förståelse för AZD!**

---

## 1. Aktivera GitHub Copilot

### 1.1 Installera GitHub Copilot Chat

Det är dags att utforska [GitHub Copilot med Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nu kan vi använda naturligt språk för att beskriva vår uppgift på en hög nivå och få hjälp med att utföra den. För detta labb kommer vi att använda [Copilot Free-planen](https://github.com/github-copilot/signup) som har en månatlig gräns för slutföranden och chattinteraktioner.

Tillägget kan installeras från marknadsplatsen, men bör redan vara tillgängligt i din Codespaces-miljö. _Klicka på `Open Chat` från Copilot-ikonens rullgardinsmeny - och skriv en prompt som `What can you do?`_ - du kan bli ombedd att logga in. **GitHub Copilot Chat är redo**.

### 1.2 Installera MCP-servrar

För att Agent Mode ska vara effektivt behöver det tillgång till rätt verktyg för att hjälpa till att hämta kunskap eller utföra åtgärder. Här kommer MCP-servrar in i bilden. Vi kommer att konfigurera följande servrar:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

För att aktivera dessa:

1. Skapa en fil som heter `.vscode/mcp.json` om den inte redan finns
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

??? warning "Du kan få ett felmeddelande om att `npx` inte är installerat (klicka för att expandera och fixa)"

      För att fixa detta, öppna filen `.devcontainer/devcontainer.json` och lägg till denna rad i avsnittet för funktioner. Bygg sedan om containern. Du bör nu ha `npx` installerat.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 Testa GitHub Copilot Chat

**Använd först `az login` för att autentisera med Azure från VS Code-kommandoraden.**

Du bör nu kunna fråga om status för din Azure-prenumeration och ställa frågor om distribuerade resurser eller konfiguration. Testa dessa kommandon:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Du kan också ställa frågor om Azure-dokumentation och få svar baserade på Microsoft Docs MCP-servern. Testa dessa kommandon:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Eller så kan du be om kodexempel för att slutföra en uppgift. Testa denna prompt:

1. `Give me a Python code example that uses AAD for an interactive chat client`

I `Ask`-läge kommer detta att ge kod som du kan kopiera och testa. I `Agent`-läge kan detta gå ett steg längre och skapa relevanta resurser åt dig - inklusive installationsskript och dokumentation - för att hjälpa dig att utföra uppgiften.

**Du är nu redo att börja utforska mallarkivet**

---

## 2. Demontera arkitektur

??? prompt "FRÅGA: Förklara applikationsarkitekturen i docs/images/architecture.png i en paragraf"

      Denna applikation är en AI-driven chattapplikation byggd på Azure som demonstrerar en modern agentbaserad arkitektur. Lösningen kretsar kring en Azure Container App som är värd för huvudapplikationskoden, vilken bearbetar användarinmatning och genererar intelligenta svar via en AI-agent. 
      
      Arkitekturen utnyttjar Azure AI Foundry Project som grund för AI-funktioner och ansluter till Azure AI Services som tillhandahåller de underliggande språkmodellerna (såsom GPT-4o-mini) och agentfunktionalitet. Användarinteraktioner flödar genom en React-baserad frontend till en FastAPI-backend som kommunicerar med AI-agenttjänsten för att generera kontextuella svar. 
      
      Systemet inkluderar kunskapshämtningsfunktioner via antingen filsökning eller Azure AI Search-tjänsten, vilket gör att agenten kan få tillgång till och citera information från uppladdade dokument. För operativ excellens inkluderar arkitekturen omfattande övervakning via Application Insights och Log Analytics Workspace för spårning, loggning och prestandaoptimering. 
      
      Azure Storage tillhandahåller bloblagring för applikationsdata och filuppladdningar, medan Managed Identity säkerställer säker åtkomst mellan Azure-resurser utan att lagra autentiseringsuppgifter. Hela lösningen är designad för skalbarhet och underhållbarhet, med den containeriserade applikationen som automatiskt skalar baserat på efterfrågan samtidigt som den erbjuder inbyggd säkerhet, övervakning och CI/CD-funktioner genom Azures ekosystem för hanterade tjänster.

![Arkitektur](../../../../../translated_images/sv/architecture.48d94861e6e6cdc0.png)

---

## 3. Arkivstruktur

!!! prompt "FRÅGA: Förklara mallens mappstruktur. Börja med ett visuellt hierarkiskt diagram."

??? info "SVAR: Visuellt hierarkiskt diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguration & Installation
      │   ├── azure.yaml                    # Azure Developer CLI-konfiguration
      │   ├── docker-compose.yaml           # Lokala utvecklingscontainrar
      │   ├── pyproject.toml                # Python-projektkonfiguration
      │   ├── requirements-dev.txt          # Utvecklingsberoenden
      │   └── .devcontainer/                # VS Code dev container-inställningar
      │
      ├── 🏗️ Infrastruktur (infra/)
      │   ├── main.bicep                    # Huvudinfrastrukturmall
      │   ├── api.bicep                     # API-specifika resurser
      │   ├── main.parameters.json          # Infrastrukturparametrar
      │   └── core/                         # Modulära infrastrukturkomponenter
      │       ├── ai/                       # AI-tjänstkonfigurationer
      │       ├── host/                     # Hosting-infrastruktur
      │       ├── monitor/                  # Övervakning och loggning
      │       ├── search/                   # Azure AI Search-inställningar
      │       ├── security/                 # Säkerhet och identitet
      │       └── storage/                  # Lagringskontokonfigurationer
      │
      ├── 💻 Applikationskällkod (src/)
      │   ├── api/                          # Backend-API
      │   │   ├── main.py                   # FastAPI-applikationsstart
      │   │   ├── routes.py                 # API-routedefinitioner
      │   │   ├── search_index_manager.py   # Sökningsfunktionalitet
      │   │   ├── data/                     # API-databehandling
      │   │   ├── static/                   # Statiska webbtillgångar
      │   │   └── templates/                # HTML-mallar
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js-beroenden
      │   │   ├── vite.config.ts            # Vite-byggkonfiguration
      │   │   └── src/                      # Frontend-källkod
      │   ├── data/                         # Exempelfiler
      │   │   └── embeddings.csv            # Förberäknade embeddings
      │   ├── files/                        # Kunskapsbasfiler
      │   │   ├── customer_info_*.json      # Kunddataexempel
      │   │   └── product_info_*.md         # Produktdokumentation
      │   ├── Dockerfile                    # Containerkonfiguration
      │   └── requirements.txt              # Python-beroenden
      │
      ├── 🔧 Automatisering & Skript (scripts/)
      │   ├── postdeploy.sh/.ps1           # Inställningar efter distribution
      │   ├── setup_credential.sh/.ps1     # Autentiseringskonfiguration
      │   ├── validate_env_vars.sh/.ps1    # Miljövalidering
      │   └── resolve_model_quota.sh/.ps1  # Hantering av modellkvoter
      │
      ├── 🧪 Testning & Utvärdering
      │   ├── tests/                        # Enhets- och integrationstester
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Utvärderingsramverk för agent
      │   │   ├── evaluate.py               # Utvärderingskörning
      │   │   ├── eval-queries.json         # Testfrågor
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Utvecklingslekplats
      │   │   ├── 1-quickstart.py           # Kom igång-exempel
      │   │   └── aad-interactive-chat.py   # Autentiseringsexempel
      │   └── airedteaming/                 # AI-säkerhetsutvärdering
      │       └── ai_redteaming.py          # Red team-testning
      │
      ├── 📚 Dokumentation (docs/)
      │   ├── deployment.md                 # Distributionsguide
      │   ├── local_development.md          # Lokala installationsinstruktioner
      │   ├── troubleshooting.md            # Vanliga problem & lösningar
      │   ├── azure_account_setup.md        # Azure-förutsättningar
      │   └── images/                       # Dokumentationsresurser
      │
      └── 📄 Projektmetadata
         ├── README.md                     # Projektöversikt
         ├── CODE_OF_CONDUCT.md           # Riktlinjer för gemenskapen
         ├── CONTRIBUTING.md              # Bidragsguide
         ├── LICENSE                      # Licensvillkor
         └── next-steps.md                # Vägledning efter distribution
      ```

### 3.1 Kärnappens arkitektur

Denna mall följer ett **fullstack-webbapplikationsmönster** med:

- **Backend**: Python FastAPI med Azure AI-integration
- **Frontend**: TypeScript/React med Vite-byggsystem
- **Infrastruktur**: Azure Bicep-mallar för molnresurser
- **Containerisering**: Docker för konsekvent distribution

### 3.2 Infrastruktur som kod (bicep)

Infrastrukturlagret använder **Azure Bicep**-mallar organiserade modulärt:

   - **`main.bicep`**: Orkestrerar alla Azure-resurser
   - **`core/` moduler**: Återanvändbara komponenter för olika tjänster
      - AI-tjänster (Azure OpenAI, AI Search)
      - Containerhosting (Azure Container Apps)
      - Övervakning (Application Insights, Log Analytics)
      - Säkerhet (Key Vault, Managed Identity)

### 3.3 Applikationskällkod (`src/`)

**Backend-API (`src/api/`)**:

- REST API baserat på FastAPI
- Integration med Azure AI Agent-tjänst
- Hantering av sökindex för kunskapshämtning
- Filuppladdning och bearbetningsfunktioner

**Frontend (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Vite för snabb utveckling och optimerade byggen
- Chattgränssnitt för agentinteraktioner

**Kunskapsbas (`src/files/`)**:

- Exempel på kund- och produktdata
- Demonstrerar filbaserad kunskapshämtning
- Exempel i JSON- och Markdown-format

### 3.4 DevOps & Automatisering

**Skript (`scripts/`)**:

- Plattformoberoende PowerShell- och Bash-skript
- Miljövalidering och inställning
- Konfiguration efter distribution
- Hantering av modellkvoter

**Integration med Azure Developer CLI**:

- `azure.yaml`-konfiguration för `azd`-arbetsflöden
- Automatiserad provisionering och distribution
- Hantering av miljövariabler

### 3.5 Testning & Kvalitetssäkring

**Utvärderingsramverk (`evals/`)**:

- Utvärdering av agentens prestanda
- Testning av fråge-svarskvalitet
- Automatiserad bedömningspipeline

**AI-säkerhet (`airedteaming/`)**:

- Red team-testning för AI-säkerhet
- Skanning av säkerhetsbrister
- Ansvarsfulla AI-praktiker

---

## 4. Grattis 🏆

Du har framgångsrikt använt GitHub Copilot Chat med MCP-servrar för att utforska arkivet.

- [X] Aktiverat GitHub Copilot för Azure
- [X] Förstått applikationsarkitekturen
- [X] Utforskat AZD-mallens struktur

Detta ger dig en förståelse för _infrastruktur som kod_-tillgångarna för denna mall. Nästa steg är att titta på konfigurationsfilen för AZD.

---

