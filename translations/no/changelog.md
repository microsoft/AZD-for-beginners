# Endringslogg - AZD For Beginners

## Introduksjon

Denne endringsloggen dokumenterer alle bemerkelsesverdige endringer, oppdateringer og forbedringer i AZD For Beginners-repositoriet. Vi følger prinsippene for semantisk versjonering og opprettholder denne loggen for å hjelpe brukere med å forstå hva som har endret seg mellom versjonene.

## Læringsmål

Ved å gå gjennom denne endringsloggen vil du:
- Holde deg informert om nye funksjoner og innholdsoppdateringer
- Forstå forbedringer gjort i eksisterende dokumentasjon
- Følge feilrettinger og korreksjoner for å sikre nøyaktighet
- Følge utviklingen av læringsmaterialene over tid

## Læringsresultater

Etter å ha gjennomgått endringsloggoppføringene vil du kunne:
- Identifisere nytt innhold og ressurser tilgjengelig for læring
- Forstå hvilke seksjoner som er oppdatert eller forbedret
- Planlegge din læringsvei basert på de mest oppdaterte materialene
- Bidra med tilbakemeldinger og forslag til fremtidige forbedringer

## Versjonshistorikk

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Malutforming, Dev Containers, Pulumi, Azure DevOps, Service Principals og Mer
**Denne versjonen lukker de gjenværende mellomliggende hullene som ble avdekket av azd-coverage-analysen: hvordan lage og publisere din egen mal, reproduserbare dev-container/Codespaces-miljøer, Pulumi infrastruktur-leverandøren, en Azure DevOps CI/CD gjennomgang, autentisering med service-prinsipper, veiledning om vertvalg (AKS/Spring Apps), forklaringer av `azd restore`/`azd package`, feilhåndtering for hooks, og praksis for team-/delt miljø.**

#### Lagt til
- **🧱 Nytt kapittel 4-leksjon** `docs/chapter-04-infrastructure/custom-templates.md` — lage din egen azd-mal: nødvendig struktur (`azure.yaml`, `infra/`, `src/`), `metadata.template`-feltet, parameterisering av infrastruktur med `uniqueString()` ressurs-token og `azd-env-name` tag, testing lokalt med `azd init --template <local-path>`, publisering til GitHub og innsendelse til Awesome AZD-galleriet
- **📦 Nytt kapittel 1-leksjon** `docs/chapter-01-foundation/dev-containers.md` — reproduserbare azd-miljøer med Dev Containers og GitHub Codespaces: minimal `.devcontainer/devcontainer.json` med den offisielle `ghcr.io/azure/azure-dev/azd` funksjonen, språkspesifikke funksjoner, `docker-in-docker` for container-verter, og `azd auth login --use-device-code` for fjerninnlogging
- **🧩 Pulumi med azd** seksjon i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi mappestruktur, stacks koblet til azd-miljøer, nødvendige outputs/tagging, og samme `azd up` / `azd down` arbeidsflyt
- **🎯 Veiledning for vertvalg** i `docs/chapter-04-infrastructure/provisioning.md` — en nybegynnervennlig sammenligning av `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, og `springapp`, med veiledning for når man skal velge AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD gjennomgang** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, tjenestetilkobling med workload identity federation (OIDC), generert `azure-dev.yml` og oppsett av variabelgruppe
- **🔑 Service Principals (Mønster 4)** lagt til i `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ikke-interaktiv `azd auth login` med klienthemmelighet vs. federerte/OIDC-legitimasjoner, når man skal bruke, og sikker lagring av legitimasjon
- **🪝 Feilhåndtering for hooks** underseksjon i `docs/chapter-04-infrastructure/deployment-guide.md` — exit-koder og `set -e`, `continueOnError`, testing av hooks isolert med `azd hooks run`, OS-spesifikke shell, og `--debug`
- **👥 Team / delte miljøer** seksjon i `docs/chapter-03-configuration/configuration.md` — hva som ligger i `.azure/`, hva som skal gitignes, miljøer per utvikler, `azd env list`/`select`, og å gi miljøverdier i CI/CD
- **🧰 Forklaringer om `azd restore` og utvidet `azd package`** i `resources/cheat-sheet.md` — gjenopprette avhengigheter og bygge deploybar artefakt uten å deployere

#### Endret
- **🧭 Kapittel 4 leksjonstabell** oppdatert til å inkludere den nye "Lage Din Egen Mal"-leksjonen (Leksjon 3)
- **🧭 Kapittel 1 leksjonstabell** oppdatert med den nye "Dev Containers & Codespaces"-leksjonen (Leksjon 5); navigasjonsfotere koblet mellom `bring-your-own-app.md` og `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Praktisk Multi-Agent Leksjon, "Bring Your Own App," Terraform og CI/CD Gjennomgang
**Denne versjonen lukker de største hullene for en komplett nybegynnerguide ved å legge til to nye praktiske leksjoner (en deploybar multi-agent gjennomgang og å legge til azd i en eksisterende app), en nybegynnervennlig introduksjon til hooks, en Terraform-med-azd seksjon, en steg-for-steg GitHub Actions pipeline gjennomgang, en forklaring for de nye forhåndsvisningsutvidelsene og en eksplisitt sjekkliste for verifisering av deploy.**

#### Lagt til
- **🤝 Nytt kapittel 5-leksjon** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en fullstendig praktisk, deploybar to-agent gjennomgang (orchestrator + spesialister) med en ekte mal (`contoso-creative-writer`), dekker når multi-agent skal brukes, `azd up` arbeidsflyt, forstå else deployerte ressurser, tverr-agent sporing, tilpasning og rydding
- **📦 Nytt kapittel 1-leksjon** `docs/chapter-01-foundation/bring-your-own-app.md` — hvordan legge til azd i et eksisterende prosjekt med `azd init` ("bruk kode i gjeldende katalog"), forstå `azure.yaml` og `infra/`, `azd infra generate`, vertdeteksjon, og deploy med `azd up`
- **🌐 Terraform med azd** seksjon lagt til i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfigurasjon, `.tf` mappestruktur, nødvendige `AZURE_*` outputs og `azd-env-name` tagging, og tilsvarende `azd up` / `azd down` arbeidsflyt (lukker hullet der Terraform-støtte ble påstått men bare Bicep ble vist)
- **⚙️ Steg-for-steg GitHub Actions gjennomgang** i `docs/chapter-08-production/production-ai-practices.md` — fra GitHub-repo til automatiserte deployer: `azd pipeline config`, OIDC federerte legitimasjoner (ingen lagrede hemmeligheter), generert `azure-dev.yml`, og veiledning rundt hemmeligheter vs. variabler
- **🪝 Nybegynner "Ny til hooks?" introduksjon** i `docs/chapter-04-infrastructure/deployment-guide.md` — hva en hook er, hook-stage tabell, en minimal første hook, og å kjøre hooks manuelt med `azd hooks run`
- **✅ "Verifiser din deploy" sjekkliste** lagt til i steg 5 av `docs/chapter-01-foundation/first-project.md` — røyktest, kontroll av helsetilstand-endepunkt, og eksplisitte suksesskriterier
- **🧩 Forklaring for nye forhåndsvisningsutvidelser** `azure.ai.skills` og `azure.ai.connections` (hva de er og når man bør bruke dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Endret
- **🧭 Kapittel 5 leksjonstabell** korrigert: `multi-agent-basics.md` er nå Leksjon 1 (den eneste fullstendig praktiske leksjonen), med ærlig merking av at Leksjon 2 finnes i Kapittel 6 og Retail-scenariet er et arkitektur-blåkopi, ikke en én-kommando mal
- **🧭 Kapittel 1 leksjonstabell** inkluderer nå den nye "Bring Your Own App"-leksjonen (Leksjon 4)
- **🔗 Navigasjonsfotere** oppdatert: `first-project.md` lenker nå fremover til `bring-your-own-app.md`

#### Fikset
- **🧱 Lukket det "påståtte men manglende" Terraform-hullet** — kurset refererte tidligere til Terraform-støtte uten å vise det
- **🔀 Korrigerte misvisende kapittel 5 krysslenker** som antydet full implementering av multi-agent når bare et arkitektur-blåkopi fantes

#### Oppdaterte filer
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(ny)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(ny)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Oppdatering, Fullstendige Agent Livssyklus Kommandoer & Aspire Omdøping
**Denne versjonen revaliderer kurset mot `azd` `1.25.6` (juni 2026) og `azure.ai.agents` `0.1.40-preview` utvidelsen, utvider AI-veiledning fra "sette opp en agent" til hele agentlivssyklusen (test → evaluer → optimaliser → inspiser → slett), viser fram de nye forhåndsvisningsutvidelsene `azure.ai.skills` og `azure.ai.connections`, og noterer produktrebranding fra ".NET Aspire" til bare "Aspire".**

#### Lagt til
- **🔁 Full dekning av agent livssyklus** for nybegynnere og AI-ingeniører på tvers av dokumentasjonen:
  - `docs/chapter-01-foundation/azd-basics.md` — Livssyklustabell (sette opp → test → måle → forbedre → inspisere → rydde opp) lagt til under Utvidelser og AI Kommandoer seksjonen
  - `docs/chapter-08-production/production-ai-practices.md` — Ny seksjon "Administrere Agent Livssyklus" som dekker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
  - `resources/cheat-sheet.md` — Utvidet AI Agent Kommandoer med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
- **🧩 Nye forhåndsvisningsutvidelser** dokumentert: `azure.ai.skills` (gjenbrukbare agentferdigheter) og `azure.ai.connections` (Foundry-tilkoblinger) lagt til i utvidelsestabellen og jukselappen
- **⏱️ Veiledning for responstid** — `azd ai agent invoke` eksempler noterer nå total latenstid og tid til første byte
- **📌 Versjonsbanner** i rot-README som peker brukere til `azd version` og `azd upgrade`

#### Endret
- **✅ Valideringsgrunnlag oppdatert** fra `azd 1.23.12` (mars 2026) til `azd 1.25.6` (juni 2026) på tvers av alle kapittel-READMEer og workshop-dokumenter
- **🤖 Kapittel 2 utvidelsesnotat** oppgradert fra `azure.ai.agents` `0.1.18-preview` til `0.1.40-preview`
- **🧪 Workshop valideringseksempel** (`azd version` output) oppdatert til `1.25.6`
- **🧭 README "Hva er nytt i azd i dag"** oppdatert for å fremheve ende-til-ende agent livssyklus, nye AI utvidelser, og nylige kvalitetsforbedringer (`azd init` idempotens, `azd auth login` fjerning av utdaterte tokens, `azd tool` første gangs prompt)
- **📖 Kapittel 2 agents.md (Alternativ 4)** peker nå brukere til livssyklus-kommandoer etter deploy i stedet for å stoppe ved `azd up`

#### Fikset
- **🏷️ Produktnavn** — lagt til notis om Aspire rebranding (".NET Aspire" er nå bare "Aspire"); azds Aspire-støtte er uendret
- **🔎 Bekreftet live release-validering** mot Azure Developer CLI-utgivelsesfeed: stabil CLI `1.25.6` (2026-06-12) og `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Oppdaterte filer
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Klarering for nybegynneropplæring, validering av oppsett og opprydding av siste AZD-kommando
**Denne versjonen følger opp AZD 1.23-valideringen med en dokumentasjonspass rettet mot nybegynnere: den klargjør AZD-første autentiseringsveiledning, legger til lokale valideringsskript for oppsett, verifiserer viktige kommandoer mot den aktive AZD CLI og fjerner de siste foreldede kommando-referansene på engelsk utenfor endringsloggen.**

