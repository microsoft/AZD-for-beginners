# Endringslogg - AZD For Nybegynnere

## Introduksjon

Denne endringsloggen dokumenterer alle betydelige endringer, oppdateringer og forbedringer i AZD For Nybegynnere-repositoriet. Vi følger prinsippene for semantisk versjonering og opprettholder denne loggen for å hjelpe brukere å forstå hva som har endret seg mellom versjoner.

## Læringsmål

Ved å gå gjennom denne endringsloggen vil du:
- Holde deg informert om nye funksjoner og innholdsoppdateringer
- Forstå forbedringer i eksisterende dokumentasjon
- Følge feilrettinger og korrigeringer for å sikre nøyaktighet
- Følge utviklingen av lærematerialet over tid

## Læringsutbytte

Etter å ha gått gjennom endringsloggoppføringene, vil du kunne:
- Identifisere nytt innhold og tilgjengelige læringsressurser
- Forstå hvilke seksjoner som er oppdatert eller forbedret
- Planlegge din læringsvei basert på det mest oppdaterte materialet
- Bidra med tilbakemeldinger og forslag til fremtidige forbedringer

## Versjonshistorikk

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Kommandoer, Innholdsvalidering & Malutvidelse
**Denne versjonen legger til kommandoer `azd ai`, `azd extension` og `azd mcp` over alle AI-relaterte kapitler, fikser ødelagte lenker og utdatert kode i agents.md, oppdaterer jukselappen, og gir en omfattende oppdatering av Eksempelmaler-seksjonen med validerte beskrivelser og nye Azure AI AZD-maler.**

