# Endringslogg - AZD for nybegynnere

## Introduksjon

Denne endringsloggen dokumenterer alle bemerkelsesverdige endringer, oppdateringer og forbedringer i AZD for nybegynnere-repositoriet. Vi følger prinsippene for semantisk versjonering og opprettholder denne loggen for å hjelpe brukere å forstå hva som har endret seg mellom versjoner.

## Læringsmål

Ved å gjennomgå denne endringsloggen vil du:
- Holde deg informert om nye funksjoner og innholdsoppdateringer
- Forstå forbedringer gjort i eksisterende dokumentasjon
- Følge feilrettinger og korreksjoner for å sikre nøyaktighet
- Følge utviklingen av læringsmaterialene over tid

## Læringsutbytte

Etter å ha gjennomgått endringslogginnleggene vil du kunne:
- Identifisere nytt innhold og ressurser tilgjengelig for læring
- Forstå hvilke seksjoner som er oppdatert eller forbedret
- Planlegge din læringsvei basert på det mest oppdaterte materialet
- Bidra med tilbakemeldinger og forslag til fremtidige forbedringer

## Versjonshistorikk

### [v3.17.0] - 2026-02-05

#### Forbedring av kurssnavigasjon
**Denne versjonen forbedrer README.md kapittelnavigasjonen med et forbedret tabellformat.**

#### Endret
- **Kurskart-tabell**: Forbedret med direkte leksjonslenker, tidsestimater og kompleksitetsvurderinger
- **Rydding i mapper**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Lenkevalidering**: Alle 21+ interne lenker i kurskart-tabellen verifisert

### [v3.16.0] - 2026-02-05

#### Oppdateringer av produktnavn
**Denne versjonen oppdaterer produktreferanser til gjeldende Microsoft-branding.**

#### Endret
- **Azure AI Foundry → Microsoft Foundry**: Alle referanser oppdatert på tvers av ikke-oversettelsesfiler
- **Azure AI Agent Service → Foundry Agents**: Tjenestenavn oppdatert for å reflektere nåværende branding

#### Oppdaterte filer
- `README.md` - Hovedkursets landingsside
- `changelog.md` - Versjonshistorikk
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - Veiledning for AI-agenter
- `examples/README.md` - Eksempeldokumentasjon
- `workshop/README.md` - Workshop landingsside
- `workshop/docs/index.md` - Workshop indeks
- `workshop/docs/instructions/*.md` - Alle workshop instruksjonsfiler

---

### [v3.15.0] - 2026-02-05

#### Større omstrukturering av repositoriet: Kapittelsbaserte mappenavn
**Denne versjonen omstrukturerer dokumentasjonen til dedikerte kapittelmappaer for enklere navigasjon.**

#### Mappenavn endringer
Gamle mapper er erstattet med kapittelnummere:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ny lagt til: `docs/chapter-05-multi-agent/`

#### Filflytting
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
- **📚 Kapittel README-filer**: Opprettet README.md i hver kapittelmapp med:
  - Læringsmål og tidsbruk
  - Leksjonstabell med beskrivelser
  - Hurtigkommandoer for oppstart
  - Navigasjon til andre kapitler

