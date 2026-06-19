# Ændringslog - AZD For Begyndere

## Introduktion

Denne ændringslog dokumenterer alle bemærkelsesværdige ændringer, opdateringer og forbedringer i AZD For Beginners-repositoriet. Vi følger principperne for semantisk versionering og vedligeholder denne log for at hjælpe brugere med at forstå, hvad der er ændret mellem versioner.

## Læringsmål

Ved at gennemgå denne ændringslog vil du:
- Holde dig orienteret om nye funktioner og tilføjelser af indhold
- Forstå forbedringer foretaget i eksisterende dokumentation
- Spore fejlrettelser og korrektioner for at sikre nøjagtighed
- Følge udviklingen af læringsmaterialerne over tid

## Læringsresultater

Efter at have gennemgået ændringslogens poster vil du kunne:
- Identificere nyt indhold og tilgængelige ressourcer til læring
- Forstå hvilke sektioner der er opdateret eller forbedret
- Planlægge din læringssti baseret på de mest aktuelle materialer
- Bidrage med feedback og forslag til fremtidige forbedringer

## Versionshistorik

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Denne version lukker de resterende mellemniveau-gab fremhævet af azd-coverage-analysen: hvordan man skriver og publicerer sin egen skabelon, reproducerbare dev-container/Codespaces-miljøer, Pulumi-infrastrukturudbyderen, et Azure DevOps CI/CD-gennemløb, autentificering med tjenesteprincipaler, vejledning til host-udvalg (AKS/Spring Apps), forklaringer af `azd restore`/`azd package`, hook-fejlhåndtering og praksisser for team-/delte-miljøer.**

#### Tilføjet
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — oprettelse af din egen azd-skabelon: påkrævet struktur (`azure.yaml`, `infra/`, `src/`), feltet `metadata.template`, parametrisering af infrastrukturen med `uniqueString()` resource-tokenet og `azd-env-name` tagget, test lokalt med `azd init --template <local-path>`, publicering til GitHub, og indsendelse til Awesome AZD-galleriet
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — reproducerbare azd-miljøer med Dev Containers og GitHub Codespaces: en minimal `.devcontainer/devcontainer.json` der bruger den officielle `ghcr.io/azure/azure-dev/azd` feature, sprog-specifikke features, `docker-in-docker` for container-værter, og `azd auth login --use-device-code` til fjern-login
- **🧩 Pulumi with azd** sektion i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-mappeopbygning, stacks kortlagt til azd-miljøer, krævede outputs/tagging, og den identiske `azd up` / `azd down` workflow
- **🎯 Host-selection guidance** i `docs/chapter-04-infrastructure/provisioning.md` — en begynder-venlig sammenligning af `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, og `springapp`, med vejledning om hvornår man skal vælge AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD walkthrough** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection med workload identity federation (OIDC), den genererede `azure-dev.yml`, og opsætning af variable-group
- **🔑 Service Principals (Pattern 4)** tilføjet til `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interaktiv `azd auth login` med klienthemmelighed vs. federerede/OIDC-legitimationsoplysninger, hvornår man skal bruge dem, og sikker opbevaring af legitimationsoplysninger
- **🪝 Hook error-handling** underafsnit i `docs/chapter-04-infrastructure/deployment-guide.md` — exit-koder og `set -e`, `continueOnError`, test af hooks isoleret med `azd hooks run`, OS-specifikke shells, og `--debug`
- **👥 Team / shared environments** sektion i `docs/chapter-03-configuration/configuration.md` — hvad der hører til i `.azure/`, hvad der skal gitignores, per-udvikler-miljøer, `azd env list`/`select`, og levering af miljøværdier i CI/CD
- **🧰 `azd restore` and expanded `azd package`** forklaringer i `resources/cheat-sheet.md` — gendannelse af afhængigheder og opbygning af et deployerbart artefakt uden deployment

