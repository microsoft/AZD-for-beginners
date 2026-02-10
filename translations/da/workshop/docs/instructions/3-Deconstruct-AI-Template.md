# 3. Nedbryd en skabelon

!!! tip "VED SLUTNINGEN AF DETTE MODUL VIL DU KUNNE"

    - [ ] Aktivér GitHub Copilot med MCP-servere til Azure-assistance
    - [ ] Forstå AZD-skabelonens mappestruktur og komponenter
    - [ ] Udforsk infrastruktur-som-kode (Bicep) organisationsmønstre
    - [ ] **Laboratorium 3:** Brug GitHub Copilot til at udforske og forstå repository-arkitekturen 

---


Med AZD-skabeloner og Azure Developer CLI (`azd`) kan vi hurtigt kickstarte vores AI-udviklingsrejse med standardiserede repositories, der leverer eksempelkode, infrastruktur og konfigurationsfiler - i form af et klar-til-udrulning _startprojekt_.

**Men nu skal vi forstå projektstrukturen og kodebasen - og være i stand til at tilpasse AZD-skabelonen - uden nogen tidligere erfaring eller forståelse af AZD!**

---

## 1. Aktivér GitHub Copilot

### 1.1 Installer GitHub Copilot Chat

Det er tid til at udforske [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nu kan vi bruge naturligt sprog til at beskrive vores opgave på et overordnet niveau og få hjælp til udførelsen. Til dette lab bruger vi [Copilot Free plan](https://github.com/github-copilot/signup), som har en månedlig grænse for tekstgenereringer og chatinteraktioner.

Udvidelsen kan installeres fra marketplace, men burde allerede være tilgængelig i dit Codespaces-miljø. _Klik på `Open Chat` fra Copilot-ikonets drop-down - og skriv en prompt som `What can you do?`_ - du kan blive bedt om at logge ind. **GitHub Copilot Chat er klar**.

### 1.2. Installer MCP-servere

For at Agent mode skal være effektiv, skal den have adgang til de rigtige værktøjer, der kan hjælpe den med at hente viden eller udføre handlinger. Her kan MCP-servere hjælpe. Vi konfigurerer følgende servere:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

For at aktivere disse:

1. Opret en fil kaldet `.vscode/mcp.json` hvis den ikke findes
1. Kopier følgende ind i den fil - og start serverne!
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

??? warning "Du kan få en fejl om, at `npx` ikke er installeret (klik for at udvide for rettelse)"

      For at rette dette, åbn `.devcontainer/devcontainer.json`-filen og tilføj denne linje i features-sektionen. Genopbyg derefter containeren. Du bør nu have `npx` installeret.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**Først brug `az login` for at autentificere med Azure fra VS Code's kommandolinje.**

Du burde nu kunne forespørge din Azure-abonnementsstatus og stille spørgsmål om udrullede ressourcer eller konfiguration. Prøv disse prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Du kan også stille spørgsmål om Azure-dokumentation og få svar baseret på Microsoft Docs MCP-serveren. Prøv disse prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Eller du kan bede om kodeeksempler til at fuldføre en opgave. Prøv denne prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

I `Ask`-tilstand vil dette give kode, som du kan kopiere og afprøve. I `Agent`-tilstand kan dette gå et skridt videre og oprette de relevante ressourcer for dig - inklusive opsætningsscripts og dokumentation - for at hjælpe dig med at gennemføre opgaven.

**Du er nu rustet til at begynde at udforske skabelon-repositoriet**

---

## 2. Analysér arkitekturen

??? prompt "SPØRG: Forklar applikationsarkitekturen i docs/images/architecture.png i 1 afsnit"

      Denne applikation er en AI-drevet chatapplikation bygget på Azure, der demonstrerer en moderne agent-baseret arkitektur. Løsningen centrerer sig omkring en Azure Container App, som huser hovedapplikationskoden, der behandler brugerinput og genererer intelligente svar gennem en AI-agent. 
      
      Arkitekturen benytter Microsoft Foundry Project som fundament for AI-mulighederne og forbinder til Azure AI Services, der leverer de underliggende sprogmodeller (såsom GPT-4o-mini) og agentfunktionalitet. Brugerinteraktioner flyder gennem en React-baseret frontend til en FastAPI-backend, som kommunikerer med AI-agenttjenesten for at generere kontekstuelle svar. 
      
      Systemet indeholder videnshentningsfunktioner gennem enten fil-søgning eller Azure AI Search-tjenesten, som gør det muligt for agenten at få adgang til og henvise oplysninger fra uploadede dokumenter. For operationel kvalitet inkluderer arkitekturen omfattende overvågning gennem Application Insights og Log Analytics Workspace til tracing, logging og performanceoptimering. 
      
      Azure Storage leverer blob-lagring til applikationsdata og filuploads, mens Managed Identity sikrer sikker adgang mellem Azure-ressourcer uden at gemme legitimationsoplysninger. Hele løsningen er designet til skalerbarhed og vedligeholdelse, med containeriseret applikation, der automatisk skalerer baseret på efterspørgsel, samtidig med at den tilbyder indbygget sikkerhed, overvågning og CI/CD-muligheder gennem Azures administrerede tjenester.

![Arkitektur](../../../../../translated_images/da/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository-struktur

!!! prompt "SPØRG: Forklar skabelonens mappestruktur. Start med et visuelt hierarkisk diagram."

??? info "SVAR: Visuelt Hierarkisk Diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI-konfiguration
      │   ├── docker-compose.yaml           # Lokale udviklingscontainere
      │   ├── pyproject.toml                # Python-projektkonfiguration
      │   ├── requirements-dev.txt          # Udviklingsafhængigheder
      │   └── .devcontainer/                # VS Code devcontainer-opsætning
      │
      ├── 🏗️ Infrastruktur (infra/)
      │   ├── main.bicep                    # Hoved infrastruktur skabelon
      │   ├── api.bicep                     # API-specifikke ressourcer
      │   ├── main.parameters.json          # Infrastrukturparametre
      │   └── core/                         # Modulære infrastrukturkomponenter
      │       ├── ai/                       # AI-servicekonfigurationer
      │       ├── host/                     # Hostinginfrastruktur
      │       ├── monitor/                  # Overvågning og logning
      │       ├── search/                   # Azure AI Search-opsætning
      │       ├── security/                 # Sikkerhed og identitet
      │       └── storage/                  # Storage-konto-konfigurationer
      │
      ├── 💻 Applikationskilde (src/)
      │   ├── api/                          # Backend-API
      │   │   ├── main.py                   # FastAPI-applikationens indgang
      │   │   ├── routes.py                 # API-rutedefinitioner
      │   │   ├── search_index_manager.py   # Søgefunktionalitet
      │   │   ├── data/                     # API-databehandling
      │   │   ├── static/                   # Statisk webindhold
      │   │   └── templates/                # HTML-skabeloner
      │   ├── frontend/                     # React/TypeScript-frontend
      │   │   ├── package.json              # Node.js-afhængigheder
      │   │   ├── vite.config.ts            # Vite-buildkonfiguration
      │   │   └── src/                      # Frontend-kildekode
      │   ├── data/                         # Eksempeldatfiler
      │   │   └── embeddings.csv            # Forhåndsberegnede embeddings
      │   ├── files/                        # Vidensbasefiler
      │   │   ├── customer_info_*.json      # Kundedataeksempler
      │   │   └── product_info_*.md         # Produktdokumentation
      │   ├── Dockerfile                    # Containerkonfiguration
      │   └── requirements.txt              # Python-afhængigheder
      │
      ├── 🔧 Automatisering & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-deploy-opsætning
      │   ├── setup_credential.sh/.ps1     # Credential-konfiguration
      │   ├── validate_env_vars.sh/.ps1    # Miljøvalidering
      │   └── resolve_model_quota.sh/.ps1  # Modelkvotestyring
      │
      ├── 🧪 Test & Evaluering
      │   ├── tests/                        # Unit- og integrationstests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent-evalueringsframework
      │   │   ├── evaluate.py               # Evalueringskører
      │   │   ├── eval-queries.json         # Testforespørgsler
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Udviklingssandbox
      │   │   ├── 1-quickstart.py           # Kom godt i gang-eksempler
      │   │   └── aad-interactive-chat.py   # Autentificeringseksempler
      │   └── airedteaming/                 # AI-sikkerhedsevaluering
      │       └── ai_redteaming.py          # Red team-testning
      │
      ├── 📚 Dokumentation (docs/)
      │   ├── deployment.md                 # Udrulningsvejledning
      │   ├── local_development.md          # Lokale opsætningsinstruktioner
      │   ├── troubleshooting.md            # Almindelige problemer & rettelser
      │   ├── azure_account_setup.md        # Azure forudsætninger
      │   └── images/                       # Dokumentationsressourcer
      │
      └── 📄 Projektmetadata
         ├── README.md                     # Projektoversigt
         ├── CODE_OF_CONDUCT.md           # Retningslinjer for fællesskabet
         ├── CONTRIBUTING.md              # Bidragsvejledning
         ├── LICENSE                      # Licensvilkår
         └── next-steps.md                # Vejledning efter udrulning
      ```

### 3.1. Kerneapp-arkitektur

Denne skabelon følger et **full-stack webapplikationsmønster** med:

- **Backend**: Python FastAPI med Azure AI-integration
- **Frontend**: TypeScript/React med Vite build-system
- **Infrastruktur**: Azure Bicep-skabeloner til cloud-ressourcer
- **Containerisering**: Docker til konsistent udrulning

### 3.2 Infrastruktur som kode (Bicep)

Infrastrukturlaget bruger **Azure Bicep**-skabeloner organiseret modulært:

   - **`main.bicep`**: Orkestrerer alle Azure-ressourcer
   - **`core/`-moduler**: Genanvendelige komponenter til forskellige tjenester
      - AI-tjenester (Azure OpenAI, AI Search)
      - Container-hosting (Azure Container Apps)
      - Overvågning (Application Insights, Log Analytics)
      - Sikkerhed (Key Vault, Managed Identity)

### 3.3 Applikationskilde (`src/`)

**Backend API (`src/api/`)**:

- REST-API baseret på FastAPI
- Foundry Agents-integration
- Søgeindeksstyring til videnshentning
- Filupload og behandlingsmuligheder

**Frontend (`src/frontend/`)**:

- Moderne React/TypeScript SPA
- Vite til hurtig udvikling og optimerede builds
- Chatgrænseflade til agentinteraktioner

**Vidensbase (`src/files/`)**:

- Eksempler på kunde- og produktdata
- Demonstrerer filbaseret videnshentning
- JSON- og Markdown-eksempler


### 3.4 DevOps & Automatisering

**Scripts (`scripts/`)**:

- Platformuafhængige PowerShell- og Bash-scripts
- Miljøvalidering og opsætning
- Post-deploy-konfiguration
- Håndtering af modelkvoter

**Azure Developer CLI Integration**:

- `azure.yaml`-konfiguration til `azd`-workflows
- Automatiseret provisioning og udrulning
- Håndtering af miljøvariabler

### 3.5 Test & Kvalitetssikring

**Evalueringsframework (`evals/`)**:

- Evaluering af agentens ydeevne
- Kvalitetstest af forespørgsel-svar
- Automatiseret vurderingspipeline

**AI Safety (`airedteaming/`)**:

- Red team-test for AI-sikkerhed
- Scanning efter sikkerhedssårbarheder
- Ansvarlig AI-praksis

---

## 4. Tillykke 🏆

Du har med succes brugt GitHub Copilot Chat med MCP-servere til at udforske repositoryet.

- [X] Aktiveret GitHub Copilot for Azure
- [X] Forstået applikationsarkitekturen
- [X] Udforsket AZD-skabelonstrukturen

Dette giver dig et indblik i _infrastruktur som kode_-aktiverne for denne skabelon. Næste kigger vi på konfigurationsfilen for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument i dets originalsprog bør betragtes som den autoritative kilde. Ved kritisk information anbefales professionel, menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->