#### Tilføyd
- **🧪 Valideringsskript for nybegynneroppsett** med `validate-setup.ps1` og `validate-setup.sh` slik at lærende kan bekrefte nødvendige verktøy før de starter Kapittel 1
- **✅ Foreløpige valideringstrinn for oppsett** i rot-README og Kapittel 1 README slik at manglende forutsetninger oppdages før `azd up`

#### Endret
- **🔐 Autentiseringsveiledning for nybegynnere** behandler nå konsekvent `azd auth login` som hovedveien for AZD-arbeidsflyter, med `az login` som valgfritt med mindre Azure CLI-kommandoer brukes direkte
- **📚 Onboarding-flyten i kapittel 1** peker nå brukere til å validere sitt lokale oppsett før installasjon, autentisering og første distribusjon
- **🛠️ Meldinger fra validator** skiller nå tydelig blokkeringer fra valgfrie Azure CLI-advarsler for den AZD-eksklusive nybegynnerveien
- **📖 Konfigurasjon, feilsøking og eksempel-dokumenter** skiller nå mellom nødvendig AZD-autentisering og valgfrie Azure CLI-innlogginger der de tidligere ble presentert uten kontekst

#### Rettet
- **📋 Gjenstående engelske kommando-referanser** oppdatert til gjeldende AZD-former, inkludert `azd config show` i jukselappen og `azd monitor --overview` der veiledning for Azure Portal-oversikt var ment
- **🧭 Påstander i kapittel 1 for nybegynnere** nedtonet for å unngå overpromisering om garantert feilfri eller tilbakestillingsadferd på tvers av alle maler og Azure-ressurser
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

#### Validering av AZD 1.23.12, utvidelse av workshop-miljø og oppdatering av AI-modeller
**Denne versjonen utfører en dokumentasjonsvalidering mot `azd` `1.23.12`, oppdaterer utdaterte AZD-kommandoeksempler, frisker opp AI-modellretningslinjer til gjeldende standarder, og utvider workshopinstruksjoner fra kun GitHub Codespaces til også å støtte utviklingscontainere og lokale kloner.**

#### Tilføyd
- **✅ Valideringsnotater i sentrale kapitler og workshop-dokumenter** for å gjøre den testede AZD-baselinen tydelig for lærende med nyere eller eldre CLI-versjoner
- **⏱️ Veiledning for distribusjonstidsavbrudd** ved langvarige AI-app-distribusjoner med `azd deploy --timeout 1800`
- **🔎 Utvidelsesinspeksjonstrinn** med `azd extension show azure.ai.agents` i AI-arbeidsflytdokumenter
- **🌐 Bredere veiledning for workshop-miljø** som dekker GitHub Codespaces, utviklingscontainere og lokale kloner med MkDocs

#### Endret
- **📚 Kapittelintroduksjons-READMEer** angir nå konsekvent validering mot `azd 1.23.12` i grunnlag, konfigurasjon, infrastruktur, multi-agent, pre-distribusjon, feilsøking og produksjonsseksjoner
- **🛠️ AZD-kommando-referanser** oppdatert til gjeldende former i dokumentene:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` avhengig av kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` der Application Insights-oversikt er ment
- **🧪 Provision-preview-eksempler** forenklet til støttet bruk som `azd provision --preview` og `azd provision --preview -e production`
- **🧭 Workshop-flyt** oppdatert slik at lærende kan fullføre laboratoriene i Codespaces, utviklingscontainer eller lokal klone i stedet for å anta Codespaces-eksklusiv kjøring
- **🔐 Autentiseringsveiledning** foretrekker nå `azd auth login` for AZD-arbeidsflyter, med `az login` som valgfri når Azure CLI-kommandoer brukes direkte

#### Rettet
- **🪟 Windows installasjonskommandoer** normalisert til gjeldende `winget` pakke-kapitalisering i installasjonsveiledningen
- **🐧 Linux installasjonsveiledning** korrigert for å unngå ikke-støttede distribusjonsspesifikke `azd` pakkehåndteringsinstruksjoner og heller peke til utgivelsesfiler der det er hensiktsmessig
- **📦 AI-modelleksempler** oppdatert fra eldre standarder som `gpt-35-turbo` og `text-embedding-ada-002` til nyere, f.eks. `gpt-4.1-mini`, `gpt-4.1` og `text-embedding-3-large`
- **📋 Distribusjons- og diagnostikksnutter** korrigert til å bruke gjeldende miljø- og statuskommandoer i logger, skript og feilsøking
- **⚙️ GitHub Actions-veiledning** oppdatert fra `Azure/setup-azd@v1.0.0` til `Azure/setup-azd@v2`
- **🤖 MCP/Copilot-samtykkeveiledning** oppdatert fra `azd mcp consent` til `azd copilot consent list`

#### Forbedret
- **🧠 AI-kapittelveiledning** forklarer nå bedre forhåndsvisningssensitive `azd ai`-adferd, tenant-spesifikk pålogging, gjeldende utvidelsesbruk og oppdaterte modellutplasseringsanbefalinger
- **🧪 Workshop-instruksjoner** bruker nå mer realistiske versjonseksempler og klarere miljøoppsett for praktiske laboratorier
- **📈 Produksjons- og feilsøkingsdokumenter** samsvarer nå bedre med nåværende overvåkings-, fallback-modell- og kostnadsnivåeksempler

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

#### AZD AI CLI-kommandoer, innholdsvalidering og malutvidelse
**Denne versjonen legger til dekning av `azd ai`, `azd extension` og `azd mcp`-kommandoer i alle AI-relaterte kapitler, fikser ødelagte lenker og utdatert kode i agents.md, oppdaterer jukselappen og overhaler seksjonen for Eksempelmaler med validerte beskrivelser og nye Azure AI AZD-maler.**

