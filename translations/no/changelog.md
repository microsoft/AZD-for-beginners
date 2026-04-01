# Changelog - AZD For Beginners

## Introduksjon

Denne changelogen dokumenterer alle viktige endringer, oppdateringer og forbedringer i AZD For Beginners-repositoriet. Vi følger prinsippene for semantisk versjonering og opprettholder denne loggen for å hjelpe brukere å forstå hva som har endret seg mellom versjoner.

## Læringsmål

Ved å gjennomgå denne changelogen vil du:
- Holde deg oppdatert på nye funksjoner og innholdstilføyelser
- Forstå forbedringer gjort i eksisterende dokumentasjon
- Følge feilrettinger og korreksjoner for å sikre nøyaktighet
- Følge utviklingen av lærematerialet over tid

## Læringsutbytte

Etter å ha gjennomgått endringene i changelogen vil du kunne:
- Identifisere nytt innhold og ressurser tilgjengelig for læring
- Forstå hvilke seksjoner som er oppdatert eller forbedret
- Planlegge din læringsreise basert på det mest oppdaterte materialet
- Bidra med tilbakemeldinger og forslag til fremtidige forbedringer

## Versjonshistorikk

### [v3.19.1] - 2026-03-27

#### Klargjøring for nybegynner-ombordstigning, validering av oppsett & opprydding av siste AZD-kommandoer
**Denne versjonen følger opp AZD 1.23 valideringssweepen med en dokumentasjonsrunde rettet mot nybegynnere: den klargjør AZD-først autentiseringsveiledning, legger til skript for lokal oppsettvalidering, verifiserer nøkkelkommandoer mot live AZD CLI, og fjerner de siste utdaterte kommandoene med engelske kilder utenfor changelogen.**

#### Lagt til
- **🧪 Valideringsskript for nybegynneroppsett** med `validate-setup.ps1` og `validate-setup.sh` slik at lærende kan bekrefte nødvendige verktøy før oppstart av Kapittel 1
- **✅ Forhåndsdefinerte oppsettvalideringstrinn** i rot-README og Kapittel 1 README slik at manglende forutsetninger fanges opp før `azd up`

#### Endret
- **🔐 Autentiseringsveiledning for nybegynnere** behandler nå konsekvent `azd auth login` som hovedvei for AZD-arbeidsflyter, med `az login` nevnt som valgfrie med mindre Azure CLI-kommandoer brukes direkte
- **📚 Onboardingflyt for Kapittel 1** peker nå lærende til å validere sitt lokale oppsett før installasjon, autentisering og første distribusjonstrinn
- **🛠️ Meldinger fra validatoren** skiller nå tydelig mellom blockerende krav og valgfrie Azure CLI-advarsler for kun AZD-relaterte nybegynnerveier
- **📖 Konfigurasjon, feilsøking og eksempeldokumenter** skiller nå mellom påkrevd AZD-autentisering og valgfrie Azure CLI-pålogginger der begge tidligere ble presentert uten kontekst

#### Fikset
- **📋 Gjenværende engelskspråklige kommando-referanser** oppdatert til nåværende AZD-former, inkludert `azd config show` i jukselisten og `azd monitor --overview` der veiledning for Azure Portal oversikt var ment
- **🧭 Nybegynnerpåstander i Kapittel 1** myknet for å unngå å love garantert null-feil eller rollback oppførsel på tvers av alle maler og Azure-ressurser
- **🔎 Live CLI-validering** bekreftet nåværende støtte for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` og `azd down --force --purge`

#### Oppdaterte filer
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12-validering, workshopmiljøutvidelse & AI-modelloppdatering
**Denne versjonen utfører en dokumentasjonsvalideringsrunde mot `azd` `1.23.12`, oppdaterer utdaterte AZD-kommandoeksempler, oppdaterer AI-modellveiledning til gjeldende standarder og utvider workshop-instruksjonene utover GitHub Codespaces til også å støtte dev containere og lokale kloner.**

#### Lagt til
- **✅ Valideringsnotater på tvers av kjernekapitler og workshopdokumenter** for å gjøre den testede AZD-baselinen eksplisitt for lærende som bruker nyere eller eldre CLI-versjoner
- **⏱️ Veiledning for deploy-tidsavbrudd** ved langvarige AI-app-distribusjoner med `azd deploy --timeout 1800`
- **🔎 Trinn for utvidelsesinspeksjon** med `azd extension show azure.ai.agents` i AI-arbeidsflytdokumenter
- **🌐 Utvidet veiledning for workshopmiljø** som dekker GitHub Codespaces, dev containere og lokale kloner med MkDocs

#### Endret
- **📚 Intro-READMEer i kapitlene** noterer nå konsekvent validering mot `azd 1.23.12` på tvers av grunnlag, konfigurasjon, infrastruktur, multi-agent, pre-deployment, feilsøking og produksjonsseksjoner
- **🛠️ AZD-kommando-referanser** oppdatert til nåværende former i dokumentene:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` avhengig av kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` der oversikt for Application Insights er ment
- **🧪 Eksempler på provision preview** forenklet til nåværende støttet bruk som `azd provision --preview` og `azd provision --preview -e production`
- **🧭 Workshopflyt** oppdatert slik at lærende kan fullføre laboratorier i Codespaces, en dev container eller en lokal klone i stedet for å anta kun Codespaces
- **🔐 Autentiseringsveiledning** foretrekker nå `azd auth login` for AZD-arbeidsflyter, med `az login` som valgfritt når Azure CLI-kommandoer brukes direkte

#### Fikset
- **🪟 Windows installasjonskommandoer** normalisert til nåværende `winget` pakkestaving i installasjonsveiledningen
- **🐧 Linux installasjonsveiledning** korrigert for å unngå utdaterte distribusjonsspesifikke `azd` pakkebehandlerinstruksjoner og i stedet peke mot release-assets ved behov
- **📦 AI-modelleksempler** oppdatert fra eldre standarder som `gpt-35-turbo` og `text-embedding-ada-002` til nåværende eksempler slik som `gpt-4.1-mini`, `gpt-4.1` og `text-embedding-3-large`
- **📋 Utdrag for deploy og diagnostikk** rettet til å bruke gjeldende miljø- og statuskommandoer i logger, skript og feilsøkingstrinn
- **⚙️ GitHub Actions-veiledning** oppdatert fra `Azure/setup-azd@v1.0.0` til `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtykkeveiledning** oppdatert fra `azd mcp consent` til `azd copilot consent list`

#### Forbedret
- **🧠 AI-kapitlets veiledning** forklarer nå bedre forhåndsvisningsfølsom `azd ai`-atferd, tenant-spesifikk pålogging, gjeldende utvidelsesbruk og oppdaterte modellutplassering anbefalinger
- **🧪 Workshopinstruksjoner** bruker nå mer realistiske versjonseksempler og klarere miljøoppsett for praktiske laboratorier
- **📈 Produksjons- og feilsøkingsdokumenter** er nå bedre tilpasset gjeldende overvåking, fallback-modeller og kostnadsnivå-eksempler

#### Oppdaterte filer
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI-kommandoer, innholdsvalidering & malutvidelse
**Denne versjonen legger til dekning for `azd ai`, `azd extension` og `azd mcp`-kommandoer på tvers av alle AI-relaterte kapitler, fikser ødelagte lenker og utdatert kode i agents.md, oppdaterer jukselisten, og kompletterer Eksempelmaler-seksjonen med validerte beskrivelser og nye Azure AI AZD-maler.**

