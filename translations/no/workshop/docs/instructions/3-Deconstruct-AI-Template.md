# 3. Dekonstruer en mal

!!! tip "PÅ SLUTTEN AV DETTE MODULEN VIL DU KUNNE"

    - [ ] Aktivere GitHub Copilot med MCP-servere for Azure-assistanse
    - [ ] Forstå AZD-malens mappestruktur og komponenter
    - [ ] Utforske organisasjonsmønstre for infrastruktur-som-kode (Bicep)
    - [ ] **Lab 3:** Bruke GitHub Copilot for å utforske og forstå depotarkitektur

---


Med AZD-maler og Azure Developer CLI (`azd`) kan vi raskt komme i gang med AI-utviklingsreisen vår med standardiserte depoter som tilbyr eksempelkode, infrastruktur og konfigurasjonsfiler - i form av et klart-til-distribuere _starter_-prosjekt.

**Men nå må vi forstå prosjektstrukturen og kodebasen - og kunne tilpasse AZD-malen - uten noen forhåndserfaring eller forståelse av AZD!**

---

## 1. Aktiver GitHub Copilot

### 1.1 Installer GitHub Copilot Chat

Det er på tide å utforske [GitHub Copilot med Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nå kan vi bruke naturlig språk til å beskrive oppgaven vår på et høyt nivå, og få hjelp til utførelsen. For denne labben bruker vi [Copilot Free plan](https://github.com/github-copilot/signup) som har en månedlig grense for fullføringer og chat-interaksjoner.

Utvidelsen kan installeres fra marketplace, men skal allerede være tilgjengelig i Codespaces-miljøet ditt. _Klikk `Open Chat` fra Copilot-ikonets nedtrekksmeny - og skriv inn et spørsmål som `What can you do?`_ - du kan bli bedt om å logge inn. **GitHub Copilot Chat er klar**.

### 1.2. Installer MCP-servere

For at Agent-modus skal være effektivt, trenger det tilgang til de riktige verktøyene for å hente kunnskap eller utføre handlinger. Her kan MCP-servere hjelpe. Vi skal konfigurere følgende servere:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

For å aktivere disse:

1. Opprett en fil kalt `.vscode/mcp.json` hvis den ikke eksisterer
1. Kopier følgende inn i den filen - og start serverne!
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

??? warning "Du kan få en feil om at `npx` ikke er installert (klikk for å utvide med løsning)"

      For å fikse dette, åpne `.devcontainer/devcontainer.json`-filen og legg til denne linjen i funksjonsseksjonen. Bygg deretter containeren på nytt. Du skal nå ha `npx` installert.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**Bruk først `az login` for å autentisere med Azure fra VS Code kommandolinje.**

Du skal nå kunne spørre om status for Azure-abonnementet ditt, og stille spørsmål om distribuerte ressurser eller konfigurasjon. Prøv disse spørsmålene:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Du kan også spørre om Azure-dokumentasjon og få svar basert på Microsoft Docs MCP-serveren. Prøv disse spørsmålene:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Eller du kan be om kodeeksempler for å utføre en oppgave. Prøv dette spørsmålet.

1. `Give me a Python code example that uses AAD for an interactive chat client`

I `Ask` modus gir dette kode som du kan kopiere og prøve ut. I `Agent` modus kan det gå et steg videre og opprette relevante ressurser for deg - inkludert oppsettsskript og dokumentasjon - for å hjelpe deg med å utføre oppgaven.

**Du er nå utstyrt for å begynne å utforske mal-depotet**

---

## 2. Dekonstruer Arkitektur

??? prompt "SPØR: Forklar applikasjonsarkitekturen i docs/images/architecture.png i ett avsnitt"

      Denne applikasjonen er en AI-drevet chatteapplikasjon bygget på Azure som demonstrerer en moderne agent-basert arkitektur. Løsningen sentreres rundt en Azure Container App som hoster hovedapplikasjonskoden, som behandler brukerinput og genererer intelligente svar gjennom en AI-agent. 
      
      Arkitekturen benytter Microsoft Foundry Project som grunnlaget for AI-kapasiteter, koblet til Azure AI Services som tilbyr de underliggende språkmodellene (som gpt-4.1-mini) og agentfunksjonalitet. Brukerinteraksjoner går gjennom et React-basert frontend til en FastAPI backend som kommuniserer med AI-agent-tjenesten for å generere kontekstuelle svar. 
      
      Systemet inkorporerer kunnskapsgjenfinningskapasitet via enten filtssøk eller Azure AI Search-tjenesten, som gjør at agenten kan få tilgang til og sitere informasjon fra opplastede dokumenter. For operasjonell fortreffelighet inkluderer arkitekturen omfattende overvåking via Application Insights og Log Analytics Workspace for sporing, logging og ytelsesoptimalisering. 
      
      Azure Storage tilbyr blob-lagring for applikasjonsdata og filopplastinger, mens Managed Identity sikrer trygg tilgang mellom Azure-ressurser uten lagring av legitimasjon. Hele løsningen er designet for skalerbarhet og vedlikeholdbarhet, med applikasjonen som automatisk skalerer basert på etterspørsel samtidig som den tilbyr innebygd sikkerhet, overvåking og CI/CD-muligheter gjennom Azures administrerte tjenester.

![Architecture](../../../../../translated_images/no/architecture.48d94861e6e6cdc0.webp)

---

## 3. Depotstruktur

!!! prompt "SPØR: Forklar malens mappestruktur. Start med et visuelt hierarkisk diagram."

??? info "SVAR: Visuelt hierarkisk diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurasjon og oppsett
      │   ├── azure.yaml                    # Azure Developer CLI konfigurasjon
      │   ├── docker-compose.yaml           # Lokale utviklingscontainere
      │   ├── pyproject.toml                # Python-prosjektkonfigurasjon
      │   ├── requirements-dev.txt          # Utviklingsavhengigheter
      │   └── .devcontainer/                # VS Code dev container-oppsett
      │
      ├── 🏗️ Infrastruktur (infra/)
      │   ├── main.bicep                    # Hovedmal for infrastruktur
      │   ├── api.bicep                     # Ressurser for API
      │   ├── main.parameters.json          # Infrastrukturparametere
      │   └── core/                         # Modulare infrastrukturelementer
      │       ├── ai/                       # AI-tjenestekonfigurasjoner
      │       ├── host/                     # Hosting-infrastruktur
      │       ├── monitor/                  # Overvåking og logging
      │       ├── search/                   # Azure AI Search-oppsett
      │       ├── security/                 # Sikkerhet og identitet
      │       └── storage/                  # Konfigurasjoner for lagringskontoer
      │
      ├── 💻 Applikasjonskilde (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI applikasjonsinngang
      │   │   ├── routes.py                 # API rutedefinisjoner
      │   │   ├── search_index_manager.py   # Søke funksjonalitet
      │   │   ├── data/                     # API datahåndtering
      │   │   ├── static/                   # Statisk webinnhold
      │   │   └── templates/                # HTML-maler
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js avhengigheter
      │   │   ├── vite.config.ts            # Vite byggkonfigurasjon
      │   │   └── src/                      # Frontend-kildekode
      │   ├── data/                         # Eksempeldatfiler
      │   │   └── embeddings.csv            # Forhåndsberegnede embeddings
      │   ├── files/                        # Kunnskapsbasefiler
      │   │   ├── customer_info_*.json      # Eksempler på kundedata
      │   │   └── product_info_*.md         # Produktdokumentasjon
      │   ├── Dockerfile                    # Containerkonfigurasjon
      │   └── requirements.txt              # Python-avhengigheter
      │
      ├── 🔧 Automatisering og Skript (scripts/)
      │   ├── postdeploy.sh/.ps1           # Oppsett etter distribusjon
      │   ├── setup_credential.sh/.ps1     # Konfigurasjon av legitimasjon
      │   ├── validate_env_vars.sh/.ps1    # Miljøvalidering
      │   └── resolve_model_quota.sh/.ps1  # Modellkvotestyring
      │
      ├── 🧪 Testing og Evaluering
      │   ├── tests/                        # Enhets- og integrasjonstester
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent-evalueringsrammeverk
      │   │   ├── evaluate.py               # Evaluering kjører
      │   │   ├── eval-queries.json         # Testspørringer
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Utviklingslekeplass
      │   │   ├── 1-quickstart.py           # Kom-i-gang-eksempler
      │   │   └── aad-interactive-chat.py   # Autentiseringseksempler
      │   └── airedteaming/                 # AI-sikkerhetsevaluering
      │       └── ai_redteaming.py          # Red team testing
      │
      ├── 📚 Dokumentasjon (docs/)
      │   ├── deployment.md                 # Distribusjonsveiledning
      │   ├── local_development.md          # Lokale oppsettinstruksjoner
      │   ├── troubleshooting.md            # Vanlige problemer og løsninger
      │   ├── azure_account_setup.md        # Azure-forutsetninger
      │   └── images/                       # Dokumentasjonsressurser
      │
      └── 📄 Prosjektmetadata
         ├── README.md                     # Prosjektoversikt
         ├── CODE_OF_CONDUCT.md           # Retningslinjer for fellesskapet
         ├── CONTRIBUTING.md              # Veiledning for bidrag
         ├── LICENSE                      # Lisensbetingelser
         └── next-steps.md                # Veiledning etter distribusjon
      ```

### 3.1. Kjerneapp-arkitektur

Denne malen følger et **full-stack webapplikasjons**-mønster med:

- **Backend**: Python FastAPI med Azure AI-integrasjon
- **Frontend**: TypeScript/React med Vite byggsystem
- **Infrastruktur**: Azure Bicep-maler for skyressurser
- **Containerisering**: Docker for konsistent distribusjon

### 3.2 Infrastruktur Som Kode (bicep)

Infrastrukturlaget bruker **Azure Bicep**-maler organisert modulært:

   - **`main.bicep`**: Orkestrerer alle Azure-ressurser
   - **`core/` moduler**: Gjenbrukbare komponenter for forskjellige tjenester
      - AI-tjenester (Microsoft Foundry Modeller, AI Search)
      - Container hosting (Azure Container Apps)
      - Overvåking (Application Insights, Log Analytics)
      - Sikkerhet (Key Vault, Managed Identity)

### 3.3 Applikasjonskilde (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-basert REST API
- Foundry Agents-integrasjon
- Søkeindeksbehandling for kunnskapsgjenfinning
- Filopplastings- og behandlingsfunksjoner

**Frontend (`src/frontend/`)**:

- Moderne React/TypeScript SPA
- Vite for rask utvikling og optimaliserte builds
- Chatgrensesnitt for agentinteraksjoner

**Kunnskapsbase (`src/files/`)**:

- Eksempler på kunde- og produktdata
- Demonstrerer filbasert kunnskapsgjenfinning
- JSON- og Markdown-format eksempler


### 3.4 DevOps & Automatisering

**Skript (`scripts/`)**:

- Plattformuavhengige PowerShell- og Bash-skript
- Miljøvalidering og oppsett
- Konfigurasjon etter distribusjon
- Modellkvotestyring

**Azure Developer CLI Integrasjon**:

- `azure.yaml` konfigurasjon for `azd` arbeidsflyter
- Automatisert provisjonering og distribusjon
- Miljøvariabelhåndtering

### 3.5 Testing og Kvalitetssikring

**Evalueringsrammeverk (`evals/`)**:

- Agent ytelsesevaluering
- Spørring-svar kvalitets-testing
- Automatisert vurderingspipeline

**AI-sikkerhet (`airedteaming/`)**:

- Red team testing for AI-sikkerhet
- Sikkerhetssårbarhetsskanning
- Ansvarlig AI-praksis

---

## 4. Gratulerer 🏆

Du brukte GitHub Copilot Chat med MCP-servere for å utforske depotet.

- [X] Aktivert GitHub Copilot for Azure
- [X] Forstått applikasjonsarkitekturen
- [X] Utforsket AZD-malstrukturen

Dette gir deg en følelse av _infrastruktur som kode_-ressursene for denne malen. Neste steg ser vi på konfigurasjonsfilen for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi ansvarer ikke for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->