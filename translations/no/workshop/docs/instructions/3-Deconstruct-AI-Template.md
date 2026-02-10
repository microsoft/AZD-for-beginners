# 3. Dekonstruere en mal

!!! tip "PÅ SLUTTEN AV DETTE MODULEN VIL DU KUNNE"

    - [ ] Aktivere GitHub Copilot med MCP-servere for Azure-assistanse
    - [ ] Forstå AZD-malens mappestruktur og komponenter
    - [ ] Utforske infrastruktur-som-kode (Bicep) organiseringsmønstre
    - [ ] **Lab 3:** Bruke GitHub Copilot for å utforske og forstå depotarkitektur 

---


Med AZD-maler og Azure Developer CLI (`azd`) kan vi raskt komme i gang med vår AI-utviklingsreise med standardiserte depoter som gir eksempel-kode, infrastruktur og konfigurasjonsfiler - i form av et klare-til-å-distribuere _starter_ prosjekt.

**Men nå må vi forstå prosjektstrukturen og kodebasen - og være i stand til å tilpasse AZD-malen - uten noen tidligere erfaring eller forståelse av AZD!**

---

## 1. Aktiver GitHub Copilot

### 1.1 Installer GitHub Copilot Chat

Det er på tide å utforske [GitHub Copilot med Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Nå kan vi bruke naturlig språk for å beskrive oppgaven på et høyt nivå, og få hjelp til utførelsen. For denne laben bruker vi [Copilot Free plan](https://github.com/github-copilot/signup) som har en månedlig grense for fullføringer og chatteinteraksjoner.

Utvidelsen kan installeres fra markedsplassen, men skal allerede være tilgjengelig i ditt Codespaces-miljø. _Klikk `Open Chat` fra Copilot-ikonets rullegardin - og skriv en prompt som `What can you do?`_ - du kan bli bedt om å logge inn. **GitHub Copilot Chat er klar**.

### 1.2. Installer MCP-servere

For at Agent mode skal være effektivt, trenger det tilgang til riktige verktøy for å hente kunnskap eller utføre handlinger. Her kan MCP-servere hjelpe. Vi konfigurerer følgende servere:

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

      For å fikse dette, åpne filen `.devcontainer/devcontainer.json` og legg til denne linjen i features-seksjonen. Bygg deretter containeren på nytt. Du skal nå ha `npx` installert.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**Bruk først `az login` for å autentisere mot Azure fra VS Code kommandolinje.**

Du skal nå kunne spørre om status for Azure-abonnementet ditt, og stille spørsmål om distribuerte ressurser eller konfigurasjon. Prøv disse promptene:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Du kan også stille spørsmål om Azure-dokumentasjon og få svar basert på Microsoft Docs MCP-serveren. Prøv disse promptene:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Eller du kan be om kodeeksempler for å fullføre en oppgave. Prøv denne prompten.

1. `Give me a Python code example that uses AAD for an interactive chat client`

I `Ask` mode vil dette gi deg kode du kan kopiere og teste ut. I `Agent` mode kan den gå et steg videre og opprette relevante ressurser for deg - inkludert oppsettsskripter og dokumentasjon - for å hjelpe deg å utføre oppgaven.

**Du er nå rustet til å begynne å utforske maldepotet**

---

## 2. Dekonstruer arkitekturen

??? prompt "SPØR: Forklar applikasjonsarkitekturen i docs/images/architecture.png i 1 avsnitt"

      Denne applikasjonen er en AI-drevet chat-applikasjon bygget på Azure som demonstrerer en moderne agent-basert arkitektur. Løsningen sentrerer rundt en Azure Container App som hoster hovedapplikasjonskoden, som behandler brukerinput og genererer intelligente svar via en AI-agent.

      Arkitekturen utnytter Microsoft Foundry Project som fundament for AI-funksjonalitet, og kobler til Azure AI-tjenester som leverer underliggende språkmodeller (som GPT-4o-mini) og agentfunksjonalitet. Brukerinteraksjoner flyter gjennom en React-basert frontend til en FastAPI backend som kommuniserer med AI-agenttjenesten for å generere kontekstuelle svar.

      Systemet inkluderer kunnskapsinnhentingsmuligheter gjennom enten filsøk eller Azure AI Search-tjenesten, som lar agenten få tilgang til og sitere informasjon fra opplastede dokumenter. For driftseffektivitet inkluderer arkitekturen omfattende overvåking via Application Insights og Log Analytics Workspace for sporing, logging og ytelsesoptimalisering.

      Azure Storage tilbyr blob-lagring for applikasjonsdata og filopplastinger, mens Managed Identity sikrer sikker tilgang mellom Azure-ressurser uten å lagre legitimasjon. Hele løsningen er designet for skalerbarhet og vedlikehold, med containerisert applikasjon som automatisk skaleres basert på etterspørsel samtidig som den tilbyr innebygd sikkerhet, overvåking og CI/CD-funksjonalitet gjennom Azure sitt forvaltede tjenesteøkosystem.

![Arkitektur](../../../../../translated_images/no/architecture.48d94861e6e6cdc0.webp)

---

## 3. Depotstruktur

!!! prompt "SPØR: Forklar malens mappestruktur. Begynn med et visuelt hierarkisk diagram."

??? info "SVAR: Visuelt hierarkisk diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Konfigurasjon for Azure Developer CLI
      │   ├── docker-compose.yaml           # Lokale utviklingscontainere
      │   ├── pyproject.toml                # Python-prosjektkonfigurasjon
      │   ├── requirements-dev.txt          # Utviklingsavhengigheter
      │   └── .devcontainer/                # VS Code dev container oppsett
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Hovedmal for infrastruktur
      │   ├── api.bicep                     # Ressurser spesifikke for API
      │   ├── main.parameters.json          # Infrastrukturparametre
      │   └── core/                         # Modulære infrastrukturelementer
      │       ├── ai/                       # AI-tjenestekonfigurasjoner
      │       ├── host/                     # Hosting infrastruktur
      │       ├── monitor/                  # Overvåking og logging
      │       ├── search/                   # Azure AI Search-oppsett
      │       ├── security/                 # Sikkerhet og identitet
      │       └── storage/                  # Lagringskonto-konfigurasjoner
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend-API
      │   │   ├── main.py                   # FastAPI applikasjonsinngang
      │   │   ├── routes.py                 # API-rute-definisjoner
      │   │   ├── search_index_manager.py   # Søkefunksjonalitet
      │   │   ├── data/                     # API datahåndtering
      │   │   ├── static/                   # Statisk web-innhold
      │   │   └── templates/                # HTML-maler
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js avhengigheter
      │   │   ├── vite.config.ts            # Vite byggekonfigurasjon
      │   │   └── src/                      # Frontend kildekode
      │   ├── data/                         # Eksempeldatafiler
      │   │   └── embeddings.csv            # Forhåndsberegnede embeddings
      │   ├── files/                        # Kunnskapsbase-filer
      │   │   ├── customer_info_*.json      # Kundedata-eksempler
      │   │   └── product_info_*.md         # Produktdokumentasjon
      │   ├── Dockerfile                    # Container-konfigurasjon
      │   └── requirements.txt              # Python-avhengigheter
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Oppsett etter distribusjon
      │   ├── setup_credential.sh/.ps1     # Legitimasjonskonfigurasjon
      │   ├── validate_env_vars.sh/.ps1    # Miljøvalidering
      │   └── resolve_model_quota.sh/.ps1  # Modellkvotehåndtering
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Enhets- og integrasjonstester
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent-evalueringsrammeverk
      │   │   ├── evaluate.py               # Evalueringskjører
      │   │   ├── eval-queries.json         # Testspørringer
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Utviklingslekeplass
      │   │   ├── 1-quickstart.py           # Komme i gang-eksempler
      │   │   └── aad-interactive-chat.py   # Autentiseringseksempler
      │   └── airedteaming/                 # AI-sikkerhetsevaluering
      │       └── ai_redteaming.py          # Red team testing
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Distribusjonsveiledning
      │   ├── local_development.md          # Lokale oppsettsinstruksjoner
      │   ├── troubleshooting.md            # Vanlige problemer og løsninger
      │   ├── azure_account_setup.md        # Azure forutsetninger
      │   └── images/                       # Dokumentasjonsbilder
      │
      └── 📄 Project Metadata
         ├── README.md                     # Prosjektoversikt
         ├── CODE_OF_CONDUCT.md           # Retningslinjer for fellesskapet
         ├── CONTRIBUTING.md              # Veiledning for bidrag
         ├── LICENSE                      # Lisensvilkår
         └── next-steps.md                # Veiledning etter distribusjon
      ```

### 3.1. Kjerneapplikasjonsarkitektur

Denne malen følger et mønster for **fullstack webapplikasjon** med:

- **Backend**: Python FastAPI med Azure AI-integrasjon
- **Frontend**: TypeScript/React med Vite byggeverktøy
- **Infrastruktur**: Azure Bicep-maler for skyløsninger
- **Containerisering**: Docker for konsekvent distribusjon

### 3.2 Infrastruktur som kode (bicep)

Infrastrukturlaget bruker **Azure Bicep**-maler organisert modulært:

   - **`main.bicep`**: Koordinerer alle Azure-ressurser
   - **`core/` moduler**: Gjenbrukbare komponenter for ulike tjenester
      - AI-tjenester (Azure OpenAI, AI Search)
      - Container-hosting (Azure Container Apps)
      - Overvåking (Application Insights, Log Analytics)
      - Sikkerhet (Key Vault, Managed Identity)

### 3.3 Applikasjonskilde (`src/`)

**Backend-API (`src/api/`)**:

- FastAPI-basert REST API
- Integrasjon med Foundry-agenter
- Administrasjon av søkeindeks for kunnskapsinnhenting
- Filopplasting og prosesseringsmuligheter

**Frontend (`src/frontend/`)**:

- Moderne React/TypeScript SPA
- Vite for rask utvikling og optimaliserte builds
- Chattgrensesnitt for agent-interaksjoner

**Kunnskapsbase (`src/files/`)**:

- Eksempelkunde- og produktdata
- Demonstrerer filbasert kunnskapsinnhenting
- Eksempler i JSON- og Markdown-format


### 3.4 DevOps og automatisering

**Skript (`scripts/`)**:

- Plattformuavhengige PowerShell- og Bash-skript
- Validering og oppsett av miljø
- Konfigurasjon etter distribusjon
- Modellkvotehåndtering

**Azure Developer CLI-integrasjon**:

- `azure.yaml` konfigurasjon for `azd` arbeidsflyter
- Automatisert provisjonering og distribusjon
- Miljøvariabelhåndtering

### 3.5 Testing og kvalitetssikring

**Evalueringsrammeverk (`evals/`)**:

- Evaluering av agentens ytelse
- Testing av spørring-svar-kvalitet
- Automatisert vurderingspipeline

**AI-sikkerhet (`airedteaming/`)**:

- Red team testing for AI-sikkerhet
- Sårbarhetsskanning
- Ansvarlig AI-praksis

---

## 4. Gratulerer 🏆

Du brukte GitHub Copilot Chat med MCP-servere for å utforske depotet.

- [X] Aktiverte GitHub Copilot for Azure
- [X] Forstod applikasjonsarkitekturen
- [X] Utforsket AZD-malens struktur

Dette gir deg en forståelse av _infrastruktur som kode_-ressursene for denne malen. Neste steg ser vi på konfigurasjonsfilen for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på det opprinnelige språket bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->