#### Lagt til
- **🤖 AZD AI CLI-dekning** på tvers av 7 filer (tidligere kun i Kapittel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny seksjon "Utvidelser og AI-kommandoer" som introduserer `azd extension`, `azd ai agent init` og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Alternativ 4: `azd ai agent init` med sammenligningstabell (mal vs manifest-tilnærming)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Underseksjonene "AZD Extensions for Foundry" og "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Kjapp start viser nå både mal- og manifestbaserte utplasseringsveier
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-delen inkluderer nå `azd ai agent init`-alternativ
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underseksjon "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Ny seksjon "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp` og `azd infra generate`
- **📦 Nye AZD AI-eksempelmaler** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chat med Blazor WebAssembly, Semantic Kernel og støtte for stemmechat
  - **azure-search-openai-demo-java** — Java RAG-chat med Langchain4J med ACA/AKS deploy-alternativer
  - **contoso-creative-writer** — Multi-agent kreativ skrive-app med Azure AI Agent Service, Bing Grounding og Prompty
  - **serverless-chat-langchainjs** — Serverless RAG ved bruk av Azure Functions + LangChain.js + Cosmos DB med støtte for lokal utvikling via Ollama
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-akselerator med adminportal, Teams-integrasjon og PostgreSQL/Cosmos DB-alternativer
  - **azure-ai-travel-agents** — Multi-agent MCP orkestreringsreferanseapp med servere i .NET, Python, Java og TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastruktur Bicep startmal
  - **🔗 Flott AZD AI-gallerialenke** — Referanse til [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ maler)

#### Fikset
- **🔗 agents.md navigasjon**: Forrige/Neste-lenker stemmer nå overens med Kapittel 2 README leksesekvens (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ødelagte lenker**: `production-ai-practices.md` korrigert til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md utdatert kode**: Erstattet `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttet `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md token-telling**: Erstattet grov `len//4` estimat med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Korrigert tjenester fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standard vertsnavn endret okt 2024)
- **contoso-chat**: Oppdatert beskrivelse til å referere Azure AI Foundry + Prompty, i tråd med repoets faktiske tittel og teknologistack

#### Fjernet
- **ai-document-processing**: Fjernet ikke-fungerende malreferanse (repo ikke offentlig tilgjengelig som AZD-mal)

#### Forbedret
- **📝 agents.md øvelser**: Øvelse 1 viser nå forventet output og `azd monitor` steg; Øvelse 2 inkluderer full `FunctionTool` registreringskode; Øvelse 3 erstatter vag veiledning med konkrete `prepdocs.py` kommandoer
- **📚 agents.md ressurser**: Oppdaterte dokumentasjonslenker til gjeldende Azure AI Agent Service-dokumentasjon og hurtigstart
- **📋 agents.md Neste Steg-tabell**: La til AI Workshop Lab-lenke for full kapitteldekning

#### Oppdaterte filer
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Forbedring av kursnavigasjon
**Denne versjonen forbedrer README.md kapittelnavigasjon med et forbedret tabellformat.**

#### Endret
- **Kurskart Tabell**: Forbedret med direkte lenker til leksjoner, tidsestimater og kompleksitetsvurderinger
- **Mapperens**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Lenkevalidering**: Alle 21+ interne lenker i Kurskart-tabellen verifisert

### [v3.16.0] - 2026-02-05

#### Oppdateringer til produktnavn
**Denne versjonen oppdaterer produktreferanser til dagens Microsoft-branding.**

#### Endret
- **Microsoft Foundry → Microsoft Foundry**: Alle referanser oppdatert i ikke-oversettelsesfiler
- **Azure AI Agent Service → Foundry Agents**: Tjenestenavn oppdatert for å gjenspeile dagens branding

#### Oppdaterte filer
- `README.md` - Hovedsiden for kurset
- `changelog.md` - Versjonshistorikk
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - AI-agenter guide
- `examples/README.md` - Eksempeldokumentasjon
- `workshop/README.md` - Workshop hovedside
- `workshop/docs/index.md` - Workshop indeks
- `workshop/docs/instructions/*.md` - Alle workshop instruksjonsfiler

---

### [v3.15.0] - 2026-02-05

#### Stor omstrukturering av repositoriet: Kapittelnavn på mapper
**Denne versjonen omstrukturerer dokumentasjonen til dedikerte kapittelmappenavn for tydeligere navigasjon.**

#### Mappeendringer
Gamle mapper er erstattet med kapittelnummererte mapper:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Nytt lagt til: `docs/chapter-05-multi-agent/`

#### Filmigreringer
| Fil | Fra | Til |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| Alle pre-deployment-filer | pre-deployment/ | chapter-06-pre-deployment/ |
| Alle troubleshooting-filer | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lagt til
- **📚 Kapitel README-filer**: Opprettet README.md i hver kapittelmappe med:
  - Læringsmål og varighet
  - Leksjonstabell med beskrivelser
  - Hurtigstart-kommandoer
  - Navigasjon til andre kapitler

#### Endret
- **🔗 Oppdaterte alle interne lenker**: 78+ stier oppdatert på tvers av all dokumentasjon
- **🗺️ Hoved README.md**: Oppdatert Kurskart med ny kapittelstruktur
- **📝 examples/README.md**: Oppdaterte kryssreferanser til kapittelmappene

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Omstrukturering av repo: Kapittelnavigasjon
**Denne versjonen la til kapittelnavigasjons README-filer (erstattet av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny AI Agent-guide
**Denne versjonen legger til en omfattende guide for deployering av AI-agenter med Azure Developer CLI.**

#### Lagt til
- **🤖 docs/microsoft-foundry/agents.md**: Komplett guide som dekker:
  - Hva AI-agenter er og hvordan de skiller seg fra chatboter
  - Tre hurtigstart-agentskjemaer (Foundry Agents, Prompty, RAG)
  - Agentarkitektur-mønstre (enkel agent, RAG, multi-agent)
  - Verktøykonfigurasjon og tilpasning
  - Overvåking og metrikksporing
  - Kostnadsbetraktninger og optimalisering
  - Vanlige feilsøkningsscenarier
  - Tre praktiske øvelser med suksesskriterier

#### Innholdsstruktur
- **Introduksjon**: Agentkonsepter for nybegynnere
- **Hurtigstart**: Deploy agenter med `azd init --template get-started-with-ai-agents`
- **Arkitektur-mønstre**: Visuelle diagrammer av agentmønstre
- **Konfigurasjon**: Verktøyoppsett og miljøvariabler
- **Overvåking**: Application Insights-integrasjon
- **Øvelser**: Progressiv praktisk læring (20-45 minutter per øvelse)

---

### [v3.12.0] - 2026-02-05

#### Oppdatering av DevContainer-miljø
**Denne versjonen oppdaterer utviklingscontainer-konfigurasjonen med moderne verktøy og bedre standarder for AZD-læringsopplevelse.**

#### Endret
- **🐳 Basebilde**: Oppdatert fra `python:3.12-bullseye` til `python:3.12-bookworm` (nyeste stabile Debian)
- **📛 Container-navn**: Omdøpt fra "Python 3" til "AZD for Beginners" for tydelighet

#### Lagt til
- **🔧 Nye Dev Container-funksjoner**:
  - `azure-cli` med aktivert Bicep-støtte
  - `node:20` (LTS-versjon for AZD-maler)
  - `github-cli` for malhåndtering
  - `docker-in-docker` for container app deployeringer

- **🔌 Port forwarding**: Ferdigkonfigurert porter for vanlig utvikling:
  - 8000 (MkDocs forhåndsvisning)
  - 3000 (Web-apper)
  - 5000 (Python Flask)
  - 8080 (APIer)

- **🧩 Nye VS Code-utvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions støtte
  - `ms-azuretools.vscode-docker` - Docker støtte
  - `ms-azuretools.vscode-bicep` - Bicep språkstøtte
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursstyring
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagramstøtte
  - `redhat.vscode-yaml` - YAML støtte (for azure.yaml)
  - `eamodio.gitlens` - Git visualisering
  - `mhutchie.git-graph` - Git-historikk

- **⚙️ VS Code-innstillinger**: Lagt til standardinnstillinger for Python-tolk, format på lagring, og fjerning av whitespace

- **📦 Oppdaterte requirements-dev.txt**:
  - Lagt til MkDocs minify-plugin
  - Lagt til pre-commit for kodekvalitet
  - Lagt til Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Fikset
- **Post-create kommando**: Verifiserer nå AZD og Azure CLI-installasjon ved containerstart

---

### [v3.11.0] - 2026-02-05

#### README-forbedring for nybegynnere
**Denne versjonen forbedrer README.md betydelig for å være mer tilgjengelig for nybegynnere og legger til viktige ressurser for AI-utviklere.**

#### Lagt til
- **🆚 Azure CLI vs AZD Sammenligning**: Klar forklaring på når man skal bruke hvert verktøy med praktiske eksempler
- **🌟 Awesome AZD-lenker**: Direkte lenker til community template gallery og bidragsressurser:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ferdige deploymaler
  - [Send inn en mal](https://github.com/Azure/awesome-azd/issues) - Community-bidrag
- **🎯 Hurtigstart-guide**: Forenklet 3-trinns komm-i-gang seksjon (Installer → Logg inn → Deploy)
- **📊 Navigasjonstabell basert på erfaring**: Klar veiledning for hvor man skal begynne basert på utviklererfaring

#### Endret
- **README Struktur**: Omskrevet for progresiv informasjon - viktige opplysninger først
- **Introduksjonsseksjon**: Omskrevet for å forklare «Magien bak `azd up`» for helt nybegynnere
- **Fjernet duplikert innhold**: Eliminert duplikat feilsøkingsseksjon
- **Feilsøkingskommandoer**: Korrigerte referanse til `azd logs` til gyldig `azd monitor --logs`

#### Fikset
- **🔐 Autentiseringskommandoer**: Lagt til `azd auth login` og `azd auth logout` i cheat-sheet.md
- **Ugyldige kommandoer**: Fjernet resterende `azd logs` fra README feilsøkingsseksjon

#### Notater
- **Omfang**: Endringer brukt på hoved-README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer spesielt rettet mot utviklere nye til AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Kommando-korreksjon
**Denne versjonen retter opp ikke-eksisterende AZD-kommandoer i hele dokumentasjonen, slik at alle kodeeksempler bruker gyldig Azure Developer CLI-syntaks.**

#### Fikset
- **🔧 Ikke-eksisterende AZD-kommandoer fjernet**: Grundig gjennomgang og korrigering av ugyldige kommandoer:
  - `azd logs` (finnes ikke) → erstattet med `azd monitor --logs` eller Azure CLI-alternativer
  - `azd service` underkommandoer (finnes ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (finnes ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flagg (finnes ikke) → fjernet
  - `azd provision --what-if/--rollback` flagg (finnes ikke) → oppdatert til å bruke `--preview`
  - `azd config validate` (finnes ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (finnes ikke) → fjernet

- **📚 Oppdaterte filer med kommando-korreksjoner**:
  - `resources/cheat-sheet.md`: Stort overhale av kommandooversikt
  - `docs/deployment/deployment-guide.md`: Fikset rollback og deploy-strategier
  - `docs/troubleshooting/debugging.md`: Korrigerte logganalyse-seksjoner
  - `docs/troubleshooting/common-issues.md`: Oppdaterte feilsøkingskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Fikset AZD debugging-seksjon
  - `docs/getting-started/azd-basics.md`: Korrigerte overvåkingskommandoer
  - `docs/getting-started/first-project.md`: Oppdaterte overvåking og feilsøkings-eksempler
  - `docs/getting-started/installation.md`: Fikset hjelp- og versjonseksempler
  - `docs/pre-deployment/application-insights.md`: Korrigerte loggvisningskommandoer
  - `docs/pre-deployment/coordination-patterns.md`: Fikset agent feilsøkingskommandoer

- **📝 Versjonsreferanse oppdatert**: 
  - `docs/getting-started/installation.md`: Endret hardkodet `1.5.0` versjon til generisk `1.x.x` med lenke til utgivelser

#### Endret
- **Rollback-strategier**: Dokumentasjonen oppdatert til å bruke Git-basert rollback (AZD har ikke innebygd rollback)
- **Loggvisning**: Erstattet `azd logs` referanser med `azd monitor --logs`, `azd monitor --live` og Azure CLI-kommandoer
- **Ytelsesseksjon**: Fjernet ikke-eksisterende parallelle/incremental deploy-flagg, gitt gyldige alternativer

#### Tekniske detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor-flagg**: `--live`, `--logs`, `--overview`
- **Fjernet funksjonalitet**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notater
- **Verifisering**: Kommandoer validert mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Fullføring av workshop og oppdatering av dokumentasjonskvalitet
**Denne versjonen fullfører de interaktive workshop-modulene, fikser alle ødelagte dokumentasjonslenker, og forbedrer den generelle innholdskvaliteten for AI-utviklere som bruker Microsoft AZD.**

#### Lagt til
- **📝 CONTRIBUTING.md**: Nytt dokument for bidragsretningslinjer med:
  - Tydelige instruksjoner for å rapportere problemer og foreslå endringer
  - Dokumentasjonsstandarder for nytt innhold
  - Retningslinjer for kodeeksempler og konvensjoner for commit-meldinger
  - Informasjon om engasjement i fellesskapet

#### Fullført
- **🎯 Workshop Modul 7 (Avslutning)**: Fullstendig ferdig avslutningsmodul med:
  - Omfattende sammendrag av workshop-resultater
  - Seksjon om nøkkelkonsepter som dekker AZD, maler og Microsoft Foundry
  - Anbefalinger for videre læringsreise
  - Workshop utfordringsøvelser med vanskelighetsgrader
  - Tilbakemeldings- og støttelenker til fellesskapet

- **📚 Workshop Modul 3 (Nedbrytning)**: Oppdaterte læringsmål med:
  - Veiledning for aktivering av GitHub Copilot med MCP-servere
  - Forståelse av AZD-malens mappestruktur
  - Infrastruktur-som-kode (Bicep) organisasjonsmønstre
  - Praktiske lab-instruksjoner

- **🔧 Workshop Modul 6 (Nedrigging)**: Fullført med:
  - Ressursopprydning og kostnadsstyringsmål
  - Bruk av `azd down` for sikker deprovisjonering av infrastruktur
  - Veiledning for gjenoppretting av mykt slettede cognitive services
  - Ekstra utforskningsoppgaver for GitHub Copilot og Azure Portal

#### Fikset
- **🔗 Fikset ødelagte lenker**: Over 15 ødelagte interne dokumentasjonslenker løst:
  - `docs/ai-foundry/ai-model-deployment.md`: Rettede stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerte stier for ai-model-deployment.md og production-ai-practices.md
  - `docs/getting-started/first-project.md`: Erstattet ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fikset FAQ- og feilsøkingsguide-stier
  - `examples/container-app/microservices/README.md`: Korrigerte kurs-hjem og deploy guide-stier
  - `resources/faq.md` og `resources/glossary.md`: Oppdaterte AI-kapittelreferanser
  - `course-outline.md`: Rettet instruktørguide og AI workshop lab-referanser

- **📅 Workshop Status-banner**: Oppdatert fra "Under Construction" til aktiv workshop-status med februar 2026-dato

- **🔗 Workshop-navigasjon**: Fikset ødelagte navigasjonslenker i workshop README.md som pekte til ikke-eksisterende lab-1-azd-basics-mappe

#### Endret
- **Workshop-presentasjon**: Fjernet "under construction"-advarsel, workshop er nå komplett og klar til bruk
- **Navigasjonskonsistens**: Sikret at alle workshop-moduler har korrekt intern navigasjon
- **Læringsstireferanser**: Oppdatert kapittelkryssreferanser til å bruke riktige microsoft-foundry-stier

#### Validert
- ✅ Alle engelske markdown-filer har gyldige interne lenker
- ✅ Workshop-moduler 0-7 er komplette med læringsmål
- ✅ Navigasjon mellom kapitler og moduler fungerer korrekt
- ✅ Innholdet egner seg for AI-utviklere som bruker Microsoft AZD
- ✅ Nybegynnervennlig språk og struktur opprettholdes gjennomgående
- ✅ CONTRIBUTING.md gir tydelig veiledning for fellesskapsbidragsytere

#### Teknisk implementering
- **Lenkevalidering**: Automatisert PowerShell-skript verifiserte alle .md interne lenker
- **Innholdsaudit**: Manuell gjennomgang av workshop-kompletthet og nybegynnervennlighet
- **Navigasjonssystem**: Konsistente navigasjonsmønstre for kapitler og moduler anvendt

#### Notater
- **Omfang**: Endringer gjøres kun i engelsk dokumentasjon
- **Oversettelser**: Oversettelsesmappene oppdateres ikke i denne versjonen (automatisert oversettelse samkjøres senere)
- **Workshop-varighet**: Komplett workshop gir nå 3-4 timers praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avansert dokumentasjon: Overvåking, sikkerhet og multi-agent mønstre
**Denne versjonen legger til omfattende A-karakter leksjoner om Application Insights-integrasjon, autentiseringsmønstre og multi-agent koordinering for produksjonsdistribusjoner.**

#### Lagt til
- **📊 Application Insights Integrasjonsleksjon**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokusert distribusjon med automatisk provisjonering
  - Komplett Bicep-maler for Application Insights + Log Analytics
  - Arbeidende Python-applikasjoner med tilpasset telemetri (1200+ linjer)
  - AI/LLM overvåkingsmønstre (Microsoft Foundry Models token/kostnadssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribuert sporing, telemetriflyt)
  - 3 praktiske øvelser (alarmer, dashbord, AI-overvåking)
  - Kusto spørringseksempler og kostnadsoptimaliseringsstrategier
  - Live metrikkstrømming og sanntids feilsøking
  - 40-50 minutters læringstid med produksjonsklare mønstre

- **🔐 Autentisering og sikkerhetsmønstre leksjon**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmønstre (tilkoblingsstrenger, Key Vault, administrert identitet)
  - Komplett Bicep infrastruktur maler for sikre distribusjoner
  - Node.js applikasjonskode med Azure SDK-integrasjon
  - 3 komplette øvelser (aktiver administrert identitet, bruker-tilordnet identitet, Key Vault-rotasjon)
  - Sikkerhetsbeste praksis og RBAC-konfigurasjoner
  - Feilsøkingsguide og kostnadsanalyse
  - Produksjonsklare passordløse autentiseringsmønstre

- **🤖 Multi-Agent Koordineringsmønstre leksjon**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineringsmønstre (sekvensiell, parallell, hierarkisk, hendelsesdrevet, konsensus)
  - Komplett tjenesteimplementering som orkestrator (Python/Flask, 1500+ linjer)
  - 3 spesialiserte agentimplementeringer (Research, Writer, Editor)
  - Service Bus-integrasjon for meldingskøer
  - Cosmos DB tilstandsadministrasjon for distribuerte systemer
  - 6 Mermaid-diagrammer som viser agent-interaksjoner
  - 3 avanserte øvelser (timeout-håndtering, retry logikk, circuit breaker)
  - Kostnadsoversikt ($240-565/måned) med optimaliseringsstrategier
  - Application Insights-integrasjon for overvåking

#### Forbedret
- **Pre-distribusjonskapittel**: Inkluderer nå omfattende overvåking og koordineringsmønstre
- **Kom i gang-kapittel**: Forbedret med profesjonelle autentiseringsmønstre
- **Produksjonsklarhet**: Full dekning fra sikkerhet til observerbarhet
- **Kursoversikt**: Oppdatert med referanser til nye leksjoner i kapittel 3 og 6

#### Endret
- **Læringsprogresjon**: Bedre integrering av sikkerhet og overvåking gjennom hele kurset
- **Dokumentasjonskvalitet**: Konsistente A-karakter standarder (95-97%) over nye leksjoner
- **Produksjonsmønstre**: Fullstendig ende-til-ende dekning for bedriftsdistribusjoner

#### Forbedret
- **Utvikleropplevelse**: Klar vei fra utvikling til produksjonsovervåking
- **Sikkerhetsstandarder**: Profesjonelle mønstre for autentisering og hemmelighetshåndtering
- **Observerbarhet**: Komplett Application Insights integrasjon med AZD
- **AI Arbeidsmengder**: Spesialisert overvåking for Microsoft Foundry Models og multi-agent systemer

#### Validert
- ✅ Alle leksjoner inkluderer komplett fungerende kode (ikke utdrag)
- ✅ Mermaid-diagrammer for visuell læring (19 totalt over 3 leksjoner)
- ✅ Praktiske øvelser med verifiseringssteg (9 totalt)
- ✅ Produksjonsklare Bicep-maler som kan deployes via `azd up`
- ✅ Kostnadsanalyse og optimaliseringsstrategier
- ✅ Feilsøkingsguider og beste praksis
- ✅ Kunnskapssjekkpunkter med verifikasjonskommandoer

#### Dokumentasjonskarakterresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvåkingsguide
- **docs/getting-started/authsecurity.md**: - Profesjonelle sikkerhetsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avanserte multi-agent arkitekturer
- **Totalt nytt innhold**: - Konsistente høykvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + tilpasset telemetri + distribuert sporing
- **Autentisering**: Administrert identitet + Key Vault + RBAC-mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvåking**: Live metrikk + Kusto spørringer + alarmer + dashbord
- **Kostnadsstyring**: Prøvetakingsstrategier, lagringspolitikker, budsjettkontroller

### [v3.7.0] - 2025-11-19

#### Forbedringer i dokumentasjonskvalitet og nytt Microsoft Foundry Models-eksempel
**Denne versjonen forbedrer dokumentasjonskvaliteten gjennom hele repoet og legger til et komplett Microsoft Foundry Models distribusjonseksempel med gpt-4.1 chat-grensesnitt.**

#### Lagt til
- **🤖 Microsoft Foundry Models Chat-eksempel**: Komplett gpt-4.1 distribusjon med fungerende implementering i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models infrastruktur (gpt-4.1 modell-distribusjon)
  - Python kommandolinje chat-grensesnitt med samtalehistorikk
  - Key Vault-integrasjon for sikker API-nøkkellagring
  - Tokenbruk-sporing og kostnadsestimering
  - Ratelimiting og feilbehandling
  - Omfattende README med 35-45 minutters deploy-veiledning
  - 11 produksjonsklare filer (Bicep-maler, Python-app, konfigurasjon)
- **📚 Dokumentasjonsøvelser**: Lagt til praktiske øvelser i konfigurasjonsguiden:
  - Øvelse 1: Multi-miljø konfigurasjon (15 minutter)
  - Øvelse 2: Praktisk hemmelighetshåndtering (10 minutter)
  - Tydelige suksesskriterier og verifikasjonssteg
- **✅ Deploy-verifisering**: Lagt til verifiseringsseksjon i deploy-guiden:
  - Helsesjekk-prosedyrer
  - Suksesskriterieliste
  - Forventede utdata for alle distribusjonskommandoer
  - Feilsøkingshurtigreferanse

#### Forbedret
- **examples/README.md**: Oppdatert til A-karakter kvalitet (93%):
  - Lagt til azure-openai-chat i alle relevante seksjoner
  - Oppdatert antall lokale eksempler fra 3 til 4
  - Lagt til i AI Application Examples-tabellen
  - Integrert i Quick Start for Intermediate Users
  - Lagt til i Microsoft Foundry Templates-seksjonen
  - Oppdatert sammenligningsmatrise og teknologi-finnende seksjoner
- **Dokumentasjonskvalitet**: Forbedret fra B+ (87%) → A- (92%) i docs-mappen:
  - Lagt til forventede utdata i kritiske kommandoeksempler
  - Inkludert verifiseringssteg for konfigurasjonsendringer
  - Forsterket praktisk læring med øvelser

#### Endret
- **Læringsprogresjon**: Bedre integrering av AI-eksempler for mellomnivåbrukere
- **Dokumentasjonsstruktur**: Mer handlingsrettede øvelser med tydelige resultater
- **Verifiseringsprosess**: Eksplisitte suksesskriterier lagt til nøkkelarbeidsflyter

#### Forbedret
- **Utvikleropplevelse**: Microsoft Foundry Models deploy tar nå 35-45 minutter (mot 60-90 for komplekse alternativer)
- **Kostnadsgjennomsiktighet**: Tydelige kostnadsestimater ($50-200/måned) for Microsoft Foundry Models-eksempel
- **Læringssti**: AI-utviklere har klar inngang med azure-openai-chat
- **Dokumentasjonsstandarder**: Konsistente forventede utdata og verifikasjonssteg

#### Validert
- ✅ Microsoft Foundry Models-eksempel fullt funksjonelt med `azd up`
- ✅ Alle 11 implementeringsfiler syntaktisk korrekte
- ✅ README-instruksjoner samsvarer med faktisk distribusjonserfaring
- ✅ Dokumentasjonslenker oppdatert på over 8 steder
- ✅ Eksempelkatalog reflekterer korrekt 4 lokale eksempler
- ✅ Ingen dupliserte eksterne lenker i tabeller
- ✅ Alle navigasjonsreferanser korrekte

#### Teknisk implementering
- **Microsoft Foundry Models Arkitektur**: gpt-4.1 + Key Vault + Container Apps-mønster
- **Sikkerhet**: Klar for administrert identitet, hemmeligheter i Key Vault
- **Overvåking**: Application Insights-integrasjon
- **Kostnadsstyring**: Token-sporing og bruksoptimalisering
- **Distribusjon**: Enkel `azd up`-kommando for komplett oppsett

### [v3.6.0] - 2025-11-19

#### Stor oppdatering: Container App distribusjonseksempler
**Denne versjonen introduserer omfattende, produksjonsklare containerapp-distribusjonseksempler med Azure Developer CLI (AZD), full dokumentasjon og integrasjon i læringsstien.**

#### Lagt til
- **🚀 Container App-eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett oversikt over containeriserte distribusjoner, rask start, produksjon og avanserte mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybegynnervennlig REST API med scale-to-zero, helseprøver, overvåking og feilsøking
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices): Produksjonsklar flertjenestedistribusjon (API Gateway, Product, Order, User, Notification), asynkron meldingshåndtering, Service Bus, Cosmos DB, Azure SQL, distribuert sporing, blue-green/canary deploy
- **Beste praksis**: Sikkerhet, overvåking, kostnadsoptimalisering og CI/CD-veiledning for containeriserte arbeidsmengder
- **Kodeeksempler**: Komplett `azure.yaml`, Bicep-maler og flerspråklige tjenesteimplementeringer (Python, Node.js, C#, Go)
- **Testing og feilsøking**: Ende-til-ende testscenarier, overvåkingskommandoer, feilsøkingsveiledning

#### Endret
- **README.md**: Oppdatert for å fremheve og lenke nye containerapp-eksempler under "Lokale Eksempler - Containerapplikasjoner"
- **examples/README.md**: Oppdatert for å fremheve containerapp-eksempler, legge til matriseovergangspunkter og oppdatere teknologi-/arkitekturreferanser
- **Kursoversikt & Studieveiledning**: Oppdatert for å referere til nye containerapp-eksempler og distribusjonsmønstre i relevante kapitler

#### Validert
- ✅ Alle nye eksempler kan distribueres med `azd up` og følger beste praksis
- ✅ Dokumentasjonskrysslenker og navigasjon oppdatert
- ✅ Eksempler dekker nybegynner til avanserte scenarier, inkludert produksjonsmikrotjenester

#### Notater
- **Omfang**: Kun engelsk dokumentasjon og eksempler
- **Neste steg**: Utvide med flere avanserte containermønstre og CI/CD-automatisering i fremtidige utgivelser

### [v3.5.0] - 2025-11-19

#### Produktrebr Branding: Microsoft Foundry  
**Denne versjonen implementerer en omfattende navneendring fra "Microsoft Foundry" til "Microsoft Foundry" i all engelsk dokumentasjon, som reflekterer Microsofts offisielle rebranding.**

#### Endret
- **🔄 Produktnavnoppdatering**: Fullstendig rebranding fra "Microsoft Foundry" til "Microsoft Foundry"
  - Oppdatert alle referanser i engelsk dokumentasjon i `docs/`-mappen
  - Omdøpt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøpt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innholdsreferanser oppdatert i 7 dokumentasjonsfiler

- **📁 Endringer i mappestruktur**:
  - `docs/ai-foundry/` omdøpt til `docs/microsoft-foundry/`
  - Alle kryssreferanser oppdatert for å reflektere ny mappestruktur
  - Navigasjonslenker validert på tvers av all dokumentasjon

- **📄 Filomdøpinger**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne lenker oppdatert for å henvise til nytt filnavn

#### Oppdaterte filer
- **Kapitteldokumentasjon** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigasjonslenker oppdatert
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnreferanser oppdatert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Allerede bruker Microsoft Foundry (fra tidligere oppdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referanser oppdatert (oversikt, fellesskapsinnspill, dokumentasjon)
  - `docs/getting-started/azd-basics.md` - 4 kryssreferanselenker oppdatert
  - `docs/getting-started/first-project.md` - 2 kapittelnavigasjonslenker oppdatert
  - `docs/getting-started/installation.md` - 2 neste kapittel-lenker oppdatert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referanser oppdatert (navigasjon, Discord-fellesskap)
  - `docs/troubleshooting/common-issues.md` - 1 navigasjonslenke oppdatert
  - `docs/troubleshooting/debugging.md` - 1 navigasjonslenke oppdatert

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referanser oppdatert (kursoversikt, kapitteltitler, malseksjon, fellesskapsinnsikt)
  - `course-outline.md` - 14 referanser oppdatert (oversikt, læringsmål, kapittelressurser)

#### Validert
- ✅ Ingen gjenværende "ai-foundry"-mappestier i engelske dokumenter
- ✅ Ingen gjenværende produktnavnreferanser "Microsoft Foundry" i engelske dokumenter
- ✅ Alle navigasjonslenker fungerer med ny mappestruktur
- ✅ Fil- og mappomdøpinger gjennomført uten feil
- ✅ Kryssreferanser mellom kapitler validert

#### Notater
- **Omfang**: Endringer gjeldende kun engelskspråklig dokumentasjon i `docs/`-mappen
- **Oversettelser**: Oversettelsesmappene (`translations/`) ikke oppdatert i denne versjonen
- **Workshop**: Workshop-materiale (`workshop/`) ikke oppdatert i denne versjonen
- **Eksempler**: Eksempelfiler kan fortsatt referere til eldre navngivning (vil bli adressert i fremtidig oppdatering)
- **Eksterne lenker**: Eksterne URL-er og GitHub-repositoriumreferanser er uendret

#### Migrasjonsveiledning for bidragsytere  
Hvis du har lokale grener eller dokumentasjon som refererer til gammel struktur:  
1. Oppdater mappehenvisninger: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. Oppdater filhenvisninger: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. Erstatt produktnavn: "Microsoft Foundry" → "Microsoft Foundry"  
4. Valider at alle interne dokumentasjonslenker fremdeles virker

---

### [v3.4.0] - 2025-10-24

#### Infrastrukturforhåndsvisning og valideringsforbedringer  
**Denne versjonen introduserer omfattende støtte for det nye forhåndsvisningsfunksjonen i Azure Developer CLI og forbedrer brukeropplevelsen i workshopen.**

#### Lagt til
- **🧪 azd provision --preview-funksjonsdokumentasjon**: Omfattende dekning av ny infrastrukturforhåndsvisningskapasitet
  - Kommandoreferanse og brukseksempler i jukselapp
  - Detaljert integrering i provisjoneringsveiledning med brukstilfeller og fordeler
  - Forhåndssjekk-integrasjon for sikrere distribusjonsvalidering
  - Oppdateringer i kom-i-gang-veiledningen med sikkerhetsfokusert distribusjonspraksis
- **🚧 Workshoppstatusbannere**: Profesjonelt HTML-banner som indikerer workshoputviklingsstatus
  - Gradientdesign med byggeindikatorer for klar brukerkommunikasjon
  - Siste oppdatert tidsstempel for åpenhet
  - Mobilresponsivt design for alle enhetstyper

#### Forbedret
- **Infrastruktursikkerhet**: Forhåndsvisningsfunksjonalitet integrert i hele distribusjonsdokumentasjonen
- **Validering før distribusjon**: Automatiserte skript inkluderer nå infrastrukturforhåndsvisningstesting
- **Utviklerarbeidsflyt**: Oppdaterte kommando-sekvenser for å inkludere forhåndsvisning som beste praksis
- **Workshop-opplevelse**: Klare forventninger satt hos brukere om innholdets utviklingsstatus

#### Endret
- **Distribusjonsbeste praksis**: Forhåndsvisning-først arbeidsflyt anbefales nå
- **Dokumentasjonsflyt**: Infrastrukturvalidering flyttet tidligere i læringsprosessen
- **Workshoppresentasjon**: Profesjonell statuskommunikasjon med klar utviklingstidslinje

#### Forbedret
- **Sikkerhetsfokus**: Infrastrukturendringer kan nå valideres før distribusjon
- **Samarbeid i team**: Forhåndsvisningsresultater kan deles for gjennomgang og godkjenning
- **Kostnadsbevissthet**: Bedre forståelse av ressurskostnader før provisjonering
- **Risikoreduksjon**: Reduserte distribusjonsfeil gjennom forhåndsvalidering

#### Teknisk implementering
- **Muldokumentintegrasjon**: Forhåndsvisningsfunksjonen dokumentert i 4 nøkkelfiler
- **Kommandomønstre**: Konsistent syntaks og eksempler gjennom dokumentasjonen
- **Beste praksisintegrering**: Forhåndsvisning inkludert i valideringsarbeidsflyter og skript
- **Visuelle indikatorer**: Klare NYE funksjonsmarkeringer for synlighet

#### Workshop-infrastruktur
- **Statuskommunikasjon**: Profesjonelt HTML-banner med gradientstil
- **Brukeropplevelse**: Klar utviklingsstatus forhindrer forvirring
- **Profesjonell presentasjon**: Opprettholder repositoriumets troverdighet samtidig som forventninger settes
- **Tidslinje-åpenhet**: Oktober 2025 siste oppdatert tidsstempel for ansvarlighet

### [v3.3.0] - 2025-09-24

#### Forbedret workshopmateriell og interaktiv læringsopplevelse  
**Denne versjonen introduserer omfattende workshopmateriell med nettleserbaserte interaktive guider og strukturerte læringsveier.**

#### Lagt til
- **🎥 Interaktiv workshopguide**: Nettleserbasert workshopopplevelse med MkDocs-forhåndsvisning
- **📝 Strukturert workshopinstruksjoner**: 7-trinns veiledet læringsløype fra oppdagelse til tilpasning
  - 0-Introduksjon: Workshopoversikt og oppsett
  - 1-Velg-AI-Mal: Maloppdagelse og valgprosess
  - 2-Valider-AI-Mal: Distribusjon og valideringsprosedyrer
  - 3-Dekonstruer-AI-Mal: Forståelse av malarkitektur
  - 4-Konfigurer-AI-Mal: Konfigurasjon og tilpasning
  - 5-Tilpass-AI-Mal: Avanserte modifikasjoner og iterasjoner
  - 6-Riv-Ned-Infrastruktur: Rydding og ressursadministrasjon
  - 7-Avslutning: Oppsummering og neste steg
- **🛠️ Workshopverktøy**: MkDocs-konfigurasjon med Material-tema for forbedret læringsopplevelse
- **🎯 Praktisk læringsløype**: 3-trinns metodikk (Oppdagelse → Distribusjon → Tilpasning)
- **📱 GitHub Codespaces-integrasjon**: Sømløst utviklingsmiljøoppsett

#### Forbedret
- **AI Workshop Lab**: Utvidet med omfattende 2-3 timers strukturert læringsopplevelse
- **Workshopdokumentasjon**: Profesjonell presentasjon med navigasjon og visuelle hjelpemidler
- **Læringsprogresjon**: Klar trinnvis veiledning fra malvalg til produksjonsdistribusjon
- **Utvikleropplevelse**: Integrert verktøy for strømlinjeformede utviklingsarbeidsflyter

#### Forbedret
- **Tilgjengelighet**: Nettleserbasert grensesnitt med søk, kopieringsfunksjonalitet og temavelger
- **Selvstyrt læring**: Fleksibel workshopstruktur som imøtekommer ulike læringshastigheter
- **Praktisk anvendelse**: Virkelige AI-mal distribusjonsscenarier
- **Fellesskapsintegrasjon**: Discord-integrasjon for workshopstøtte og samarbeid

#### Workshopfunksjoner
- **Innebygd søk**: Rask nøkkelord- og leksjonsoppdagelse
- **Kopier kodeblokker**: Hover-for-kopiering for alle kodeeksempler
- **Temavelger**: Mørk/lys modus-støtte for ulike preferanser
- **Visuelle ressurser**: Skjermbilder og diagrammer for bedre forståelse
- **Hjelpeintegrasjon**: Direkte Discord-tilgang for fellesskapsstøtte

### [v3.2.0] - 2025-09-17

#### Viktig navigasjonsomstrukturering og kapittelbasert læringssystem  
**Denne versjonen introduserer en omfattende kapittelbasert læringsstruktur med forbedret navigasjon gjennom hele repositoriet.**

#### Lagt til
- **📚 Kapittelbasert læringssystem**: Omstrukturert hele kurset i 8 progressive læringskapitler
  - Kapittel 1: Grunnlag & Rask start (⭐ - 30-45 min)
  - Kapittel 2: AI-først utvikling (⭐⭐ - 1-2 timer)
  - Kapittel 3: Konfigurasjon & autentisering (⭐⭐ - 45-60 min)
  - Kapittel 4: Infrastruktur som kode & distribusjon (⭐⭐⭐ - 1-1,5 timer)
  - Kapittel 5: Multi-agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapittel 6: Forhåndsvalidering & planlegging (⭐⭐ - 1 time)
  - Kapittel 7: Feilsøking & debugging (⭐⭐ - 1-1,5 timer)
  - Kapittel 8: Produksjons- & bedriftsmønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigasjonssystem**: Konsistente navigasjonshoder og -føtter i all dokumentasjon
- **🎯 Fremdriftssporing**: Kursfullføringsjekkliste og læringsverifiseringssystem
- **🗺️ Veiledning i læringsvei**: Klare inngangspunkter tilpasset ulike erfaringsnivåer og mål
- **🔗 Kryssreferanse-navigasjon**: Relaterte kapitler og forutsetninger tydelig lenket

#### Forbedret
- **README-struktur**: Omformet til en strukturert læringsplattform med kapittelbasert organisering
- **Dokumentasjonsnavigering**: Hver side inkluderer nå kapittelkontekst og fremdriftveiledning
- **Malorganisering**: Eksempler og maler knyttet til relevante læringskapitler
- **Ressursintegrasjon**: Jukselapper, FAQ og studieveiledninger koblet til relevante kapitler
- **Workshop-integrasjon**: Praktiske laboratorier knyttet til flere læringsmål i kapitler

#### Endret
- **Læringsprogresjon**: Gikk fra lineær dokumentasjon til fleksibel kapittelbasert læring
- **Konfigurasjonsplassering**: Konfigurasjonsveiledning flyttet til kapittel 3 for bedre flyt
- **AI-innholdsintegrering**: Bedre integrering av AI-spesifikt innhold gjennom hele læringsløpet
- **Produksjonsinnhold**: Avanserte mønstre samlet i kapittel 8 for bedriftsbrukere

#### Forbedret
- **Brukeropplevelse**: Klare navigasjonsbrødsmuler og kapittelfremdriftsindikatorer
- **Tilgjengelighet**: Konsistente navigasjonsmønstre for enklere kursgjennomføring
- **Profesjonell presentasjon**: Universitetstilnærmet kursstruktur egnet for akademisk og bedriftsopplæring
- **Læringseffektivitet**: Redusert tid til å finne relevant innhold gjennom bedre organisering

#### Teknisk implementering
- **Navigasjonshoder**: Standardisert kapittelnavigasjon i over 40 dokumentasjonsfiler
- **Navigasjonsfot**: Konsistent veiledning om fremdrift og kapittel-fullføring
- **Krysslenking**: Omfattende intern lenkesystem som knytter sammen relaterte konsepter
- **Kapittelkartlegging**: Maler og eksempler tydelig knyttet til læringsmål

#### Forbedring av studieveiledning
- **📚 Omfattende læringsmål**: Omstrukturert studieveiledning for å samsvare med 8-kapittelsystem
- **🎯 Kapittelbasert vurdering**: Hvert kapittel inkluderer spesifikke læringsmål og praktiske øvelser
- **📋 Fremdriftssporing**: Ukentlig læringsplan med målbare resultater og fullføringsjekklister
- **❓ Vurderingsspørsmål**: Kunnskapsvalideringsspørsmål for hvert kapittel med profesjonelle resultater
- **🛠️ Praktiske øvelser**: Praktiske aktiviteter med virkelige distribusjonsscenarier og feilsøking
- **📊 Ferdighetsprogresjon**: Klar utvikling fra grunnleggende konsepter til bedriftsmønstre med karrierefokus
- **🎓 Sertifiseringsrammeverk**: Profesjonelle utviklingsresultater og fellesskapsgjenkjennelsessystem
- **⏱️ Tidslinjestyring**: Strukturert 10-ukers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedret multi-agent AI-løsninger  
**Denne versjonen forbedrer multi-agent detaljløsningen med bedre agentnavngivning og forbedret dokumentasjon.**

#### Endret
- **Multi-agent terminologi**: Erstatter "Cora agent" med "Kundeagent" gjennom hele retail multi-agent-løsningen for tydeligere forståelse
- **Agentarkitektur**: Oppdatert all dokumentasjon, ARM-maler og kodeeksempler til å bruke konsekvent "Kundeagent"-navngivning
- **Konfigurasjonseksempler**: Moderniserte agentkonfigurasjonsmønstre med oppdaterte navngivningskonvensjoner
- **Dokumentasjonskonsistens**: Sikret at alle referanser bruker profesjonelle, beskrivende agentnavn

#### Forbedret
- **ARM-malpakke**: Oppdatert retail-multiagent-arm-template med Customer-agentreferanser  
- **Arkitekturdiagrammer**: Oppfriskede Mermaid-diagrammer med oppdatert agentnavngiving  
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruker nå CustomerAgent-navngiving  
- **Miljøvariabler**: Oppdatert alle deployeringsskripter til å bruke CUSTOMER_AGENT_NAME-konvensjoner  

#### Forbedret
- **Utvikleropplevelse**: Klarere agentroller og ansvarsområder i dokumentasjonen  
- **Produksjonsberedskap**: Bedre tilpasning til bedriftsnavnekonvensjoner  
- **Læringsmateriell**: Mer intuitiv agentnavngiving for pedagogiske formål  
- **Malens brukervennlighet**: Forenklet forståelse av agentfunksjoner og deployeringsmønstre  

#### Tekniske detaljer
- Oppdaterte Mermaid-arkitekturdiagrammer med CustomerAgent-referanser  
- Erstattet CoraAgent-klassenavn med CustomerAgent i Python-eksempler  
- Endret ARM-malens JSON-konfigurasjoner til å bruke agenttypen "customer"  
- Oppdaterte miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre  
- Fornyet alle deployeringskommandoer og containerkonfigurasjoner  

### [v3.0.0] - 2025-09-12

#### Store endringer – Fokus på AI-utviklere og Microsoft Foundry-integrasjon  
**Denne versjonen omdanner depotet til en omfattende AI-fokusert læringsressurs med Microsoft Foundry-integrasjon.**

#### Lagt til
- **🤖 AI-først læringsløype**: Fullstendig omstrukturering med prioritering av AI-utviklere og ingeniører  
- **Microsoft Foundry-integrasjonsveiledning**: Omfattende dokumentasjon for tilkobling av AZD med Microsoft Foundry-tjenester  
- **AI-modell deployeringsmønstre**: Detaljert veiledning om modellvalg, konfigurasjon og produksjonsdeployering  
- **AI Workshop Lab**: 2-3 timers praktisk workshop for konvertering av AI-applikasjoner til AZD-deployerbare løsninger  
- **Beste praksis for produksjons-AI**: Bedriftsklare mønstre for skalering, overvåking og sikring av AI-arbeidsmengder  
- **AI-spesifikk feilsøking**: Omfattende feilsøkingsveiledning for Microsoft Foundry-modeller, Cognitive Services og AI-deployeringsproblemer  
- **AI-malgaleri**: Utvalgt samling av Microsoft Foundry-maler med kompleksitetsvurdering  
- **Workshop-materiell**: Fullstendig workshopstruktur med praktiske laboratorier og referansemateriell  

#### Forbedret
- **README-struktur**: AI-utviklerfokusert med 45 % samfunnsinteresse-data fra Microsoft Foundry Discord  
- **Læringsløp**: Dedikert AI-utviklerreise ved siden av tradisjonelle løp for studenter og DevOps-ingeniører  
- **Mal-anbefalinger**: Fremhevede AI-maler inkludert azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart  
- **Samfunnsintegrasjon**: Forbedret Discord-fellesskap med AI-spesifikke kanaler og diskusjoner  

#### Sikkerhet og produksjonsfokus
- **Managed Identity-mønstre**: AI-spesifikk autentisering og sikkerhetskonfigurasjoner  
- **Kostnadsoptimalisering**: Sporing av tokenbruk og budsjettkontroller for AI-arbeidsmengder  
- **Multi-region deployering**: Strategier for global AI-applikasjonsdeployering  
- **Ytelsesmonitorering**: AI-spesifikke måledata og Application Insights-integrasjon  

#### Dokumentasjonskvalitet
- **Lineær kursstruktur**: Logisk progresjon fra nybegynner til avanserte AI-deployeringsmønstre  
- **Validerte URL-er**: Alle eksterne depotlenker bekreftet og tilgjengelige  
- **Fullstendig referanse**: Alle interne dokumentasjonslenker validert og funksjonelle  
- **Produksjonsklar**: Bedriftsdeployeringsmønstre med praktiske eksempler  

### [v2.0.0] - 2025-09-09

#### Store endringer – Depotomstrukturering og profesjonell forbedring  
**Denne versjonen representerer en betydelig revisjon av depotets struktur og innholdsoppsett.**

#### Lagt til
- **Strukturert læringsrammeverk**: Alle dokumentasjonssidene inkluderer nå Introduksjon, Læringsmål og Læringsutbytte  
- **Navigasjonssystem**: La til Forrige/Neste leksjonslenker i hele dokumentasjonen for veiledet læringsprogresjon  
- **Studieveiledning**: Omfattende studieguide.md med læringsobjektiver, øvelser og vurderingsmateriell  
- **Profesjonell presentasjon**: Fjernet alle emoji-ikoner for bedre tilgjengelighet og mer profesjonelt uttrykk  
- **Forbedret innholdsstruktur**: Bedre organisering og flyt i læringsmateriellet  

#### Endret
- **Dokumentasjonsformat**: Standardisert all dokumentasjon med et enhetlig læringsfokusert format  
- **Navigasjonsflyt**: Implementert logisk progresjon i alt læringsmateriell  
- **Innholdspresentasjon**: Fjernet dekorative elementer for klar og profesjonell formatering  
- **Lenkestruktur**: Oppdaterte alle interne lenker for å støtte det nye navigasjonssystemet  

#### Forbedret
- **Tilgjengelighet**: Fjernet emoji-avhengigheter for bedre skjermleserkompatibilitet  
- **Profesjonelt utseende**: Ren, akademisk stil egnet for bedriftslæring  
- **Læringsopplevelse**: Strukturert tilnærming med tydelige mål og utbytter for hver leksjon  
- **Innholdsorganisering**: Bedre logisk sammenheng og kobling mellom relaterte temaer  

### [v1.0.0] - 2025-09-09

#### Første utgivelse – Omfattende AZD-læringsdepot

#### Lagt til
- **Kjernedokumentasjonsstruktur**  
  - Komplett kom-i-gang-serie  
  - Omfattende dokumentasjon for deployering og provisjonering  
  - Detaljerte feilsøkingsressurser og debugging-guider  
  - Verktøy og prosedyrer for validering før deployering  

- **Kom-i-gang-modul**  
  - AZD-grunnprinsipper: Kjernebegreper og terminologi  
  - Installasjonsveiledning: Plattformspesifikke oppsettsinstruksjoner  
  - Konfigurasjonsveiledning: Miljøoppsett og autentisering  
  - Første prosjekt-veiledning: Trinnvis praktisk læring  

- **Deployering og provisjonering-modul**  
  - Deployering-veiledning: Komplett arbeidsflytdokumentasjon  
  - Provisjoneringsveiledning: Infrastruktur som kode med Bicep  
  - Beste praksis for produksjonsdeployeringer  
  - Mønstre for flertjenestearkitektur  

- **Validering før deployering-modul**  
  - Kapasitetsplanlegging: Validering av Azure-ressurstilgjengelighet  
  - SKU-valg: Omfattende veiledning om tjenestelagsvalg  
  - Forhåndssjekk: Automatiserte valideringsskript (PowerShell og Bash)  
  - Kostnadsestimering og budsjetteringsverktøy  

- **Feilsøkingsmodul**  
  - Vanlige problemer: Ofte forekommende feil og løsninger  
  - Debugging-veiledning: Systematiske feilsøkingsmetoder  
  - Avanserte diagnostiske teknikker og verktøy  
  - Overvåking og ytelsesoptimalisering  

- **Ressurser og referanser**  
  - Kommando-hurtigoversikt: Rask referanse for viktige kommandoer  
  - Ordliste: Omfattende terminologi- og forkortelsesforklaringer  
  - FAQ: Detaljerte svar på ofte stilte spørsmål  
  - Eksterne ressurser og fellesskapskoblinger  

- **Eksempler og maler**  
  - Enkel webapplikasjon-eksempel  
  - Statisk website-deployermal  
  - Containerapplikasjonskonfigurasjon  
  - Databaseintegrasjonsmønstre  
  - Microservices-arkitektur-eksempler  
  - Serverløs funksjonsimplementeringer  

#### Funksjoner
- **Multi-plattform støtte**: Installasjons- og konfigurasjonsveiledning for Windows, macOS og Linux  
- **Flere ferdighetsnivåer**: Innhold designet for studenter til profesjonelle utviklere  
- **Praktisk fokus**: Praktiske eksempler og virkelige scenarioer  
- **Omfattende dekning**: Fra grunnleggende konsepter til avanserte bedriftsmønstre  
- **Sikkerhetsorientert tilnærming**: Sikkerhetsbeste praksis integrert gjennom hele innholdet  
- **Kostnadsoptimalisering**: Veiledning for kostnadseffektive deployeringer og ressursstyring  

#### Dokumentasjonskvalitet
- **Detaljerte kodeeksempler**: Praktiske, testede kodeeksempler  
- **Trinnvise instruksjoner**: Klare, handlingsrettede veiledninger  
- **Omfattende feilbehandling**: Feilsøking for vanlige problemer  
- **Beste praksisintegrasjon**: Bransjestandarder og anbefalinger  
- **Versjonskompatibilitet**: Oppdatert med siste Azure-tjenester og azd-funksjoner  

## Planlagte fremtidige forbedringer

### Versjon 3.1.0 (Planlagt)  
#### Utvidelse av AI-plattform  
- **Multi-modell støtte**: Integrasjonsmønstre for Hugging Face, Azure Machine Learning og egendefinerte modeller  
- **AI Agent-rammeverk**: Maler for LangChain, Semantic Kernel og AutoGen-deployeringer  
- **Avanserte RAG-mønstre**: Vektorbaserte databasealternativer utover Azure AI Search (Pinecone, Weaviate osv.)  
- **AI Observerbarhet**: Forbedret overvåking av modellprestasjon, tokenbruk og responskvalitet  

#### Utvikleropplevelse  
- **VS Code-utvidelse**: Integrert AZD + Microsoft Foundry utviklingsopplevelse  
- **GitHub Copilot-integrasjon**: AI-assistert generering av AZD-maler  
- **Interaktive veiledninger**: Praktiske kodeøvelser med automatisk validering for AI-scenarier  
- **Videoinnhold**: Supplerende videotutorialer for visuelle lærere med fokus på AI-deployeringer  

### Versjon 4.0.0 (Planlagt)  
#### Bedrifts-AI-mønstre  
- **Styringsrammeverk**: AI-modellstyring, samsvar og revisjonsspor  
- **Multi-leietaker AI**: Mønstre for å serve flere kunder med isolerte AI-tjenester  
- **Edge AI-deployering**: Integrasjon med Azure IoT Edge og container-instansenheter  
- **Hybrid Cloud AI**: Multi-cloud og hybrid deployeringsmønstre for AI-arbeidsmengder  

#### Avanserte funksjoner  
- **AI-pipeline-automatisering**: MLOps-integrasjon med Azure Machine Learning-pipelines  
- **Avansert sikkerhet**: Zero-trust-mønstre, private endepunkter og avansert trusselbeskyttelse  
- **Ytelsesoptimalisering**: Avansert tuning og skalering for AI-applikasjoner med høy gjennomstrømning  
- **Global distribusjon**: Innholdslevering og edge caching-mønstre for AI-applikasjoner  

### Versjon 3.0.0 (Planlagt) – Overtatt av nåværende utgivelse  
#### Foreslåtte tillegg – Nå implementert i v3.0.0  
- ✅ **AI-fokusert innhold**: Omfattende Microsoft Foundry-integrasjon (Fullført)  
- ✅ **Interaktive veiledninger**: Praktisk AI-workshop lab (Fullført)  
- ✅ **Avansert sikkerhetsmodul**: AI-spesifikke sikkerhetsmønstre (Fullført)  
- ✅ **Ytelsesoptimalisering**: AI-arbeidsmengdetuning (Fullført)  

### Versjon 2.1.0 (Planlagt) – Delvis implementert i v3.0.0  
#### Mindre forbedringer – Noen fullført i nåværende utgivelse  
- ✅ **Ekstra eksempler**: AI-fokuserte deployeringsscenarioer (Fullført)  
- ✅ **Utvidet FAQ**: AI-spesifikke spørsmål og feilsøking (Fullført)  
- **Verktøy-integrasjon**: Forbedrede IDE- og editorintegrasjonsveiledninger  
- ✅ **Utvidet overvåking**: AI-spesifikke overvåkings- og varslingsmønstre (Fullført)  

#### Fortsatt planlagt for fremtidige utgivelser  
- **Mobilvennlig dokumentasjon**: Responsivt design for mobil læring  
- **Offline-tilgang**: Nedlastbare dokumentasjonspakker  
- **Forbedret IDE-integrasjon**: VS Code-utvidelse for AZD + AI-arbeidsflyter  
- **Fellesskaps-dashboard**: Sanntids fellesskapsstatistikk og bidragsrapportering  

## Bidra til endringsloggen

### Rapportering av endringer  
Ved bidrag til dette depotet, vennligst sørg for at endringsloggoppføringer inkluderer:  

1. **Versjonsnummer**: Følger semantisk versjonering (major.minor.patch)  
2. **Dato**: Utgivelses- eller oppdateringsdato i formatet YYYY-MM-DD  
3. **Kategori**: Lagt til, Endret, Utgått, Fjernet, Fikset, Sikkerhet  
4. **Klar beskrivelse**: Kortfattet beskrivelse av hva som endret seg  
5. **Påvirkningsvurdering**: Hvordan endringene påvirker eksisterende brukere  

### Endringskategorier

#### Lagt til  
- Nye funksjoner, dokumentasjonsseksjoner eller kapabiliteter  
- Nye eksempler, maler eller læringsressurser  
- Ytterligere verktøy, skript eller hjelpeprogrammer  

#### Endret  
- Modifikasjoner i eksisterende funksjonalitet eller dokumentasjon  
- Oppdateringer for å forbedre klarhet eller nøyaktighet  
- Omstrukturering av innhold eller organisering  

#### Utgått  
- Funksjoner eller tilnærminger som fases ut  
- Dokumentasjonsseksjoner planlagt fjernet  
- Metoder med bedre alternativer  

#### Fjernet  
- Funksjoner, dokumentasjon eller eksempler som ikke lenger er relevante  
- Utdatert informasjon eller utgåtte tilnærminger  
- Overflødig eller konsolidert innhold  

#### Fikset  
- Rettelser av feil i dokumentasjon eller kode  
- Løsning av rapporterte problemer  
- Forbedringer av nøyaktighet eller funksjonalitet  

#### Sikkerhet  
- Sikkerhetsrelaterte forbedringer eller feilrettinger  
- Oppdateringer til beste sikkerhetspraksis  
- Løsning av sikkerhetssårbarheter  

### Semantiske versjoneringsretningslinjer

#### Hovedversjon (X.0.0)  
- Brytende endringer som krever tiltak fra brukeren  
- Betydelig omstrukturering av innhold eller organisering  
- Endringer som endrer grunnleggende tilnærming eller metodikk  

#### Mindre versjon (X.Y.0)  
- Nye funksjoner eller innholdsutvidelser  
- Forbedringer med bakoverkompatibilitet  
- Ytterligere eksempler, verktøy eller ressurser  

#### Oppdatering (X.Y.Z)  
- Feilrettinger og korreksjoner  
- Mindre forbedringer i eksisterende innhold  
- Presiseringer og små forbedringer  

## Fellesskapsinnspill og forslag

Vi oppfordrer aktivt til tilbakemeldinger for å forbedre denne læringsressursen:  

### Hvordan gi tilbakemelding  
- **GitHub Issues**: Rapporter problemer eller foreslå forbedringer (AI-spesifikke problemer er velkomne)  
- **Discord-diskusjoner**: Del ideer og delta i Microsoft Foundry-fellesskapet  
- **Pull Requests**: Bidra med direkte forbedringer i innhold, spesielt AI-maler og guider  
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen for AZD + AI-diskusjoner  
- **Fellesskapsfora**: Vær med i bredere Azure-utviklerdiskusjoner  

### Tilbakemeldingskategorier  
- **AI-innholdsakkurathet**: Korreksjoner til AI-tjenesteintegrasjon og deployering  
- **Læringsopplevelse**: Forslag for forbedret AI-utviklerflyt  
- **Manglende AI-innhold**: Forespørsler om flere AI-maler, mønstre eller eksempler  
- **Tilgjengelighet**: Forbedringer for varierte læringsbehov  
- **AI-verktøyintegrasjon**: Forslag for bedre AI-utviklingsflytintegrasjon  
- **Produksjons-AI-mønstre**: Forespørsler om bedrifts-AI deployeringsmønstre  

### Forpliktelse til respons  
- **Svar på issues**: Innen 48 timer for rapporterte problemer  
- **Funksjonsforespørsler**: Evaluering innen én uke  
- **Fellesskapsbidrag**: Gjennomgang innen én uke  
- **Sikkerhetsproblemer**: Umiddelbar prioritet med rask respons  

## Vedlikeholdsplan

### Regelmessige oppdateringer  
- **Månedlige gjennomganger**: Innholdsnøyaktighet og lenkevalidering  
- **Kvartalsvise oppdateringer**: Store innholdsutvidelser og forbedringer  
- **Halvårlige gjennomganger**: Omfattende omstrukturering og forbedring  
- **Årlige utgivelser**: Store versjonsoppdateringer med betydelige forbedringer  

### Overvåking og kvalitetssikring  
- **Automatisert testing**: Regelmessig validering av kodeeksempler og lenker  
- **Integrering av tilbakemeldinger**: Regelmessig innarbeiding av brukersuggesjoner  
- **Teknologiske oppdateringer**: Tilpasning til siste Azure-tjenester og azd-utgivelser  
- **Tilgjengelighetsrevisjoner**: Regelmessig gjennomgang for inkluderende designprinsipper  

## Versjonsstøttepolicy

### Støtte for nåværende versjon
- **Siste store versjon**: Full støtte med regelmessige oppdateringer
- **Forrige store versjon**: Sikkerhetsoppdateringer og kritiske feilrettinger i 12 måneder
- **Eldre versjoner**: Kun fellesskapsstøtte, ingen offisielle oppdateringer

### Migrasjonsveiledning
Når store versjoner slippes, tilbyr vi:
- **Migrasjonsguider**: Trinnvise overgangsinstruksjoner
- **Kompatibilitetsnotater**: Detaljer om endringer som bryter kompatibilitet
- **Verktøystøtte**: Skript eller verktøy som hjelper med migrasjon
- **Fellesskapsstøtte**: Dedikerte forum for migrasjonsspørsmål

---

**Navigasjon**
- **Forrige leksjon**: [Study Guide](resources/study-guide.md)
- **Neste leksjon**: Gå tilbake til [Main README](README.md)

**Hold deg oppdatert**: Følg dette depotet for varsler om nye utgivelser og viktige oppdateringer til læringsmateriellet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->