#### Lagt til
- **🤖 AZD AI CLI dekning** i 7 filer (tidligere kun i kapittel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny seksjon "Extensions and AI Commands" som introduserer `azd extension`, `azd ai agent init` og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Alternativ 4: `azd ai agent init` med sammenligningstabell (mal vs manifest-tilnærming)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Undersseksjoner "AZD Extensions for Foundry" og "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Hurtigstart viser nå både mal- og manifest-baserte distribusjonsveier
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Distribusjonsseksjonen inkluderer nå `azd ai agent init` som alternativ
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Undersseksjon "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Ny seksjon "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp` og `azd infra generate`
- **📦 Nye AZD AI eksempelmaler** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat med Blazor WebAssembly, Semantic Kernel, og stemmechat-støtte
  - **azure-search-openai-demo-java** — Java RAG chat med Langchain4J med ACA/AKS distribusjonsvalg
  - **contoso-creative-writer** — Multi-agent kreativ skriveapp med Azure AI Agent Service, Bing Grounding og Prompty
  - **serverless-chat-langchainjs** — Serverløs RAG med Azure Functions + LangChain.js + Cosmos DB og lokal Ollama-utviklingsstøtte
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG akselerator med adminportal, Teams-integrasjon og PostgreSQL/Cosmos DB-alternativer
  - **azure-ai-travel-agents** — Multi-agent MCP orkestreringsreferanseapp med servere i .NET, Python, Java og TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastruktur Bicep startmal
  - **🔗 Fantastisk AZD AI-galleri-lenke** — Referanse til [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ maler)

#### Fikset
- **🔗 agents.md navigasjon**: Forrige/Neste-lenker samsvarer nå med kapittel 2 README leksjonsrekkefølge (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ødelagte lenker**: `production-ai-practices.md` rettet til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md utdatert kode**: Erstattet `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttet `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md token-telling**: Erstattet grovt estimat `len//4` med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rettet tjenester fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standardvert endret oktober 2024)
- **contoso-chat**: Oppdatert beskrivelse for å referere Azure AI Foundry + Prompty, samsvarende med repoets faktiske tittel og teknologistakk

#### Fjernet
- **ai-document-processing**: Fjernet referanse til mal som ikke fungerer (repo ikke offentlig tilgjengelig som AZD-mal)

#### Forbedret
- **📝 agents.md oppgaver**: Oppgave 1 viser nå forventet output og `azd monitor`-steg; Oppgave 2 inkluderer full `FunctionTool`-registreringskode; Oppgave 3 erstatter vag veiledning med konkrete `prepdocs.py`-kommandoer
- **📚 agents.md ressurser**: Oppdaterte dokumentasjonslenker til gjeldende Azure AI Agent Service-dokumentasjon og hurtigstart
- **📋 agents.md Neste Steg tabell**: Lagt til AI Workshop Lab-lenke for komplett kapitteldekning

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
- **Kurskart-tabell**: Forbedret med direkte leksjonslenker, tidsestimat og kompleksitetsvurdering
- **Rydding i mapper**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Lenkevalidering**: Alle 21+ interne lenker i kurskarttabellen verifisert

### [v3.16.0] - 2026-02-05

#### Oppdateringer av produktnavn
**Denne versjonen oppdaterer produktreferanser til gjeldende Microsoft merkevare.**

#### Endret
- **Microsoft Foundry → Microsoft Foundry**: Alle referanser oppdatert i ikke-oversettelsesfiler
- **Azure AI Agent Service → Foundry Agents**: Tjenestenavn oppdatert for å reflektere gjeldende merkevare

#### Oppdaterte filer
- `README.md` - Hovedkursforside
- `changelog.md` - Versjonshistorikk
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - AI-agenter veiledning
- `examples/README.md` - Eksempeldokumentasjon
- `workshop/README.md` - Workshop forside
- `workshop/docs/index.md` - Workshop indeks
- `workshop/docs/instructions/*.md` - Alle workshop instruksjonsfiler

---

### [v3.15.0] - 2026-02-05

#### Stor repositorieomstrukturering: Kapittelbaserte mappe-navn
**Denne versjonen omstrukturerer dokumentasjonen i dedikerte kapittelmappper for bedre navigasjon.**

#### Mappenavn endringer
Gamle mapper er erstattet med kapittelnummerrerte mapper:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ny: `docs/chapter-05-multi-agent/`

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
| Alle pre-deployment filer | pre-deployment/ | chapter-06-pre-deployment/ |
| Alle troubleshooting filer | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lagt til
- **📚 Kapittel README-filer**: Opprettet README.md i hver kapittelmapppe med:
  - Læringsmål og varighet
  - Leksjonstabell med beskrivelser
  - Hurtigstartkommandoer
  - Navigasjon til andre kapitler

#### Endret
- **🔗 Oppdaterte alle interne lenker**: 78+ stier oppdatert i all dokumentasjon
- **🗺️ Hoved README.md**: Oppdatert kurskart med ny kapittelstruktur
- **📝 examples/README.md**: Oppdaterte kryssreferanser til kapittelmappene

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repositorieomstrukturering: Kapittelnavigasjon
**Denne versjonen la til kapittel-navigasjons README-filer (erstattet av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny AI Agent-veiledning
**Denne versjonen legger til en omfattende veiledning for distribusjon av AI-agenter med Azure Developer CLI.**

#### Lagt til
- **🤖 docs/microsoft-foundry/agents.md**: Komplett veiledning som dekker:
  - Hva AI-agenter er og hvordan de skiller seg fra chatboter
  - Tre hurtigstart-malene for agenter (Foundry Agents, Prompty, RAG)
  - Agentarkitektur-mønstre (enkel agent, RAG, multi-agent)
  - Verktøykonfigurasjon og tilpasning
  - Overvåking og metrikksporing
  - Kostnadsbetraktninger og optimalisering
  - Vanlige feilsøkingsscenarier
  - Tre praktiske øvelser med suksesskriterier

#### Innholdsstruktur
- **Introduksjon**: Agentkonsepter for nybegynnere
- **Hurtigstart**: Distribuer agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmønstre**: Visuelle diagrammer av agentmønstre
- **Konfigurasjon**: Verktøyoppsett og miljøvariabler
- **Overvåking**: Application Insights-integrasjon
- **Øvelser**: Progressiv praktisk læring (20–45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-miljø Oppdatering
**Denne versjonen oppdaterer utviklingscontainer-konfigurasjonen med moderne verktøy og bedre standarder for AZD læringsopplevelse.**

#### Endret
- **🐳 Basisbilde**: Oppdatert fra `python:3.12-bullseye` til `python:3.12-bookworm` (nyeste Debian stabil)
- **📛 Container-navn**: Omdøpt fra "Python 3" til "AZD for Beginners" for klarhet

#### Lagt til
- **🔧 Nye Dev Container-funksjoner**:
  - `azure-cli` med Bicep-støtte aktivert
  - `node:20` (LTS-versjon for AZD-maler)
  - `github-cli` for maladministrasjon
  - `docker-in-docker` for container-app distribusjoner

- **🔌 Portvideresending**: Forhåndskonfigurerte porter for vanlig utvikling:
  - 8000 (MkDocs forhåndsvisning)
  - 3000 (Webapper)
  - 5000 (Python Flask)
  - 8080 (API-er)

- **🧩 Nye VS Code-utvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-støtte
  - `ms-azuretools.vscode-docker` - Docker-støtte
  - `ms-azuretools.vscode-bicep` - Bicep språkstøtte
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursadministrasjon
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid-diagramstøtte
  - `redhat.vscode-yaml` - YAML-støtte (for azure.yaml)
  - `eamodio.gitlens` - Git visualisering
  - `mhutchie.git-graph` - Git-historikk

- **⚙️ VS Code-innstillinger**: Lagt til standardinnstillinger for Python-tolk, formatering ved lagring, og trimming av mellomrom

- **📦 Oppdatert requirements-dev.txt**:
  - Lagt til MkDocs minify-plugin
  - Lagt til pre-commit for kodekvalitet
  - Lagt til Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Fikset
- **Post-Create Command**: Verifiserer nå AZD og Azure CLI-installasjon ved container-start

---

### [v3.11.0] - 2026-02-05

#### Nybegynnervennlig README-oppdatering
**Denne versjonen forbedrer README.md betydelig for å være mer tilgjengelig for nybegynnere og legger til viktige ressurser for AI-utviklere.**

#### Lagt til
- **🆚 Azure CLI vs AZD Sammenligning**: Klar forklaring på når man skal bruke hvert verktøy med praktiske eksempler
- **🌟 Fantastiske AZD-lenker**: Direkte lenker til samfunnets malgalleri og ressurser for bidrag:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ klare til distribusjon-maler
  - [Send inn en mal](https://github.com/Azure/awesome-azd/issues) - Fellesskapsbidrag
- **🎯 Rask start-guide**: Forenklet 3-trinns oppstartseksjon (Installer → Logg inn → Distribuer)
- **📊 Erfaringsbasert navigasjonstabell**: Klar veiledning om hvor man skal starte basert på utviklererfaring

#### Endret
- **README-struktur**: Omorganisert for progressiv visning – nøkkelinformasjon først
- **Introduksjonsseksjon**: Omskrevet for å forklare "Magien bak `azd up`" for helt nybegynnere
- **Fjernet duplikatinnhold**: Eliminert duplikat feilsøkingsseksjon
- **Feilsøkingskommandoer**: Rettet `azd logs`-referanse til å bruke gyldig `azd monitor --logs`

#### Fikset
- **🔐 Autentiseringskommandoer**: Lagt til `azd auth login` og `azd auth logout` i cheat-sheet.md
- **Ugyldige kommando-referanser**: Fjernet resterende `azd logs` fra README feilsøkingsseksjon

#### Notater
- **Omfang**: Endringer brukt på hoved-README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer spesielt rettet mot utviklere nye i AZD

---

### [v3.10.0] - 2026-02-05

#### Oppdatering av kommando-nøyaktighet for Azure Developer CLI
**Denne versjonen korrigerer ikke-eksisterende AZD-kommandoer i dokumentasjonen, og sikrer at alle kodeeksempler bruker gyldig Azure Developer CLI-syntaks.**

#### Fikset
- **🔧 Ikke-eksisterende AZD-kommandoer fjernet**: Omfattende revisjon og korrigering av ugyldige kommandoer:
  - `azd logs` (finnes ikke) → erstattet med `azd monitor --logs` eller Azure CLI-alternativer
  - `azd service` underkommandoer (finnes ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (finnes ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flagg (finnes ikke) → fjernet
  - `azd provision --what-if/--rollback` flagg (finnes ikke) → oppdatert til å bruke `--preview`
  - `azd config validate` (finnes ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (finnes ikke) → fjernet

- **📚 Filer oppdatert med kommando-korreksjoner**:
  - `resources/cheat-sheet.md`: Stor revisjon av kommandoreferanse
  - `docs/deployment/deployment-guide.md`: Rettet rollback og distribusjonsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigerte logganalyse-seksjoner
  - `docs/troubleshooting/common-issues.md`: Oppdaterte feilsøkingskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Rettet AZD feilsøkingsseksjon
  - `docs/getting-started/azd-basics.md`: Korrigerte overvåkingskommandoer
  - `docs/getting-started/first-project.md`: Oppdaterte overvåkings- og feilsøkseksempler
  - `docs/getting-started/installation.md`: Holde hjelpe- og versjonseksempler
  - `docs/pre-deployment/application-insights.md`: Korrigerte loggvisningskommandoer
  - `docs/pre-deployment/coordination-patterns.md`: Rettet agent-feilsøkingskommandoer

- **📝 Versjonsreferanse oppdatert**:
  - `docs/getting-started/installation.md`: Endret hardkodet `1.5.0` versjon til generisk `1.x.x` med link til utgivelser

#### Endret
- **Rollback-strategier**: Dokumentasjon oppdatert til å bruke Git-basert rollback (AZD har ikke innebygd rollback)
- **Loggvisning**: Erstattet `azd logs`-referanser med `azd monitor --logs`, `azd monitor --live`, og Azure CLI-kommandoer
- **Ytelseseksjon**: Fjernet ikke-eksisterende parallell/incrementell distribusjon flagg, gitt gyldige alternativer

#### Tekniske detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor flagg**: `--live`, `--logs`, `--overview`
- **Fjernet funksjoner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notater
- **Verifisering**: Kommandoer validert mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Fullføring av workshop og dokumentasjonskvalitetsoppdatering
**Denne versjonen fullfører de interaktive workshop-modulene, fjerner ødelagte dokumentasjonslenker, og forbedrer det totale innholdet for AI-utviklere som bruker Microsoft AZD.**

#### Lagt til
- **📝 CONTRIBUTING.md**: Nytt dokument for bidragsretningslinjer med:
  - Klare instruksjoner for rapportering av problemer og forslag til endringer
  - Dokumentasjonsstandarder for nytt innhold
  - Retningslinjer for kodeeksempler og commit-meldinger
  - Informasjon om samfunnsengasjement

#### Fullført
- **🎯 Workshop Modul 7 (Avslutning)**: Fullt gjennomført avslutningsmodul med:
  - Omfattende oppsummering av workshop-resultater
  - Nøkkelkonsepter dekket, inkludert AZD, maler og Microsoft Foundry
  - Anbefalinger for videre læring
  - Workshop utfordringer med vanskelighetsgrader
  - Fellesskapsfeedback og støtte-lenker

- **📚 Workshop Modul 3 (Nedbryting)**: Oppdaterte læringsmål med:
  - Aktivering av GitHub Copilot med MCP-servere
  - Forståelse av AZD-malmappe-struktur
  - Infrastruktur-som-kode (Bicep) organisasjonsmønstre
  - Praktiske labinstruksjoner

- **🔧 Workshop Modul 6 (Nedrigging)**: Fullført med:
  - Ressursrydding og kostnadsstyringsmål
  - Bruk av `azd down` for sikker nedrigging av infrastruktur
  - Veiledning for gjenoppretting av myk-sletter tjenestekognitive tjenester
  - Bonusutforskningsoppgaver for GitHub Copilot og Azure-portalen

#### Fikset
- **🔗 Ødelagte lenker fikset**: Løste 15+ ødelagte interne dokumentasjonslenker:
  - `docs/ai-foundry/ai-model-deployment.md`: Rettet stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerte stier til ai-model-deployment.md og production-ai-practices.md
  - `docs/getting-started/first-project.md`: Erstattet ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Rettet FAQ og feilsøkingsguide-stier
  - `examples/container-app/microservices/README.md`: Korrigerte kursforside- og distribusjonsguide-stier
  - `resources/faq.md` og `resources/glossary.md`: Oppdaterte referanser til AI-kapitler
  - `course-outline.md`: Rettet instruktørguide og AI-workshop lab-referanser

- **📅 Workshop-statusbanner**: Oppdatert fra "Under Construction" til aktiv workshop-status med februar 2026-dato

- **🔗 Workshop-navigasjon**: Rettet ødelagte navigasjonslenker i workshop README.md som pekte til ikke-eksisterende lab-1-azd-basics-mappe

#### Endret
- **Workshop presentasjon**: Fjernet "under construction"-advarsel, workshop er nå komplett og klar til bruk
- **Navigasjonskonsistens**: Sikret at alle workshop-moduler har riktig inter-modul navigasjon
- **Læringsstier**: Oppdaterte kapittelkrossreferanser til å bruke korrekte microsoft-foundry-stier

#### Validert
- ✅ Alle engelskspråklige markdown-filer har gyldige interne lenker
- ✅ Workshop-moduler 0-7 er komplette med læringsmål
- ✅ Navigasjon mellom kapitler og moduler fungerer korrekt
- ✅ Innholdet er tilpasset AI-utviklere som bruker Microsoft AZD
- ✅ Nybegynnervennlig språk og struktur opprettholdt gjennomgående
- ✅ CONTRIBUTING.md gir klare retningslinjer for samfunnsbidragsytere

#### Teknisk implementering
- **Lenkevalidering**: Automatisert PowerShell-skript validerte alle .md interne lenker
- **Innholdsrevisjon**: Manuell gjennomgang av workshop-fullstendighet og nybegynnertilpasning
- **Navigasjonssystem**: Konsistente kapitler og modulnavigasjonsmønstre anvendt

#### Notater
- **Omfang**: Endringer brukt kun på engelsk dokumentasjon
- **Oversettelser**: Oversettelsesmapper ikke oppdatert i denne versjonen (automatisk oversettelse vil synkronisere senere)
- **Workshop-varighet**: Komplett workshop gir nå 3-4 timer praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avansert dokumentasjon: Overvåking, sikkerhet og multi-agent mønstre
**Denne versjonen legger til omfattende A-grad læringsøkter om integrering med Application Insights, autentiseringsmønstre og multi-agent koordinasjon for produksjonsdistribusjoner.**

#### Lagt til
- **📊 Application Insights Integrasjonsleksjon**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokusert distribusjon med automatisk provisjonering
  - Fullstendige Bicep-maler for Application Insights + Log Analytics
  - Fungerende Python-applikasjoner med tilpasset telemetri (1 200+ linjer)
  - AI/LLM overvåkingsmønstre (Microsoft Foundry-modeller med token- og kostnadssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribuert sporing, telemetristrøm)
  - 3 praktiske øvelser (alarmer, dashbord, AI-overvåking)
  - Kusto-spørringseksempler og kostnadsoptimaliseringsstrategier
  - Strømming av live-metrikker og sanntids feilsøking
  - 40-50 minutters læringstid med produksjonsklare mønstre

- **🔐 Autentiserings- og sikkerhetsmønstre leksjon**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmønstre (tilkoblingsstrenger, Key Vault, administrert identitet)
  - Fullstendige Bicep infrastrukturmaler for sikre distribusjoner
  - Node.js applikasjonskode med Azure SDK-integrasjon
  - 3 komplette øvelser (aktivering av administrert identitet, bruker-tilordnet identitet, nøkkelrotasjon i Key Vault)
  - Beste praksis for sikkerhet og RBAC-konfigurasjoner
  - Feilsøkingsguide og kostnadsanalyse
  - Produksjonsklare passordfrie autentiseringsmønstre

- **🤖 Multi-Agent koordinasjonsmønstre leksjon**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinasjonsmønstre (sekvensiell, parallell, hierarkisk, hendelsesdrevet, konsensus)
  - Fullstendig orkestratorserviceløsning (Python/Flask, 1 500+ linjer)
  - 3 spesialiserte agentimplementasjoner (Forskning, Skribent, Redaktør)
  - Service Bus-integrasjon for meldingkø
  - Cosmos DB tilstandshåndtering for distribuerte systemer
  - 6 Mermaid-diagrammer som viser agentinteraksjoner
  - 3 avanserte øvelser (timeout-håndtering, retry-logikk, circuit breaker)
  - Kostnadsoversikt ($240-565/måned) med optimaliseringsstrategier
  - Application Insights integrasjon for overvåking

#### Forbedret
- **Pre-deployment Kapittel**: Inkluderer nå omfattende overvåking og koordinasjonsmønstre
- **Getting Started Kapittel**: Forbedret med profesjonelle autentiseringsmønstre
- **Produksjonsklarhet**: Full dekning fra sikkerhet til observabilitet
- **Kursoversikt**: Oppdatert til å referere nye leksjoner i kapitler 3 og 6

#### Endret
- **Læringsprogresjon**: Bedre integrasjon av sikkerhet og overvåking gjennom kurset
- **Dokumentasjonskvalitet**: Konsistente A-grad standarder (95-97%) på nye leksjoner
- **Produksjonsmønstre**: Fullstendig ende-til-ende dekning for bedriftsdistribusjoner

#### Forbedret
- **Utvikleropplevelse**: Klar vei fra utvikling til produksjonsovervåking  
- **Sikkerhetsstandarder**: Profesjonelle mønstre for autentisering og hemmelighetshåndtering  
- **Observerbarhet**: Komplett Application Insights-integrasjon med AZD  
- **AI-Arbeidsbelastninger**: Spesialisert overvåking for Microsoft Foundry-modeller og fleragentssystemer  

#### Validert  
- ✅ Alle leksjoner inkluderer komplett fungerende kode (ikke utdrag)  
- ✅ Mermaid-diagrammer for visuell læring (totalt 19 på 3 leksjoner)  
- ✅ Praktiske øvelser med verifikasjonstrinn (totalt 9)  
- ✅ Produksjonsklare Bicep-maler deployerbare via `azd up`  
- ✅ Kostnadsanalyse og optimaliseringsstrategier  
- ✅ Feilsøkingsguider og beste praksiser  
- ✅ Kunnskapssjekkpunkter med verifikasjonskommandoer  

#### Dokumentasjonsvurderingsresultater  
- **docs/pre-deployment/application-insights.md**: - Omfattende overvåkingsguide  
- **docs/getting-started/authsecurity.md**: - Profesjonelle sikkerhetsmønstre  
- **docs/pre-deployment/coordination-patterns.md**: - Avanserte fleragentarkitekturer  
- **Totalt nytt innhold**: - Konsistente høykvalitetsstandarder  

#### Teknisk implementering  
- **Application Insights**: Log Analytics + tilpasset telemetri + distribuert sporing  
- **Autentisering**: Managed Identity + Key Vault + RBAC-mønstre  
- **Fleragent**: Service Bus + Cosmos DB + Container Apps + orkestrering  
- **Overvåking**: Live-metrikker + Kusto-spørringer + varsler + dashboard  
- **Kostnadsstyring**: Sampling-strategier, oppbevaringsregler, budsjettkontroller  

### [v3.7.0] - 2025-11-19

#### Dokumentasjonskvalitetsforbedringer og nytt eksempel på Microsoft Foundry Models  
**Denne versjonen forbedrer dokumentasjonskvaliteten på tvers av arkivet og legger til et komplett distribusjonseksempel for Microsoft Foundry Models med gpt-4.1 chat-grensesnitt.**

#### Lagt til  
- **🤖 Microsoft Foundry Models Chat-eksempel**: Komplett gpt-4.1-distribusjon med fungerende implementering i `examples/azure-openai-chat/`:  
  - Komplett Microsoft Foundry Models infrastruktur (gpt-4.1 modellutplassering)  
  - Python kommandolinje chat-grensesnitt med samtalehistorikk  
  - Key Vault-integrasjon for sikker lagring av API-nøkler  
  - Sporing av tokenbruk og kostnadsestimering  
  - Hastighetsbegrensning og feilbehandling  
  - Omfattende README med 35-45 minutters distribusjonsveiledning  
  - 11 produksjonsklare filer (Bicep-maler, Python-app, konfigurasjon)  
- **📚 Dokumentasjonsøvelser**: Lagt til praktiske øvelser i konfigurasjonsveiledning:  
  - Øvelse 1: Flermiljøkonfigurasjon (15 minutter)  
  - Øvelse 2: Praktisk håndtering av hemmeligheter (10 minutter)  
  - Klare suksesskriterier og verifikasjonstrinn  
- **✅ Distribusjonsverifisering**: Lagt til verifikasjonsseksjon i distribusjonsveiledning:  
  - Helsesjekkprosedyrer  
  - Suksesskriterier sjekkliste  
  - Forventede utskrifter for alle distribusjonskommandoer  
  - Kjapp referanse for feilsøking  

#### Forbedret  
- **examples/README.md**: Oppgradert til A-karakter kvalitet (93 %):  
  - Lagt til azure-openai-chat i alle relevante seksjoner  
  - Oppdatert antall lokale eksempler fra 3 til 4  
  - Lagt til i AI Application Examples-tabellen  
  - Integrert i Quick Start for Intermediate Users  
  - Lagt til i Microsoft Foundry Templates-seksjonen  
  - Oppdatert sammenligningsmatrise og teknologioversiktsseksjoner  
- **Dokumentasjonskvalitet**: Forbedret fra B+ (87 %) → A- (92 %) i hele docs-mappen:  
  - Lagt til forventede utskrifter for kritiske kommandoeksempler  
  - Inkludert verifikasjonstrinn for konfigurasjonsendringer  
  - Forbedret praktisk læring med øvelser  

#### Endret  
- **Læringsprogresjon**: Bedre integrasjon av AI-eksempler for mellomliggende brukere  
- **Dokumentasjonsstruktur**: Mer handlingsorienterte øvelser med klare utfall  
- **Verifiseringsprosess**: Eksplisitte suksesskriterier lagt til sentrale arbeidsflyter  

#### Forbedret  
- **Utvikleropplevelse**: Microsoft Foundry Models distribuering tar nå 35-45 minutter (mot 60-90 for komplekse alternativer)  
- **Kostnadstransparens**: Klare kostnadsestimater ($50-200/måned) for Microsoft Foundry Models-eksempelet  
- **Læringsvei**: AI-utviklere får tydelig inngangspunkt med azure-openai-chat  
- **Dokumentasjonsstandarder**: Konsistente forventede utskrifter og verifikasjonstrinn  

#### Validert  
- ✅ Microsoft Foundry Models-eksempel fullt funksjonelt med `azd up`  
- ✅ Alle 11 implementeringsfiler syntaktisk korrekte  
- ✅ README-instruksjoner samsvarer med faktisk distribusjonsopplevelse  
- ✅ Dokumentasjonslenker oppdatert på over 8 steder  
- ✅ Eksempelfilindeks nøyaktig med 4 lokale eksempler  
- ✅ Ingen dupliserte eksterne lenker i tabeller  
- ✅ Alle navigasjonsreferanser korrekte  

#### Teknisk implementering  
- **Microsoft Foundry Models-arkitektur**: gpt-4.1 + Key Vault + Container Apps-mønster  
- **Sikkerhet**: Managed Identity klar, hemmeligheter i Key Vault  
- **Overvåking**: Application Insights-integrasjon  
- **Kostnadsstyring**: Token-sporing og brukoptimalisering  
- **Distribusjon**: Én enkelt `azd up`-kommando for full oppsett  

### [v3.6.0] - 2025-11-19

#### Stor oppdatering: Container App distribusjonseksempler  
**Denne versjonen introduserer omfattende, produksjonsklare eksempler på containerapplikasjonsdistribusjon ved bruk av Azure Developer CLI (AZD), med full dokumentasjon og integrering i læringsløpet.**

#### Lagt til  
- **🚀 Container App-eksempler**: Nye lokale eksempler i `examples/container-app/`:  
  - [Master Guide](examples/container-app/README.md): Komplett oversikt over containerdistribusjoner, rask start, produksjon og avanserte mønstre  
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybegynnervennlig REST API med scale-to-zero, helsesjekker, overvåking og feilsøking  
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices): Produksjonsklar multi-service distribusjon (API Gateway, Product, Order, User, Notification), asynkron meldingsutveksling, Service Bus, Cosmos DB, Azure SQL, distribuert sporing, blue-green/canary deployment  
- **Beste praksis**: Sikkerhet, overvåking, kostnadsoptimalisering og CI/CD veiledning for containeriserte arbeidsbelastninger  
- **Kodeeksempler**: Komplett `azure.yaml`, Bicep-maler, og fler-språklige tjenesteimplementeringer (Python, Node.js, C#, Go)  
- **Testing og feilsøking**: Slutt-til-slutt testscenarier, overvåkingskommandoer, veiledning for feilsøking  

#### Endret  
- **README.md**: Oppdatert for å vise og lenke nye container app-eksempler under "Local Examples - Container Applications"  
- **examples/README.md**: Oppdatert for å fremheve container app-eksempler, legge til oppføringer i sammenligningsmatrise og oppdatere teknologi/arkitekturreferanser  
- **Kursoversikt og studieguide**: Oppdatert for å referere nye container app-eksempler og distribusjonsmønstre i relevante kapitler  

#### Validert  
- ✅ Alle nye eksempler deployerbare med `azd up` og følger beste praksis  
- ✅ Dokumentasjonens krysslenker og navigasjon oppdatert  
- ✅ Eksempler dekker scenarier fra nybegynner til avansert, med produksjonsmikrotjenester  

#### Notater  
- **Omfang**: Dokumentasjon og eksempler på engelsk kun  
- **Neste steg**: Utvide med flere avanserte container-mønstre og CI/CD-automatisering i fremtidige versjoner  

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry  
**Denne versjonen implementerer en omfattende navneendring av produktet fra "Microsoft Foundry" til "Microsoft Foundry" i all engelsk dokumentasjon, i tråd med Microsofts offisielle rebranding.**

#### Endret  
- **🔄 Oppdatering av produktnavn**: Full rebranding fra "Microsoft Foundry" til "Microsoft Foundry"  
  - Oppdatert alle referanser i engelsk dokumentasjon i `docs/`-mappen  
  - Omdøpt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
  - Omdøpt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - Totalt: 23 innholdsreferanser oppdatert i 7 dokumentasjonsfiler  

- **📁 Endringer i mappestruktur**:  
  - `docs/ai-foundry/` omdøpt til `docs/microsoft-foundry/`  
  - Alle kryssreferanser oppdatert for å reflektere ny mappestruktur  
  - Navigasjonslenker validert i all dokumentasjon  

- **📄 Omdøpinger av filer**:  
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - Alle interne lenker oppdatert til ny filnavn  

#### Oppdaterte filer  
- **Kapiteldokumentasjon** (7 filer):  
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigasjonslenker oppdatert  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnsreferanser oppdatert  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Allerede bruker Microsoft Foundry (fra tidligere oppdateringer)  
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referanser oppdatert (oversikt, fellesskapsfeedback, dokumentasjon)  
  - `docs/getting-started/azd-basics.md` - 4 kryssreferanselenker oppdatert  
  - `docs/getting-started/first-project.md` - 2 kapittelnavigasjonslenker oppdatert  
  - `docs/getting-started/installation.md` - 2 lenker til neste kapittel oppdatert  
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referanser oppdatert (navigasjon, Discord-fellesskap)  
  - `docs/troubleshooting/common-issues.md` - 1 navigasjonslenke oppdatert  
  - `docs/troubleshooting/debugging.md` - 1 navigasjonslenke oppdatert  

- **Kursstrukturfiler** (2 filer):  
  - `README.md` - 17 referanser oppdatert (kursoversikt, kapitler, malseksjon, fellesskapsinnsikt)  
  - `course-outline.md` - 14 referanser oppdatert (oversikt, læringsmål, kapittelressurser)  

#### Validert  
- ✅ Ingen gjenværende "ai-foundry" mappestireferanser i engelsk dokumentasjon  
- ✅ Ingen gjenværende "Microsoft Foundry" produktnavnsreferanser i engelsk dokumentasjon  
- ✅ Alle navigasjonslenker fungerer med ny mappestruktur  
- ✅ Fil- og mappenavn endret vellykket  
- ✅ Kryssreferanser mellom kapitler validert  

#### Notater  
- **Omfang**: Endringer kun i engelsk dokumentasjon i `docs/`-mappen  
- **Oversettelser**: Oversettelsesmappene (`translations/`) oppdatert ikke i denne versjonen  
- **Workshop**: Workshop-materiale (`workshop/`) oppdatert ikke i denne versjonen  
- **Eksempler**: Eksempelfiler kan fortsatt referere til gammelt navn (skal rettes i fremtidig oppdatering)  
- **Eksterne lenker**: Eksterne URL-er og GitHub-repositoriumreferanser uendret  

#### Migrasjonsguide for bidragsytere  
Hvis du har lokale brancher eller dokumentasjon som refererer til gammel struktur:  
1. Oppdater mappereferanser: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. Oppdater filreferanser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. Erstatt produktnavn: "Microsoft Foundry" → "Microsoft Foundry"  
4. Verifiser at alle interne dokumentasjonslenker fortsatt fungerer  

---

### [v3.4.0] - 2025-10-24

#### Forhåndsvisning av infrastruktur og valideringsforbedringer  
**Denne versjonen introduserer omfattende støtte for den nye Azure Developer CLI forhåndsvisningsfunksjonen og forbedrer brukeropplevelsen i workshop.**

#### Lagt til  
- **🧪 azd provision --preview funksjonsdokumentasjon**: Omfattende dekning av ny funksjonalitet for forhåndsvisning av infrastruktur  
  - Kommandoreferanse og bruks-eksempler i jukselapp  
  - Detaljert integrasjon i provisjonsveiledning med brukstilfeller og fordeler  
  - Pre-flight sjekk integrert for sikrere distribusjonsvalidering  
  - Oppdateringer av kom igang-vejledning med sikkerhet først distribusjonspraksis  
- **🚧 Workshop statusbanner**: Profesjonelt HTML-banner som indikerer workshop-utviklingsstatus  
  - Gradientdesign med byggeindikatorer for tydelig brukermelding  
  - Sist oppdatert tidsstempel for åpenhet  
  - Mobilresponsivt design for alle enheter  

#### Forbedret  
- **Infrastruktursikkerhet**: Forhåndsvisningsfunksjonalitet integrert gjennom distribusjonsdokumentasjon  
- **Validering før distribusjon**: Automatiserte skript inkluderer nå infrastrukturforhåndsvisningstesting  
- **Utviklerarbeidsflyt**: Oppdaterte kommandosekvenser med forhåndsvisning som beste praksis  
- **Workshop-opplevelse**: Klare forventninger satt for brukere om innholdsutviklingsstatus  

#### Endret  
- **Distribusjonsbeste praksis**: Forhåndsvisning-først arbeidsflyt anbefalt som tilnærming  
- **Dokumentasjonsflyt**: Infrastrukturvalidering flyttet tidligere i læringsprosessen  
- **Workshop-presentasjon**: Profesjonell statuskommunikasjon med klar utviklingstidslinje  

#### Forbedret  
- **Sikkerhet først-tilnærming**: Infrastrukturendringer kan nå valideres før distribusjon  
- **Samarbeid i team**: Forhåndsvisningsresultater kan deles for gjennomgang og godkjenning  
- **Kostnadsbevissthet**: Bedre forståelse av ressurskostnader før provisjonering  
- **Risikoredusering**: Færre distribusjonsfeil gjennom forhåndsvalidering  

#### Teknisk implementering  
- **Multidokumentintegrasjon**: Forhåndsvisningsfunksjon dokumentert i 4 nøkkelfiler  
- **Kommandomønstre**: Konsistent syntaks og eksempler i dokumentasjon  
- **Beste praksis-integrasjon**: Forhåndsvisning inkludert i valideringsarbeidsflyter og skript  
- **Visuelle indikasjoner**: Klare NYE funksjonsmarkeringer for oppdagbarhet  

#### Workshop-infrastruktur  
- **Statuskommunikasjon**: Profesjonelt HTML-banner med gradientstil  
- **Brukeropplevelse**: Klar utviklingsstatus forhindrer forvirring  
- **Profesjonell presentasjon**: Opprettholder arkivets troverdighet mens forventninger settes  
- **Tidslinjeåpenhet**: Sist oppdatert oktober 2025 tidsstempel for ansvarlighet  

### [v3.3.0] - 2025-09-24

#### Forbedrede workshop-materialer og interaktiv læringsopplevelse  
**Denne versjonen introduserer omfattende workshop-materialer med nettleserbaserte interaktive guider og strukturerte læringsløp.**

#### Lagt til  

- **🎥 Interaktiv Workshop-veiledning**: Nettleserbasert workshop-opplevelse med forhåndsvisning i MkDocs
- **📝 Strukturert Workshop-instruksjon**: 7-trinns guidet læringssti fra oppdagelse til tilpasning
  - 0-Introduksjon: Oversikt over workshop og oppsett
  - 1-Select-AI-Template: Maloppdagelse og utvelgelsesprosess
  - 2-Validate-AI-Template: Distribusjons- og valideringsprosedyrer
  - 3-Deconstruct-AI-Template: Forståelse av malarkitektur
  - 4-Configure-AI-Template: Konfigurasjon og tilpasning
  - 5-Customize-AI-Template: Avanserte modifikasjoner og iterasjoner
  - 6-Teardown-Infrastructure: Opprydding og ressursstyring
  - 7-Wrap-up: Oppsummering og neste steg
- **🛠️ Workshop-verktøy**: MkDocs-konfigurasjon med Material-tema for forbedret læringsopplevelse
- **🎯 Praktisk læringssti**: 3-trinns metodikk (Oppdagelse → Distribusjon → Tilpasning)
- **📱 GitHub Codespaces-integrasjon**: Sømløst oppsett av utviklingsmiljø

#### Forbedret
- **AI Workshop Lab**: Utvidet med omfattende 2-3 timers strukturert læringsopplevelse
- **Workshop-dokumentasjon**: Profesjonell presentasjon med navigasjon og visuelle hjelpemidler
- **Læringsprogresjon**: Klar steg-for-steg veiledning fra malvalg til produksjonsdistribusjon
- **Utvikleropplevelse**: Integrerte verktøy for strømlinjeformede utviklingsarbeidsflyter

#### Forbedret
- **Tilgjengelighet**: Nettleserbasert grensesnitt med søk, kopieringsfunksjon og temabryter
- **Selvstyrt læring**: Fleksibel workshop-struktur som tilpasser ulike læringstempoer
- **Praktisk anvendelse**: Virkelighetsnære AI-mal-distribusjonsscenarier
- **Fellesskapsintegrasjon**: Discord-integrasjon for workshop-støtte og samarbeid

#### Workshop-funksjoner
- **Innebygd søk**: Rask søk etter nøkkelord og leksjoner
- **Kopieringskodeblokker**: Hover-for-kopiering for alle kodeeksempler
- **Temabryter**: Mørk/lys-modus støtte for ulike preferanser
- **Visuelle elementer**: Skjermbilder og diagrammer for bedre forståelse
- **Hjelpeintegrasjon**: Direkte Discord-tilgang for fellesskapsstøtte

### [v3.2.0] - 2025-09-17

#### Omfattende navigasjonsomstrukturering og kapittelbasert læringssystem
**Denne versjonen introduserer en omfattende kapittelbasert læringsstruktur med forbedret navigasjon gjennom hele depotet.**

#### Lagt til
- **📚 Kapittelbasert læringssystem**: Omstrukturert hele kurset til 8 progressive lærekapitler
  - Kapittel 1: Grunnlag & Rask start (⭐ - 30-45 min)
  - Kapittel 2: AI-først utvikling (⭐⭐ - 1-2 timer)
  - Kapittel 3: Konfigurasjon & Autentisering (⭐⭐ - 45-60 min)
  - Kapittel 4: Infrastruktur som kode & Distribusjon (⭐⭐⭐ - 1-1,5 timer)
  - Kapittel 5: Multi-agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapittel 6: Forhåndsvalidering og planlegging (⭐⭐ - 1 time)
  - Kapittel 7: Feilsøking & Debugging (⭐⭐ - 1-1,5 timer)
  - Kapittel 8: Produksjon & Enterprise-mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigasjonssystem**: Konsistente navigasjonshoder og -bunner på tvers av all dokumentasjon
- **🎯 Progresjonssporing**: Sjekkliste for kursgjennomføring og læringsverifisering
- **🗺️ Veiledning for læringssti**: Klare inngangspunkter for ulike erfaringsnivåer og mål
- **🔗 Tverrreferanse-navigasjon**: Relaterte kapitler og forutsetninger tydelig lenket

#### Forbedret
- **README-struktur**: Omdannet til en strukturert læringsplattform med kapittelbasert organisering
- **Dokumentasjonsnavigasjon**: Hver side inneholder nå kapittelkontekst og progresjonsveiledning
- **Malorganisering**: Eksempler og maler kartlagt til aktuelle lærekapitler
- **Ressursintegrasjon**: Fuskeark, FAQ og studieveiledninger knyttet til relevante kapitler
- **Workshop-integrasjon**: Praktiske laboratorier koblet til flere kapittelbaserte læringsmål

#### Endret
- **Læringsprogresjon**: Flyttet fra lineær dokumentasjon til fleksibel kapittelbasert læring
- **Konfigurasjonsplassering**: Flyttet konfigurasjonsveiledning til Kapittel 3 for bedre flyt
- **AI-innholdsintegrasjon**: Bedre integrasjon av AI-spesifikt innhold gjennom hele læringsreisen
- **Produksjonsinnhold**: Avanserte mønstre samlet i Kapittel 8 for bedriftsbrukere

#### Forbedret
- **Brukeropplevelse**: Klare navigasjonsstier og kapittelprogresjonsindikatorer
- **Tilgjengelighet**: Konsistente navigasjonsmønstre for enklere kursgjennomføring
- **Profesjonell presentasjon**: Universitetslignende kursstruktur egnet for akademisk og bedriftsopplæring
- **Læringseffektivitet**: Redusert tid til å finne relevant innhold gjennom bedre organisering

#### Teknisk implementering
- **Navigasjonshoder**: Standardiserte kapittelnavigasjoner i over 40 dokumentasjonsfiler
- **Navigasjonsbunner**: Konsistent progresjonsveiledning og kapittelfullføringsindikatorer
- **Krysslenking**: Omfattende internt koblingssystem som knytter relaterte konsepter
- **Kapittelkartlegging**: Maler og eksempler tydelig tilknyttet læringsmål

#### Studieveiledningsforbedring
- **📚 Omfattende læringsmål**: Omstrukturert studieveiledning for å samsvare med 8-kapittel systemet
- **🎯 Kapittelbasert vurdering**: Hvert kapittel inkluderer spesifikke læringsmål og praktiske øvelser
- **📋 Progresjonssporing**: Ukentlig læringsplan med målbare resultater og sjekklister
- **❓ Vurderingsspørsmål**: Kunnskapsvalideringsspørsmål for hvert kapittel med profesjonelle resultater
- **🛠️ Praktiske øvelser**: Hands-on aktiviteter med virkelige distribusjonsscenarier og feilsøking
- **📊 Ferdighetsprogresjon**: Klar fremgang fra grunnleggende konsepter til bedriftsmønstre med karrierefokus
- **🎓 Sertifiseringsrammeverk**: Profesjonelle utviklingsresultater og fellesskapsanerkjennelse
- **⏱️ Tidsstyring**: Strukturert 10-ukers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede Multi-Agent AI-løsninger
**Denne versjonen forbedrer multi-agent-løsningen for detaljhandel med bedre agentnavn og forbedret dokumentasjon.**

#### Endret
- **Multi-agent terminologi**: Erstattet "Cora-agent" med "Customer-agent" gjennom hele detaljhandels multi-agent-løsningen for bedre forståelse
- **Agentarkitektur**: Oppdatert all dokumentasjon, ARM-maler og kodeeksempler til konsistent "Customer-agent" navngivning
- **Konfigurasjonseksempler**: Modernisert agentkonfigurasjonsmønstre med oppdaterte navn
- **Dokumentasjonskonsistens**: Sikret at alle referanser bruker profesjonelle, beskrivende agentnavn

#### Forbedret
- **ARM-malpakke**: Oppdatert retail-multiagent-arm-template med Customer-agent referanser
- **Arkitekturdiagrammer**: Oppdatert Mermaid-diagrammer med ny agentnavngivning
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruker nå CustomerAgent-navn
- **Miljøvariabler**: Oppdatert alle distribusjonsskript for å bruke CUSTOMER_AGENT_NAME-konvensjoner

#### Forbedret
- **Utvikleropplevelse**: Klare agentroller og ansvarsområder i dokumentasjonen
- **Produksjonsklarhet**: Bedre samsvar med bedriftsnavngivningskonvensjoner
- **Læringsmateriell**: Mer intuitiv agentnavngivning for utdannelsesformål
- **Malbrukervennlighet**: Forenklet forståelse av agentfunksjoner og distribusjonsmønstre

#### Tekniske detaljer
- Oppdaterte Mermaid arkitekturdiagrammer med CustomerAgent referanser
- Erstattet CoraAgent klasse navn med CustomerAgent i Python eksempler
- Endret ARM-mal JSON-konfigurasjoner til å bruke "customer" agent type
- Oppdaterte miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_*
- Oppfrisket alle distribusjonskommandoer og container-konfigurasjoner

### [v3.0.0] - 2025-09-12

#### Store endringer - AI-utviklerfokus og Microsoft Foundry-integrasjon
**Denne versjonen transformerer depotet til en omfattende AI-fokusert læringsressurs med Microsoft Foundry-integrasjon.**

#### Lagt til
- **🤖 AI-første læringssti**: Fullstendig omstrukturering med vekt på AI-utviklere og ingeniører
- **Microsoft Foundry-integrasjonsveiledning**: Omfattende dokumentasjon for å koble AZD til Microsoft Foundry-tjenester
- **AI-modell distribusjonsmønstre**: Detaljert guide for modellvalg, konfigurasjon og produksjonsdistribusjonsstrategier
- **AI Workshop Lab**: 2-3 timers praktisk workshop for konvertering av AI-applikasjoner til AZD-distribuerbare løsninger
- **Beste praksis for produksjons-AI**: Bedriftsklare mønstre for skalering, overvåkning og sikring av AI-arbeidsbelastninger
- **AI-spesifikk feilsøkingsguide**: Omfattende feilsøking for Microsoft Foundry-modeller, Cognitive Services og AI-distribusjonsproblemer
- **AI-mal-galleri**: Utvalgt samling av Microsoft Foundry-maler med kompleksitetsvurdering
- **Workshop-materialer**: Komplett workshopstruktur med praktiske laboratorier og referansemateriale

#### Forbedret
- **README-struktur**: AI-utviklerfokusert med 45% fellesskapsinteresse fra Microsoft Foundry Discord
- **Læringsstier**: Dedikert AI-utviklerreise parallelt med tradisjonelle stier for studenter og DevOps-ingeniører
- **Mal-anbefalinger**: Utvalgte AI-maler inkludert azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Fellesskapsintegrasjon**: Forbedret Discord-støtte med AI-spesifikke kanaler og diskusjoner

#### Sikkerhet & produksjonsfokus
- **Håndterte identitetsmønstre**: AI-spesifikk autentiserings- og sikkerhetskonfigurasjon
- **Kostnadsoptimalisering**: Sporing av tokenbruk og budsjettkontroller for AI-arbeidsbelastninger
- **Multi-region distribusjon**: Strategier for global AI-applikasjonsdistribusjon
- **Ytelsesovervåkning**: AI-spesifikke måleparametere og Application Insights-integrasjon

#### Dokumentasjonskvalitet
- **Lineær kursstruktur**: Logisk progresjon fra nybegynner til avanserte AI-distribusjonsmønstre
- **Validerte URLer**: Alle eksterne linkede depotlenker verifisert og tilgjengelige
- **Fullstendig referanse**: Alle interne dokumentasjonslenker validerte og funksjonelle
- **Produksjonsklar**: Bedriftsdistribusjonsmønstre med virkelighetseksempler

### [v2.0.0] - 2025-09-09

#### Store endringer - Depotomstrukturering og profesjonell forbedring
**Denne versjonen representerer en betydelig revisjon av depotstruktur og innholdspresentasjon.**

#### Lagt til
- **Strukturert læringsrammeverk**: Alle dokumentasjonssider inkluderer nå Introduksjon, Læringsmål og Læringsresultater-seksjoner
- **Navigasjonssystem**: Lagt til forrige/neste leksjonslenker i all dokumentasjon for styrt læringsprogresjon
- **Studieveiledning**: Omfattende study-guide.md med læringsmål, praksisøvelser og vurderingsmateriell
- **Profesjonell presentasjon**: Fjernet alle emoji-ikoner for bedre tilgjengelighet og et profesjonelt uttrykk
- **Forbedret innholdsstruktur**: Bedre organisering og flyt i læringsmaterialet

#### Endret
- **Dokumentasjonsformat**: Standardisert all dokumentasjon med konsistent læringsfokusert struktur
- **Navigasjonsflyt**: Implementert logisk fremdrift gjennom alt læringsmateriale
- **Innholdspresentasjon**: Fjernet dekorative elementer til fordel for klar, profesjonell formatering
- **Lenkestruktur**: Oppdatert interne lenker for å støtte nytt navigasjonssystem

#### Forbedret
- **Tilgjengelighet**: Fjernet emoji-avhengighet for bedre skjermlesertilgjengelighet
- **Profesjonelt utseende**: Ren, akademisk stil presentasjon egnet for bedriftsopplæring
- **Læringsopplevelse**: Strukturert tilnærming med klare mål og resultater for hver leksjon
- **Innholdsorganisering**: Bedre logisk flyt og sammenheng mellom relaterte emner

### [v1.0.0] - 2025-09-09

#### Første utgivelse - Omfattende AZD læringsdepot

#### Lagt til
- **Kjernen i dokumentasjonsstrukturen**
  - Komplett kom-i-gang guide-serie
  - Omfattende distribusjons- og provisjonsdokumentasjon
  - Detaljert feilsøkingsressurser og debugging-guider
  - Verktøy og prosedyrer for forhåndsvalidering

- **Kom-i-gang-modul**
  - AZD Grunnleggende: Kjernen i konsepter og terminologi
  - Installasjonsveiledning: Plattformspesifikke oppsettinstruksjoner
  - Konfigurasjonsveiledning: Miljøoppsett og autentisering
  - Første prosjektopplæring: Steg-for-steg praktisk læring

- **Distribusjons- og provisjonsmodul**
  - Distribusjonsveiledning: Fullstendig arbeidsflytdokumentasjon
  - Provisjonsveiledning: Infrastruktur som kode med Bicep
  - Beste praksis for produksjonsdistribusjoner
  - Mønstre for fler-tjenestearkitektur

- **Forhåndsvalideringsmodul**
  - Kapasitetsplanlegging: Validering av tilgjengelige Azure-ressurser
  - SKU-valg: Omfattende veiledning for tjenestenivåer
  - Preflight-sjekker: Automatiserte valideringsskript (PowerShell og Bash)
  - Kostnadsestimering og budsjettplanleggingsverktøy

- **Feilsøkingsmodul**
  - Vanlige problemer: Ofte stilte spørsmål og løsninger
  - Debugging-veiledning: Systematisk feilsøking
  - Avanserte diagnostiske teknikker og verktøy
  - Ytelsesovervåkning og -optimalisering

- **Ressurser og referanser**
  - Kommandofuskeark: Rask referanse for essensielle kommandoer
  - Ordliste: Omfattende terminologi- og forkortelsesdefinisjoner
  - FAQ: Detaljerte svar på vanlige spørsmål
  - Eksterne ressurslenker og fellesskapsforbindelser

- **Eksempler og maler**
  - Eksempel på enkel webapplikasjon
  - Mal for distribusjon av statisk nettsted
  - Konfigurasjon av container-applikasjon
  - Databasintegrasjonsmønstre
  - Eksempler på mikroservicearkitektur
  - Implementering av serverløse funksjoner

#### Funksjoner
- **Tverrplattform-støtte**: Installasjons- og konfigurasjonsveiledninger for Windows, macOS og Linux
- **Flere ferdighetsnivåer**: Innhold utformet for studenter til profesjonelle utviklere
- **Praktisk fokus**: Hands-on eksempler og virkelige scenarier
- **Omfattende dekning**: Fra grunnleggende konsepter til avanserte bedriftsmønstre
- **Sikkerhetsfokus**: Sikkerhetsbeste praksis integrert gjennom hele
- **Kostnadsoptimalisering**: Veiledning for kostnadseffektive distribusjoner og ressursstyring

#### Dokumentasjonskvalitet
- **Detaljerte kodeeksempler**: Praktiske, testede kodeeksempler
- **Steg-for-steg instruksjoner**: Klare, handlingsorienterte veiledninger
- **Omfattende feilbehandling**: Feilsøking for vanlige problemer
- **Beste praksis integrasjon**: Industri-standarder og anbefalinger
- **Versjonskompatibilitet**: Oppdatert med siste Azure-tjenester og azd-funksjoner

## Planlagte fremtidige forbedringer

### Versjon 3.1.0 (Planlagt)
#### Utvidelse av AI-plattformen
- **Støtte for flere modeller**: Integrasjonsmønstre for Hugging Face, Azure Machine Learning og egendefinerte modeller  
- **AI-agentrammeverk**: Maler for LangChain, Semantic Kernel og AutoGen-distribusjoner  
- **Avanserte RAG-mønstre**: Vektor databasealternativer utover Azure AI Search (Pinecone, Weaviate, osv.)  
- **AI-observabilitet**: Forbedret overvåking for modellytelse, tokenbruk og svar kvalitet  

#### Utvikleropplevelse  
- **VS Code-utvidelse**: Integrert AZD + Microsoft Foundry utvikleropplevelse  
- **GitHub Copilot-integrasjon**: AI-assistert AZD malgenerering  
- **Interaktive veiledninger**: Praktiske kodingøvelser med automatisert validering for AI-scenarier  
- **Videoinnhold**: Supplerende videotutorials for visuelle lærere med fokus på AI-distribusjoner  

### Versjon 4.0.0 (Planlagt)  
#### Enterprise AI-mønstre  
- **Styringsrammeverk**: AI-modellstyring, samsvar og revisjonsspor  
- **Multi-leietaker AI**: Mønstre for å betjene flere kunder med isolerte AI-tjenester  
- **Edge AI-distribusjon**: Integrasjon med Azure IoT Edge og containerinstanser  
- **Hybrid Cloud AI**: Multi-cloud og hybride distribusjonsmønstre for AI arbeidsbelastninger  

#### Avanserte funksjoner  
- **AI-pipeline-automatisering**: MLOps-integrasjon med Azure Machine Learning pipelines  
- **Avansert sikkerhet**: Zero-trust-mønstre, private endepunkter og avansert trusselbeskyttelse  
- **Ytelsesoptimalisering**: Avanserte tuning- og skaleringstrategier for AI-applikasjoner med høy gjennomstrømning  
- **Global distribusjon**: Innholdslevering og edge caching-mønstre for AI-applikasjoner  

### Versjon 3.0.0 (Planlagt) - Erstattet av gjeldende utgivelse  
#### Foreslåtte tillegg - Nå implementert i v3.0.0  
- ✅ **AI-fokusert innhold**: Omfattende Microsoft Foundry-integrasjon (Fullført)  
- ✅ **Interaktive veiledninger**: Praktisk AI-verkstedslab (Fullført)  
- ✅ **Avansert sikkerhetsmodul**: AI-spesifikke sikkerhetsmønstre (Fullført)  
- ✅ **Ytelsesoptimalisering**: AI-arbeidsbelastningstuningstrategier (Fullført)  

### Versjon 2.1.0 (Planlagt) - Delvis implementert i v3.0.0  
#### Mindre forbedringer - Noen fullført i nåværende utgivelse  
- ✅ **Flere eksempler**: AI-fokuserte distribusjonsscenarier (Fullført)  
- ✅ **Utvidet FAQ**: AI-spesifikke spørsmål og feilsøking (Fullført)  
- **Verktøyintegrasjon**: Forbedrede IDE- og redaktør-integrasjonsveiledninger  
- ✅ **Overvåking utvidelse**: AI-spesifikke overvåknings- og varslingsmønstre (Fullført)  

#### Fortsatt planlagt for fremtidig utgivelse  
- **Mobilvennlig dokumentasjon**: Responsivt design for mobil læring  
- **Offline tilgang**: Nedlastbare dokumentasjonspakker  
- **Forbedret IDE-integrasjon**: VS Code-utvidelse for AZD + AI arbeidsflyter  
- **Fellesskapsdashbord**: Sanntids fellesskapsmålinger og bidragssporing  

## Bidra til endringsloggen  

### Rapportering av endringer  
Når du bidrar til dette arkivet, vennligst sørg for at endringsloggoppføringer inkluderer:  

1. **Versjonsnummer**: Følger semantisk versjonering (major.minor.patch)  
2. **Dato**: Utgivelses- eller oppdateringsdato i formatet ÅÅÅÅ-MM-DD  
3. **Kategori**: Added, Changed, Deprecated, Removed, Fixed, Security  
4. **Klar beskrivelse**: Kortfattet beskrivelse av hva som har endret seg  
5. **Virkningsevaluering**: Hvordan endringene påvirker eksisterende brukere  

### Endringskategorier  

#### Added  
- Nye funksjoner, dokumentasjonsseksjoner eller kapabiliteter  
- Nye eksempler, maler eller læringsressurser  
- Ytterligere verktøy, skript eller hjelpemidler  

#### Changed  
- Endringer i eksisterende funksjonalitet eller dokumentasjon  
- Oppdateringer for å forbedre klarhet eller nøyaktighet  
- Omstrukturering av innhold eller organisasjon  

#### Deprecated  
- Funksjoner eller tilnærminger som fases ut  
- Dokumentasjonsseksjoner planlagt for fjernelse  
- Metoder som har bedre alternativer  

#### Removed  
- Funksjoner, dokumentasjon eller eksempler som ikke lenger er relevante  
- Utdatert informasjon eller utdaterte tilnærminger  
- Overflødig eller konsolidert innhold  

#### Fixed  
- Rettelser av feil i dokumentasjon eller kode  
- Løsning av rapporterte problemer eller feil  
- Forbedringer i nøyaktighet eller funksjonalitet  

#### Security  
- Sikkerhetsrelaterte forbedringer eller rettearbeid  
- Oppdateringer av sikkerhets beste praksis  
- Løsning av sikkerhetssårbarheter  

### Retningslinjer for semantisk versjonering  

#### Hovedversjon (X.0.0)  
- Bruddendringer som krever brukerhandling  
- Betydelig omstrukturering av innhold eller organisering  
- Endringer som endrer den grunnleggende tilnærmingen eller metodologien  

#### Mindre versjon (X.Y.0)  
- Nye funksjoner eller innholds tillegg  
- Forbedringer som opprettholder bakoverkompatibilitet  
- Ytterligere eksempler, verktøy eller ressurser  

#### Patch-versjon (X.Y.Z)  
- Feilrettinger og korrigeringer  
- Mindre forbedringer i eksisterende innhold  
- Klargjøringer og små forbedringer  

## Fellesskapsinnspill og forslag  

Vi oppmuntrer aktivt til fellesskapsinnspill for å forbedre denne læringsressursen:  

### Hvordan gi tilbakemelding  
- **GitHub Issues**: Rapporter problemer eller foreslå forbedringer (AI-spesifikke problemstillinger ønskes)  
- **Discord Discussions**: Del ideer og engasjer deg med Microsoft Foundry-fellesskapet  
- **Pull Requests**: Bidra med direkte forbedringer til innhold, spesielt AI-maler og guider  
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen for AZD + AI-diskusjoner  
- **Fellesskapsforum**: Delta i bredere Azure utviklerdiskusjoner  

### Tilbakemeldingskategorier  
- **AI-innholds nøyaktighet**: Rettelser for AI-tjeneste integrasjon og distribusjonsinformasjon  
- **Læringsopplevelse**: Forslag for forbedret AI-utvikler læringsflyt  
- **Manglende AI-innhold**: Forespørsler om flere AI-maler, mønstre eller eksempler  
- **Tilgjengelighet**: Forbedringer for ulike læringsbehov  
- **AI-verktøyintegrasjon**: Forslag for bedre AI-utviklings arbeidsflytintegrasjon  
- **Produksjons AI-mønstre**: Forespørsler om bedrifts AI distribusjonsmønstre  

### Responsforpliktelse  
- **Problemrespons**: Innen 48 timer for rapporterte problemer  
- **Funksjonsforespørsler**: Evaluering innen en uke  
- **Fellesskapsbidrag**: Gjennomgang innen en uke  
- **Sikkerhetsproblemer**: Umiddelbar prioritet med hurtig responstid  

## Vedlikeholdsplan  

### Regelmessige oppdateringer  
- **Månedlige gjennomganger**: Innholdsnøyaktighet og lenkekontroll  
- **Kvartalsvise oppdateringer**: Store innholdstillegg og forbedringer  
- **Halvårlige gjennomganger**: Omfattende omstrukturering og forbedring  
- **Årlige utgivelser**: Hovedversjonsoppdateringer med betydelige forbedringer  

### Overvåking og kvalitetskontroll  
- **Automatisert testing**: Regelmessig validering av kodeeksempler og lenker  
- **Integrering av fellesskapstilbakemelding**: Regelmessig innarbeiding av brukersuggesjoner  
- **Teknologiske oppdateringer**: Synkronisering med siste Azure-tjenester og azd-utgivelser  
- **Tilgjengelighetsrevisjoner**: Regelmessig gjennomgang for inkluderende designprinsipper  

## Policy for versjonsstøtte  

### Støtte for gjeldende versjon  
- **Nyeste hovedversjon**: Full støtte med regelmessige oppdateringer  
- **Forrige hovedversjon**: Sikkerhetsoppdateringer og kritiske feilrettinger i 12 måneder  
- **Eldre versjoner**: Kun fellesskapsstøtte, ingen offisielle oppdateringer  

### Migrasjonsveiledning  
Ved utgivelse av hovedversjoner tilbyr vi:  
- **Migrasjonsguider**: Trinnvise overgangsinstruksjoner  
- **Kompatibilitetsnotater**: Detaljer om bruddendringer  
- **Verktøystøtte**: Skript eller verktøy for å hjelpe med migrasjon  
- **Fellesskapsstøtte**: Dedikerte forum for migrasjonsspørsmål  

---

**Navigasjon**  
- **Forrige leksjon**: [Studieveiledning](resources/study-guide.md)  
- **Neste leksjon**: Gå tilbake til [Hoved README](README.md)  

**Hold deg oppdatert**: Følg dette arkivet for varslinger om nye utgivelser og viktige oppdateringer til læringsmaterialene.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->