#### Ændret
- **🧭 Chapter 4 lessons table** opdateret til at inkludere den nye "Authoring Your Own Template" lektion (Lesson 3)
- **🧭 Chapter 1 lessons table** opdateret til at inkludere den nye "Dev Containers & Codespaces" lektion (Lesson 5); navigationsfootere forbundet mellem `bring-your-own-app.md` og `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Denne version lukker de største huller for en komplet begyndervejledning ved at tilføje to nye hands-on-lektioner (et deploybart multi-agent gennemløb og at tilføje azd til en eksisterende app), en begynder-venlig hooks-introduktion, en Terraform-with-azd sektion, en trin-for-trin GitHub Actions pipeline-gennemgang, en forklaring af de nye preview-extensions, og en eksplicit deployment-verifikationscheckliste.**

#### Tilføjet
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — et fuldt hands-on, deploybart to-agent gennemløb (orchestrator + specialists) ved brug af en rigtig skabelon (`contoso-creative-writer`), dækker hvornår man skal bruge multi-agent, `azd up` workflowet, forståelse af de deployerede ressourcer, cross-agent tracing, tilpasning, og oprydning
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — hvordan man tilføjer azd til et eksisterende projekt med `azd init` ("use code in the current directory"), forståelse af `azure.yaml` og `infra/`, `azd infra generate`, host-detektion, og deploy med `azd up`
- **🌐 Terraform with azd** sektion tilføjet til `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfiguration, `.tf` mappeopbygning, krævede `AZURE_*` outputs og `azd-env-name` tagging, og den identiske `azd up` / `azd down` workflow (lukker hullet hvor Terraform-support blev nævnt men kun Bicep blev vist)
- **⚙️ Step-by-step GitHub Actions walkthrough** i `docs/chapter-08-production/production-ai-practices.md` — fra GitHub-repo til automatiserede deploys: `azd pipeline config`, OIDC-federerede legitimationsoplysninger (ingen gemte hemmeligheder), den genererede `azure-dev.yml`, og vejledning om secrets vs. variables
- **🪝 Beginner "New to hooks?" introduction** i `docs/chapter-04-infrastructure/deployment-guide.md` — hvad en hook er, en hook-stage tabel, en minimal første hook, og kørsel af hooks manuelt med `azd hooks run`
- **✅ "Verify Your Deployment" checklist** tilføjet til Trin 5 af `docs/chapter-01-foundation/first-project.md` — smoke-test, health-endpoint-tjek, og eksplicitte succeskriterier
- **🧩 Explainer for new preview extensions** `azure.ai.skills` og `azure.ai.connections` (hvad de er og hvornår man ska bruge dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Ændret
- **🧭 Chapter 5 lessons table** rettet: `multi-agent-basics.md` er nu Lesson 1 (den eneste fuldt hands-on lektion), med ærlig mærkning om at Lesson 2 ligger i Chapter 6 og at Retail-scenariet er et arkitekturblåttryk, ikke en one-command skabelon
- **🧭 Chapter 1 lessons table** inkluderer nu den nye "Bring Your Own App" lektion (Lesson 4)
- **🔗 Navigation footers** opdateret: `first-project.md` linker nu fremad til `bring-your-own-app.md`

#### Rettet
- **🧱 Lukket det "påståede men manglende" Terraform-hul** — kurset refererede tidligere til Terraform-support uden at vise det
- **🔀 Rettet vildledende Chapter 5 kryds-links** der antydede at en fuld multi-agent-implementation eksisterede, hvor kun et arkitekturblåttryk var tilfældet

#### Opdaterede filer
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

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Denne version genvaliderer kurset mod `azd` `1.25.6` (juni 2026) og `azure.ai.agents` `0.1.40-preview` extensionen, udvider AI-vejledningen fra "scaffold en agent" til den komplette agent-lifecycle (test → evaluate → optimize → inspect → delete), synliggør de nye preview-extensions `azure.ai.skills` og `azure.ai.connections`, og bemærker ".NET Aspire" → "Aspire" produkt-rebrandet.**

#### Tilføjet
- **🔁 Full agent lifecycle coverage** for begyndere og AI-ingeniører på tværs af dokumenterne:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle-tabel (scaffold → test → measure → improve → inspect → clean up) tilføjet til Extensions and AI Commands-sektionen
  - `docs/chapter-08-production/production-ai-practices.md` — Ny "Managing the Agent Lifecycle" sektion der dækker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
  - `resources/cheat-sheet.md` — Udvidede AI Agent Commands med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
- **🧩 New preview extensions** dokumenteret: `azure.ai.skills` (genbrugelige agent-skills) og `azure.ai.connections` (Foundry connections) tilføjet til extensions-tabellen og cheat sheet
- **⏱️ Response-timing guidance** — `azd ai agent invoke` eksempler bemærker nu at den printer total latens og time-to-first-byte
- **📌 Version banner** i root README der peger lærende på `azd version` og `azd upgrade`

#### Ændret
- **✅ Validation baseline opdateret** fra `azd 1.23.12` (marts 2026) til `azd 1.25.6` (juni 2026) på tværs af alle chapter-READMEs og workshop-dokumenterne
- **🤖 Chapter 2 extension note** opdateret fra `azure.ai.agents` `0.1.18-preview` til `0.1.40-preview`
- **🧪 Workshop validation example** (`azd version` output) opdateret til `1.25.6`
- **🧭 README "What's New in azd Today"** opdateret for at fremhæve end-to-end agent-lifecycle, nye AI-extensions, og nyere kvalitet-af-livs-fixes (`azd init` idempotency, `azd auth login` rydning af stale-tokens, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** peger nu lærende til post-deploy lifecycle-kommandoerne i stedet for at stoppe ved `azd up`

#### Rettet
- **🏷️ Produktnavngivning** — tilføjet en Aspire rebrand-note (".NET Aspire" er nu blot "Aspire"); azd's Aspire-support er uændret
- **🔎 Live release validation** bekræftet mod Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) og `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Opdaterede filer
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
#### Begynder-onboarding-afklaring, validering af opsætning og endelig oprydning af AZD-kommandoer
**Denne version følger op på AZD 1.23-valideringsgennemgangen med en dokumentationsgennemgang rettet mod begyndere: den præciserer AZD-først autentificeringsvejledning, tilføjer lokale valideringsscripts til opsætning, verificerer nøglekommandoer mod den live AZD-CLI og fjerner de sidste forældede engelsksprogede kommando-referencer uden for changeloggen.**

#### Tilføjet
- **🧪 Begynder-valideringsscripts til opsætning** med `validate-setup.ps1` og `validate-setup.sh`, så deltagere kan bekræfte nødvendige værktøjer inden de starter Kapitel 1
- **✅ Indledende valideringsskridt for opsætning** i rod-README'en og Kapitel 1-README'en, så manglende forudsætninger fanges før `azd up`

#### Ændret
- **🔐 Begynder-autentificeringsvejledning** behandler nu konsekvent `azd auth login` som primær vej for AZD-workflows, mens `az login` fremhæves som valgfri medmindre Azure CLI-kommandoer anvendes direkte
- **📚 Kapitel 1 onboarding-flow** peger nu deltagere på at validere deres lokale opsætning før installation, autentificering og de første udrulningsskridt
- **🛠️ Validator-beskeder** adskiller nu klart blokerende krav fra valgfrie Azure CLI-advarsler for AZD-only begynderstien
- **📖 Konfigurations-, fejlfindings- og eksempel-dokumenter** adskiller nu krævet AZD-autentificering fra valgfri Azure CLI-log ind, hvor begge tidligere blev præsenteret uden kontekst

#### Rettet
- **📋 Tilbageværende engelsksprogede kommando-referencer** opdateret til aktuelle AZD-former, inklusive `azd config show` i cheat sheet og `azd monitor --overview` hvor Azure Portal-oversigtsguidance var tilsigtet
- **🧭 Begynderpåstande i Kapitel 1** er blødet op for at undgå at love garanteret fejlfri eller rollback-adfærd på tværs af alle skabeloner og Azure-ressourcer
- **🔎 Live CLI-validering** bekræftede aktuel support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, og `azd down --force --purge`

#### Filer opdateret
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

#### AZD 1.23.12-validering, udvidelse af workshopmiljøer og opdatering af AI-modeller
**Denne version udfører en dokumentationsvalideringsgennemgang mod `azd` `1.23.12`, opdaterer forældede AZD-kommandoeksempler, opdaterer AI-modelvejledning til aktuelle standarder og udvider workshopinstruktionerne ud over GitHub Codespaces til også at understøtte dev-containere og lokale kloner.**

#### Tilføjet
- **✅ Valideringsnoter på tværs af kernenkapitler og workshopdokumenter** for at gøre den testede AZD-baseline eksplicit for deltagere, der bruger nyere eller ældre CLI-builds
- **⏱️ Vejledning om udrulningstimeouts** for langkørende AI-apps ved brug af `azd deploy --timeout 1800`
- **🔎 Trin til inspektion af udvidelser** med `azd extension show azure.ai.agents` i AI-workflow-dokumenter
- **🌐 Bredere vejledning om workshopmiljøer** der dækker GitHub Codespaces, dev-containere og lokale kloner med MkDocs

#### Ændret
- **📚 Kapitelintro-READMEs** bemærker nu konsekvent validering mod `azd 1.23.12` i foundation-, configuration-, infrastructure-, multi-agent-, pre-deployment-, troubleshooting- og production-afsnittene
- **🛠️ AZD-kommando-referencer** opdateret til aktuelle former i dokumenterne:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` afhængigt af kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` hvor en oversigt i Application Insights er tilsigtet
- **🧪 Provision preview-eksempler** forenklet til den aktuelt understøttede brug som `azd provision --preview` og `azd provision --preview -e production`
- **🧭 Workshop-flow** opdateret så deltagere kan gennemføre øvelserne i Codespaces, en dev-container eller en lokal klon i stedet for at antage Codespaces-only udførelse
- **🔐 Autentificeringsvejledning** foretrækker nu `azd auth login` til AZD-workflows, mens `az login` er positioneret som valgfri, når Azure CLI-kommandoer bruges direkte

#### Rettet
- **🪟 Windows-installationskommandoer** normaliseret til aktuel `winget`-pakke-casing i installationsguiden
- **🐧 Linux-installationsvejledning** rettet for at undgå ikke-understøttede distro-specifikke `azd` package manager-instruktioner og i stedet pege på release-assets hvor passende
- **📦 AI-model-eksempler** opdateret fra ældre standarder som `gpt-35-turbo` og `text-embedding-ada-002` til nuværende eksempler såsom `gpt-4.1-mini`, `gpt-4.1`, og `text-embedding-3-large`
- **📋 Udrulnings- og diagnostikudsnit** rettet til at bruge aktuelle miljø- og statuskommandoer i logs, scripts og fejlfindingsskridt
- **⚙️ GitHub Actions-vejledning** opdateret fra `Azure/setup-azd@v1.0.0` til `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtykkevejledning** opdateret fra `azd mcp consent` til `azd copilot consent list`

#### Forbedret
- **🧠 AI-kapitelvejledning** forklarer nu bedre preview-sensitive `azd ai`-adfærd, tenant-specifik login, aktuel udvidelsesbrug og opdaterede anbefalinger for modeludrulning
- **🧪 Workshopinstruktioner** bruger nu mere realistiske versionseksempler og klarere sprog om opsætning af miljøer til hands-on labs
- **📈 Produktions- og fejlfindingsdokumenter** er nu bedre tilpasset aktuelle eksempler på overvågning, fallback-modeller og omkostningsniveauer

#### Filer opdateret
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

#### AZD AI CLI-kommandoer, indholdsvalidering og udvidelse af skabeloner
**Denne version tilføjer dækning af `azd ai`, `azd extension` og `azd mcp`-kommandoer i alle AI-relaterede kapitler, retter ødelagte links og forældet kode i agents.md, opdaterer cheat sheet og renoverer afsnittet om eksempel-skabeloner med validerede beskrivelser og nye Azure AI AZD-skabeloner.**

#### Tilføjet
- **🤖 AZD AI CLI-dækning** på tværs af 7 filer (tidligere kun i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny sektion "Extensions and AI Commands" der introducerer `azd extension`, `azd ai agent init`, og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Mulighed 4: `azd ai agent init` med sammenligningstabel (skabelon vs manifest-tilgang)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD-udvidelser til Foundry" og "Agent-først-udrulning" underafsnit
  - `docs/chapter-05-multi-agent/README.md` — Quick Start viser nu både skabelon- og manifest-baserede udrulningsveje
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-sektionen inkluderer nu `azd ai agent init`-mulighed
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underafsnit "AZD AI-udvidelseskommandoer til diagnostik"
  - `resources/cheat-sheet.md` — Ny sektion "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp`, og `azd infra generate`
- **📦 Nye AZD AI-eksempelskabeloner** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chat med Blazor WebAssembly, Semantic Kernel og understøttelse af stemmechat
  - **azure-search-openai-demo-java** — Java RAG-chat ved brug af Langchain4J med ACA/AKS udrulningsmuligheder
  - **contoso-creative-writer** — Multi-agent kreativ skriveapp ved brug af Azure AI Agent Service, Bing Grounding og Prompty
  - **serverless-chat-langchainjs** — Serverless RAG ved brug af Azure Functions + LangChain.js + Cosmos DB med Ollama support til lokal udvikling
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med administrationsportal, Teams-integration og PostgreSQL/Cosmos DB-muligheder
  - **azure-ai-travel-agents** — Multi-agent MCP-orkestrerings-referenceapp med servere i .NET, Python, Java og TypeScript
  - **azd-ai-starter** — Minimal Azure AI-infrastruktur Bicep-starterskabelon
  - **🔗 Awesome AZD AI Gallery link** — Henvisning til [awesome-azd AI-galleri](https://azure.github.io/awesome-azd/?tags=ai) (80+ skabeloner)

#### Rettet
- **🔗 agents.md navigation**: Forrige/Næste-links matcher nu Kapitel 2 README-lektionsrækkefølgen (Microsoft Foundry Integration → Agenter → AI-modeludrulning)
- **🔗 agents.md ødelagte links**: `production-ai-practices.md` rettet til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md forældet kode**: Udskiftet `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttede `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md tokenoptælling**: Udskiftede grov `len//4`-estimat med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rettede tjenester fra 'Cognitive Search + App Service' til 'Azure AI Search + Azure Container Apps' (standardvært ændret okt 2024)
- **contoso-chat**: Opdateret beskrivelse til at referere Azure AI Foundry + Prompty, så det matcher repoets faktiske titel og tech-stack

#### Fjernet
- **ai-document-processing**: Fjernet ikke-funktionel skabelonreference (repo ikke offentligt tilgængeligt som en AZD-skabelon)

#### Forbedret
- **📝 agents.md øvelser**: Øvelse 1 viser nu forventet output og `azd monitor`-trin; Øvelse 2 inkluderer fuld `FunctionTool`-registreringskode; Øvelse 3 erstatter vag vejledning med konkrete `prepdocs.py`-kommandoer
- **📚 agents.md ressourcer**: Opdaterede dokumentationslinks til aktuelle Azure AI Agent Service-dokumenter og quickstart
- **📋 agents.md Next Steps-tabel**: Tilføjede AI Workshop Lab-link for komplet kapiteldækning

#### Filer opdateret
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### Forbedring af kursusnavigation
**Denne version forbedrer README.md kapitelnavigationen med et forbedret tabelformat.**

#### Ændret
- **Course Map Table**: Forbedret med direkte lektionslinks, varighedsskøn og kompleksitetsvurderinger
- **Folder Cleanup**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Alle 21+ interne links i Course Map-tabellen verificeret

### [v3.16.0] - 2026-02-05

#### Produktnavneopdateringer
**Denne version opdaterer produktreferencer til den aktuelle Microsoft-branding.**

#### Ændret
- **Microsoft Foundry → Microsoft Foundry**: Alle referencer opdateret i ikke-oversatte filer
- **Azure AI Agent Service → Foundry Agents**: Servicenavn opdateret for at afspejle den nuværende branding

#### Filer opdateret
- `README.md` - Hovedsiden for kurset
- `changelog.md` - Versionshistorik
- `course-outline.md` - Kursusstruktur
- `docs/chapter-02-ai-development/agents.md` - Guide til AI-agenter
- `examples/README.md` - Dokumentation for eksempler
- `workshop/README.md` - Workshop-hovedside
- `workshop/docs/index.md` - Workshop-indeks
- `workshop/docs/instructions/*.md` - Alle workshop-instruktionsfiler

---

### [v3.15.0] - 2026-02-05

#### Stor omstrukturering af repository: Kapitelbaserede mappenavne
**Denne version omstrukturerer dokumentationen i dedikerede kapitelmapper for klarere navigation.**

#### Omdøbte mapper
Gamle mapper er blevet erstattet af kapitelnummererede mapper:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Filmigrationer
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Tilføjet
- **📚 Kapitel-README-filer**: Oprettet README.md i hver kapitelmappe med:
  - Læringsmål og varighed
  - Lektionstabel med beskrivelser
  - Hurtigstart-kommandoer
  - Navigation til andre kapitler

#### Ændret
- **🔗 Opdateret alle interne links**: 78+ stier opdateret på tværs af dokumentationsfiler
- **🗺️ Hoved-README.md**: Opdateret Course Map med ny kapitelstruktur
- **📝 examples/README.md**: Opdaterede krydsreferencer til kapitelmapper

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Omstrukturering af repository: Kapitelnavigation
**Denne version tilføjede kapitelnavigation README-filer (erstattet af v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny guide til AI-agenter
**Denne version tilføjer en omfattende guide til udrulning af AI-agenter med Azure Developer CLI.**

#### Tilføjet
- **🤖 docs/microsoft-foundry/agents.md**: Fuld guide der dækker:
  - Hvad AI-agenter er, og hvordan de adskiller sig fra chatbots
  - Tre quick-start agent-skabeloner (Foundry Agents, Prompty, RAG)
  - Agentarkitekturmønstre (enkelt agent, RAG, multi-agent)
  - Konfiguration af værktøjer og tilpasning
  - Overvågning og metrics-sporing
  - Omkostningsovervejelser og optimering
  - Almindelige fejlsøgningsscenarier
  - Tre praktiske øvelser med succeskriterier

#### Indholdsstruktur
- **Introduktion**: Agentkoncepter for begyndere
- **Quick Start**: Deploy agents with `azd init --template get-started-with-ai-agents`
- **Arkitekturmønstre**: Visuelle diagrammer af agentmønstre
- **Konfiguration**: Værktøjsopsætning og miljøvariabler
- **Overvågning**: Integration med Application Insights
- **Øvelser**: Progressiv praktisk læring (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### Opdatering af DevContainer-miljø
**Denne version opdaterer konfigurationen af udviklingscontaineren med moderne værktøjer og bedre standardindstillinger til AZD-læringsoplevelsen.**

#### Ændret
- **🐳 Base Image**: Opdateret fra `python:3.12-bullseye` til `python:3.12-bookworm` (seneste Debian stable)
- **📛 Container Name**: Omdøbt fra "Python 3" til "AZD for Beginners" for klarhed

#### Tilføjet
- **🔧 Nye Dev Container-funktioner**:
  - `azure-cli` med Bicep-understøttelse aktiveret
  - `node:20` (LTS-version til AZD-skabeloner)
  - `github-cli` til skabelonhåndtering
  - `docker-in-docker` til container-app-udrulninger

- **🔌 Port Forwarding**: Forudkonfigurerede porte til almindelig udvikling:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nye VS Code-udvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-understøttelse
  - `ms-azuretools.vscode-docker` - Docker-understøttelse
  - `ms-azuretools.vscode-bicep` - Bicep-sprogunderstøttelse
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid-diagramunderstøttelse
  - `redhat.vscode-yaml` - YAML-understøttelse (til azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historik

- **⚙️ VS Code-indstillinger**: Tilføjede standardindstillinger for Python-interpreter, format on save og fjernelse af whitespace

- **📦 Opdateret requirements-dev.txt**:
  - Tilføjet MkDocs minify-plugin
  - Tilføjet pre-commit til kodekvalitet
  - Tilføjet Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Rettet
- **Post-Create Command**: Verificerer nu AZD- og Azure CLI-installation ved containerstart

---

### [v3.11.0] - 2026-02-05

#### Bruger-/begynder-venlig README-genopbygning
**Denne version forbedrer README.md betydeligt for at være mere tilgængelig for begyndere og tilføjer væsentlige ressourcer til AI-udviklere.**

#### Tilføjet
- **🆚 Azure CLI vs AZD-sammenligning**: Klar forklaring på, hvornår man bruger hvert værktøj med praktiske eksempler
- **🌟 Awesome AZD Links**: Direkte links til community-skabelongalleri og bidragsressourcer:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ klar-til-udrulning skabeloner
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community-bidrag
- **🎯 Hurtigstartguide**: Forenklet 3-trins "kom i gang"-sektion (Install → Login → Deploy)
- **📊 Navigationstabel baseret på erfaring**: Klar vejledning om, hvor man skal starte baseret på udviklerens erfaring

#### Ændret
- **README-struktur**: Omgjort for progressiv afsløring - nøgleinformation først
- **Introduktionssektion**: Omskrevet for at forklare "The Magic of `azd up`" for helt nye brugere
- **Fjernet duplikeret indhold**: Elimineret duplikeret fejlsøgningssektion
- **Fejlsøgningskommandoer**: Rettet `azd logs`-reference til at bruge gyldig `azd monitor --logs`

#### Rettet
- **🔐 Autentifikationskommandoer**: Tilføjede `azd auth login` og `azd auth logout` til cheat-sheet.md
- **Ugyldige kommando-referencer**: Fjernede resterende `azd logs` fra README-fejlsøgningssektionen

#### Noter
- **Anvendelsesområde**: Ændringer anvendt på hoved-README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer specifikt rettet mod udviklere nye til AZD

---

### [v3.10.0] - 2026-02-05

#### Korrigering af Azure Developer CLI-kommandoer
**Denne version korrigerer ikke-eksisterende AZD-kommandoer i dokumentationen og sikrer, at alle kodeeksempler bruger gyldig Azure Developer CLI-syntaks.**

#### Rettet
- **🔧 Ikke-eksisterende AZD-kommandoer fjernet**: Omfattende revision og korrektion af ugyldige kommandoer:
  - `azd logs` (findes ikke) → erstattet med `azd monitor --logs` eller Azure CLI-alternativer
  - `azd service` underkommandoer (findes ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (findes ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flag (findes ikke) → fjernet
  - `azd provision --what-if/--rollback` flag (findes ikke) → opdateret til at bruge `--preview`
  - `azd config validate` (findes ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (findes ikke) → fjernet

- **📚 Filer opdateret med kommando-korrektioner**:
  - `resources/cheat-sheet.md`: Omfattende gennemgang af kommandooversigt
  - `docs/deployment/deployment-guide.md`: Rettet rollback- og udrulningsstrategier
  - `docs/troubleshooting/debugging.md`: Rettet sektioner om loganalyse
  - `docs/troubleshooting/common-issues.md`: Opdaterede fejlsøgningskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Rettet AZD-debuggingsektion
  - `docs/getting-started/azd-basics.md`: Rettet overvågningskommandoer
  - `docs/getting-started/first-project.md`: Opdaterede overvågnings- og fejlsøgnings-eksempler
  - `docs/getting-started/installation.md`: Rettede hjælp- og versionseksempler
  - `docs/pre-deployment/application-insights.md`: Rettede kommandoer til visning af logs
  - `docs/pre-deployment/coordination-patterns.md`: Rettede agent-debuggingkommandoer

- **📝 Versionsreference opdateret**: 
  - `docs/getting-started/installation.md`: Ændret hardkodet `1.5.0`-version til generisk `1.x.x` med link til releases

#### Ændret
- **Rollback-strategier**: Dokumentation opdateret til at bruge Git-baseret rollback (AZD har ikke indbygget rollback)
- **Logvisning**: Erstattede `azd logs`-referencer med `azd monitor --logs`, `azd monitor --live`, og Azure CLI-kommandoer
- **Ydelsesafsnit**: Fjernede ikke-eksisterende parallelle/incremental udrulningsflag og gav gyldige alternativer

#### Tekniske detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor-flags**: `--live`, `--logs`, `--overview`
- **Fjernede funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Noter
- **Verifikation**: Kommandoer verificeret mod Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshopfærdiggørelse og forbedring af dokumentationskvalitet
**Denne version færdiggør de interaktive workshopmoduler, retter alle brudte dokumentationslinks og forbedrer det overordnede indhold for AI-udviklere, der bruger Microsoft AZD.**

#### Tilføjet
- **📝 CONTRIBUTING.md**: Ny dokument med retningslinjer for bidrag med:
  - Klare instruktioner til rapportering af issues og forslag til ændringer
  - Dokumentationsstandarder for nyt indhold
  - Retningslinjer for kodeeksempler og konventioner for commit-beskeder
  - Information om fællesskabsengagement

#### Fuldført
- **🎯 Workshop Modul 7 (Opsummering)**: Færdigt opsummeringsmodul med:
  - Omfattende resumé af workshopens resultater
  - Afsnit om nøglekoncepter der er mestret, dækker AZD, skabeloner og Microsoft Foundry
  - Anbefalinger til fortsættelse af læringsrejsen
  - Workshop-udfordringsøvelser med sværhedsgrader
  - Links til feedback fra fællesskabet og support

- **📚 Workshop Modul 3 (Deconstruct)**: Opdaterede læringsmål med:
  - Vejledning til aktivering af GitHub Copilot med MCP-servere
  - Forståelse af AZD skabelonmappestruktur
  - Infrastruktur-som-kode (Bicep) organisationsmønstre
  - Hands-on labinstruktioner

- **🔧 Workshop Modul 6 (Teardown)**: Færdiggjort med:
  - Mål for oprydning af ressourcer og omkostningsstyring
  - Brug af `azd down` til sikker nedtagning af infrastruktur
  - Vejledning i genopretning af blødt slettede kognitive tjenester
  - Bonus-udforskningstips for GitHub Copilot og Azure Portal

#### Rettet
- **🔗 Rettelse af brudte links**: Løst 15+ brudte interne dokumentationslinks:
  - `docs/ai-foundry/ai-model-deployment.md`: Rettede stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerede ai-model-deployment.md og production-ai-practices.md stier
  - `docs/getting-started/first-project.md`: Erstattede ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Rettede stier til FAQ og fejlfinding-vejledning
  - `examples/container-app/microservices/README.md`: Korrigerede stier til kursusforside og deploymentsvejledning
  - `resources/faq.md` and `resources/glossary.md`: Opdaterede AI-kapitlets referencer
  - `course-outline.md`: Rettede referencer til instruktørvejledning og AI-workshop-lab

- **📅 Workshop Status Banner**: Opdateret fra "Under Construction" til aktiv workshopstatus med dato februar 2026

- **🔗 Workshop Navigation**: Rettede brudte navigationslinks i workshop README.md, som pegede på den ikke-eksisterende lab-1-azd-basics mappe

#### Ændret
- **Workshop Presentation**: Fjernede "under construction"-advarsel, workshop er nu komplet og klar til brug
- **Navigation Consistency**: Sikrede, at alle workshopmoduler har korrekt navigation mellem moduler
- **Learning Path References**: Opdaterede kapitelkrydsreferencer til at bruge korrekte microsoft-foundry-stier

#### Valideret
- ✅ Alle engelske markdownfiler har gyldige interne links
- ✅ Workshopmoduler 0-7 er komplette med læringsmål
- ✅ Navigation mellem kapitler og moduler fungerer korrekt
- ✅ Indhold er egnet til AI-udviklere, der bruger Microsoft AZD
- ✅ Begyndervenligt sprog og struktur opretholdt
- ✅ CONTRIBUTING.md giver klare retningslinjer for bidragydere i fællesskabet

#### Teknisk implementering
- **Link Validation**: Automatiseret PowerShell-script verificerede alle .md interne links
- **Content Audit**: Manuel gennemgang af workshopens fuldstændighed og egnethed for begyndere
- **Navigation System**: Ensartede kapitel- og modulnavigationsmønstre anvendt

#### Bemærkninger
- **Scope**: Ændringer anvendt kun på den engelske dokumentation
- **Translations**: Oversættelsesmapper blev ikke opdateret i denne version (automatiseret oversættelse synkroniseres senere)
- **Workshop Duration**: Den komplette workshop giver nu 3-4 timers praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avanceret dokumentation: Overvågning, sikkerhed og multi-agent-mønstre
**Denne version tilføjer omfattende lektioner i A-kvalitet om Application Insights-integration, autentificeringsmønstre og multi-agent-koordinering til produktionsimplementeringer.**

#### Tilføjet
- **📊 Application Insights Integration Lesson**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuseret udrulning med automatisk provisionering
  - Fuldstændige Bicep-skabeloner til Application Insights + Log Analytics
  - Fungerende Python-applikationer med brugerdefineret telemetri (1,200+ lines)
  - AI/LLM overvågningsmønstre (Microsoft Foundry Models token/cost tracking)
  - 6 Mermaid-diagrammer (arkitektur, distribueret tracing, telemetri flow)
  - 3 hands-on øvelser (alarmer, dashboards, AI-overvågning)
  - Kusto-forespørgselseksempler og strategier for omkostningsoptimering
  - Live metriks-streaming og realtidsdebugging
  - 40-50 minutters læringstid med produktionsklare mønstre

- **🔐 Lektion om autentificerings- og sikkerhedsmønstre**: i `docs/getting-started/authsecurity.md`:
  - 3 autentificeringsmønstre (forbindelsesstrenge, Key Vault, managed identity)
  - Fuldstændige Bicep-infrastruktursskabeloner til sikre udrulninger
  - Node.js-applikationskode med Azure SDK-integration
  - 3 komplette øvelser (aktiver managed identity, bruger-tilknyttet identitet, Key Vault-rotation)
  - Sikkerhedspraksis og RBAC-konfigurationer
  - Fejlfindingsvejledning og omkostningsanalyse
  - Produktionsklare passwordløse autentificeringsmønstre

- **🤖 Lektion om multi-agent koordinationsmønstre**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineringsmønstre (sekventiel, parallel, hierarkisk, event-drevet, konsensus)
  - Fuldstændig orchestrator-serviceimplementering (Python/Flask, 1,500+ lines)
  - 3 specialiserede agentimplementeringer (Research, Writer, Editor)
  - Service Bus-integration til beskedkøer
  - Cosmos DB-tilstandsadministration for distribuerede systemer
  - 6 Mermaid-diagrammer, der viser agentinteraktioner
  - 3 avancerede øvelser (timeout-håndtering, retry-logik, circuit breaker)
  - Omkostningsoversigt ($240-565/month) med optimeringsstrategier
  - Application Insights-integration til overvågning

#### Forbedret
- **Kapitel før udrulning**: Indeholder nu omfattende overvågnings- og koordinationsmønstre
- **Kom godt i gang-kapitel**: Forbedret med professionelle autentificeringsmønstre
- **Produktionsparathed**: Fuld dækning fra sikkerhed til observabilitet
- **Kursusoversigt**: Opdateret til at henvise til nye lektioner i Kapitel 3 og 6

#### Ændret
- **Læringsprogression**: Bedre integration af sikkerhed og overvågning gennem hele kurset
- **Dokumentationskvalitet**: Ensartede A-niveau standarder (95-97%) på tværs af nye lektioner
- **Produktionsmønstre**: Fuldstændig ende-til-ende dækning for virksomheders udrulninger

#### Forbedret
- **Udvikleroplevelse**: Klar vej fra udvikling til produktionsovervågning
- **Sikkerhedsstandarder**: Professionelle mønstre for autentificering og hemmelighedshåndtering
- **Observability**: Fuldstændig Application Insights-integration med AZD
- **AI Workloads**: Specialiseret overvågning for Microsoft Foundry Models og multi-agent-systemer

#### Valideret
- ✅ Alle lektioner indeholder komplet fungerende kode (ikke uddrag)
- ✅ Mermaid-diagrammer til visuel læring (19 i alt på tværs af 3 lektioner)
- ✅ Hands-on øvelser med verifikationssteg (9 i alt)
- ✅ Produktionsklare Bicep-skabeloner kan udrulles via `azd up`
- ✅ Omkostningsanalyse og optimeringsstrategier
- ✅ Fejlfindingsvejledninger og bedste praksis
- ✅ Videnscheckpunkter med verifikationskommandoer

#### Dokumentationsbedømmelsesresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvågningsvejledning
- **docs/getting-started/authsecurity.md**: - Professionelle sikkerhedsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avancerede multi-agent-arkitekturer
- **Samlet nyt indhold**: - Ensartede højkvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + brugerdefineret telemetri + distribueret tracing
- **Autentificering**: Managed Identity + Key Vault + RBAC-mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestration
- **Overvågning**: Live-metrikker + Kusto-forespørgsler + alarmer + dashboards
- **Omkostningsstyring**: Sampling-strategier, opbevaringspolitikker, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Forbedringer i dokumentationskvalitet og nyt eksempel på Microsoft Foundry Models
**Denne version forbedrer dokumentationskvaliteten på tværs af repoet og tilføjer et komplet deployment-eksempel for Microsoft Foundry Models med gpt-4.1 chat-interface.**

#### Tilføjet
- **🤖 Microsoft Foundry Models Chat-eksempel**: Komplet gpt-4.1-udrulning med fungerende implementering i `examples/azure-openai-chat/`:
  - Komplet Microsoft Foundry Models-infrastruktur (gpt-4.1 modeludrulning)
  - Python kommandolinje chat-interface med samtalehistorik
  - Key Vault-integration til sikker opbevaring af API-nøgler
  - Token-brugsopsporing og omkostningsestimering
  - Ratebegrænsning og fejlhåndtering
  - Omfattende README med 35-45 minutters vejledning til udrulning
  - 11 produktionsklare filer (Bicep-skabeloner, Python-app, konfiguration)
- **📚 Dokumentationsøvelser**: Tilføjede praktiske øvelser til konfigurationsvejledningen:
  - Øvelse 1: Konfiguration af flere miljøer (15 minutter)
  - Øvelse 2: Håndtering af hemmeligheder (10 minutter)
  - Klar succeskriterier og verifikationssteg
- **✅ Verifikation af udrulning**: Tilføjede verifikationsafsnit til udrulningsvejledningen:
  - Procedurer for sundhedstjek
  - Tjekliste for succeskriterier
  - Forventede output for alle udrulningskommandoer
  - Hurtig reference for fejlfinding

#### Forbedret
- **examples/README.md**: Opdateret til A-niveau kvalitet (93%):
  - Tilføjede azure-openai-chat til alle relevante sektioner
  - Opdaterede antal lokale eksempler fra 3 til 4
  - Tilføjet til tabellen over AI-applikationseksempler
  - Integreret i Quick Start for brugere på mellemniveau
  - Tilføjet til Microsoft Foundry Templates-sektionen
  - Opdaterede sammenligningsmatrixen og afsnit om teknologivalg
- **Dokumentationskvalitet**: Forbedret B+ (87%) → A- (92%) i docs-mappen:
  - Tilføjede forventede outputs til kritiske kommandoeksempler
  - Medtog verifikationssteg for konfigurationsændringer
  - Forbedret hands-on læring med praktiske øvelser

#### Ændret
- **Læringsprogression**: Bedre integration af AI-eksempler for brugere på mellemniveau
- **Dokumentationsstruktur**: Mere handlingsorienterede øvelser med klare resultater
- **Verifikationsproces**: Eksplicitte succeskriterier tilføjet til nøglearbejdsgange

#### Forbedret
- **Udvikleroplevelse**: Microsoft Foundry Models-udrulningen tager nu 35-45 minutter (vs. 60-90 for komplekse alternativer)
- **Omkostningstransparens**: Klare omkostningsestimater ($50-200/month) for Microsoft Foundry Models-eksemplet
- **Læringssti**: AI-udviklere har en klar indgang med azure-openai-chat
- **Dokumentationsstandarder**: Ensartede forventede outputs og verifikationssteg

#### Valideret
- ✅ Microsoft Foundry Models-eksemplet er fuldt funktionsdygtigt med `azd up`
- ✅ Alle 11 implementeringsfiler er syntaktisk korrekte
- ✅ README-instruktioner matcher den faktiske udrulningsoplevelse
- ✅ Dokumentationslinks opdateret på 8+ steder
- ✅ Eksempelindeks afspejler nøjagtigt 4 lokale eksempler
- ✅ Ingen duplikerede eksterne links i tabeller
- ✅ Alle navigationsreferencer korrekte

#### Teknisk implementering
- **Microsoft Foundry Models-arkitektur**: gpt-4.1 + Key Vault + Container Apps-mønster
- **Sikkerhed**: Managed Identity klar, hemmeligheder i Key Vault
- **Overvågning**: Application Insights-integration
- **Omkostningsstyring**: Token-sporing og brugsoptimering
- **Udrulning**: Enkel `azd up`-kommando for komplet opsætning

### [v3.6.0] - 2025-11-19

#### Større opdatering: Container App-udrulningseksempler
**Denne version introducerer omfattende, produktionsklare containerapplikations-udrulningseksempler ved brug af Azure Developer CLI (AZD), med fuld dokumentation og integration i læringsforløbet.**

#### Tilføjet
- **🚀 Container App-eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Masterguide](examples/container-app/README.md): Fuldstændig oversigt over containeriserede udrulninger, hurtigstart, produktion og avancerede mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Begyndervenlig REST-API med scale-to-zero, health probes, overvågning og fejlfinding
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices): Produktionsklar multi-service udrulning (API Gateway, Product, Order, User, Notification), asynkron messaging, Service Bus, Cosmos DB, Azure SQL, distribueret tracing, blue-green/canary udrulning
- **Best Practices**: Sikkerhed, overvågning, omkostningsoptimering og CI/CD-vejledning for containeriserede workloads
- **Code Samples**: Fuldstændige `azure.yaml`, Bicep-skabeloner og flersprogede serviceimplementeringer (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end testscenarier, overvågningskommandoer, fejlfindingvejledning

#### Ændret
- **README.md**: Opdateret til at fremhæve og linke nye container app-eksempler under "Local Examples - Container Applications"
- **examples/README.md**: Opdateret til at fremhæve container app-eksempler, tilføje sammenligningsmatrixindtastninger og opdatere teknologi-/arkitekturreferencer
- **Course Outline & Study Guide**: Opdateret til at henvise til nye container app-eksempler og udrulningsmønstre i relevante kapitler

#### Valideret
- ✅ Alle nye eksempler kan udrulles med `azd up` og følger bedste praksis
- ✅ Dokumentationskrydslinks og navigation opdateret
- ✅ Eksempler dækker fra begynder til avancerede scenarier, inklusive produktionsmikrotjenester

#### Bemærkninger
- **Scope**: Engelsk dokumentation og eksempler kun
- **Next Steps**: Udvid med yderligere avancerede container-mønstre og CI/CD-automatisering i fremtidige udgivelser

### [v3.5.0] - 2025-11-19

#### Produktomdøbning: Microsoft Foundry
**Denne version gennemfører en omfattende produktnavneændring fra "Microsoft Foundry" til "Microsoft Foundry" på tværs af al engelsk dokumentation, som afspejler Microsofts officielle rebranding.**

#### Ændret
- **🔄 Opdatering af produktnavn**: Fuldstændig omdøbning fra "Microsoft Foundry" til "Microsoft Foundry"
  - Opdaterede alle referencer i den engelske dokumentation i `docs/`-mappen
  - Omdøbt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøbt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 indholdsreferencer opdateret på tværs af 7 dokumentationsfiler

- **📁 Ændringer i mappestruktur**:
  - `docs/ai-foundry/` omdøbt til `docs/microsoft-foundry/`
  - Alle krydsreferencer opdateret for at afspejle den nye mappestruktur
  - Navigationslinks valideret på tværs af al dokumentation

- **📄 Filomdøbninger**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links opdateret til at referere til det nye filnavn

#### Opdaterede filer
- **Kapitel-dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 opdateringer af navigationslinks
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referencer til produktnavn opdateret
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bruger allerede Microsoft Foundry (fra tidligere opdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencer opdateret (oversigt, feedback fra fællesskabet, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 krydsreference-links opdateret
  - `docs/getting-started/first-project.md` - 2 kapitel-navigationslinks opdateret
  - `docs/getting-started/installation.md` - 2 links til næste kapitel opdateret
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencer opdateret (navigation, Discord-fællesskab)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslink opdateret
  - `docs/troubleshooting/debugging.md` - 1 navigationslink opdateret

- **Kursusstrukturfiler** (2 filer):
  - `README.md` - 17 referencer opdateret (kursusoversigt, kapiteltitler, skabelonsektion, fællesskabsindsigter)
  - `course-outline.md` - 14 referencer opdateret (oversigt, læringsmål, kapitelressourcer)

#### Valideret
- ✅ Ingen tilbageværende "ai-foundry" folder path references i de engelske dokumenter
- ✅ Ingen tilbageværende "Microsoft Foundry" product name references i de engelske dokumenter
- ✅ Alle navigationslinks fungerer med den nye mappestruktur
- ✅ Fil- og mappenavne omdøbt med succes
- ✅ Krydsreferencer mellem kapitler valideret

#### Bemærkninger
- **Omfang**: Ændringer anvendt på den engelske dokumentation i `docs/`-mappen kun
- **Oversættelser**: Oversættelsesmapperne (`translations/`) er ikke opdateret i denne version
- **Workshop**: Workshop-materialer (`workshop/`) ikke opdateret i denne version
- **Eksempler**: Eksempelfiler kan stadig referere til ældre navngivning (vil blive håndteret i en fremtidig opdatering)
- **Eksterne links**: Eksterne URL'er og GitHub-repositoriehenvisninger forbliver uændrede

#### Migreringsvejledning for bidragsydere
Hvis du har lokale brancher eller dokumentation, der henviser til den gamle struktur:
1. Opdater mappehenvisninger: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Opdater filhenvisninger: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstat produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Valider at alle interne dokumentationslinks stadig fungerer

---

### [v3.4.0] - 2025-10-24

#### Forbedringer af infrastrukturforhåndsvisning og validering
**Denne version introducerer omfattende support for den nye Azure Developer CLI preview-funktion og forbedrer workshop-brugeroplevelsen.**

#### Tilføjet
- **🧪 azd provision --preview Feature Documentation**: Omfattende dækning af den nye infrastrukturforhåndsvisningsfunktion
  - Kommandoreference og brugs-eksempler i snydeark
  - Detaljeret integration i provisioning-guiden med brugstilfælde og fordele
  - Pre-flight check-integration for sikrere deploymentsvalidering
  - Opdateringer i introduktionsguiden med sikkerheds-først deploymentspraksis
- **🚧 Workshop Status Banner**: Professionel HTML-banner, der angiver workshop-udviklingsstatus
  - Gradientdesign med byggeindikatorer for klar brugerkommunikation
  - Sidst opdateret-tidsstempel for gennemsigtighed
  - Mobilresponsivt design til alle enhedstyper

#### Forbedret
- **Infrastruktur-sikkerhed**: Forhåndsvisningsfunktionalitet integreret igennem deploymentsdokumentationen
- **Pre-deployment validering**: Automatiserede scripts inkluderer nu infrastrukturforhåndsvisningstest
- **Udviklerworkflow**: Opdaterede kommando-sekvenser inkluderer preview som bedste praksis
- **Workshop-oplevelse**: Klare forventninger sat for brugere om indholdets udviklingsstatus

#### Ændret
- **Deployment bedste praksis**: Preview-first workflow anbefales nu som tilgang
- **Dokumentationsflow**: Infrastrukturvalidering flyttet tidligere ind i læringsprocessen
- **Workshop-præsentation**: Professionel statuskommunikation med klar udviklingstidslinje

#### Forbedret
- **Sikkerheds-først tilgang**: Infrastrukturomændringer kan nu valideres inden deployment
- **Team-samarbejde**: Preview-resultater kan deles til review og godkendelse
- **Omkostningsbevidsthed**: Bedre forståelse af ressourceomkostninger før provisioning
- **Risikoafværgelse**: Færre deploymentsfejl gennem forhåndsvalidering

#### Teknisk implementering
- **Multi-dokument integration**: Preview-funktionen dokumenteret på tværs af 4 nøglefiler
- **Kommandomønstre**: Konsistent syntaks og eksempler igennem dokumentationen
- **Bedste praksis integration**: Preview inkluderet i valideringsworkflows og scripts
- **Visuelle indikatorer**: Klare NY-funktionsmarkeringer for synlighed

#### Workshop-infrastruktur
- **Statuskommunikation**: Professionel HTML-banner med gradientstyling
- **Brugeroplevelse**: Klar udviklingsstatus forhindrer forvirring
- **Professionel præsentation**: Opretholder repositoryets troværdighed samtidig med at forventninger sættes
- **Tidslinjegennemsigtighed**: October 2025 sidst opdateret-tidsstempel for ansvarlighed

### [v3.3.0] - 2025-09-24

#### Forbedrede workshopmaterialer og interaktiv læringsoplevelse
**Denne version introducerer omfattende workshopmaterialer med browser-baserede interaktive guider og strukturerede læringsforløb.**

#### Tilføjet
- **🎥 Interactive Workshop Guide**: Browser-baseret workshopoplevelse med MkDocs preview-mulighed
- **📝 Strukturerede workshopinstruktioner**: 7-trins vejledt læringssti fra opdagelse til tilpasning
  - 0-Introduction: Workshopoversigt og opsætning
  - 1-Select-AI-Template: Skabelonopdagelse og udvælgelsesproces
  - 2-Validate-AI-Template: Deployment- og valideringsprocedurer
  - 3-Deconstruct-AI-Template: Forståelse af skabelonarkitektur
  - 4-Configure-AI-Template: Konfiguration og tilpasning
  - 5-Customize-AI-Template: Avancerede ændringer og iterationer
  - 6-Teardown-Infrastructure: Oprydning og ressourcestyring
  - 7-Wrap-up: Opsummering og næste skridt
- **🛠️ Workshop-værktøj**: MkDocs-konfiguration med Material theme for forbedret læringsoplevelse
- **🎯 Praktisk læringssti**: 3-trins metodologi (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Problemfri udviklingsmiljøopsætning

#### Forbedret
- **AI Workshop Lab**: Udvidet med omfattende 2-3 timers struktureret læringsoplevelse
- **Workshopdokumentation**: Professionel præsentation med navigation og visuelle hjælpemidler
- **Læringsprogression**: Klar trinvis vejledning fra skabelonvalg til produktionsdeployment
- **Udvikleroplevelse**: Integreret tooling for strømlinede udviklingsworkflows

#### Forbedret
- **Tilgængelighed**: Browser-baseret interface med søgning, kopi-funktionalitet og tema-skift
- **Selvstyret læring**: Fleksibel workshopstruktur, der tilpasser sig forskellige læringshastigheder
- **Praktisk anvendelse**: Real-world AI-skabelon deploymentscenarier
- **Fællesskabsintegration**: Discord-integration for workshop-support og samarbejde

#### Workshopfunktioner
- **Indbygget søgning**: Hurtig nøgleords- og lektion-opdagelse
- **Kopi kodeblokke**: Hover-to-copy funktionalitet for alle kodeeksempler
- **Tema-skift**: Dark/light mode support for forskellige præferencer
- **Visuelle ressourcer**: Skærmbilleder og diagrammer for bedre forståelse
- **Hjælpeintegration**: Direkte Discord-adgang for fællesskabsstøtte

### [v3.2.0] - 2025-09-17

#### Større navigationsomstrukturering og kapitelbaseret læringssystem
**Denne version introducerer et omfattende kapitelbaseret læringsstruktur med forbedret navigation i hele repositoryet.**

#### Tilføjet
- **📚 Kapitelbaseret læringssystem**: Omstruktureret hele kurset i 8 progressive læringskapitler
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Omfattende navigationssystem**: Konsistente navigations-headere og footere på tværs af al dokumentation
- **🎯 Fremdriftssporing**: Kursusfærdiggørelses-checkliste og læringsverifikationssystem
- **🗺️ Vejledning i læringssti**: Klare indgangspunkter for forskellige erfaringsniveauer og mål
- **🔗 Krydsreference-navigation**: Relaterede kapitler og forudsætninger klart linket

#### Forbedret
- **README-struktur**: Omdannet til en struktureret læringsplatform med kapitelbaseret organisering
- **Dokumentationsnavigation**: Hver side inkluderer nu kapitelsammenhæng og progression
- **Skabelonorganisation**: Eksempler og skabeloner kortlagt til passende læringskapitler
- **Ressourceintegration**: Snydeark, FAQ'er og studievejledninger forbundet til relevante kapitler
- **Workshopintegration**: Hands-on labs kortlagt til flere kapitlers læringsmål

#### Ændret
- **Læringsprogression**: Flyttet fra lineær dokumentation til fleksibelt kapitelbaseret læring
- **Konfigurationsplacering**: Omsat konfigurationsguiden som Kapitel 3 for bedre læringsflow
- **AI-indholdsintegration**: Bedre integration af AI-specifikt indhold gennem læringsrejsen
- **Produktionsindhold**: Avancerede mønstre samlet i Kapitel 8 for enterprise-lærende

#### Forbedret
- **Brugeroplevelse**: Klare navigationsbrødkrummer og kapitelfremskridtsindikatorer
- **Tilgængelighed**: Konsistente navigationsmønstre for nemmere kursusgennemgang
- **Professionel præsentation**: Universitet-stil kursusstruktur egnet til akademisk og virksomhedstræning
- **Læringseffektivitet**: Reduceret tid til at finde relevant indhold gennem forbedret organisering

#### Teknisk implementering
- **Navigationsheadere**: Standardiseret kapitelnavigation på tværs af 40+ dokumentationsfiler
- **Footer-navigation**: Konsistent fremdriftsvejledning og kapitelfærdiggørelsesindikatorer
- **Krydslinking**: Omfattende interne linksystem, der forbinder relaterede koncepter
- **Kapitelkortlægning**: Skabeloner og eksempler klart associeret med læringsmål

#### Forbedring af studieguide
- **📚 Omfattende læringsmål**: Omstruktureret studieguide til at tilpasse sig 8-kapitel systemet
- **🎯 Kapitelbaseret vurdering**: Hvert kapitel inkluderer specifikke læringsmål og praktiske øvelser
- **📋 Fremdriftssporing**: Ugentlig læringsplan med målbare resultater og checklister
- **❓ Vurderingsspørgsmål**: Viden-valideringsspørgsmål for hvert kapitel med professionelle resultater
- **🛠️ Praktiske øvelser**: Hands-on aktiviteter med reelle deploymentscenarier og fejlsøgning
- **📊 Færdighedsprogression**: Klar avancement fra grundlæggende koncepter til enterprise-mønstre med karrierefokus
- **🎓 Certificeringsramme**: Professionelle udviklingsresultater og fællesskabsanerkendelsessystem
- **⏱️ Tidslinjestyring**: Struktureret 10-ugers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede Multi-Agent AI-løsninger
**Denne version forbedrer den multi-agent detailløsning med bedre agentnavngivning og forbedret dokumentation.**

#### Ændret
- **Multi-Agent terminologi**: Erstattede "Cora agent" med "Customer agent" gennem hele detail-multi-agent løsningen for klarere forståelse
- **Agentarkitektur**: Opdaterede al dokumentation, ARM-skabeloner og kodeeksempler til konsekvent "Customer agent"-navngivning
- **Konfigurationseksempler**: Moderniserede agentkonfigurationsmønstre med opdaterede navnekonventioner
- **Dokumentationskonsistens**: Sikret at alle referencer bruger professionelle, beskrivende agentnavne

#### Forbedret
- **ARM Template-pakke**: Opdateret retail-multiagent-arm-template med Customer agent-referencer
- **Arkitekturdiagrammer**: Opfriskede Mermaid-diagrammer med opdateret agentnavngivning
- **Kodeeksempler**: Python-klasser og implementations-eksempler bruger nu CustomerAgent-navngivning
- **Miljøvariabler**: Opdateret alle deploymentscripts til at bruge CUSTOMER_AGENT_NAME-konventioner

#### Forbedret
- **Udvikleroplevelse**: Klarere agentroller og ansvar i dokumentationen
- **Produktionsparathed**: Bedre tilpasning til enterprise-navnekonventioner
- **Læringsmaterialer**: Mere intuitiv agentnavngivning til uddannelsesformål
- **Skabelonbrugervenlighed**: Forenklet forståelse af agentfunktioner og deploymentsmønstre

#### Teknisk detaljer
- Opdaterede Mermaid-arkitekturdiagrammer med CustomerAgent-referencer
- Erstattede CoraAgent-klasse-navne med CustomerAgent i Python-eksempler
- Ændrede ARM template JSON-konfigurationer til at bruge "customer" agent-typen
- Opdaterede miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Opfriskede alle deploymentskommandoer og containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Større ændringer - AI-udviklerfokus og Microsoft Foundry-integration
**Denne version transformer repositoryet til en omfattende AI-fokuseret læringsressource med Microsoft Foundry-integration.**

#### Tilføjet
- **🤖 AI-First læringssti**: Fuld omstrukturering med prioritet til AI-udviklere og ingeniører
- **Microsoft Foundry Integration Guide**: Omfattende dokumentation til at forbinde AZD med Microsoft Foundry-tjenester
- **AI Model Deployment Patterns**: Detaljeret guide dækning modelvalg, konfiguration og produktionsdeploymentsstrategier
- **AI Workshop Lab**: 2-3 timers praktisk workshop til at konvertere AI-applikationer til AZD-udrulningsklare løsninger
- **Production AI Best Practices**: Virksomhedsklare mønstre til skalering, overvågning og sikring af AI-arbejdsbelastninger
- **AI-Specific Troubleshooting Guide**: Omfattende fejlfinding for Microsoft Foundry-modeller, Cognitive Services og AI-udrulningsproblemer
- **AI Template Gallery**: Fremhævet samling af Microsoft Foundry-skabeloner med kompleksitetsvurderinger
- **Workshop Materials**: Fuldstændig workshopstruktur med praktiske laboratorier og referencemateriale

#### Forbedret
- **README Structure**: AI-udviklerfokuseret med 45% data om fællesskabets interesse fra Microsoft Foundry Discord
- **Learning Paths**: Dedikeret AI-udviklerrejse ved siden af traditionelle forløb for studerende og DevOps-ingeniører
- **Template Recommendations**: Fremhævede AI-skabeloner inklusive azure-search-openai-demo, contoso-chat, og openai-chat-app-quickstart
- **Community Integration**: Forbedret Discord-fællesskabsstøtte med AI-specifikke kanaler og diskussioner

#### Sikkerhed og produktionsfokus
- **Managed Identity Patterns**: AI-specifikke autentificerings- og sikkerhedskonfigurationer
- **Cost Optimization**: Sporing af tokenbrug og budgetkontroller for AI-arbejdsbelastninger
- **Multi-Region Deployment**: Strategier for global udrulning af AI-applikationer
- **Performance Monitoring**: AI-specifikke målinger og integration med Application Insights

#### Dokumentationskvalitet
- **Linear Course Structure**: Logisk progression fra begynder- til avancerede AI-udrulningsmønstre
- **Validated URLs**: Alle eksterne repository-links verificeret og tilgængelige
- **Complete Reference**: Alle interne dokumentationslinks valideret og funktionelle
- **Production Ready**: Virksomhedsudrulningsmønstre med eksempler fra den virkelige verden

### [v2.0.0] - 2025-09-09

#### Store ændringer - Repository-omstrukturering og professionel forbedring
**Denne version repræsenterer en betydelig gennemgribende ændring af repository-strukturen og indholdspræsentationen.**

#### Tilføjet
- **Structured Learning Framework**: Alle dokumentationssider indeholder nu sektionerne Introduktion, Læringsmål og Læringsudbytte
- **Navigation System**: Tilføjet Forrige/Næste lektionslinks gennem hele dokumentationen for vejledt læringsprogression
- **Study Guide**: Omfattende study-guide.md med læringsmål, øvelsesopgaver og vurderingsmateriale
- **Professional Presentation**: Fjernet alle emoji-ikoner for forbedret tilgængelighed og mere professionelt udseende
- **Enhanced Content Structure**: Forbedret organisering og flow i læringsmaterialerne

#### Ændret
- **Documentation Format**: Standardiseret al dokumentation med konsekvent læringsfokuseret struktur
- **Navigation Flow**: Implementeret logisk progression gennem alt læringsmateriale
- **Content Presentation**: Fjernet dekorative elementer til fordel for klar, professionel formatering
- **Link Structure**: Opdateret alle interne links for at understøtte det nye navigationssystem

#### Forbedret
- **Accessibility**: Fjernet emoji-afhængigheder for bedre kompatibilitet med skærmlæsere
- **Professional Appearance**: Ren, akademisk stil i præsentationen egnet til virksomhedslæring
- **Learning Experience**: Struktureret tilgang med klare mål og udbytter for hver lektion
- **Content Organization**: Bedre logisk flow og sammenhæng mellem relaterede emner

### [v1.0.0] - 2025-09-09

#### Første udgivelse - Omfattende AZD-læringsrepository

#### Tilføjet
- **Kerne-dokumentationsstruktur**
  - Fuldstændig serie af kom-godt-i-gang-guides
  - Omfattende dokumentation for udrulning og provisionering
  - Detaljerede fejlfindingressourcer og debugging-vejledninger
  - Valideringsværktøjer og procedurer før udrulning

- **Kom godt i gang-modul**
  - AZD Basics: Kernekoncepter og terminologi
  - Installationsvejledning: Platform-specifikke opsætningsinstruktioner
  - Konfigurationsvejledning: Miljøopsætning og autentificering
  - Første projektvejledning: Trin-for-trin praktisk læring

- **Udrulnings- og provisioneringsmodul**
  - Udrulningsvejledning: Fuldstændig workflow-dokumentation
  - Provisioneringsvejledning: Infrastruktur som kode med Bicep
  - Bedste praksis for produktionsudrulninger
  - Mønstre for multi-service-arkitektur

- **For-udrulningsvalideringsmodul**
  - Kapacitetsplanlægning: Validering af Azure-ressource tilgængelighed
  - SKU-udvælgelse: Omfattende vejledning om servicelag
  - Forudgående kontroller: Automatiserede valideringsscripts (PowerShell og Bash)
  - Værktøjer til omkostningsestimering og budgetplanlægning

- **Fejlfinding-modul**
  - Almindelige problemer: Hyppigt forekommende problemer og løsninger
  - Fejlfindingsvejledning: Systematiske fejlfindingmetodikker
  - Avancerede diagnostiske teknikker og værktøjer
  - Ydelsesmåling og optimering

- **Ressourcer og referencer**
  - Kommando-hurtigreference: Hurtig reference for essentielle kommandoer
  - Ordliste: Omfattende terminologi- og forkortelsesdefinitioner
  - FAQ: Detaljerede svar på almindelige spørgsmål
  - Eksterne ressourcelinks og fællesskabsforbindelser

- **Eksempler og skabeloner**
  - Eksempel på simpel webapplikation
  - Skabelon til deployment af statisk website
  - Konfiguration af containerapplikation
  - Mønstre for databaseintegration
  - Eksempler på microservices-arkitektur
  - Implementeringer af serverless-funktioner

#### Funktioner
- **Multi-Platform Support**: Installations- og konfigurationsvejledninger for Windows, macOS og Linux
- **Multiple Skill Levels**: Indhold designet til studerende og professionelle udviklere
- **Practical Focus**: Praktisk fokus med hands-on eksempler og scenarier fra den virkelige verden
- **Comprehensive Coverage**: Fra grundlæggende koncepter til avancerede virksomhedsmønstre
- **Security-First Approach**: Sikkerhedsbest practices integreret gennem hele materialet
- **Cost Optimization**: Vejledning i omkostningseffektive udrulninger og ressourcestyring

#### Dokumentationskvalitet
- **Detailed Code Examples**: Praktiske, testede kodeeksempler
- **Step-by-Step Instructions**: Klar, handlingsorienteret vejledning
- **Comprehensive Error Handling**: Fejlfinding for almindelige problemer
- **Best Practices Integration**: Industriens standarder og anbefalinger
- **Version Compatibility**: Opdateret til de seneste Azure-tjenester og azd-funktioner

## Planlagte fremtidige forbedringer

### Version 3.1.0 (Planlagt)
#### Udvidelse af AI-platformen
- **Multi-Model Support**: Integrationsmønstre for Hugging Face, Azure Machine Learning og brugerdefinerede modeller
- **AI Agent Frameworks**: Skabeloner til LangChain, Semantic Kernel og AutoGen-udrulninger
- **Advanced RAG Patterns**: Vektor-databasevalg ud over Azure AI Search (Pinecone, Weaviate mv.)
- **AI Observability**: Forbedret overvågning af modelydelse, tokenbrug og svar-kvalitet

#### Udvikleroplevelse
- **VS Code Extension**: Integreret AZD + Microsoft Foundry udviklingsoplevelse
- **GitHub Copilot Integration**: AI-assisteret generering af AZD-skabeloner
- **Interactive Tutorials**: Praktiske kodningsøvelser med automatisk validering for AI-scenarier
- **Video Content**: Supplerende videotutorials til visuelle elever med fokus på AI-udrulninger

### Version 4.0.0 (Planlagt)
#### Enterprise AI-mønstre
- **Governance Framework**: AI-modelstyring, compliance og revisionsspor
- **Multi-Tenant AI**: Mønstre til at servicere flere kunder med isolerede AI-tjenester
- **Edge AI Deployment**: Integration med Azure IoT Edge og containerinstanser
- **Hybrid Cloud AI**: Multi-cloud og hybrid udrulningsmønstre for AI-arbejdsbelastninger

#### Avancerede funktioner
- **AI Pipeline Automation**: MLOps-integration med Azure Machine Learning-pipelines
- **Advanced Security**: Zero-trust mønstre, private endpoints og avanceret trusselsbeskyttelse
- **Performance Optimization**: Avanceret tuning og skaleringstrategier for AI-applikationer med høj gennemstrømning
- **Global Distribution**: Indholdslevering og edge-caching mønstre for AI-applikationer

### Version 3.0.0 (Planlagt) - Erstattet af den nuværende udgivelse
#### Foreslåede tilføjelser - Nu implementeret i v3.0.0
- ✅ **AI-Focused Content**: Omfattende Microsoft Foundry-integration (Fuldført)
- ✅ **Interactive Tutorials**: Praktisk AI-workshop-lab (Fuldført)
- ✅ **Advanced Security Module**: AI-specifikke sikkerhedsmønstre (Fuldført)
- ✅ **Performance Optimization**: Tuningstrategier for AI-arbejdsbelastninger (Fuldført)

### Version 2.1.0 (Planlagt) - Delvist implementeret i v3.0.0
#### Mindre forbedringer - Nogle fuldførte i den aktuelle udgivelse
- ✅ **Additional Examples**: AI-fokuserede udrulningsscenarier (Fuldført)
- ✅ **Extended FAQ**: AI-specifikke spørgsmål og fejlfinding (Fuldført)
- **Tool Integration**: Forbedrede IDE- og editorintegrationsvejledninger
- ✅ **Monitoring Expansion**: AI-specifik overvågning og alarmeringsmønstre (Fuldført)

#### Stadig planlagt til fremtidig udgivelse
- **Mobile-Friendly Documentation**: Responsivt design til mobil læring
- **Offline Access**: Downloadbare dokumentationspakker
- **Enhanced IDE Integration**: VS Code-udvidelse til AZD + AI-workflows
- **Community Dashboard**: Realtidsfællesskabsmetrikker og bidragssporing

## Bidrag til changeloggen

### Indrapportering af ændringer
Når du bidrager til dette repository, bedes du sikre, at changelog-poster indeholder:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Udgivelses- eller opdateringsdato i formatet YYYY-MM-DD
3. **Kategori**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Klar beskrivelse**: Kortfattet beskrivelse af hvad der er ændret
5. **Konsekvensvurdering**: Hvordan ændringer påvirker eksisterende brugere

### Ændringskategorier

#### Tilføjet
- Nye funktioner, dokumentationssektioner eller kapaciteter
- Nye eksempler, skabeloner eller læringsressourcer
- Yderligere værktøjer, scripts eller hjælpeprogrammer

#### Ændret
- Ændringer i eksisterende funktionalitet eller dokumentation
- Opdateringer for at forbedre klarhed eller nøjagtighed
- Omstrukturering af indhold eller organisering

#### Forældet
- Funktioner eller tilgange, der udfases
- Dokumentationssektioner planlagt fjernet
- Metoder, der har bedre alternativer

#### Fjernet
- Funktioner, dokumentation eller eksempler, der ikke længere er relevante
- Forældet information eller udfasede tilgange
- Redundant eller konsolideret indhold

#### Rettet
- Rettelser af fejl i dokumentation eller kode
- Løsning af rapporterede problemer eller fejl
- Forbedringer af nøjagtighed eller funktionalitet

#### Sikkerhed
- Sikkerhedsrelaterede forbedringer eller rettelser
- Opdateringer af sikkerhedsbest practices
- Løsning af sikkerhedssårbarheder

### Retningslinjer for semantisk versionering

#### Major-version (X.0.0)
- Brydende ændringer, der kræver brugerhandling
- Betydelig omstrukturering af indhold eller organisering
- Ændringer, der ændrer den grundlæggende tilgang eller metodologi

#### Minor-version (X.Y.0)
- Nye funktioner eller indholdsudvidelser
- Forbedringer, der bevarer bagudkompatibilitet
- Yderligere eksempler, værktøjer eller ressourcer

#### Patch-version (X.Y.Z)
- Fejlrettelser og korrektioner
- Mindre forbedringer af eksisterende indhold
- Afklaringer og små forbedringer

## Fællesskabsfeedback og forslag

Vi opfordrer aktivt til fællesskabsfeedback for at forbedre denne læringsressource:

### Hvordan man giver feedback
- **GitHub Issues**: Rapporter problemer eller foreslå forbedringer (AI-specifikke problemer er velkomne)
- **Discord Discussions**: Del ideer og engager dig med Microsoft Foundry-fællesskabet
- **Pull Requests**: Bidrag med direkte forbedringer til indholdet, især AI-skabeloner og vejledninger
- **Microsoft Foundry Discord**: Deltag i #Azure-kanalen for AZD + AI-diskussioner
- **Community Forums**: Deltag i bredere Azure-udviklerdiskussioner

### Feedbackkategorier
- **AI Content Accuracy**: Rettelser til AI-tjenesteintegration og udrulningsinformation
- **Learning Experience**: Forslag til forbedret læringsflow for AI-udviklere
- **Missing AI Content**: Anmodninger om yderligere AI-skabeloner, mønstre eller eksempler
- **Accessibility**: Forbedringer for forskellige læringsbehov
- **AI Tool Integration**: Forslag til bedre integration af AI-udviklingsworkflows
- **Production AI Patterns**: Forespørgsler på virksomhedsmønstre til AI-udrulning

### Responsforpligtelse
- **Issue Response**: Inden for 48 timer for indrapporterede problemer
- **Feature Requests**: Evaluering inden for en uge
- **Community Contributions**: Gennemgang inden for en uge
- **Security Issues**: Umiddelbar prioritet med hurtig håndtering

## Vedligeholdelsesplan

### Regelmæssige opdateringer
- **Monthly Reviews**: Indholdsnøjagtighed og linkvalidering
- **Quarterly Updates**: Større indholdsudvidelser og forbedringer
- **Semi-Annual Reviews**: Omfattende omstrukturering og forbedringer
- **Annual Releases**: Store versionsopdateringer med betydelige forbedringer

### Overvågning og kvalitetssikring
- **Automated Testing**: Regelmæssig validering af kodeeksempler og links
- **Community Feedback Integration**: Regelmæssig indarbejdelse af brugerforslag
- **Technology Updates**: Afstemning med de nyeste Azure-tjenester og azd-udgivelser
- **Accessibility Audits**: Regelmæssig gennemgang for inkluderende designprincipper

## Versionssupportpolitik

### Support for nuværende version
- **Latest Major Version**: Fuld support med regelmæssige opdateringer
- **Previous Major Version**: Sikkerhedsopdateringer og kritiske rettelser i 12 måneder
- **Legacy Versions**: Kun fællesskabsstøtte, ingen officielle opdateringer

### Migreringsvejledning
Når større versioner udgives, leverer vi:
- **Migration Guides**: Trin-for-trin overgangsinstruktioner
- **Compatibility Notes**: Detaljer om brydende ændringer
- **Tool Support**: Scripts eller hjælpeprogrammer til at assistere migrering
- **Community Support**: Dedikerede fora til migrationsspørgsmål

---

**Navigation**
- **Forrige lektion**: [Studieguide](resources/study-guide.md)
- **Næste lektion**: Gå tilbage til [Hoved README](README.md)

**Hold dig opdateret**: Følg dette repository for notifikationer om nye udgivelser og vigtige opdateringer af læringsmaterialerne.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->