#### Endret
- **🔗 Oppdaterte alle interne lenker**: 78+ stier oppdatert i alle dokumentasjonsfiler
- **🗺️ Hoved-README.md**: Oppdatert kurskart med ny kapittelstruktur
- **📝 examples/README.md**: Oppdaterte kryssreferanser til kapittelmappene

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Omstrukturering av repositoriet: Kapittelnavigasjon
**Denne versjonen la til kapittelnavigasjons-README-filer (erstattet av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny veiledning for AI-agenter
**Denne versjonen legger til en omfattende veiledning for å distribuere AI-agenter med Azure Developer CLI.**

#### Lagt til
- **🤖 docs/microsoft-foundry/agents.md**: Fullstendig guide som dekker:
  - Hva AI-agenter er og hvordan de skiller seg fra chatboter
  - Tre maler for hurtigstart (Foundry Agents, Prompty, RAG)
  - Agentarkitekturmønstre (enkel agent, RAG, multi-agent)
  - Konfigurasjon og tilpasning av verktøy
  - Overvåking og metrikksporing
  - Kostnadshensyn og optimalisering
  - Vanlige feilsøkingsscenarier
  - Tre praktiske øvelser med suksesskriterier

#### Innholdsstruktur
- **Introduksjon**: Agentkonsepter for nybegynnere
- **Hurtigstart**: Distribuer agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmønstre**: Visuelle diagrammer av agentmønstre
- **Konfigurasjon**: Verktøyoppsett og miljøvariabler
- **Overvåking**: Integrasjon med Application Insights
- **Øvelser**: Progressiv praktisk læring (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### Oppdatering av DevContainer-miljø
**Denne versjonen oppdaterer utviklingscontainerkonfigurasjonen med moderne verktøy og bedre standardinnstillinger for AZD-læringsopplevelsen.**

#### Endret
- **🐳 Basisbilde**: Oppdatert fra `python:3.12-bullseye` til `python:3.12-bookworm` (nyeste Debian stable)
- **📛 Container-navn**: Endret fra "Python 3" til "AZD for Beginners" for klarhet

#### Lagt til
- **🔧 Nye Dev Container-funksjoner**:
  - `azure-cli` med aktivert Bicep-støtte
  - `node:20` (LTS-versjon for AZD-maler)
  - `github-cli` for malhåndtering
  - `docker-in-docker` for container app-distribusjon

- **🔌 Portvideresending**: Forhåndskonfigurerte porter for vanlig utvikling:
  - 8000 (MkDocs forhåndsvisning)
  - 3000 (Webapper)
  - 5000 (Python Flask)
  - 8080 (APIer)

- **🧩 Nye VS Code-utvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Støtte for Azure Functions
  - `ms-azuretools.vscode-docker` - Docker-støtte
  - `ms-azuretools.vscode-bicep` - Bicep-språkstøtte
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursadministrasjon
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid diagramstøtte
  - `redhat.vscode-yaml` - YAML-støtte (for azure.yaml)
  - `eamodio.gitlens` - Git visualisering
  - `mhutchie.git-graph` - Git-historikk

- **⚙️ VS Code-innstillinger**: La til standardinnstillinger for Python-tolk, formatering ved lagring, og trimming av mellomrom

- **📦 Oppdatert requirements-dev.txt**:
  - Lagt til MkDocs minifiseringsplugin
  - Lagt til pre-commit for kodekvalitet
  - Lagt til Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Fikset
- **Post-Create-kommando**: Verifiserer nå AZD og Azure CLI installasjon ved oppstart av container

---

### [v3.11.0] - 2026-02-05

#### Nybegynnervennlig README-omlegging
**Denne versjonen forbedrer README.md betydelig for å være mer tilgjengelig for nybegynnere og legger til viktige ressurser for AI-utviklere.**

#### Lagt til
- **🆚 Sammenligning Azure CLI vs AZD**: Klar forklaring på når man skal bruke hvert verktøy med praktiske eksempler
- **🌟 Awesome AZD-lenker**: Direkte lenker til community-mal-galleri og bidragsressurser:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ferdige maler for utrulling
  - [Send inn en mal](https://github.com/Azure/awesome-azd/issues) - Community-bidrag
- **🎯 Hurtigstartguide**: Forenklet 3-trinns oppstart (Installer → Logg inn → Distribuer)
- **📊 Erfaringsbasert navigasjonstabell**: Klar veiledning om hvor man skal starte basert på utviklererfaring

#### Endret
- **README-struktur**: Omdisponert for trinnvis visning — viktig informasjon først
- **Introduksjonsseksjon**: Omskrevet for å forklare "Magien i `azd up`" for nybegynnere
- **Fjernet duplikatinnhold**: Eliminerte duplikat feilsøkingsseksjon
- **Feilsøkingskommandoer**: Rettet `azd logs` referanse til å bruke gyldig `azd monitor --logs`

#### Fikset
- **🔐 Autentiseringskommandoer**: Lagt til `azd auth login` og `azd auth logout` i cheat-sheet.md
- **Ugyldige kommandoer**: Fjernet gjenværende `azd logs` fra README feilsøkingsseksjon

#### Notater
- **Omfang**: Endringer utført i hoved-README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer spesifikt rettet mot utviklere som er nye med AZD

---

### [v3.10.0] - 2026-02-05

#### Oppdatering av Azure Developer CLI kommandoer for korrekthet
**Denne versjonen retter ikke-eksisterende AZD-kommandoer i all dokumentasjon, og sikrer at alle kodeeksempler bruker gyldig Azure Developer CLI-syntaks.**

#### Fikset
- **🔧 Ikke-eksisterende AZD-kommandoer fjernet**: Komplett gjennomgang og korrigering av ugyldige kommandoer:
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
  - `docs/troubleshooting/debugging.md`: Korrigerte logganalysetekster
  - `docs/troubleshooting/common-issues.md`: Oppdaterte feilsøkingskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Fikset AZD debug-seksjon
  - `docs/getting-started/azd-basics.md`: Rettet overvåkingskommandoer
  - `docs/getting-started/first-project.md`: Oppdaterte overvåking og feilsøkings-eksempler
  - `docs/getting-started/installation.md`: Rettet hjelp og versjons-eksempler
  - `docs/pre-deployment/application-insights.md`: Korrigerte logg-visningskommandoer
  - `docs/pre-deployment/coordination-patterns.md`: Rettet agent debug-kommandoer

- **📝 Versjonsreferanse oppdatert**:
  - `docs/getting-started/installation.md`: Endret fast versjon `1.5.0` til generisk `1.x.x` med lenke til releases

#### Endret
- **Rollback-strategier**: Oppdatert dokumentasjon til å bruke Git-basert rollback (AZD har ikke innebygd rollback)
- **Logg-visning**: Erstattet `azd logs` med `azd monitor --logs`, `azd monitor --live` og Azure CLI-kommandoer
- **Ytelseseksjon**: Fjernet ikke-eksisterende parallelle/incrementelle distribusjonsflagg, gav gyldige alternativer

#### Tekniske detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor-flagg**: `--live`, `--logs`, `--overview`
- **Fjernet funksjonalitet**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notater
- **Verifisering**: Kommandoer validert mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Oppdatering av fullføring av workshop og dokumentasjonskvalitet
**Denne versjonen fullfører de interaktive workshop-modulene, fikser alle ødelagte dokumentasjonslenker, og forbedrer den overordnede innholdskvaliteten for AI-utviklere som bruker Microsoft AZD.**

#### Lagt til
- **📝 CONTRIBUTING.md**: Nytt dokument for retningslinjer for bidrag med:
  - Klare instruksjoner for rapportering av problemer og forslag til endringer
  - Dokumentasjonsstandarder for nytt innhold
  - Retningslinjer for kodeeksempler og commit-beskjeder
  - Informasjon om fellesskapsengasjement

#### Fullført
- **🎯 Workshop Modul 7 (Oppsummering)**: Fullstendig fullført oppsummeringsmodul med:
  - Omfattende sammendrag av workshoppens resultater
  - Nøkkelkonsepter mestret-seksjon som dekker AZD, maler og AI Foundry
  - Anbefalinger for videre læringsreise
  - Workshop-utfordringsøvelser med vanskelighetsgrader
  - Tilbakemeldings- og støttelenker til fellesskapet

- **📚 Workshop Modul 3 (Nedbrytning)**: Oppdaterte læringsmål med:
  - Veiledning for aktivering av GitHub Copilot med MCP-servere
  - Forståelse av AZD-malens mappestruktur
  - Organisasjonsmønstre for infrastruktur-som-kode (Bicep)
  - Instruksjoner for praktiske laboratorier

- **🔧 Workshop Modul 6 (Nedmontering)**: Fullført med:
  - Mål for ressursopprydding og kostnadsstyring
  - Bruk av `azd down` for sikker deprovisjonering av infrastruktur
  - Veiledning for gjenoppretting av mykt slettede kognitive tjenester
  - Bonusekspplorering for GitHub Copilot og Azure Portal

#### Fikset
- **🔗 Fikset ødelagte lenker**: Løst over 15 ødelagte interne dokumentasjonslenker:
  - `docs/ai-foundry/ai-model-deployment.md`: Fikset stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerte sti til ai-model-deployment.md og production-ai-practices.md
  - `docs/getting-started/first-project.md`: Erstattet ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fikset FAQ og feilsøkingsguide-stier
  - `examples/container-app/microservices/README.md`: Korrigerte stier til kurs-hjem og deployeringsguide
  - `resources/faq.md` og `resources/glossary.md`: Oppdaterte AI-kapittelreferanser
  - `course-outline.md`: Fikset instruktørguide og AI-workshop-lab-referanser

- **📅 Workshop-statusbanner**: Oppdatert fra "Under Construction" til aktiv workshop-status med dato februar 2026

- **🔗 Workshop-navigasjon**: Fikset ødelagte navigasjonslenker i workshop README.md som pekte til ikke-eksisterende lab-1-azd-basics-mappe

#### Endret
- **Workshop-presentasjon**: Fjernet "under construction"-advarsel, workshop er nå komplett og klar til bruk
- **Navigasjonskonsistens**: Sikret at alle workshop-moduler har korrekt navigasjon mellom moduler
- **Læringssti-referanser**: Oppdatert kapittel-kryssreferanser til å bruke riktige microsoft-foundry-stier

#### Validert
- ✅ Alle engelske markdown-filer har gyldige interne lenker
- ✅ Workshop-moduler 0-7 er fullført med læringsmål
- ✅ Navigasjon mellom kapitler og moduler fungerer korrekt
- ✅ Innhold er egnet for AI-utviklere som bruker Microsoft AZD
- ✅ Begynnervennlig språk og struktur opprettholdes gjennomgående
- ✅ CONTRIBUTING.md gir tydelige retningslinjer for fellesskapsbidragsytere

#### Teknisk implementering
- **Lenkevalidering**: Automatisk PowerShell-skript verifiserte alle .md interne lenker
- **Innholdrevisjon**: Manuell gjennomgang av workshoppens fullstendighet og brukervennlighet for nybegynnere
- **Navigasjonssystem**: Konsistente navigasjonsmønstre for kapitler og moduler anvendt

#### Notater
- **Omfang**: Endringer anvendt kun på engelsk dokumentasjon
- **Oversettelser**: Oversettelsesmappene ble ikke oppdatert i denne versjonen (automatisk oversettelse vil synkroniseres senere)
- **Workshop-varighet**: Komplett workshop gir nå 3-4 timers praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avansert dokumentasjon: Overvåking, sikkerhet og multi-agentmønstre
**Denne versjonen legger til omfattende A-grad leksjoner om Application Insights-integrasjon, autentiseringsmønstre og multi-agent-koordinering for produksjonsdistribusjoner.**

#### Lagt til
- **📊 Application Insights-integrasjonsleksjon**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokusert distribusjon med automatisk provisionering
  - Fullstendige Bicep-maler for Application Insights + Log Analytics
  - Arbeidende Python-applikasjoner med tilpasset telemetri (1200+ linjer)
  - AI/LLM-overvåkingsmønstre (Azure OpenAI token/kostnadssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribuert tracing, telemetryflyt)
  - 3 praktiske øvelser (varsler, dashbord, AI-overvåking)
  - Kusto-forespørselseksempler og kostnadsoptimaliseringsstrategier
  - Live metrikker og sanntidsfeilsøking
  - 40-50 minutters læringstid med produksjonsklare mønstre

- **🔐 Autentisering og sikkerhetsmønstre leksjon**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmønstre (tilkoblingsstrenger, Key Vault, administrert identitet)
  - Fullstendige Bicep-infrastrukturmaler for sikre distribusjoner
  - Node.js applikasjonskode med Azure SDK-integrasjon
  - 3 komplette øvelser (aktivere administrert identitet, bruker-assigned identitet, Key Vault-rotasjon)
  - Beste praksiser for sikkerhet og RBAC-konfigurasjoner
  - Feilsøkingsveiledning og kostnadsanalyse
  - Produksjonsklare passordløse autentiseringsmønstre

- **🤖 Multi-agent koordinasjonsmønstre leksjon**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinasjonsmønstre (sekvensiell, parallell, hierarkisk, hendelsesdrevet, konsensus)
  - Fullstendig orkestratørtjenesteimplementering (Python/Flask, 1500+ linjer)
  - 3 spesialiserte agentimplementeringer (Research, Writer, Editor)
  - Service Bus-integrasjon for meldingskøing
  - Cosmos DB tilstandshåndtering for distribuerte systemer
  - 6 Mermaid-diagrammer som viser agentinteraksjoner
  - 3 avanserte øvelser (timeout-håndtering, retry-logikk, kretsbryter)
  - Kostnadsoversikt ($240-565/måned) med optimaliseringsstrategier
  - Application Insights-integrasjon for overvåking

#### Forbedret
- **For-distribusjonskapittel**: Inkluderer nå omfattende overvåking og koordinasjonsmønstre
- **Kom i gang-kapittel**: Forbedret med profesjonelle autentiseringsmønstre
- **Produksjonsberedskap**: Full dekning fra sikkerhet til observerbarhet
- **Kursoversikt**: Oppdatert for å referere til nye leksjoner i kapittel 3 og 6

#### Endret
- **Læringsprogresjon**: Bedre integrasjon av sikkerhet og overvåking gjennom hele kurset
- **Dokumentasjonskvalitet**: Konsistente A-grad-standarder (95-97%) for nye leksjoner
- **Produksjonsmønstre**: Full end-to-end dekning for bedriftsdistribusjoner

#### Forbedret
- **Utvikleropplevelse**: Klar vei fra utvikling til produksjonsovervåking
- **Sikkerhetsstandarder**: Profesjonelle mønstre for autentisering og hemmelighetshåndtering
- **Observerbarhet**: Fullstendig Application Insights-integrasjon med AZD
- **AI-arbeidsbelastninger**: Spesialisert overvåking for Azure OpenAI og multi-agent-systemer

#### Validert
- ✅ Alle leksjoner inkluderer fullstendig fungerende kode (ikke utsnitt)
- ✅ Mermaid-diagrammer for visuell læring (19 totalt på tvers av 3 leksjoner)
- ✅ Praktiske øvelser med verifiseringstrinn (9 totalt)
- ✅ Produksjonsklare Bicep-maler deployerbare via `azd up`
- ✅ Kostnadsanalyse og optimaliseringsstrategier
- ✅ Feilsøkingsguider og beste praksiser
- ✅ Kunnskapssjekker med verifiseringskommandoer

#### Dokumentasjonsresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvåkingsguide
- **docs/getting-started/authsecurity.md**: - Profesjonelle sikkerhetsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avanserte multi-agent-arkitekturer
- **Totalt nytt innhold**: - Konsistente høykvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + tilpasset telemetri + distribuert tracing
- **Autentisering**: Administrert identitet + Key Vault + RBAC-mønstre
- **Multi-agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvåking**: Live metrikker + Kusto-forespørsler + varsler + dashbord
- **Kostnadsstyring**: Sampling, retensjonspolitikker, budsjettkontroller

### [v3.7.0] - 2025-11-19

#### Dokumentasjonsforbedringer og nytt Azure OpenAI-eksempel
**Denne versjonen forbedrer dokumentasjonskvaliteten i hele repositoriet og legger til et komplett Azure OpenAI-distribusjonseksempel med GPT-4 chatgrensesnitt.**

#### Lagt til
- **🤖 Azure OpenAI Chat-eksempel**: Komplett GPT-4-distribusjon med fungerende implementering i `examples/azure-openai-chat/`:
  - Full Azure OpenAI-infrastruktur (GPT-4 modell distribusjon)
  - Python kommandolinje-chatgrensesnitt med samtalehistorikk
  - Key Vault-integrasjon for sikker API-nøkkellagring
  - Tokenbrukssporing og kostnadsestimering
  - Hastighetsbegrensning og feilhåndtering
  - Omfattende README med 35-45 minutters deployeringsveiledning
  - 11 produksjonsklare filer (Bicep-maler, Python-app, konfigurasjon)
- **📚 Dokumentasjonsøvelser**: Lagt til praktiske øvelser i konfigurasjonsveiledningen:
  - Øvelse 1: Konfigurasjon for flere miljøer (15 minutter)
  - Øvelse 2: Øvelse i hemmelighetshåndtering (10 minutter)
  - Klare suksesskriterier og verifiseringstrinn
- **✅ Distribusjonsverifisering**: Lagt til verifikasjonsseksjon i deployeringsguide:
  - Helsesjekkprosedyrer
  - Suksesskriterier sjekkliste
  - Forventede utdata for alle deployeringskommandoer
  - Rask feilsøking

#### Forbedret
- **examples/README.md**: Oppdatert til A-grad kvalitet (93%):
  - Lagt til azure-openai-chat i alle relevante seksjoner
  - Oppdatert antall lokale eksempler fra 3 til 4
  - Lagt til i AI Application Examples-tabellen
  - Integrert i Hurtigstart for mellomliggende brukere
  - Lagt til i Microsoft Foundry Templates-seksjonen
  - Oppdatert sammenligningsmatrise og teknologifinneseksjoner
- **Dokumentasjonskvalitet**: Forbedret fra B+ (87%) til A- (92%) i docs-mappen:
  - Lagt til forventede utdata på kritiske kommandoeksempler
  - Inkludert verifiseringstrinn for konfigurasjonsendringer
  - Forbedret praktisk læring med øvelser

#### Endret
- **Læringsprogresjon**: Bedre integrasjon av AI-eksempler for mellomliggende brukere
- **Dokumentasjonsstruktur**: Mer handlingsorienterte øvelser med klare resultater
- **Verifiseringsprosess**: Eksplisitte suksesskriterier lagt til viktige arbeidsflyter

#### Forbedret
- **Utvikleropplevelse**: Azure OpenAI-distribusjon tar nå 35-45 minutter (mot 60-90 for komplekse alternativer)
- **Kostnadstransparens**: Klare kostnadsestimater ($50-200/måned) for Azure OpenAI-eksempel
- **Læringssti**: AI-utviklere har klart inngangspunkt med azure-openai-chat
- **Dokumentasjonsstandarder**: Konsistente forventede utdata og verifiseringstrinn

#### Validert
- ✅ Azure OpenAI-eksempel fullt funksjonelt med `azd up`
- ✅ Alle 11 implementasjonsfiler syntaktisk korrekte
- ✅ README-instruksjoner stemmer med faktisk deployeringsopplevelse
- ✅ Dokumentasjonslenker oppdatert på over 8 steder
- ✅ Eksempelliste nøyaktig med 4 lokale eksempler
- ✅ Ingen dupliserte eksterne lenker i tabeller
- ✅ Alle navigasjonsreferanser korrekte

#### Teknisk implementering
- **Azure OpenAI-arkitektur**: GPT-4 + Key Vault + Container Apps-mønster
- **Sikkerhet**: Klar for administrert identitet, hemmeligheter i Key Vault
- **Overvåking**: Application Insights-integrasjon
- **Kostnadsstyring**: Token-sporing og optimalisering
- **Distribusjon**: Enkelt `azd up`-kommando for full oppsett

### [v3.6.0] - 2025-11-19

#### Stor oppdatering: Container App distribusjonseksempler
**Denne versjonen introduserer omfattende, produksjonsklare container-applikasjonsdistribusjonseksempler ved bruk av Azure Developer CLI (AZD), med full dokumentasjon og integrering i læringsstien.**

#### Lagt til
- **🚀 Container App-eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett oversikt over containerdistribusjoner, hurtigstart, produksjon og avanserte mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybegynnervennlig REST API med scale-to-zero, helsekontroller, overvåking og feilsøking
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices): Produksjonsklar fler-tjenestedistribusjon (API Gateway, Produkt, Ordre, Bruker, Notifikasjon), asynkron meldingshåndtering, Service Bus, Cosmos DB, Azure SQL, distribuert tracing, blå-grønn/canary distribusjon
- **Beste praksiser**: Sikkerhet, overvåking, kostnadsoptimalisering og CI/CD-veiledning for containeriserte arbeidsbelastninger
- **Kodeeksempler**: Komplett `azure.yaml`, Bicep-maler og servicetjeneste-implementeringer i flere språk (Python, Node.js, C#, Go)
- **Testing & feilsøking**: Helhetlige testscenarier, overvåkingskommandoer, feilsøkingsveiledning

#### Endret
- **README.md**: Oppdatert for å vise og lenke til nye container app-eksempler under "Local Examples - Container Applications"
- **examples/README.md**: Oppdatert for å fremheve container app-eksempler, legge til oppføringer i sammenligningsmatrise og oppdatere teknologi-/arkitekturreferanser
- **Kursoversikt og Studieveiledning**: Oppdatert for å referere til nye eksempler på containerapper og distribusjonsmønstre i relevante kapitler

#### Validert
- ✅ Alle nye eksempler kan deployeres med `azd up` og følger beste praksis
- ✅ Dokumentasjonskryssreferanser og navigasjon oppdatert
- ✅ Eksemplene dekker nybegynner til avanserte scenarier, inkludert produksjonsmikrotjenester

#### Notater
- **Omfang**: Kun engelsk dokumentasjon og eksempler
- **Neste trinn**: Utvide med flere avanserte containermønstre og CI/CD-automatisering i fremtidige utgivelser

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry  
**Denne versjonen implementerer en omfattende produktnavneendring fra "Microsoft Foundry" til "Microsoft Foundry" i all engelsk dokumentasjon, som reflekterer Microsofts offisielle rebranding.**

#### Endret
- **🔄 Oppdatering av produktnavn**: Full rebranding fra "Microsoft Foundry" til "Microsoft Foundry"
  - Oppdaterte alle referanser i engelsk dokumentasjon i `docs/`-mappen
  - Omdøpte mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøpte fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innholdsreferanser oppdatert i 7 dokumentasjonsfiler

- **📁 Endringer i mappestruktur**:
  - `docs/ai-foundry/` omdøpt til `docs/microsoft-foundry/`
  - Alle kryssreferanser oppdatert for å reflektere ny mappestruktur
  - Navigasjonslenker validert i all dokumentasjon

- **📄 Filnavn endret**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne lenker oppdatert for å peke til nytt filnavn

#### Oppdaterte filer
- **Kapitteldokumentasjon** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigasjonslenker oppdatert
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnreferanser oppdatert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bruker allerede Microsoft Foundry (fra tidligere oppdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referanser oppdatert (oversikt, samfunnsfeedback, dokumentasjon)
  - `docs/getting-started/azd-basics.md` - 4 kryssreferanselenker oppdatert
  - `docs/getting-started/first-project.md` - 2 kapittelnavigasjonslenker oppdatert
  - `docs/getting-started/installation.md` - 2 lenker til neste kapittel oppdatert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referanser oppdatert (navigasjon, Discord-fellesskap)
  - `docs/troubleshooting/common-issues.md` - 1 navigasjonslenke oppdatert
  - `docs/troubleshooting/debugging.md` - 1 navigasjonslenke oppdatert

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referanser oppdatert (kursoversikt, kapitteltitler, mal-seksjon, samfunnsinnsikt)
  - `course-outline.md` - 14 referanser oppdatert (oversikt, læringsmål, kapittelressurser)

#### Validert
- ✅ Null gjenværende "ai-foundry" mappesti-referanser i engelsk dokumentasjon
- ✅ Null gjenværende "Microsoft Foundry" produktnavnreferanser i engelsk dokumentasjon
- ✅ Alle navigasjonslenker fungerer med ny mappestruktur
- ✅ Fil- og mappenavnendringer fullført vellykket
- ✅ Kryssreferanser mellom kapitler validert

#### Notater
- **Omfang**: Endringer gjelder kun engelsk dokumentasjon i `docs/`-mappen
- **Oversettelser**: Oversettelsesmappene (`translations/`) er ikke oppdatert i denne versjonen
- **Workshop**: Workshop-materiale (`workshop/`) er ikke oppdatert i denne versjonen
- **Eksempler**: Eksempelfiler kan fortsatt referere til gammelt navn (skal håndteres i fremtidig oppdatering)
- **Eksterne lenker**: Eksterne URL-er og GitHub-repositorium-referanser er uendret

#### Migrasjonsveiledning for bidragsytere  
Hvis du har lokale grener eller dokumentasjon som refererer til gammel struktur:  
1. Oppdater mappe-referanser: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. Oppdater filreferanser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. Erstatt produktnavn: "Microsoft Foundry" → "Microsoft Foundry"  
4. Valider at alle interne dokumentasjonslenker fortsatt fungerer

---

### [v3.4.0] - 2025-10-24

#### Forhåndsvisning og valideringsforbedringer for infrastruktur  
**Denne versjonen introduserer omfattende støtte for den nye forhåndsvisningsfunksjonen i Azure Developer CLI og forbedrer brukeropplevelsen i workshop.**

#### La til
- **🧪 azd provision --preview funskjonsdokumentasjon**: Omfattende dekning av ny infrastrukturforhåndsvisningskapasitet
  - Kommandoreferanse og bruks-eksempler i jukselapp
  - Detaljert integrasjon i provisioning-guide med bruksområder og fordeler
  - Pre-flight sjekk integrert for sikrere deployvalidering
  - Oppdateringer til kom-i-gang-guide med sikkerhetsfokusert deploypraksis
- **🚧 Workshop-statusbanner**: Profesjonelt HTML-banner som viser workshopens utviklingsstatus
  - Gradientdesign med byggeindikatorer for tydelig brukerkommunikasjon
  - Sist oppdatert-tidsstempel for åpenhet
  - Mobilresponsivt design for alle enhetstyper

#### Forbedret
- **Infrastruktursikkerhet**: Forhåndsvisningsfunksjonalitet integrert gjennom hele distribusjonsdokumentasjonen
- **Validering før distribusjon**: Automatiserte skript inkluderer nå infrastrukturforhåndsvisningstesting
- **Utviklerarbeidsflyt**: Oppdaterte kommandosekvenser som inkluderer forhåndsvisning som beste praksis
- **Workshop-opplevelse**: Klare forventninger satt til brukere om innholdets utviklingsstatus

#### Endret
- **Beste praksis for distribusjon**: Forhåndsvisning-først arbeidsflyt nå anbefalt fremgangsmåte
- **Dokumentasjonsflyt**: Infrastrukturvalidering flyttet tidligere i læringsløpet
- **Workshop-presentasjon**: Profesjonell statuskommunikasjon med tydelig utviklingstidslinje

#### Forbedret
- **Sikkerhetsfokusert tilnærming**: Infrastrukturendringer kan valideres før distribusjon
- **Team-samarbeid**: Resultater fra forhåndsvisning kan deles for gjennomgang og godkjenning
- **Kostnadsbevissthet**: Bedre forståelse av ressurskostnader før provisioning
- **Risikoavlastning**: Reduserte deployfeil gjennom forhåndsvalidering

#### Teknisk implementering
- **Multi-dokumentintegrasjon**: Forhåndsvisning dokumentert på tvers av 4 nøkkelfiler
- **Kommandomønstre**: Konsistent syntaks og eksempler i dokumentasjonen
- **Beste-praksis-integrasjon**: Forhåndsvisning inkludert i valideringsarbeidsflyter og skript
- **Visuelle indikatorer**: Klare NYE funksjonsmarkeringer for oppdagbarhet

#### Workshop-infrastruktur
- **Statuskommunikasjon**: Profesjonelt HTML-banner med gradientstil
- **Brukeropplevelse**: Klar utviklingsstatus hindrer forvirring
- **Profesjonell presentasjon**: Opprettholder repositoriekredibilitet samtidig som forventninger settes
- **Tidslinjeåpenhet**: Sist oppdatert oktober 2025-tidsstempel for ansvarlighet

### [v3.3.0] - 2025-09-24

#### Forbedret workshop-materiale og interaktiv læringsopplevelse  
**Denne versjonen introduserer omfattende workshop-materiale med nettleserbaserte interaktive guider og strukturerte læringsløp.**

#### La til
- **🎥 Interaktiv workshop-guide**: Nettleserbasert workshop-opplevelse med MkDocs-forhåndsvisning
- **📝 Strukturert workshop-instruksjon**: 7-trinns veiledet læringsløp fra oppdagelse til tilpasning
  - 0-Introduksjon: Workshopoversikt og oppsett
  - 1-Select-AI-Template: Maloppdagelse og valgprosess
  - 2-Validate-AI-Template: Distribusjon og valideringsprosedyrer
  - 3-Deconstruct-AI-Template: Forståelse av malarkitektur
  - 4-Configure-AI-Template: Konfigurasjon og tilpasning
  - 5-Customize-AI-Template: Avanserte modifikasjoner og iterasjoner
  - 6-Teardown-Infrastructure: Opprydding og ressursstyring
  - 7-Wrap-up: Oppsummering og neste trinn
- **🛠️ Workshop-verktøy**: MkDocs-konfigurasjon med Material-tema for forbedret læringsopplevelse
- **🎯 Praktisk læringsløp**: 3-trinns metodikk (Oppdagelse → Distribusjon → Tilpasning)
- **📱 GitHub Codespaces-integrasjon**: Sømløst oppsett av utviklingsmiljø

#### Forbedret
- **AI Workshop Lab**: Utvidet med omfattende 2-3 timers strukturert læringsopplevelse
- **Workshop-dokumentasjon**: Profesjonell presentasjon med navigasjon og visuelle hjelpemidler
- **Læringsprogresjon**: Klar steg-for-steg veiledning fra malvalg til produksjonsdistribusjon
- **Utvikleropplevelse**: Integrerte verktøy for strømlinjeformede utviklingsarbeidsflyter

#### Forbedret
- **Tilgjengelighet**: Nettlesergrensesnitt med søk, kopieringsfunksjonalitet og temavelger
- **Selvstyrt læring**: Fleksibel workshopstruktur som tilpasses ulik læringshastighet
- **Praktisk anvendelse**: Virkelige AI-mal-distribusjonsscenarier
- **Fellesskapsintegrasjon**: Discord-integrasjon for workshop-støtte og samarbeid

#### Workshopfunksjoner
- **Innebygd søk**: Rask søking etter nøkkelord og leksjoner
- **Kopieringsknapper for kodeblokker**: Hover-for-kopier-funksjon for alle kodeeksempler
- **Temavelger**: Støtte for mørk/lys modus etter preferanse
- **Visuelle ressurser**: Skjermbilder og diagrammer for bedre forståelse
- **Hjelpeintegrasjon**: Direkte tilgang til Discord for fellesskapsstøtte

### [v3.2.0] - 2025-09-17

#### Stor omstrukturering av navigasjon og kapitellæringssystem  
**Denne versjonen introduserer en omfattende kapittelbasert læringsstruktur med forbedret navigasjon gjennom hele repositoriet.**

#### La til
- **📚 Kapittelbasert læringssystem**: Hele kurset omstrukturert til 8 progressive læringskapitler
  - Kapittel 1: Grunnlag og hurtigstart (⭐ - 30-45 min)
  - Kapittel 2: AI-først-utvikling (⭐⭐ - 1-2 timer)
  - Kapittel 3: Konfigurasjon og autentisering (⭐⭐ - 45-60 min)
  - Kapittel 4: Infrastruktur som kode og distribusjon (⭐⭐⭐ - 1-1,5 time)
  - Kapittel 5: Multi-agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapittel 6: Validering og planlegging før distribusjon (⭐⭐ - 1 time)
  - Kapittel 7: Feilsøking og debugging (⭐⭐ - 1-1,5 time)
  - Kapittel 8: Produksjon og bedriftsmønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigasjonssystem**: Konsistente navigasjonshoder og -føtter på tvers av all dokumentasjon
- **🎯 Progresjonssporing**: Kursfullføringssjekkliste og læringsverifiseringssystem
- **🗺️ Læringsløpsveiledning**: Klare inngangspunkter for ulike erfaringsnivåer og mål
- **🔗 Kryssreferanse-navigasjon**: Relaterte kapitler og forutsetninger tydelig lenket

#### Forbedret
- **README-struktur**: Omformet til en strukturert læringsplattform med kapittelbasert organisasjon
- **Dokumentasjonsnavigasjon**: Hver side inkluderer nå kapittelkontekst og progresjonsveiledning
- **Malorganisering**: Eksempler og maler kartlagt til riktige læringskapitler
- **Ressursintegrasjon**: Jukseark, FAQ og studieveiledninger knyttet til relevante kapitler
- **Workshop-integrasjon**: Praktiske laboratorier kartlagt til flere kapittellæringsmål

#### Endret
- **Læringsprogresjon**: Flyttet fra lineær dokumentasjon til fleksibel kapittelbasert læring
- **Konfigurasjonsplassering**: Omplassert konfigurasjonsveiledning til kapittel 3 for bedre flyt
- **AI-innholdsintegrasjon**: Bedre integrasjon av AI-spesifikt innhold gjennom hele læringsløpet
- **Produksjonsinnhold**: Avanserte mønstre konsolidert i kapittel 8 for bedriftsbrukere

#### Forbedret
- **Brukeropplevelse**: Klare navigasjonsstier og kapittelprogresjonsindikatorer
- **Tilgjengelighet**: Konsistente navigasjonsmønstre for enklere kursgjennomføring
- **Profesjonell presentasjon**: Universitetslignende kursstruktur egnet for akademisk og bedriftsopplæring
- **Læringseffektivitet**: Kortere tid til å finne relevant innhold gjennom bedre organisering

#### Teknisk implementering
- **Navigasjonshoder**: Standardisert kapittelnavigasjon i 40+ dokumentasjonsfiler
- **Navigasjonsfot**: Konsistent progresjonsveiledning og kapittelfullføringsindikatorer
- **Krysslenking**: Omfattende intern lenkesystem som forbinder relaterte konsepter
- **Kapittelkartlegging**: Maler og eksempler tydelig knyttet til læringsmål

#### Forbedring av studieveiledning
- **📚 Omfattende læringsmål**: Omstrukturert studieveiledning for å samsvare med 8-kapittelssystemet
- **🎯 Kapittelbasert vurdering**: Hvert kapittel inneholder spesifikke læringsmål og praktiske oppgaver
- **📋 Progresjonssporing**: Ukentlig læringsplan med målbare resultater og fullføringssjekklister
- **❓ Vurderingsspørsmål**: Kunnskapsvalideringsspørsmål for hvert kapittel med profesjonelle resultater
- **🛠️ Praktiske øvelser**: Hands-on-aktiviteter med ekte distribusjonsscenarier og feilsøking
- **📊 Ferdighetsprogresjon**: Klar utvikling fra grunnleggende konsepter til bedriftsmønstre med karrierefokus
- **🎓 Sertifiseringsrammeverk**: Profesjonelle utviklingsresultater og system for fellesskapsanerkjennelse
- **⏱️ Tidsledelse**: Strukturert 10-ukers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede Multi-Agent AI-løsninger  
**Denne versjonen forbedrer multi-agent retail-løsningen med bedre agentnavn og forbedret dokumentasjon.**

#### Endret
- **Multi-agent terminologi**: Erstattet "Cora agent" med "Customer agent" i hele retail multi-agent-løsningen for klarere forståelse
- **Agentarkitektur**: Oppdatert all dokumentasjon, ARM-maler og kodeeksempler til å bruke konsekvent "Customer agent"-navngivning
- **Konfigurasjonseksempler**: Moderniserte agentkonfigurasjonsmønstre med oppdaterte navnekonvensjoner
- **Dokumentasjonskonsistens**: Sikret at alle referanser bruker profesjonelle, beskrivende agentnavn

#### Forbedret
- **ARM-malpakke**: Oppdatert retail-multiagent-arm-mal med Customer agent-referanser
- **Arkitekturdiagrammer**: Oppfriskede Mermaid-diagrammer med oppdaterte agentnavn
- **Kodeeksempler**: Python-klasser og implementasjonseksempler bruker nå CustomerAgent-navngivning
- **Miljøvariabler**: Oppdatert alle deploy-skript til å bruke CUSTOMER_AGENT_NAME-konvensjoner

#### Forbedret
- **Utvikleropplevelse**: Klarere agentroller og ansvarsområder i dokumentasjonen  
- **Produksjonsberedskap**: Bedre tilpasning til virksomhetens navnekonvensjoner  
- **Læringsmateriell**: Mer intuitiv agentnavngivning for pedagogiske formål  
- **Malbrukervennlighet**: Forenklet forståelse av agentfunksjoner og distribusjonsmønstre  

#### Tekniske detaljer  
- Oppdaterte Mermaid-arkitekturdiagrammer med CustomerAgent-referanser  
- Erstattet CoraAgent-klassenavn med CustomerAgent i Python-eksempler  
- Endret ARM-malat JSON-konfigurasjoner til å bruke "customer" agent-type  
- Oppdaterte miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre  
- Oppfrisket alle distribusjonskommandoer og containerkonfigurasjoner  

### [v3.0.0] - 2025-09-12  

#### Store endringer - Fokus på AI-utviklere og Microsoft Foundry-integrasjon  
**Denne versjonen gjør depotet om til en omfattende AI-fokusert læringsressurs med Microsoft Foundry-integrasjon.**  

#### Lagt til  
- **🤖 AI-Første Læringssti**: Fullstendig omstrukturering med prioritet på AI-utviklere og ingeniører  
- **Microsoft Foundry Integrasjonsguide**: Omfattende dokumentasjon for tilkobling av AZD til Microsoft Foundry-tjenester  
- **AI Modellutsettingsmønstre**: Detaljert veiledning om modellvalg, konfigurasjon og produksjonsutrullingsstrategier  
- **AI Workshop-Lab**: 2-3 timers praktisk workshop for konvertering av AI-applikasjoner til AZD-distribuerbare løsninger  
- **Produksjons AI Beste Praksis**: Enterprise-klare mønstre for skalering, overvåking og sikring av AI-arbeidsbelastninger  
- **AI-Spesifikk Feilsøkingsguide**: Omfattende feilsøking for Azure OpenAI, Cognitive Services og AI-distribusjonsproblemer  
- **AI Malgalleri**: Utvalgt samling av Microsoft Foundry-maler med kompleksitetsvurderinger  
- **Workshop Materialer**: Fullstendig workshopstruktur med praktiske laboratorier og referansemateriell  

#### Forbedret  
- **README-struktur**: AI-utviklerfokusert med 45 % samfunnsinteressedata fra Microsoft Foundry Discord  
- **Læringsstier**: Dedikert AI-utviklerreise ved siden av tradisjonelle stier for studenter og DevOps-ingeniører  
- **Mal Anbefalinger**: Fremhevede AI-maler inkludert azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart  
- **Samfunnsintegrasjon**: Forbedret Discord-samfunnsstøtte med AI-spesifikke kanaler og diskusjoner  

#### Sikkerhet og produksjonsfokus  
- **Administrerte Identitetsmønstre**: AI-spesifikke autentiserings- og sikkerhetskonfigurasjoner  
- **Kostnadsoptimalisering**: Sporing av tokenbruk og budsjettkontroller for AI-arbeidsbelastninger  
- **Distribusjon i flere regioner**: Strategier for global AI-applikasjonsutrulling  
- **Ytelsesovervåking**: AI-spesifikke måleparametere og Application Insights-integrasjon  

#### Dokumentasjonskvalitet  
- **Linear Kursstruktur**: Logisk progresjon fra nybegynner til avanserte AI-utrullingsmønstre  
- **Validerte URL-er**: Alle eksterne depotlenker verifisert og tilgjengelige  
- **Fullstendig Referanse**: Alle interne dokumentasjonslenker validert og funksjonelle  
- **Produksjonsklar**: Enterprise-distribusjonsmønstre med virkelighetseksempler  

### [v2.0.0] - 2025-09-09  

#### Store endringer - Omstrukturering av depot og profesjonell forbedring  
**Denne versjonen representerer en betydelig overhaling av depotsstruktur og innholdspresentasjon.**  

#### Lagt til  
- **Strukturert læringsrammeverk**: Alle dokumentasjonssider inkluderer nå Introduksjon, Læringsmål og Læringsresultater  
- **Navigasjonssystem**: La til Forrige/Neste leksjonslenker gjennom hele dokumentasjonen for veiledet læringsflyt  
- **Studieveiledning**: Omfattende study-guide.md med læringsmål, øvingsoppgaver og vurderingsmateriell  
- **Profesjonell presentasjon**: Fjernet alle emoji-ikoner for bedre tilgjengelighet og profesjonelt utseende  
- **Forbedret innholdsstruktur**: Bedre organisering og flyt i læringsmateriell  

#### Endret  
- **Dokumentasjonsformat**: Standardisert all dokumentasjon med konsekvent læringsfokusert struktur  
- **Navigasjonsflyt**: Implementert logisk progresjon gjennom alt læringsmateriell  
- **Innholdspresentasjon**: Fjernet dekorative elementer til fordel for klar, profesjonell formatering  
- **Lenkestruktur**: Oppdaterte alle interne lenker for å støtte nytt navigasjonssystem  

#### Forbedret  
- **Tilgjengelighet**: Fjernet emoji-avhengigheter for bedre støtte til skjermlesere  
- **Profesjonelt utseende**: Ren, akademisk stil presentasjon egnet for virksomhetslæring  
- **Læringsopplevelse**: Strukturert tilnærming med klare mål og resultater for hver leksjon  
- **Innholdsorganisering**: Bedre logisk flyt og kobling mellom relaterte emner  

### [v1.0.0] - 2025-09-09  

#### Første utgivelse - Omfattende AZD læringsdepot  

#### Lagt til  
- **Kjernedokumentasjonsstruktur**  
  - Komplett kom-i-gang guide-serie  
  - Utførlig dokumentasjon av distribusjon og provisjonering  
  - Detaljerte feilsøkingsressurser og debug-veiledninger  
  - Verktøy og prosedyrer for validering før distribusjon  

- **Kom-i-gang-modul**  
  - AZD Grunnleggende: Kjernkonsepter og terminologi  
  - Installajonsveiledning: Plattformspesifikk oppsettinstruksjon  
  - Konfigurasjonsguide: Miljøoppsett og autentisering  
  - Første prosjektveiledning: Steg-for-steg praktisk læring  

- **Distribusjon og provisjonering-modul**  
  - Distribusjonsguide: Komplett arbeidsflytdokumentasjon  
  - Provisjoneringsguide: Infrastruktur som kode med Bicep  
  - Beste praksis for produksjonsdistribusjon  
  - Arkitektur-mønstre for flertjenestearkitektur  

- **Validering før distribusjon-modul**  
  - Kapasitetsplanlegging: Validering av Azure-ressursers tilgjengelighet  
  - SKU-valg: Omfattende veiledning for tjenestenivå  
  - Forhåndssjekker: Automatiserte valideringsskript (PowerShell og Bash)  
  - Kostnadsestimering og budsjettplanleggingsverktøy  

- **Feilsøkingsmodul**  
  - Vanlige problemer: Hyppig forekommende problemer og løsninger  
  - Debuggingguide: Systematiske feilsøkingsmetoder  
  - Avanserte diagnostiske teknikker og verktøy  
  - Ytelsesovervåking og optimalisering  

- **Ressurser og referanser**  
  - Kommandooversikt: Rask referanse for essensielle kommandoer  
  - Ordliste: Utfyllende terminologier og akronymforklaringer  
  - FAQ: Detaljerte svar på vanlige spørsmål  
  - Eksterne ressurslenker og samfunnskontakter  

- **Eksempler og maler**  
  - Enkelt webapplikasjonseksempel  
  - Statisk nettsidedistribusjonsmal  
  - Containerapplikasjonskonfigurasjon  
  - Databaseintegrasjonsmønstre  
  - Mikroservicearkitektureksempler  
  - Serverløse funksjonsimplementasjoner  

#### Funksjoner  
- **Multi-plattform støtte**: Installajons- og konfigurasjonsveiledninger for Windows, macOS og Linux  
- **Flere ferdighetsnivåer**: Innhold designet for studenter til profesjonelle utviklere  
- **Praktisk fokus**: Hånd-på-eksempler og virkelighetsnære scenarioer  
- **Omfattende dekning**: Fra grunnleggende konsepter til avanserte virksomhetsmønstre  
- **Sikkerhetsfokus**: Sikkerhets beste praksis integrert overalt  
- **Kostnadsoptimalisering**: Veiledning for kostnadseffektive distribusjoner og ressursstyring  

#### Dokumentasjonskvalitet  
- **Detaljerte kodeeksempler**: Praktiske, testede kodeeksempler  
- **Trinnvise instrukser**: Klare, handlingsrettede veiledninger  
- **Omfattende feilbehandling**: Feilsøking for vanlige problemer  
- **Integrering av beste praksis**: Bransjestandarder og anbefalinger  
- **Versjonskompatibilitet**: Oppdatert med nyeste Azure-tjenester og azd-funksjoner  

## Planlagte fremtidige forbedringer  

### Versjon 3.1.0 (Planlagt)  
#### Utvidelse av AI-plattform  
- **Multi-modell støtte**: Integrasjonsmønstre for Hugging Face, Azure Machine Learning og egendefinerte modeller  
- **AI Agent-rammeverk**: Maler for LangChain, Semantic Kernel og AutoGen-distribusjoner  
- **Avanserte RAG-mønstre**: Vektor databasesystemer utover Azure AI Search (Pinecone, Weaviate, etc.)  
- **AI Observability**: Forbedret overvåking av modellprestasjon, tokenbruk og responskvalitet  

#### Utvikleropplevelse  
- **VS Code-utvidelse**: Integrert AZD + AI Foundry utvikleropplevelse  
- **GitHub Copilot-integrasjon**: AI-assistert generering av AZD-maler  
- **Interaktive tutorials**: Praktiske kodingøvelser med automatisert validering for AI-scenarier  
- **Videoinnhold**: Supplerende videotutorials for visuelle lærende med fokus på AI-distribusjoner  

### Versjon 4.0.0 (Planlagt)  
#### Enterprise AI-mønstre  
- **Styringsrammeverk**: AI-modellstyring, samsvar og revisjonsspor  
- **Multi-leietaker AI**: Mønstre for å betjene flere kunder med isolerte AI-tjenester  
- **Edge AI-distribusjon**: Integrasjon med Azure IoT Edge og containerinstanser  
- **Hybrid Cloud AI**: Multi-cloud og hybrid distribusjon for AI-arbeidsbelastninger  

#### Avanserte funksjoner  
- **AI Pipeline-automatisering**: MLOps-integrasjon med Azure Machine Learning pipelines  
- **Avansert sikkerhet**: Zero-trust-mønstre, private endepunkter og avansert trusselbeskyttelse  
- **Ytelsesoptimalisering**: Avansert tuning og skaleringsstrategier for AI-applikasjoner med høy gjennomstrømning  
- **Global distribusjon**: Innholdslevering og edge caching-mønstre for AI-applikasjoner  

### Versjon 3.0.0 (Planlagt) - Overtatt av nåværende utgivelse  
#### Foreslåtte tillegg - Nå implementert i v3.0.0  
- ✅ **AI-fokusert innhold**: Omfattende Microsoft Foundry-integrasjon (Fullført)  
- ✅ **Interaktive tutorials**: Praktisk AI workshop-lab (Fullført)  
- ✅ **Avansert sikkerhetsmodul**: AI-spesifikke sikkerhetsmønstre (Fullført)  
- ✅ **Ytelsesoptimalisering**: AI arbeidsbelastningsjusteringsstrategier (Fullført)  

### Versjon 2.1.0 (Planlagt) - Delvis implementert i v3.0.0  
#### Mindre forbedringer - Noen fullført i nåværende utgivelse  
- ✅ **Flere eksempler**: AI-fokuserte distribusjonsscenarier (Fullført)  
- ✅ **Utvidet FAQ**: AI-spesifikke spørsmål og feilsøking (Fullført)  
- **Verktøy-integrasjon**: Forbedrede IDE- og editor-integrasjonsguider  
- ✅ **Utvidet overvåking**: AI-spesifikke overvåkings- og varslingsmønstre (Fullført)  

#### Fremdeles planlagt for fremtidig utgivelse  
- **Mobilvennlig dokumentasjon**: Responsivt design for mobil læring  
- **Offline-tilgang**: Nedlastbare dokumentasjonspakker  
- **Forbedret IDE-integrasjon**: VS Code-utvidelse for AZD + AI arbeidsflyter  
- **Samfunnsdashboard**: Sanntids samfunnsdata og bidragsoppfølging  

## Å bidra til changelog  

### Rapportering av endringer  
Når du bidrar til dette depotet, vennligst sikre at changelog-oppføringer inkluderer:  

1. **Versjonsnummer**: Følger semantisk versjonering (major.minor.patch)  
2. **Dato**: Utgivelses- eller oppdateringsdato i formatet ÅÅÅÅ-MM-DD  
3. **Kategori**: Lagt til, Endret, Utdaterte, Fjernet, Fikset, Sikkerhet  
4. **Tydelig beskrivelse**: Kortfattet beskrivelse av hva som endret seg  
5. **Virkningsevaluering**: Hvordan endringene påvirker eksisterende brukere  

### Endringskategorier  

#### Lagt til  
- Nye funksjoner, dokumentasjonsseksjoner eller kapasiteter  
- Nye eksempler, maler eller læringsressurser  
- Flere verktøy, skript eller programvarer  

#### Endret  
- Endringer i eksisterende funksjonalitet eller dokumentasjon  
- Oppdateringer for å forbedre klarhet eller nøyaktighet  
- Omstrukturering av innhold eller organisering  

#### Utdaterte  
- Funksjoner eller tilnærminger som fases ut  
- Dokumentasjonsseksjoner planlagt fjernet  
- Metoder som har bedre alternativer  

#### Fjernet  
- Funksjoner, dokumentasjon eller eksempler som ikke lenger er relevante  
- Utdatert informasjon eller utdaterte tilnærminger  
- Overflødig eller konsolidert innhold  

#### Fikset  
- Rettelser av feil i dokumentasjon eller kode  
- Løste rapporterte problemer eller feil  
- Forbedringer i nøyaktighet eller funksjonalitet  

#### Sikkerhet  
- Sikkerhetsrelaterte forbedringer eller fikser  
- Oppdateringer av beste sikkerhetspraksis  
- Løsning av sikkerhetssårbarheter  

### Retningslinjer for semantisk versjonering  

#### Hovedversjon (X.0.0)  
- Brytende endringer som krever brukerhandling  
- Betydelig omstrukturering av innhold eller organisasjon  
- Endringer som endrer den fundamentale tilnærmingen eller metodologien  

#### Mindre versjon (X.Y.0)  
- Nye funksjoner eller innholds tillegg  
- Forbedringer som opprettholder bakoverkompatibilitet  
- Flere eksempler, verktøy eller ressurser  

#### Patch-versjon (X.Y.Z)  
- Feilrettinger og korrigeringer  
- Mindre forbedringer i eksisterende innhold  
- Klargjøringer og små forbedringer  

## Samfunnets tilbakemelding og forslag  

Vi oppfordrer aktivt tilbakemeldinger fra samfunnet for å forbedre denne læringsressursen:  

### Hvordan gi tilbakemelding  
- **GitHub Issues**: Rapportér problemer eller foreslå forbedringer (AI-spesifikke saker velkomne)  
- **Discord-diskusjoner**: Del ideer og engasjer deg i Microsoft Foundry-samfunnet  
- **Pull Requests**: Bidra med direkte forbedringer til innhold, spesielt AI-maler og guider  
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen for AZD + AI-diskusjoner  
- **Samfunnsfora**: Delta i bredere Azure-utviklerdiskusjoner  

### Tilbakemeldingskategorier  
- **AI-innholds nøyaktighet**: Korreksjoner for AI-tjenesteintegrasjon og distribusjonsinformasjon  
- **Læringsopplevelse**: Forslag for forbedret AI-utviklerlæringsflyt  
- **Manglende AI-innhold**: Forespørsler om flere AI-maler, mønstre eller eksempler  
- **Tilgjengelighet**: Forbedringer for ulike læringsbehov  
- **AI-verktøyintegrasjon**: Forslag til bedre AI-utviklingsarbeidsflytintegrasjon  
- **Produksjons AI-mønstre**: Enterprise AI distribusjonsmønster-forespørsler  

### Responsløfte  
- **Sakssvar**: Innen 48 timer for rapporterte problemer  
- **Funksjonsforespørsler**: Vurdering innen én uke  
- **Samfunnsbidrag**: Gjennomgang innen én uke  
- **Sikkerhetssaker**: Umiddelbar prioritet med hurtigsvar  

## Vedlikeholdsplan  

### Regelmessige oppdateringer  
- **Månedlige gjennomganger**: Innholdsnøyaktighet og lenkevalidering  
- **Kvartalsvise oppdateringer**: Store innholdsutvidelser og forbedringer  
- **Halvårlige gjennomganger**: Omfattende omstrukturering og forbedring  
- **Årlige utgivelser**: Store versjonsoppdateringer med betydelige forbedringer  

### Overvåking og kvalitetskontroll  
- **Automatisert testing**: Jevnlig validering av kodeeksempler og lenker  
- **Samfunnstilbakemeldingsintegrasjon**: Regelmessig innarbeiding av brukerforslag  
- **Teknologiske oppdateringer**: Justering til siste Azure-tjenester og azd-utgivelser  
- **Tilgjengelighetsrevisjoner**: Jevnlig gjennomgang for inkluderende designprinsipper  

## Versjonsstøttepolicy  

### Nåværende versjonsstøtte  
- **Nyeste hovedversjon**: Full støtte med regelmessige oppdateringer  
- **Forrige hovedversjon**: Sikkerhetsoppdateringer og kritiske feilrettinger i 12 måneder  
- **Eldre versjoner**: Kun samfunnsstøtte, ingen offisielle oppdateringer  

### Migreringsveiledning  
Når hovedversjoner slippes, tilbyr vi:
- **Migreringsguider**: Steg-for-steg overføringsinstruksjoner
- **Kompatibilitetsnotater**: Detaljer om bruddendringer
- **Verktøystøtte**: Skript eller verktøy for å hjelpe med migrering
- **Fellesskapsstøtte**: Dedikerte forum for migreringsspørsmål

---

**Navigasjon**
- **Forrige leksjon**: [Studieveiledning](resources/study-guide.md)
- **Neste leksjon**: Gå tilbake til [Hoved README](README.md)

**Hold deg oppdatert**: Følg dette depotet for varsler om nye utgivelser og viktige oppdateringer til læringsmaterialene.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på morsmålet bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->