#### Tilføyd
- **🤖 Dekning av AZD AI CLI** i 7 filer (tidligere kun i kapittel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny seksjon "Utvidelser og AI-kommandoer" som introduserer `azd extension`, `azd ai agent init` og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Valg 4: `azd ai agent init` med sammenligningstabell (mal vs manifest-tilnærming)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Underseksjoner "AZD-utvidelser for Foundry" og "Agent-Første Distribusjon"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start viser nå både mal- og manifestbasert distribusjonsvei
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Distribusjonsseksjon inkluderer nå `azd ai agent init`-valg
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underseksjon "AZD AI-utvidelseskommandoer for diagnostikk"
  - `resources/cheat-sheet.md` — Ny seksjon "AI & Utvidelseskommandoer" med `azd extension`, `azd ai agent init`, `azd mcp` og `azd infra generate`
- **📦 Nye AZD AI-eksempelmaler** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chat med Blazor WebAssembly, Semantic Kernel og stemmechat-støtte
  - **azure-search-openai-demo-java** — Java RAG-chat med Langchain4J med ACA/AKS distribusjonsvalg
  - **contoso-creative-writer** — Multi-agent kreativ skriveapp med Azure AI Agent Service, Bing Grounding og Prompty
  - **serverless-chat-langchainjs** — Serverløs RAG med Azure Functions + LangChain.js + Cosmos DB med Ollama lokal utviklingsstøtte
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med adminportal, Teams-integrasjon og PostgreSQL/Cosmos DB-valg
  - **azure-ai-travel-agents** — Multi-agent MCP orkestreringsreferanseapp med servere i .NET, Python, Java og TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastruktur Bicep startmal
  - **🔗 Fantastisk AZD AI-gallerilenke** — Referanse til [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ maler)

#### Rettet
- **🔗 Navigasjon i agents.md**: Tidligere/Neste-lenker samsvarer nå med Kapittel 2 README-leksjonsrekkefølge (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Ødelagte lenker i agents.md**: `production-ai-practices.md` korrigert til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 Utdatert kode i agents.md**: `opencensus` erstattet med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Feil API i agents.md**: Flyttet `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 Token-telling i agents.md**: Erstattet grov `len//4`-estimat med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Korrigerte tjenester fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standard vert endret okt 2024)
- **contoso-chat**: Oppdatert beskrivelse til å referere Azure AI Foundry + Prompty som samsvarer med repoets faktiske tittel og teknologistabel

#### Fjernet
- **ai-document-processing**: Fjernet ikke-fungerende malreferanse (repo ikke offentlig tilgjengelig som AZD-mal)

#### Forbedret
- **📝 Øvelser i agents.md**: Øvelse 1 viser nå forventet output og `azd monitor`-trinn; øvelse 2 inkluderer full `FunctionTool`-registreringskode; øvelse 3 bytter ut vag veiledning med konkrete `prepdocs.py`-kommandoer
- **📚 Ressurser i agents.md**: Oppdaterte dokumentasjonslenker til nåværende Azure AI Agent Service-dokumenter og hurtigstart
- **📋 Tabellen Neste steg i agents.md**: Lagt til AI Workshop Lab-lenke for komplett kapitteldekning

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
#### Forbedring av Kursnavigasjon
**Denne versjonen forbedrer README.md kapittelnavigasjon med et forbedret tabellformat.**

#### Endret
- **Kurskarttabell**: Forbedret med direkte leksjonslenker, varighetsestimater og kompleksitetsvurderinger
- **Mapperydding**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Lenkevalidering**: Alle 21+ interne lenker i Kurskart-tabellen verifisert

### [v3.16.0] - 2026-02-05

#### Oppdateringer av Produktnavn
**Denne versjonen oppdaterer produktreferanser til gjeldende Microsoft-merking.**

#### Endret
- **Microsoft Foundry → Microsoft Foundry**: Alle referanser oppdatert på tvers av ikke-oversettelsesfiler
- **Azure AI Agent Service → Foundry Agents**: Tjenestenavn oppdatert for å reflektere gjeldende merkevare

#### Filer oppdatert
- `README.md` - Hovedkurs landingsside
- `changelog.md` - Versjonshistorikk
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - Veiledning for AI-agenter
- `examples/README.md` - Eksempeldokumentasjon
- `workshop/README.md` - Workshop landingsside
- `workshop/docs/index.md` - Workshop-indeks
- `workshop/docs/instructions/*.md` - Alle workshop-instruksjonsfiler

---

### [v3.15.0] - 2026-02-05

#### Større Omstrukturering av Repository: Kapittelbaserte Mappenavn
**Denne versjonen omstrukturerer dokumentasjonen i dedikerte kapittelmappen for klarere navigasjon.**

#### Mappeendringer
Gamle mapper har blitt erstattet med kapittelnummererte mapper:
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
| Alle pre-deployment filer | pre-deployment/ | chapter-06-pre-deployment/ |
| Alle troubleshooting filer | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lagt til
- **📚 Kapittel-README-filer**: Opprettet README.md i hver kapittelmapp med:
  - Læringsmål og varighet
  - Leksjonstabell med beskrivelser
  - Hurtigstart-kommandoer
  - Navigasjon til andre kapitler

#### Endret
- **🔗 Oppdaterte alle interne lenker**: 78+ stier oppdatert på tvers av alle dokumentasjonsfiler
- **🗺️ Hoved README.md**: Oppdatert Kurskart med ny kapittelstruktur
- **📝 examples/README.md**: Oppdaterte kryssreferanser til kapittelmappene

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-omstrukturering: Kapittelnavigasjon
**Denne versjonen la til kapittelnavigasjon README-filer (erstattet av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny Veiledning for AI-Agenter
**Denne versjonen legger til en omfattende veiledning for distribusjon av AI-agenter med Azure Developer CLI.**

#### Lagt til
- **🤖 docs/microsoft-foundry/agents.md**: Komplett veiledning som dekker:
  - Hva AI-agenter er og hvordan de skiller seg fra chatbots
  - Tre hurtigstart-agentmaler (Foundry Agents, Prompty, RAG)
  - Agentarkitektur-mønstre (enkeltagent, RAG, multi-agent)
  - Verktøykonfigurasjon og tilpasning
  - Overvåking og måling
  - Kostnadsbetraktninger og optimalisering
  - Vanlige feilsøkingsscenarier
  - Tre praktiske øvelser med suksesskriterier

#### Innholdsstruktur
- **Introduksjon**: Agentkonsepter for nybegynnere
- **Hurtigstart**: Distribuer agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmønstre**: Visuelle diagrammer av agentmønstre
- **Konfigurasjon**: Verktøyoppsett og miljøvariabler
- **Overvåking**: Application Insights-integrasjon
- **Øvelser**: Progressiv praktisk læring (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### Oppdatering av DevContainer-miljø
**Denne versjonen oppdaterer utviklingscontainerkonfigurasjonen med moderne verktøy og bedre standarder for AZD-læringsopplevelsen.**

#### Endret
- **🐳 Basert bilde**: Oppdatert fra `python:3.12-bullseye` til `python:3.12-bookworm` (seneste Debian stable)
- **📛 Containernavn**: Omdøpt fra "Python 3" til "AZD for Beginners" for klarhet

#### Lagt til
- **🔧 Nye Dev Container-funksjoner**:
  - `azure-cli` med Bicep-støtte aktivert
  - `node:20` (LTS-versjon for AZD-maler)
  - `github-cli` for maladministrasjon
  - `docker-in-docker` for container app-distribusjoner

- **🔌 Portviderekobling**: Forhåndskonfigurerte porter for vanlig utvikling:
  - 8000 (MkDocs forhåndsvisning)
  - 3000 (Webapper)
  - 5000 (Python Flask)
  - 8080 (API-er)

- **🧩 Nye VS Code-utvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Støtte for Azure Functions
  - `ms-azuretools.vscode-docker` - Docker-støtte
  - `ms-azuretools.vscode-bicep` - Bicep språkstøtte
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursadministrasjon
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid diagramstøtte
  - `redhat.vscode-yaml` - YAML-støtte (for azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historikk

- **⚙️ VS Code-innstillinger**: Lagt til standardinnstillinger for Python-tolk, formatering ved lagring og fjerning av overflødig mellomrom

- **📦 Oppdaterte requirements-dev.txt**:
  - Lagt til MkDocs minify-plugin
  - Lagt til pre-commit for kodekvalitet
  - Lagt til Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Fikset
- **Post-Create-kommando**: Verifiserer nå AZD og Azure CLI-installasjon ved oppstart av container

---

### [v3.11.0] - 2026-02-05

#### Nybegynnervennlig README-omstrukturering
**Denne versjonen forbedrer README.md betydelig for å være mer tilgjengelig for nybegynnere og legger til essensielle ressurser for AI-utviklere.**

#### Lagt til
- **🆚 Azure CLI vs AZD-sammenligning**: Klar forklaring på når man skal bruke hvilket verktøy med praktiske eksempler
- **🌟 Awesome AZD-lenker**: Direkte lenker til samfunnets malgalleri og bidragsressurser:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ klar-til-distribusjon maler
  - [Send inn en mal](https://github.com/Azure/awesome-azd/issues) - Fellesskapsbidrag
- **🎯 Hurtigstartguide**: Forenklet 3-trinns oppstartseksjon (Installer → Logg inn → Distribuer)
- **📊 Erfaringsbasert navigasjonstabell**: Klar veiledning om hvor man skal begynne basert på utviklererfaring

#### Endret
- **README-struktur**: Omorganisert for progressiv opplysning – viktig informasjon først
- **Introduksjonsseksjon**: Omskrevet for å forklare "Magien bak `azd up`" for helt nybegynnere
- **Fjernet duplikatinnhold**: Eliminert duplisert feilsøkingsseksjon
- **Feilsøkingskommandoer**: Rettet `azd logs`-referanse for å bruke gyldig `azd monitor --logs`

#### Fikset
- **🔐 Autentiseringskommandoer**: Lagt til `azd auth login` og `azd auth logout` i cheat-sheet.md
- **Ugyldige kommando-referanser**: Fjernet gjenværende `azd logs` fra README feilsøkingsseksjon

#### Notater
- **Omfang**: Endringer anvendt på hoved README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer spesielt rettet mot utviklere som er nye til AZD

---

### [v3.10.0] - 2026-02-05

#### Presisjonsoppdatering for Azure Developer CLI-kommandoer
**Denne versjonen korrigerer ikke-eksisterende AZD-kommandoer i dokumentasjonen, og sikrer at alle kodeeksempler bruker gyldig Azure Developer CLI-syntaks.**

#### Fikset
- **🔧 Ikke-eksisterende AZD-kommandoer fjernet**: Omfattende revisjon og retting av ugyldige kommandoer:
  - `azd logs` (eksisterer ikke) → erstattet med `azd monitor --logs` eller Azure CLI-alternativer
  - `azd service` subkommandoer (eksisterer ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (eksisterer ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flagg (eksisterer ikke) → fjernet
  - `azd provision --what-if/--rollback` flagg (eksisterer ikke) → oppdatert til å bruke `--preview`
  - `azd config validate` (eksisterer ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (eksisterer ikke) → fjernet

- **📚 Filer oppdatert med kommando-korrigeringer**:
  - `resources/cheat-sheet.md`: Større overhaling av kommandoreferanse
  - `docs/deployment/deployment-guide.md`: Rettet rollback og distribusjonsstrategier
  - `docs/troubleshooting/debugging.md`: Rettet logganalyse-seksjoner
  - `docs/troubleshooting/common-issues.md`: Oppdaterte feilsøkingskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Rettet AZD feilsøkingsseksjon
  - `docs/getting-started/azd-basics.md`: Korrigerte overvåkingskommandoer
  - `docs/getting-started/first-project.md`: Oppdaterte overvåkings- og feilsøkings-eksempler
  - `docs/getting-started/installation.md`: Rettet hjelpe- og versjonseksempler
  - `docs/pre-deployment/application-insights.md`: Korrigerte loggvisningskommandoer
  - `docs/pre-deployment/coordination-patterns.md`: Rettet agent feilsøkingskommandoer

- **📝 Versjonsreferanse oppdatert**:
  - `docs/getting-started/installation.md`: Endret hardkodet `1.5.0` versjon til generisk `1.x.x` med lenke til utgivelser

#### Endret
- **Rollback-strategier**: Oppdatert dokumentasjonen til å bruke Git-basert rollback (AZD har ikke native rollback)
- **Loggvisning**: Erstattet `azd logs` referanser med `azd monitor --logs`, `azd monitor --live`, og Azure CLI-kommandoer
- **Ytelsesseksjon**: Fjernet ikke-eksisterende flagg for parallell/incremental distribusjon, ga gyldige alternativer

#### Tekniske detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor flagg**: `--live`, `--logs`, `--overview`
- **Fjernet funksjoner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notater
- **Verifikasjon**: Kommandoer validert mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Fullføring og Dokumentasjonskvalitetsoppdatering
**Denne versjonen fullfører de interaktive workshop-modulene, fikser alle brutte dokumentasjonslenker, og forbedrer generell innholdskvalitet for AI-utviklere som bruker Microsoft AZD.**

#### Lagt til
- **📝 CONTRIBUTING.md**: Nytt dokument med retningslinjer for bidrag inkludert:
  - Klare instruksjoner for rapportering av problemer og foreslå endringer
  - Dokumentasjonsstandarder for nytt innhold

  - Retningslinjer for kodeeksempler og konvensjoner for commit-meldinger
  - Informasjon om samfunnsengasjement

#### Fullført
- **🎯 Workshop Modul 7 (Oppsummering)**: Fullført oppsummeringsmodul med:
  - Omfattende sammendrag av workshop-prestasjoner
  - Seksjon med nøkkelkonsepter dekker AZD, maler og Microsoft Foundry
  - Anbefalinger for videre læringsreise
  - Workshop-utfordringsøvelser med vanskelighetsgrader
  - Tilbakemeldinger fra fellesskapet og støttelenker

- **📚 Workshop Modul 3 (Nedbrytning)**: Oppdaterte læringsmål med:
  - GitHub Copilot med MCP-serveraktivering veiledning
  - Forståelse av AZD-mal-mappestruktur
  - Infrastruktur-som-kode (Bicep) organisasjonsmønstre
  - Praktiske lab-instruksjoner

- **🔧 Workshop Modul 6 (Nedrigging)**: Fullført med:
  - Ressursopprydding og kostnadsstyringsmål
  - Bruk av `azd down` for trygg nedlasting av infrastruktur
  - Veiledning for gjenoppretting av myk-slettede kognitive tjenester
  - Bonus utforskningsoppgaver for GitHub Copilot og Azure Portal

#### Fikset
- **🔗 Ødelagte lenker fikset**: Løst 15+ ødelagte interne dokumentasjonslenker:
  - `docs/ai-foundry/ai-model-deployment.md`: Fikset stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerte stier for ai-model-deployment.md og production-ai-practices.md
  - `docs/getting-started/first-project.md`: Erstattet ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fikset FAQ og feilsøkingsveiledningstier
  - `examples/container-app/microservices/README.md`: Korrigerte kurs-hjem og deployment-guide stier
  - `resources/faq.md` og `resources/glossary.md`: Oppdaterte AI kapittelreferanser
  - `course-outline.md`: Fikset instruktørguide og AI workshop-lab referanser

- **📅 Workshop statusbanner**: Oppdatert fra "Under Construction" til aktiv workshop-status med februar 2026-dato

- **🔗 Workshop-navigasjon**: Fikset ødelagte navigasjonslenker i workshop README.md som pekte til ikke-eksisterende lab-1-azd-basics-mappe

#### Endret
- **Workshop-presentasjon**: Fjernet "under construction"-advarsel; workshop er nå komplett og klar til bruk
- **Konsistent navigasjon**: Sikret at alle workshop-moduler har riktig modul-til-modul navigasjon
- **Læringssti-referanser**: Oppdatert kapittel-kryssreferanser til korrekte microsoft-foundry stier

#### Validert
- ✅ Alle engelske markdown-filer har gyldige interne lenker
- ✅ Workshop-moduler 0-7 er komplette med læringsmål
- ✅ Navigasjon mellom kapitler og moduler fungerer korrekt
- ✅ Innholdet er egnet for AI-utviklere som bruker Microsoft AZD
- ✅ Begynnervennlig språk og struktur opprettholdt gjennom hele
- ✅ CONTRIBUTING.md gir klare retningslinjer for fellesskapsbidragsytere

#### Teknisk implementering
- **Lenkevalidering**: Automatisert PowerShell-skript verifiserte alle .md interne lenker
- **Innholdrevisjon**: Manuell gjennomgang av workshop-fullstendighet og nybegynnervennlighet
- **Navigasjonssystem**: Konsistente navigasjonsmønstre for kapitler og moduler anvendt

#### Notater
- **Omfang**: Endringer gjelder kun engelsk dokumentasjon
- **Oversettelser**: Oversettelsesmapper ikke oppdatert i denne versjonen (automatisk oversettelse vil synkroniseres senere)
- **Workshop-varighet**: Komplett workshop gir nå 3-4 timer praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avansert dokumentasjon: Overvåking, sikkerhet og multi-agent mønstre
**Denne versjonen legger til omfattende A-nivå leksjoner om Application Insights-integrasjon, autentiseringsmønstre og multi-agent koordinering for produksjonsutrullinger.**

#### Lagt til
- **📊 Application Insights-integrasjon leksjon**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokusert utrulling med automatisk provisjonering
  - Komplett Bicep-maler for Application Insights + Log Analytics
  - Fullt fungerende Python-applikasjoner med tilpasset telemetri (1 200+ linjer)
  - AI/LLM overvåkingsmønstre (Microsoft Foundry Models token/kostnads-sporing)
  - 6 Mermaid-diagrammer (arkitektur, distribuert tracing, telemetriflyt)
  - 3 praktiske øvelser (varsler, dashbord, AI-overvåking)
  - Kusto-spørringseksempler og kostnadsoptimaliseringsstrategier
  - Live metrikksstrømming og sanntids feilsøking
  - 40-50 minutters læringstid med produksjonsklare mønstre

- **🔐 Autentisering & sikkerhetsmønstre leksjon**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmønstre (tilkoblingsstrenger, Key Vault, managed identity)
  - Fullstendige Bicep infrastrukturmaler for sikre utrullinger
  - Node.js applikasjonskode med Azure SDK-integrasjon
  - 3 komplette øvelser (aktivering av managed identity, bruker-tilordnet identitet, Key Vault rotasjon)
  - Sikkerhets beste praksis og RBAC-konfigurasjoner
  - Feilsøkingsveiledning og kostnadsanalyse
  - Produksjonsklare passordløse autentiseringsmønstre

- **🤖 Multi-Agent koordinering mønstre leksjon**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinering mønstre (sekvensiell, parallell, hierarkisk, hendelsesdrevet, konsensus)
  - Komplett orkestrator tjenesteimplementering (Python/Flask, 1500+ linjer)
  - 3 spesialiserte agentimplementasjoner (Research, Writer, Editor)
  - Service Bus integrasjon for meldingskø
  - Cosmos DB tilstandshåndtering for distribuerte systemer
  - 6 Mermaid-diagrammer som viser agent-interaksjoner
  - 3 avanserte øvelser (timeout-håndtering, retry-logikk, circuit breaker)
  - Kostnadsbryting ($240-565/måned) med optimaliseringsstrategier
  - Application Insights-integrasjon for overvåking

#### Forbedret
- **Pre-deployment kapittel**: Inkluderer nå omfattende overvåking og koordinering mønstre
- **Getting Started kapittel**: Forbedret med profesjonelle autentiseringsmønstre
- **Produksjonsklarhet**: Full dekning fra sikkerhet til observabilitet
- **Kursoversikt**: Oppdatert for å referere nye leksjoner i kapitler 3 og 6

#### Endret
- **Læringsprogresjon**: Bedre integrering av sikkerhet og overvåking gjennom hele kurset
- **Dokumentasjonskvalitet**: Konsistente A-nivå standarder (95-97%) på nye leksjoner
- **Produksjonsmønstre**: Fullstendig ende-til-ende dekning for entrepriseutrullinger

#### Forbedret
- **Utvikleropplevelse**: Klar vei fra utvikling til produksjonsovervåking
- **Sikkerhetsstandarder**: Profesjonelle mønstre for autentisering og hemmelighetshåndtering
- **Observabilitet**: Komplett Application Insights-integrasjon med AZD
- **AI arbeidsmengder**: Spesialisert overvåking for Microsoft Foundry Models og multi-agent systemer

#### Validert
- ✅ Alle leksjoner inkluderer komplett fungerende kode (ikke bare utdrag)
- ✅ Mermaid-diagrammer for visuell læring (19 totalt i 3 leksjoner)
- ✅ Praktiske øvelser med verifiseringstrinn (9 totalt)
- ✅ Produksjonsklare Bicep-maler som kan deployeres med `azd up`
- ✅ Kostnadsanalyser og optimaliseringsstrategier
- ✅ Feilsøkingsguider og beste praksis
- ✅ Kunnskapssjekkpunkter med verifiseringskommandoer

#### Dokumentasjonsvurderingsresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvåkingsveiledning
- **docs/getting-started/authsecurity.md**: - Profesjonelle sikkerhetsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avanserte multi-agent arkitekturer
- **Totalt nytt innhold**: - Konsistent høykvalitetsstandard

#### Teknisk implementering
- **Application Insights**: Log Analytics + tilpasset telemetri + distribuert tracing
- **Autentisering**: Managed Identity + Key Vault + RBAC-mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvåking**: Live metrikker + Kusto-spørringer + varsler + dashbord
- **Kostnadsstyring**: Sampling strategier, lagringspolicyer, budsjettkontroller

### [v3.7.0] - 2025-11-19

#### Forbedringer i dokumentasjonskvalitet og nytt Microsoft Foundry Models-eksempel
**Denne versjonen forbedrer dokumentasjonskvaliteten i hele arkivet og legger til et komplett Microsoft Foundry Models-utplasseringseksempel med gpt-4.1 chat-grensesnitt.**

#### Lagt til
- **🤖 Microsoft Foundry Models Chat-eksempel**: Komplett gpt-4.1 utrulling med fungerende implementering i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models-infrastruktur (gpt-4.1 modellutrulling)
  - Python kommandolinje chat-grensesnitt med samtalehistorikk
  - Key Vault integrasjon for sikker API-nøkkellagring
  - Sporing av token-bruk og kostnadsestimering
  - Ratebegrensing og feilhåndtering
  - Omfattende README med 35-45 minutters utrullingsveiledning
  - 11 produksjonsklare filer (Bicep-maler, Python-app, konfigurasjon)
- **📚 Dokumentasjonsøvelser**: Lagt til praktiske øvelser i konfigurasjonsveiledning:
  - Øvelse 1: Multi-miljø konfigurasjon (15 minutter)
  - Øvelse 2: Hemmelighetshåndtering praksis (10 minutter)
  - Klare suksesskriterier og verifiseringstrinn
- **✅ Utrullingsverifisering**: Lagt til verifiseringsseksjon i utrullingsveiledning:
  - Helsekontrollprosedyrer
  - Suksesskriterier sjekkliste
  - Forventede utdata for alle utrullingskommandoer
  - Rask referanse for feilsøking

#### Forbedret
- **examples/README.md**: Oppgradert til A-nivå kvalitet (93%):
  - Lagt til azure-openai-chat i alle relevante seksjoner
  - Oppdatert antall lokale eksempler fra 3 til 4
  - Lagt til i AI Application Examples-tabellen
  - Integrert i Quick Start for intermediate brukere
  - Lagt til i Microsoft Foundry Templates-seksjonen
  - Oppdatert sammenligningsmatrise og teknologi/finningsseksjoner
- **Dokumentasjonskvalitet**: Forbedret fra B+ (87%) → A- (92%) i docs-mappen:
  - Lagt til forventede utdata på kritiske kommandoeksempler
  - Inkludert verifiseringstrinn for konfigurasjonsendringer
  - Forbedret praktisk læring med øvelser

#### Endret
- **Læringsprogresjon**: Bedre integrering av AI-eksempler for mellomnivå brukere
- **Dokumentasjonsstruktur**: Mer handlingsorienterte øvelser med klare resultater
- **Verifiseringsprosess**: Eksplisitte suksesskriterier lagt til kjernearbeidsflyter

#### Forbedret
- **Utvikleropplevelse**: Microsoft Foundry Models utrulling tar nå 35-45 minutter (vs. 60-90 for komplekse alternativer)
- **Kostnadstransparens**: Klare kostnadsestimater ($50-200/måned) for Microsoft Foundry Models-eksemplet
- **Læringssti**: AI-utviklere har klart inngangspunkt med azure-openai-chat
- **Dokumentasjonsstandarder**: Konsistente forventede utdata og verifiseringstrinn

#### Validert
- ✅ Microsoft Foundry Models-eksempel fullstendig funksjonelt med `azd up`
- ✅ Alle 11 implementasjonsfiler syntaktisk korrekte
- ✅ README-instruksjoner samsvarer med faktisk utrullingsopplevelse
- ✅ Dokumentasjonslenker oppdatert i over 8 steder
- ✅ Eksempelliste nøyaktig med 4 lokale eksempler
- ✅ Ingen dupliserte eksterne lenker i tabeller
- ✅ Alle navigasjonsreferanser korrekte

#### Teknisk implementering
- **Microsoft Foundry Models arkitektur**: gpt-4.1 + Key Vault + Container Apps-mønster
- **Sikkerhet**: Managed Identity klar, hemmeligheter i Key Vault
- **Overvåking**: Application Insights-integrasjon
- **Kostnadsstyring**: Token-sporing og bruksoptimalisering
- **Utrulling**: Enkelt `azd up`-kommando for fullstendig setup

### [v3.6.0] - 2025-11-19

#### Større oppdatering: Container App-utplasseringseksempler
**Denne versjonen introduserer omfattende, produksjonsklare containerapplikasjonsutrullingseksempler ved hjelp av Azure Developer CLI (AZD), med full dokumentasjon og integrering i læringsstien.**

#### Lagt til
- **🚀 Container App-eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett oversikt over containerutrullinger, hurtigstart, produksjon og avanserte mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybegynnervennlig REST API med scale-to-zero, helsesjekker, overvåking og feilsøking
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices): Produksjonsklar multi-tjenesteutrulling (API-gateway, Produkt, Ordre, Bruker, Notifikasjon), asynkron meldingshåndtering, Service Bus, Cosmos DB, Azure SQL, distribuert tracing, blue-green/canary deployment
- **Beste praksis**: Sikkerhet, overvåking, kostnadsoptimalisering og CI/CD-veiledning for containerarbeidsmengder
- **Kodeeksempler**: Fullstendige `azure.yaml`, Bicep-maler og flerspråklige tjenesteimplementasjoner (Python, Node.js, C#, Go)
- **Testing & feilsøking**: End-to-end testscenarier, overvåkingskommandoer, feilsøkingsveiledninger

#### Endret
- **README.md**: Oppdatert for å vise og lenke til nye container app-eksempler under "Local Examples - Container Applications"
- **examples/README.md**: Oppdatert for å fremheve container app-eksempler, legge til sammenligningsmatriseposter og oppdatere teknologi-/arkitekturreferanser
- **Kursoversikt & Studieguide**: Oppdatert for å referere nye container app-eksempler og utrullingsmønstre i relevante kapitler

#### Validert
- ✅ Alle nye eksempler kan utrulles med `azd up` og følger beste praksis
- ✅ Dokumentasjonskrysslenker og navigasjon oppdatert
- ✅ Eksempler dekker nybegynner til avanserte scenarioer, inkludert produksjonsmikrotjenester

#### Notater
- **Omfang**: Kun engelsk dokumentasjon og eksempler
- **Neste steg**: Utvidelse med flere avanserte containermønstre og CI/CD-automatisering i fremtidige versjoner

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry
**Denne versjonen implementerer en fullstendig navneendring av produktet fra "Microsoft Foundry" til "Microsoft Foundry" i all engelsk dokumentasjon, reflekterende Microsofts offisielle rebranding.**

#### Endret
- **🔄 Produktnavnoppdatering**: Fullstendig rebranding fra "Microsoft Foundry" til "Microsoft Foundry"
  - Oppdaterte alle referanser i all engelsk dokumentasjon i `docs/`-mappen
  - Omdøpte mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fil omdøpt: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innholdsreferanser oppdatert på tvers av 7 dokumentasjonsfiler

- **📁 Endringer i mappestruktur**:
  - `docs/ai-foundry/` omdøpt til `docs/microsoft-foundry/`
  - Alle kryssreferanser oppdatert for å reflektere ny mappestruktur
  - Navigasjonslenker validert på tvers av all dokumentasjon

- **📄 Filomdøpinger**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne lenker oppdatert for å referere til nytt filnavn

#### Oppdaterte filer
- **Kapitteldokumentasjon** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigasjonslenkeoppdateringer
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnreferanser oppdatert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bruker allerede Microsoft Foundry (fra tidligere oppdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referanser oppdatert (oversikt, fellesskapsinnspill, dokumentasjon)
  - `docs/getting-started/azd-basics.md` - 4 kryssreferanselenker oppdatert
  - `docs/getting-started/first-project.md` - 2 kapittelnavigasjonslenker oppdatert
  - `docs/getting-started/installation.md` - 2 neste kapittelenker oppdatert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referanser oppdatert (navigasjon, Discord-fellesskap)
  - `docs/troubleshooting/common-issues.md` - 1 navigasjonslenke oppdatert
  - `docs/troubleshooting/debugging.md` - 1 navigasjonslenke oppdatert

- **Filstruktur for kurs** (2 filer):
  - `README.md` - 17 referanser oppdatert (kursoversikt, kapitteltitler, malseksjon, fellesskapsinnsikt)
  - `course-outline.md` - 14 referanser oppdatert (oversikt, læringsmål, kapittelressurser)

#### Validert
- ✅ Ingen gjenværende "ai-foundry" mappesti-referanser i engelskspråklig dokumentasjon
- ✅ Ingen gjenværende produktnavnreferanser til "Microsoft Foundry" i engelskspråklig dokumentasjon
- ✅ Alle navigasjonslenker fungerer med ny mappestruktur
- ✅ Fil- og mappenedøpinger fullført uten feil
- ✅ Kryssreferanser mellom kapitler validert

#### Notater
- **Omfang**: Endringer gjeldende for engelskspråklig dokumentasjon i `docs/`-mappen kun
- **Oversettelser**: Oversettelsesmappene (`translations/`) oppdatert ikke i denne versjonen
- **Workshop**: Workshopmateriell (`workshop/`) oppdatert ikke i denne versjonen
- **Eksempler**: Eksempelfiler kan fortsatt referere til eldre navn (vil bli adressert i framtidig oppdatering)
- **Eksterne lenker**: Eksterne URL-er og GitHub-repositoriumreferanser uendret

#### Migrasjonsveiledning for bidragsytere
Hvis du har lokale grener eller dokumentasjon som refererer til gammel struktur:
1. Oppdater mappereferanser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Oppdater filreferanser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstatt produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Validér at alle interne dokumentasjonslenker fortsatt fungerer

---

### [v3.4.0] - 2025-10-24

#### Forbedringer i infrastrukturforhåndsvisning og validering
**Denne versjonen introduserer omfattende støtte for den nye Azure Developer CLI forhåndsvisningsfunksjonen og forbedrer brukeropplevelsen i workshop.**

#### Lagt til
- **🧪 azd provision --preview funksjonsdokumentasjon**: Utførlig dekning av den nye infrastrukturen forhåndsvisningsevne
  - Kommandoreferanse og bruks-eksempler i jukselapp
  - Detaljert integrasjon i provisjonsveiledning med brukstilfeller og fordeler
  - Pre-flight sjekk integrert for sikrere deploy-validering
  - Oppdatering i komme-igang-guide med sikkerhetsfokusert deploy-praksis
- **🚧 Workshop statusbanner**: Profesjonelt HTML-banner som indikerer workshoputviklingsstatus
  - Gradientdesign med byggeindikatorer for tydelig brukerkommunikasjon
  - Sist oppdatert tidsstempel for åpenhet
  - Mobilresponsiv design for alle enhetstyper

#### Forbedret
- **Infrastruktur Sikkerhet**: Forhåndsvisningsfunksjon integrert i hele deploy-dokumentasjonen
- **Forhåndsvalidering før distribuering**: Automatiserte skript inkluderer nå infrastruktur-forhåndsvisningstesting
- **Utviklerarbeidsflyt**: Oppdaterte kommandosekvenser som inkluderer forhåndsvisning som beste praksis
- **Workshopopplevelse**: Klare forventninger satt for brukere vedrørende innholdsutviklingsstatus

#### Endret
- **Deploy beste praksis**: Forhåndsvisning-først arbeidsflyt anbefales nå
- **Dokumentasjonsflyt**: Infrastrukturvalidering flyttet tidligere i læringsprosessen
- **Workshoppresentasjon**: Profesjonell statuskommunikasjon med klar utviklingstidslinje

#### Forbedret
- **Sikkerhetsfokusert tilnærming**: Infrastrukturendringer kan nå valideres før deploy
- **Team-samarbeid**: Forhåndsvisningsresultater kan deles for gjennomgang og godkjenning
- **Kostnadsbevissthet**: Bedre forståelse av ressurskostnader før provisjonering
- **Risikoreduksjon**: Mindre deploy-feil gjennom forhåndsvalidering

#### Teknisk gjennomføring
- **Integrasjon i flere dokumenter**: Forhåndsvisningsfunksjon dokumentert i 4 nøkkelfiler
- **Kommandomønstre**: Konsistent syntaks og eksempler i dokumentasjon
- **Beste praksis-integrering**: Forhåndsvisning inkludert i valideringsarbeidsflyter og skript
- **Visuelle indikatorer**: Klare NYE funksjonsmarkeringer for synlighet

#### Workshopinfrastruktur
- **Statuskommunikasjon**: Profesjonelt HTML-banner med gradientstil
- **Brukeropplevelse**: Klar utviklingsstatus for å forhindre forvirring
- **Profesjonell presentasjon**: Opprettholder repositoriekredibilitet samtidig som forventninger settes
- **Tidslinjeåpenhet**: Sist oppdatert oktober 2025-tidsstempel for ansvarlighet

### [v3.3.0] - 2025-09-24

#### Forbedret workshopmateriell og interaktiv læringsopplevelse
**Denne versjonen introduserer omfattende workshopmateriell med nettleserbaserte interaktive guider og strukturerte læringsløp.**

#### Lagt til
- **🎥 Interaktiv workshopguide**: Nettleserbasert workshopopplevelse med MkDocs forhåndsvisningsmulighet
- **📝 Strukturerte workshopinstruksjoner**: 7-trinns veiledet læringsløp fra oppdagelse til tilpasning
  - 0-Introduksjon: Workshopoversikt og oppsett
  - 1-Select-AI-Template: Maloppdagelse og valgprosess
  - 2-Validate-AI-Template: Distribusjon og valideringsprosedyrer
  - 3-Deconstruct-AI-Template: Forståelse av malarkitektur
  - 4-Configure-AI-Template: Konfigurasjon og tilpasning
  - 5-Customize-AI-Template: Avanserte modifikasjoner og iterasjoner
  - 6-Teardown-Infrastructure: Opprydding og ressursadministrasjon
  - 7-Wrap-up: Oppsummering og neste steg
- **🛠️ Workshopverktøy**: MkDocs-konfigurasjon med Material-tema for forbedret læringsopplevelse
- **🎯 Praktisk læringsløp**: 3-trinns metodikk (Oppdagelse → Distribusjon → Tilpasning)
- **📱 GitHub Codespaces-integrasjon**: Sømløs oppsett av utviklingsmiljø

#### Forbedret
- **AI Workshop Lab**: Utvidet med omfattende 2-3 timers strukturert læringsopplevelse
- **Workshopdokumentasjon**: Profesjonell presentasjon med navigasjon og visuelle hjelpemidler
- **Læringsprogresjon**: Klar trinnvis veiledning fra malvalg til produksjonsdistribusjon
- **Utvikleropplevelse**: Integrert verktøystøtte for effektiv utviklingsarbeidsflyt

#### Forbedret
- **Tilgjengelighet**: Nettlesergrensesnitt med søk, kopi-funksjonalitet og tema-velger
- **Selvstyrt læring**: Fleksibel workshopstruktur som tilpasses ulik læringshastighet
- **Praktisk anvendelse**: Virkelige AI-mal-distribusjonsscenarier
- **Fellesskapsintegrasjon**: Discord-integrasjon for workshopstøtte og samarbeid

#### Workshopfunksjoner
- **Innebygd søk**: Rask nøkkelords- og leksjonsfunn
- **Kopi av kodeblokker**: Hover-for-kopi-funksjonalitet for alle kodeeksempler
- **Temavelger**: Støtte for mørk/lys modus etter preferanse
- **Visuelle ressurser**: Skjermbilder og diagrammer for bedre forståelse
- **Hjelpeintegrasjon**: Direkte Discord-tilgang for fellesskapsstøtte

### [v3.2.0] - 2025-09-17

#### Stor navigasjonsomstrukturering og kapittelbasert læringssystem
**Denne versjonen introduserer et omfattende kapittelbasert læringsoppsett med forbedret navigasjon gjennom hele repositoriet.**

#### Lagt til
- **📚 Kapittelbasert læringssystem**: Omstrukturert hele kurset i 8 progressive læringskapitler
  - Kapittel 1: Grunnlag & Rask Start (⭐ - 30-45 min)
  - Kapittel 2: AI-Først Utvikling (⭐⭐ - 1-2 timer)
  - Kapittel 3: Konfigurasjon & Autentisering (⭐⭐ - 45-60 min)
  - Kapittel 4: Infrastruktur som kode & Distribusjon (⭐⭐⭐ - 1-1.5 time)
  - Kapittel 5: Multi-Agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapittel 6: Forhåndsvalidering & Planlegging (⭐⭐ - 1 time)
  - Kapittel 7: Feilsøking & Debugging (⭐⭐ - 1-1.5 time)
  - Kapittel 8: Produksjon & Enterprise Mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigasjonssystem**: Konsistente navigasjonshoder og -bunner over all dokumentasjon
- **🎯 Fremdriftssporing**: Kursfullføringsjekkliste og læringsverifikasjonssystem
- **🗺️ Veiledning for læringsløp**: Klare inngangspunkter for ulike erfaringsnivåer og mål
- **🔗 Kryssreferanse-navigasjon**: Relaterte kapitler og forutsetninger tydelig lenket

#### Forbedret
- **README-struktur**: Transformert til en strukturert læringsplattform med kapittelbasert organisering
- **Dokumentasjonsnavigasjon**: Hver side inkluderer nå kapitlets kontekst og progresjonsveiledning
- **Malorganisering**: Eksempler og maler kartlagt til relevante læringskapitler
- **Ressursintegrasjon**: Jukselapper, FAQ og studieveiledninger koplet til relevante kapitler
- **Workshop-integrasjon**: Praktiske laboratorier tilknyttet flere kapittellæringsmål

#### Endret
- **Læringsprogresjon**: Flyttet fra lineær dokumentasjon til fleksibel kapittelbasert læring
- **Konfigurasjonsplassering**: Konfigurasjonsveiledning flyttet til kapittel 3 for bedre flyt
- **AI-innholdsintegrasjon**: Bedre integrering av AI-spesifikt innhold i læringsreisen
- **Produktinnhold**: Avanserte mønstre konsolidert i kapittel 8 for enterprise-lærende

#### Forbedret
- **Brukeropplevelse**: Tydelige navigasjonskrummer og kapitelfremdriftsindikatorer
- **Tilgjengelighet**: Konsistente navigasjonsmønstre for enklere kursgjennomføring
- **Profesjonell presentasjon**: Universitetstil kursstruktur egnet for akademisk og bedriftsopplæring
- **Læringseffektivitet**: Redusert tid for å finne relevant innhold gjennom forbedret organisering

#### Teknisk gjennomføring
- **Navigasjonshoder**: Standardisert kapittelnavigasjon i over 40 dokumentasjonsfiler
- **Navigasjonsbunntekst**: Konsistent progresjonsveiledning og kapittelfullføringsindikatorer
- **Krysslenking**: Omfattende intern lenkesystem som kobler relaterte konsepter
- **Kapittelkartlegging**: Maler og eksempler tydelig tilknyttet læringsmål

#### Forbedring av studieveiledning
- **📚 Omfattende læringsmål**: Omstrukturert studieveiledning for å samsvare med 8-kapittelssystemet
- **🎯 Kapittelbasert vurdering**: Hvert kapittel inkluderer spesifikke læringsmål og praktiske øvelser
- **📋 Fremdriftssporing**: Ukentlig læringsplan med målbare resultater og sjekklister for fullføring
- **❓ Vurderingsspørsmål**: Kunnskapsvalideringsspørsmål for hvert kapittel med profesjonelle utfall
- **🛠️ Praktiske øvelser**: Hands-on aktiviteter med ekte distribusjonsscenarier og feilsøking
- **📊 Ferdighetsprogresjon**: Klar progresjon fra grunnleggende konsepter til enterprise-mønstre med karrierefokus
- **🎓 Sertifiseringsrammeverk**: Profesjonelle utviklingsutfall og fellesskapsgjenkjennelse
- **⏱️ Tidsstyring**: Strukturert 10-ukers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede Multi-Agent AI-løsninger
**Denne versjonen forbedrer fleragent-løsningen for retail med bedre agentnavngivning og forbedret dokumentasjon.**

#### Endret
- **Multi-Agent Terminologi**: Erstattet "Cora agent" med "Customer agent" gjennom hele retail fleragentløsningen for tydeligere forståelse
- **Agentarkitektur**: Oppdatert all dokumentasjon, ARM-maler og kodeeksempler med konsistent "Customer agent"-navngivning
- **Konfigurasjonseksempler**: Modernisert agentkonfigurasjonsmønstre med oppdatert navngivning
- **Dokumentasjonskonsistens**: Sikret at alle referanser bruker profesjonelle og beskrivende agentnavn

#### Forbedret
- **ARM-malpakke**: Oppdatert retail-multiagent-arm-template med Customer agent-referanser
- **Arkitekturdiagrammer**: Oppfriskede Mermaid-diagrammer med oppdatert agentnavngivning
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruker nå CustomerAgent-navn
- **Miljøvariabler**: Oppdatert alle deploy-skript til å bruke CUSTOMER_AGENT_NAME-konvensjoner

#### Forbedret
- **Utvikleropplevelse**: Klarere agentroller og ansvarsområder i dokumentasjonen
- **Produksjonsklarhet**: Bedre samsvar med bedriftsnavngivningskonvensjoner
- **Læringsmateriell**: Mer intuitiv agentnavngivning for utdannelsesformål
- **Malbrukervennlighet**: Forenklet forståelse av agentfunksjoner og deploy-mønstre

#### Tekniske detaljer
- Oppdatert Mermaid-arkitekturdiagrammer med CustomerAgent-referanser
- Erstattet CoraAgent-klassenavn med CustomerAgent i Python-eksempler
- Endret ARM-mal JSON-konfigurasjoner til å bruke "customer"-agenttype
- Oppdatert miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Oppfrisket alle deploy-kommandoer og containerkonfigurasjoner

### [v3.0.0] - 2025-09-12

#### Store endringer – AI-utviklerfokus og Microsoft Foundry-integrasjon
**Denne versjonen transformerer repositoriet til en omfattende AI-fokusert læringsressurs med Microsoft Foundry-integrasjon.**

#### Lagt til
- **🤖 AI-Først læringsløp**: Fullstendig omstrukturering med prioritet på AI-utviklere og ingeniører
- **Microsoft Foundry integrasjonsveiledning**: Omfattende dokumentasjon for tilkobling av AZD med Microsoft Foundry-tjenester
- **AI-modell distribusjonsmønstre**: Detaljert veiledning som dekker modellvalg, konfigurasjon og produksjonsdistribusjonsstrategier
- **AI Workshop-lab**: 2-3 timers praktisk workshop for å konvertere AI-applikasjoner til AZD-distribuerbare løsninger
- **Best Practices for produksjons-AI**: Bedriftsklare mønstre for skalering, overvåking og sikring av AI-arbeidsbelastninger
- **Feilsøkingsguide spesifikk for AI**: Omfattende feilsøking for Microsoft Foundry-modeller, Cognitive Services og AI-distribusjonsproblemer
- **AI-mal-galleri**: Utvalgt samling av Microsoft Foundry-maler med kompleksitetsvurderinger
- **Workshop-materialer**: Komplett workshopstruktur med praktiske laboratorier og referansemateriale

#### Forbedret
- **README-struktur**: AI-utviklerfokusert med 45 % data om samfunnsinteresse fra Microsoft Foundry Discord
- **Læringsløp**: Dedikert AI-utviklerreise ved siden av tradisjonelle løp for studenter og DevOps-ingeniører
- **Mal-anbefalinger**: Utvalgte AI-maler inkludert azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Integrasjon med fellesskap**: Forbedret Discord-fellesskapsstøtte med AI-spesifikke kanaler og diskusjoner

#### Sikkerhet og produksjonsfokus
- **Mønstre for administrert identitet**: AI-spesifikk autentisering og sikkerhetskonfigurasjoner
- **Kostnadsoptimalisering**: Sporing av tokenbruk og budsjettkontroller for AI-arbeidsbelastninger
- **Distribusjon i flere regioner**: Strategier for global distribusjon av AI-applikasjoner
- **Ytelsesovervåking**: AI-spesifikke måleparametere og integrasjon med Application Insights

#### Dokumentasjonskvalitet
- **Lineær kursstruktur**: Logisk progresjon fra nybegynner- til avanserte AI-distribusjonsmønstre
- **Validerte URL-er**: Alle eksterne repositorielinker verifisert og tilgjengelige
- **Fullstendig referanse**: Alle interne dokumentasjonslenker validert og funksjonelle
- **Produksjonsklar**: Bedriftsdistribusjonsmønstre med eksempler fra virkeligheten

### [v2.0.0] - 2025-09-09

#### Store endringer - Omstrukturering av repository og profesjonell forbedring
**Denne versjonen representerer en betydelig overhaling av repositoriets struktur og innholdspresentasjon.**

#### Lagt til
- **Strukturert læringsrammeverk**: Alle dokumentsider inkluderer nå Introduksjon, Læringsmål og Læringsutbytte-seksjoner
- **Navigasjonssystem**: La til forrige/neste leksjonslenker i all dokumentasjon for veiledet læringsprogresjon
- **Studieguide**: Omfattende study-guide.md med læringsmål, øvelser og vurderingsmateriell
- **Profesjonell presentasjon**: Fjernet alle emoji-ikoner for bedre tilgjengelighet og profesjonelt utseende
- **Forbedret innholdsstruktur**: Bedre organisering og flyt i læringsmaterialer

#### Endret
- **Dokumentasjonsformat**: Standardiserte all dokumentasjon med konsekvent læringsfokusert struktur
- **Navigasjonsflyt**: Implementert logisk progresjon gjennom alt læringsmateriell
- **Innholdspresentasjon**: Fjernet dekorative elementer til fordel for klar og profesjonell formatering
- **Lenkestruktur**: Oppdaterte alle interne lenker for å støtte nytt navigasjonssystem

#### Forbedret
- **Tilgjengelighet**: Fjernet emoji-avhengigheter for bedre kompatibilitet med skjermlesere
- **Profesjonelt utseende**: Ren, akademisk stil som passer for bedriftslæring
- **Læringsopplevelse**: Strukturert tilnærming med klare mål og resultater for hver leksjon
- **Innholdsorganisering**: Bedre logisk flyt og kobling mellom relaterte emner

### [v1.0.0] - 2025-09-09

#### Første utgivelse - Omfattende AZD læringsrepository

#### Lagt til
- **Kjernesaksdokumentasjon**
  - Komplett serie med startguide
  - Omfattende dokumentasjon for distribusjon og provisjonering
  - Detaljerte feilsøkingsressurser og debug-veiledninger
  - Verktøy og prosedyrer for validering før distribusjon

- **Kom i gang-modul**
  - AZD-grunnleggende: Kjernbegreper og terminologi
  - Installasjonsveiledning: Plattformspesifikke oppsettsinstruksjoner
  - Konfigurasjonsveiledning: Miljøoppsett og autentisering
  - Første prosjekt-veiledning: Steg-for-steg praktisk læring

- **Distribusjons- og provisjoneringsmodul**
  - Distribusjonsveiledning: Fullstendig arbeidsflytdokumentasjon
  - Provisjoneringsveiledning: Infrastruktur som kode med Bicep
  - Beste praksis for produksjonsdistribusjoner
  - Mønstre for fler-tjenestearkitektur

- **Validering før distribusjon-modul**
  - Kapasitetsplanlegging: Validering av Azure-ressursers tilgjengelighet
  - SKU-valg: Veiledning for tjenestelagsnivåer
  - Pre-flight-sjekker: Automatiserte valideringsskript (PowerShell og Bash)
  - Kostnadsestimering og budsjettplanleggingsverktøy

- **Feilsøkingsmodul**
  - Vanlige problemer: Ofte forekommende problemer og løsninger
  - Debug-veiledning: Systematiske feilsøkingsmetodikker
  - Avanserte diagnostikkteknikker og verktøy
  - Ytelsesovervåking og optimalisering

- **Ressurser og referanser**
  - Kommandolommelykt: Rask referanse for essensielle kommandoer
  - Ordliste: Omfattende terminologi og forkortelser
  - FAQ: Detaljerte svar på vanlige spørsmål
  - Eksterne ressurslenker og fellesskapskoblinger

- **Eksempler og maler**
  - Enkel webapplikasjonseksempel
  - Mal for distribusjon av statisk nettsted
  - Containerappkonfigurasjon
  - Databaseintegrasjonsmønstre
  - Mikroservicearkitektureksempler
  - Serverless-funksjonsimplementeringer

#### Funksjoner
- **Multiplattformstøtte**: Installasjons- og konfigurasjonsveiledninger for Windows, macOS og Linux
- **Ulike ferdighetsnivåer**: Innhold designet for studenter til profesjonelle utviklere
- **Praktisk fokus**: Praktiske eksempler og virkelighetsnære scenarioer
- **Omfattende dekning**: Fra grunnleggende konsepter til avanserte bedriftsmønstre
- **Sikkerhetsfokus**: Sikkerhetsbeste praksis integrert gjennomgående
- **Kostnadsoptimalisering**: Veiledning for kostnadseffektive distribusjoner og ressursstyring

#### Dokumentasjonskvalitet
- **Detaljerte kodeeksempler**: Praktiske, testede kodeeksempler
- **Steg-for-steg-instruksjoner**: Klar og handlingsrettet veiledning
- **Omfattende feilhåndtering**: Feilsøking for vanlige problemer
- **Integrering av beste praksis**: Bransjestandarder og anbefalinger
- **Versjonskompatibilitet**: Oppdatert med nyeste Azure-tjenester og azd-funksjoner

## Planlagte fremtidige forbedringer

### Versjon 3.1.0 (Planlagt)
#### Utvidelse av AI-plattform
- **Støtte for flere modeller**: Integrasjonsmønstre for Hugging Face, Azure Machine Learning og egendefinerte modeller
- **AI-agent-rammeverk**: Maler for LangChain, Semantic Kernel og AutoGen-distribusjoner
- **Avanserte RAG-mønstre**: Vektorbaser utenom Azure AI Search (Pinecone, Weaviate, osv.)
- **AI-observabilitet**: Forbedret overvåking av modellytelse, tokenbruk og responskvalitet

#### Utvikleropplevelse
- **VS Code-utvidelse**: Integrert AZD + Microsoft Foundry utvikleropplevelse
- **GitHub Copilot-integrasjon**: AI-assistert AZD-mal-generering
- **Interaktive veiledninger**: Praktiske kodeøvelser med automatisk validering for AI-scenarier
- **Videoinnhold**: Supplerende videotutorials for visuelle elever med fokus på AI-distribusjoner

### Versjon 4.0.0 (Planlagt)
#### Bedrifts-AI-mønstre
- **Styringsrammeverk**: AI-modellstyring, samsvar og revisjonsspor
- **Multi-leietaker AI**: Mønstre for å betjene flere kunder med isolerte AI-tjenester
- **Edge AI-distribusjon**: Integrasjon med Azure IoT Edge og containerforekomster
- **Hybrid sky-AI**: Fler-sky og hybrid distribusjonsmønstre for AI-arbeidsbelastninger

#### Avanserte funksjoner
- **AI-pipeline-automatisering**: MLOps-integrasjon med Azure Machine Learning-pipelines
- **Avansert sikkerhet**: Zero-trust-mønstre, private endepunkter og avansert trusselbeskyttelse
- **Ytelsesoptimalisering**: Avanserte innstillinger og skaleringsstrategier for høy gjennomstrømming i AI-applikasjoner
- **Global distribusjon**: Innholdslevering og edge-caching-mønstre for AI-applikasjoner

### Versjon 3.0.0 (Planlagt) - Overgått av nåværende utgivelse
#### Foreslåtte tillegg - Nå implementert i v3.0.0
- ✅ **AI-fokusert innhold**: Omfattende Microsoft Foundry-integrasjon (Fullført)
- ✅ **Interaktive veiledninger**: Praktisk AI-workshop-lab (Fullført)
- ✅ **Avansert sikkerhetsmodul**: AI-spesifikke sikkerhetsmønstre (Fullført)
- ✅ **Ytelsesoptimalisering**: AI-arbeidsbelastning tuning-strategier (Fullført)

### Versjon 2.1.0 (Planlagt) - Delvis implementert i v3.0.0
#### Mindre forbedringer - Noe fullført i nåværende utgivelse
- ✅ **Flere eksempler**: AI-fokuserte distribusjonsscenarioer (Fullført)
- ✅ **Utvidet FAQ**: AI-spesifikke spørsmål og feilsøking (Fullført)
- **Verktøyintegrasjon**: Forbedret IDE- og editor-integrasjonsveiledninger
- ✅ **Utvidet overvåking**: AI-spesifikke overvåkings- og varslingsmønstre (Fullført)

#### Fortsatt planlagt for fremtidig utgivelse
- **Mobilvennlig dokumentasjon**: Responsivt design for mobil læring
- **Offline tilgang**: Nedlastbare dokumentasjonspakker
- **Forbedret IDE-integrasjon**: VS Code-utvidelse for AZD + AI-arbeidsflyter
- **Fellesskapsdashboard**: Sanntidsmålinger og sporing av bidrag i fellesskapet

## Bidra til endringsloggen

### Rapportere endringer
Når du bidrar til dette repositoryet, vennligst sørg for at endringsloggoppføringer inkluderer:

1. **Versjonsnummer**: Følg semantisk versjonering (major.minor.patch)
2. **Dato**: Utgivelses- eller oppdateringsdato i YYYY-MM-DD-format
3. **Kategori**: Lagt til, Endret, Utdaterte, Fjernet, Rettet, Sikkerhet
4. **Klar beskrivelse**: Kortfattede endringer
5. **Påvirkningsvurdering**: Hvordan endringer påvirker eksisterende brukere

### Endringskategorier

#### Lagt til
- Nye funksjoner, dokumentasjonsseksjoner eller muligheter
- Nye eksempler, maler eller læringsressurser
- Ytterligere verktøy, skript eller nyttige funksjoner

#### Endret
- Endringer i eksisterende funksjonalitet eller dokumentasjon
- Oppdateringer for å forbedre klarhet eller nøyaktighet
- Omstrukturering av innhold eller organisering

#### Utdaterte
- Funksjoner eller tilnærminger som fases ut
- Dokumentasjonsseksjoner planlagt fjernet
- Metoder med bedre alternativer

#### Fjernet
- Funksjoner, dokumentasjon eller eksempler som ikke lenger er relevante
- Utdatert informasjon eller utdaterte tilnærminger
- Redundant eller konsolidert innhold

#### Rettet
- Korreksjoner av feil i dokumentasjon eller kode
- Løsning av rapporterte problemer eller feil
- Forbedringer av nøyaktighet eller funksjonalitet

#### Sikkerhet
- Sikkerhetsrelaterte forbedringer eller feilrettinger
- Oppdateringer for beste sikkerhetspraksis
- Løsning av sikkerhetssårbarheter

### Retningslinjer for semantisk versjonering

#### Hovedversjon (X.0.0)
- Endringer som bryter kompatibilitet og krever brukerhandling
- Betydelig omstrukturering av innhold eller organisering
- Endringer som påvirker grunnleggende tilnærming eller metodikk

#### Mindre versjon (X.Y.0)
- Nye funksjoner eller innholdsutvidelser
- Forbedringer som opprettholder bakoverkompatibilitet
- Flere eksempler, verktøy eller ressurser

#### Patch-versjon (X.Y.Z)
- Feilrettinger og korreksjoner
- Mindre forbedringer til eksisterende innhold
- Presiseringer og små justeringer

## Tilbakemeldinger og forslag fra fellesskapet

Vi oppfordrer aktivt tilbakemeldinger fra fellesskapet for å forbedre denne læringsressursen:

### Hvordan gi tilbakemelding
- **GitHub Issues**: Rapporter problemer eller foreslå forbedringer (AI-spesifikke problemer ønskes)
- **Discord-diskusjoner**: Del ideer og engasjer deg med Microsoft Foundry-fellesskapet
- **Pull Requests**: Bidra med direkte forbedringer til innhold, spesielt AI-maler og guider
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen for AZD + AI-diskusjoner
- **Fellesskapsfora**: Delta i bredere Azure-utviklerdiskusjoner

### Tilbakemeldingskategorier
- **Nøyaktighet i AI-innhold**: Korreksjoner for AI-tjenesteintegrasjon og distribusjonsinformasjon
- **Læringsopplevelse**: Forslag for forbedret AI-utviklerlæringsflyt
- **Mangler i AI-innhold**: Forespørsler om flere AI-maler, mønstre eller eksempler
- **Tilgjengelighet**: Forbedringer for ulike læringsbehov
- **AI-verktøyintegrasjon**: Forslag til bedre AI-utviklingsarbeidsflytintegrasjon
- **Produksjons-AI-mønstre**: Forespørsler om bedriftsmønstre for AI-distribusjon

### Responsforpliktelse
- **Problemrespons**: Innen 48 timer for rapporterte problemer
- **Funksjonsforespørsler**: Vurdering innen en uke
- **Bidrag fra fellesskap**: Gjennomgang innen en uke
- **Sikkerhetsproblemer**: Umiddelbar prioritet med rask respons

## Vedlikeholdsskjema

### Regelmessige oppdateringer
- **Månedlige gjennomganger**: Innholdsnøyaktighet og validering av lenker
- **Kvartalsvise oppdateringer**: Store innholdsutvidelser og forbedringer
- **Halvårlige gjennomganger**: Omfattende omstrukturering og forbedring
- **Årlige utgivelser**: Større versjonsoppdateringer med betydelige forbedringer

### Overvåking og kvalitetskontroll
- **Automatisert testing**: Regelmessig validering av kodeeksempler og lenker
- **Integrasjon av tilbakemeldinger**: Regelmessig innarbeiding av brukerforslag
- **Teknologioppdateringer**: Tilpasning til nyeste Azure-tjenester og azd-utgivelser
- **Tilgjengelighetsrevisjoner**: Jevnlige gjennomganger for inkluderende designprinsipper

## Versjonsstøttepolicy

### Støtte for gjeldende versjon
- **Siste hovedversjon**: Full støtte med regelmessige oppdateringer
- **Forrige hovedversjon**: Sikkerhetsoppdateringer og kritiske feilrettinger i 12 måneder
- **Legacy-versjoner**: Kun fellesskapsstøtte, ingen offisielle oppdateringer

### Migrasjonsveiledning
Når hovedversjoner slippes, tilbyr vi:
- **Migrasjonsguider**: Steg-for-steg overgangsinstruksjoner
- **Kompatibilitetsnotater**: Detaljer om brytende endringer
- **Verktøystøtte**: Skript eller verktøy for å hjelpe med migrering
- **Fellesskapsstøtte**: Dedikerte forum for migrasjonsrelaterte spørsmål

---

**Navigasjon**
- **Forrige leksjon**: [Studieveiledning](resources/study-guide.md)
- **Neste leksjon**: Gå tilbake til [Hoved-README](README.md)

**Hold deg oppdatert**: Følg dette repositoryet for varsler om nye utgivelser og viktige oppdateringer i læringsmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->