# Changelog - AZD For Beginners

## Introduktion

Denne changelog dokumenterer alle bemærkelsesværdige ændringer, opdateringer og forbedringer til AZD For Beginners-repositoriet. Vi følger semantiske versionsprincipper og vedligeholder denne log for at hjælpe brugere med at forstå, hvad der er ændret mellem versioner.

## Læringsmål

Ved at gennemgå denne changelog vil du:
- Blive informeret om nye funktioner og tilføjelser til indhold
- Forstå forbedringer foretaget i eksisterende dokumentation
- Følge fejlrettelser og korrektioner for at sikre nøjagtighed
- Følge udviklingen af læringsmaterialerne over tid

## Læringsudbytte

Efter at have gennemgået changelog-posterne vil du kunne:
- Identificere nyt indhold og tilgængelige ressourcer til læring
- Forstå hvilke sektioner der er opdateret eller forbedret
- Planlægge din læringssti baseret på det nyeste materiale
- Bidrage med feedback og forslag til fremtidige forbedringer

## Versionshistorik

### [v3.24.0]- 2026-11-04

#### Rettet
- Repareret navigation i det engelske kursus, flyttede side-stier, manglende ankre og forældede eksterne referencer, inklusiv Kapitel 2-linket til produktions-AI-guiden.
- Gennemgået nuværende vejledning mod udgivne AZD 1.37.2, agenter 1.0.0-beta.23, og evalueringer 1.0.0-beta.2. Dokumenteret den separate `azd ai eval` workflow og optimeringskonfigurations-migration.
- Rettet ikke-understøttede CLI-flag, autentifikationsgrænser, vejledning om klartekst-miljø/hemmeligheder, infrastrukturopdateringer, modelkonfiguration og destruktive gendannelseseksempler.
- Forfrisket workshoppen mod det nuværende AI Agents-eksempel, inklusiv faktiske hooks, konfigurationsinput, evalueringstest, red-teaming indgangspunkt og observabilitet.
- Rettet eksempel-implementeringspåstande og repareret associerede applikations-/infrastruktur-/konfigurationsproblemer. Materiale om detailarkitektur er eksplicit adskilt fra en komplet fungerende applikation.
- Genskabt CodeQL sprogmatrixen, valgt understøttet Node.js 24 til dev-containeren, og fået setup-validatorer til at rapportere mislykkede versionskommandoer.

#### Tilføjet
- En engelsk-sproget offline link/ankerkontrol, regressions-tests og en dokumentations-workflow, der også bygger workshoppen i strikt tilstand. Genererede oversættelser og oversatte billeder er undtaget.

#### Valideringsomfang
- Kilde, syntaks, konfiguration, lokal adfærd og netværkslink-kontroller etablerer ikke live Azure deployérbarhed, kvoter, RBAC, regional modeltilgængelighed, fakturering, sikkerhedsoverholdelse eller produktionsparathed.
- Ældre poster nedenfor er historiske optegnelser, ikke aktuelle kommando- eller udgivelsesinstruktioner.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Opdatering: Versionsaktualitet
**Denne version genvaliderer kurset mod `azd` `1.27.1` (juli 2026, seneste stabile udgivelse) og den aktuelle preview AI agent udvidelse `azure.ai.agents` `1.0.0-beta.5`, og bringer alle "valideret mod"-baner ajour efter 1.26.0, 1.27.0 og 1.27.1 udgivelserne.**

#### Ændret
- **✅ Valideringsbaseline opdateret** fra `azd 1.25.6` (juni 2026) til `azd 1.27.1` (juli 2026) på tværs af rod-README, alle kapitel README'er, Kapitel 1 dev-container lektion (inklusive eksempler med fastlåste versioner), Kapitel 4 custom-templates lektion, Kapitel 5 multi-agent lektion og workshop-dokumenterne
- **🤖 Kapitel 2 baseline opfrisket** fra `azd 1.23.12` (marts 2026) til `azd 1.27.1` på tværs af `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` og `microsoft-foundry-integration.md`; valideringsnote-datoer opdateret til 2026-07-13
- **🧩 AI agent udvidelse opgraderet** fra `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` til den nuværende `1.0.0-beta.5` udgivelse i Kapitel 2 README og `agents.md`
- **🧪 Workshop valideringseksempel** (`azd version` output) opdateret til `1.27.1`

#### Noter om relevante azd-udgivelser (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go support til Azure Functions på Flex Consumption, `azd config sub-filter` per-lejer abonnementsfiltre, selvstændige udvidelsespakker (`azd x pack --bundle`), og `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellér Azure AI Foundry projekter/agenter direkte i `azure.yaml` (init uden Bicep/Terraform), container-udrulningssupport til App Service (`host: appservice` + `language: docker`), direkte `-s/--source` til `azd extension` kommandoer, og `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flag for `azd extension install`, forældede modeller ekskluderet fra katalog/kvote-prompt som standard, og flere fejlrettelser

#### Opdaterede filer
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Begynder Udfyldnings-#2: Skabelsesforfatterskab, Dev Containers, Pulumi, Azure DevOps, Service Principals og Mere
**Denne version lukker de resterende mellemliggende huller, som blev afdækket af azd-dækningsanalysen: hvordan man forfatter og publicerer sin egen skabelon, reproducerbare dev-container/Codespaces-miljøer, Pulumi-infrastrukturudbyderen, en Azure DevOps CI/CD gennemgang, service-principal autentifikation, vejledning i værtvalg (AKS/Spring Apps), `azd restore`/`azd package` forklaringer, hook-fejlhåndtering og team-/delt miljø-praksis.**

#### Tilføjet
- **🧱 Ny Kapitel 4 lektion** `docs/chapter-04-infrastructure/custom-templates.md` — forfatterskab af egen azd skabelon: påkrævet struktur (`azure.yaml`, `infra/`, `src/`), `metadata.template` feltet, parameterisering af infrastruktur med `uniqueString()` ressourcetoken og `azd-env-name` tag, lokal testning med `azd init --template <local-path>`, publicering til GitHub og afsendelse til Awesome AZD galleriet
- **📦 Ny Kapitel 1 lektion** `docs/chapter-01-foundation/dev-containers.md` — reproducerbare azd miljøer med Dev Containers og GitHub Codespaces: en minimal `.devcontainer/devcontainer.json` ved brug af den officielle `ghcr.io/azure/azure-dev/azd` funktion, sprogspecifikke features, `docker-in-docker` til container-verter og `azd auth login --use-device-code` til fjern-login
- **🧩 Pulumi med azd** sektion i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi mappestruktur, stacks kortlagt til azd miljøer, påkrævede output/tagging og den identiske `azd up` / `azd down` workflow
- **🎯 Værtvalg vejledning** i `docs/chapter-04-infrastructure/provisioning.md` — en begynder-venlig sammenligning af `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` og `springapp`, med vejledning om hvornår man vælger AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD gennemgang** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, serviceforbindelse med workload identity federation (OIDC), genereret `azure-dev.yml` og variabel-gruppe opsætning
- **🔑 Service Principals (Mønster 4)** tilføjet til `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interaktiv `azd auth login` med klienthemmelighed vs. fødererede/OIDC legitimationsoplysninger, hvornår man bruger, og sikker legitimationsopbevaring
- **🪝 Hook fejl-håndtering** underafsnit i `docs/chapter-04-infrastructure/deployment-guide.md` — exit-koder og `set -e`, `continueOnError`, test af hooks isoleret med `azd hooks run`, OS-specifikke shell'er og `--debug`
- **👥 Team-/delt miljøer** sektion i `docs/chapter-03-configuration/configuration.md` — hvad lever i `.azure/`, hvad der skal gitignores, per-udvikler miljøer, `azd env list`/`select` og levering af miljøværdier i CI/CD
- **🧰 `azd restore` og udvidede `azd package`** forklaringer i `resources/cheat-sheet.md` — genskaber afhængigheder og bygger et deployerbart artefakt uden at deployere

#### Ændret
- **🧭 Kapitel 4 lektionstabel** opdateret til at inkludere den nye "Oprettelse af din egen skabelon" lektion (Lektion 3)
- **🧭 Kapitel 1 lektionstabel** opdateret til at inkludere den nye "Dev Containers & Codespaces" lektion (Lektion 5); navigationsfødder forbundet mellem `bring-your-own-app.md` og `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Begynder Hul-Udfyldning: Praktisk Multi-Agent Lektion, "Bring Your Own App," Terraform, og CI/CD Gennemgang
**Denne version lukker de største huller i en komplet begyndervejledning ved at tilføje to nye praktiske lektioner (en deployerbar multi-agent gennemgang og tilføjelse af azd til en eksisterende app), en begynder-venlig hooks introduktion, en Terraform-med-azd sektion, en trin-for-trin GitHub Actions pipeline gennemgang, en forklaring på de nye preview-udvidelser, og en eksplicit deployment-verifikationscheckliste.**

#### Tilføjet
- **🤝 Ny Kapitel 5 lektion** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en fuldt praktisk, deployerbar to-agent gennemgang (orchestrator + specialister) ved brug af en rigtig skabelon (`contoso-creative-writer`), der dækker hvornår man skal bruge multi-agent, `azd up` arbejdsgangen, forståelse af de deployerede ressourcer, cross-agent tracing, tilpasning og oprydning
- **📦 Ny Kapitel 1 lektion** `docs/chapter-01-foundation/bring-your-own-app.md` — hvordan man tilføjer azd til et eksisterende projekt med `azd init` ("brug kode i den nuværende mappe"), forståelse af `azure.yaml` og `infra/`, `azd infra generate`, vært genkendelse, og deployment med `azd up`
- **🌐 Terraform med azd** sektion tilføjet til `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfiguration, `.tf` mappestruktur, nødvendige `AZURE_*` output og `azd-env-name` tagging, og den identiske `azd up` / `azd down` arbejdsgang (lukker hullet hvor Terraform-support blev påstået men kun Bicep blev vist)
- **⚙️ Trin-for-trin GitHub Actions gennemgang** i `docs/chapter-08-production/production-ai-practices.md` — fra GitHub repo til automatiserede deploys: `azd pipeline config`, OIDC federerede legitimationsoplysninger (ingen lagrede hemmeligheder), den genererede `azure-dev.yml`, og vejledning om hemmeligheder vs. variabler
- **🪝 Begynder "Ny til hooks?" introduktion** i `docs/chapter-04-infrastructure/deployment-guide.md` — hvad en hook er, en hook-fase tabel, en minimal første hook, og manuel kørsel af hooks med `azd hooks run`
- **✅ "Verificer Din Deployment" checkliste** tilføjet til trin 5 i `docs/chapter-01-foundation/first-project.md` — røgtest, helbreds-endpoint kontrol, og eksplicit succes kriterium
- **🧩 Forklaring på nye preview-udvidelser** `azure.ai.skills` og `azure.ai.connections` (hvad de er og hvornår man skal bruge dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Ændret
- **🧭 Kapitel 5 lektionstabel** rettet: `multi-agent-basics.md` er nu Lektion 1 (den eneste fuldt praktiske lektion), med ærlig mærkning om at Lektion 2 findes i Kapitel 6 og at Retail scenariet er en arkitekturblåkopi, ikke en én-kommando skabelon
- **🧭 Kapitel 1 lektionstabel** inkluderer nu den nye "Bring Your Own App" lektion (Lektion 4)
- **🔗 Navigationsfødder** opdateret: `first-project.md` linker nu frem til `bring-your-own-app.md`

#### Rettet
- **🧱 Lukket det "påståede men manglende" Terraform hul** — kurset refererede tidligere til Terraform support uden at vise det
- **🔀 Rettet misvisende Kapitel 5 kryds-links** som antydede at en fuld multi-agent implementering fandtes når det kun var en arkitekturblåkopi

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

#### AZD 1.25.6 Opdatering, Fuld Agentlivscyklus Kommandoer & Aspire Genbranding
**Denne version genvaliderer kurset mod `azd` `1.25.6` (juni 2026) og `azure.ai.agents` `0.1.40-preview` udvidelsen, udvider AI-vejledningen fra "scaffold en agent" til den komplette agentlivscyklus (test → evaluer → optimer → inspicer → slet), viser de nye `azure.ai.skills` og `azure.ai.connections` preview-udvidelser, og noterer ".NET Aspire" → "Aspire" produktgenbranding.**

#### Tilføjet
- **🔁 Fuld agentlivscyklus dækning** for begyndere og AI-ingeniører på tværs af dokumentationen:
  - `docs/chapter-01-foundation/azd-basics.md` — Livscyklus tabel (scaffold → test → mål → forbedr → inspicer → ryd op) føjet til Extensions og AI Commands sektionen
  - `docs/chapter-08-production/production-ai-practices.md` — Ny "Managing the Agent Lifecycle" sektion, der dækker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
  - `resources/cheat-sheet.md` — Udvidede AI Agent Commands med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
- **🧩 Nye preview-udvidelser** dokumenteret: `azure.ai.skills` (genanvendelige agentfærdigheder) og `azure.ai.connections` (Foundry forbindelser) tilføjet til udvidelsestabellen og snydearket
- **⏱️ Respons-tids vejledning** — `azd ai agent invoke` eksempler nævner nu, at den udskriver total latenstid og time-to-first-byte
- **📌 Versionsbanner** i rod-README, der peger lærende mod `azd version` og `azd upgrade`

#### Ændret
- **✅ Valideringsbaseline opdateret** fra `azd 1.23.12` (marts 2026) til `azd 1.25.6` (juni 2026) på tværs af alle kapitel README’er og workshop dokumenter
- **🤖 Kapitel 2 udvidelsesnote** opdateret fra `azure.ai.agents` `0.1.18-preview` til `0.1.40-preview`
- **🧪 Workshop valideringseksempel** (`azd version` output) opdateret til `1.25.6`
- **🧭 README "Hvad er nyt i azd i dag"** opfrisket for at fremhæve den fulde agentlivscyklus, nye AI-udvidelser, og nylige kvalitetsforbedringer (`azd init` idempotens, `azd auth login` udløbet token rensning, `azd tool` første-kørsel prompt)
- **📖 Kapitel 2 agents.md (Option 4)** peger nu på post-deployment livscyklus kommandoer frem for at stoppe ved `azd up`

#### Rettet
- **🏷️ Produktnavngivning** — tilføjet en Aspire genbranding note (".NET Aspire" hedder nu blot "Aspire"); azd’s Aspire support er uændret
- **🔎 Live release validering** bekræftet mod Azure Developer CLI releasefeed: stabil CLI `1.25.6` (2026-06-12) og `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Begynder onboarding afklaring, opsætningsvalidering & endelig AZD kommando oprydning
**Denne version følger op på AZD 1.23 valideringsrunden med en begynderfokuseret dokumentationsgennemgang: den afklarer AZD-først autentificeringsvejledning, tilføjer lokale opsætningsvalideringsscripts, bekræfter nøglekommandoer mod den live AZD CLI, og fjerner de sidste forældede engelsksprogede kommando-referencer uden for changeloggen.**

#### Tilføjet
- **🧪 Begynder opsætningsvalideringsscripts** med `validate-setup.ps1` og `validate-setup.sh` så lærende kan bekræfte nødvendige værktøjer før start af Kapitel 1
- **✅ Forhåndsopsætningsvaliderings-trin** i rod-README og Kapitel 1 README, så manglende forudsætninger fanges før `azd up`

#### Ændret
- **🔐 Begynder autentificeringsvejledning** behandler nu konsekvent `azd auth login` som den primære sti for AZD arbejdsgange, med `az login` kaldt ud som valgfri medmindre Azure CLI kommandoer bruges direkte
- **📚 Kapitel 1 onboarding flow** peger nu lærende mod validering af lokal opsætning før installation, autentificering og første deployerings-trin
- **🛠️ Validator beskeder** adskiller nu klart blokerende krav fra valgfrie Azure CLI advarsler for AZD-only begyndervejen
- **📖 Konfiguration, fejlfinding og eksempel dokumenter** adskiller nu mellem nødvendig AZD autentificering og valgfri Azure CLI login hvor begge tidligere blev præsenteret uden kontekst

#### Rettet
- **📋 Resterende engelsksprogede kommando-referencer** opdateret til aktuelle AZD former, inklusive `azd config show` i snydearket og `azd monitor --overview` hvor Azure Portal oversigtsvejledning var tiltænkt
- **🧭 Begynder udsagn i Kapitel 1** blødgjort for at undgå overløfter om garanteret fejlfri eller roll-back opførsel på tværs af alle skabeloner og Azure ressourcer
- **🔎 Live CLI validering** bekræftet nuværende support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, og `azd down --force --purge`

#### Opdaterede filer
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

#### AZD 1.23.12 Validering, Workshop Miljø Udvidelse & AI Model Opdatering
**Denne version udfører en dokumentationsvalideringsrunde mod `azd` `1.23.12`, opdaterer forældede AZD kommandoeksempler, opfrisker AI model vejledning til aktuelle standarder, og udvider workshop instruktionerne ud over GitHub Codespaces for også at understøtte dev containers og lokale kloner.**

#### Tilføjet
- **✅ Valideringsnoter på tværs af kernekapitler og workshop dokumenter** for at gøre den testede AZD baseline eksplicit for lærende, der bruger nyere eller ældre CLI builds
- **⏱️ Vejledning om timeout ved deployment** til langvarige AI app deployments med `azd deploy --timeout 1800`
- **🔎 Udvidelsesinspektions-trin** med `azd extension show azure.ai.agents` i AI arbejdsgange dokumentation
- **🌐 Udvidet workshop miljø vejledning** omfatter GitHub Codespaces, dev containers, og lokale kloner med MkDocs

#### Ændret
- **📚 Kapitel introduktions-README’er** nævner nu konsekvent validering mod `azd 1.23.12` på tværs af fundament, konfiguration, infrastruktur, multi-agent, pre-deployment, fejlfinding, og produktion sektioner
- **🛠️ AZD kommando referencer** opdateret til aktuelle former på tværs af dokumentationen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` afhængigt af kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` hvor Application Insights oversigt er tiltænkt
- **🧪 Provision preview eksempler** forenklet til nuværende understøttede brug som `azd provision --preview` og `azd provision --preview -e production`
- **🧭 Workshop flow** opdateret så lærende kan gennemføre labs i Codespaces, en dev container, eller en lokal klon i stedet for kun at antage Codespaces
- **🔐 Autentificeringsvejledning** foretrækker nu `azd auth login` til AZD arbejdsgange, med `az login` positioneret som valgfri når Azure CLI kommandoer bruges direkte

#### Rettet
- **🪟 Windows installationskommandoer** normaliseret til nuværende `winget` pakkecasingsstand i installationsguiden
- **🐧 Linux installationsvejledning** rettet for at undgå ikke-understøttede distro-specifikke `azd` pakkehåndteringsinstruktioner og peger i stedet på release-assets hvor relevant
- **📦 AI model eksempler** opdateret fra ældre standarder som `gpt-35-turbo` og `text-embedding-ada-002` til aktuelle eksempler som `gpt-4.1-mini`, `gpt-4.1`, og `text-embedding-3-large`
- **📋 Deploy- og diagnostik snippets** rettet til at bruge nuværende miljø- og status-kommandoer i logs, scripts, og fejlsøgnings-trin
- **⚙️ GitHub Actions vejledning** opdateret fra `Azure/setup-azd@v1.0.0` til `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtykke vejledning** opdateret fra `azd mcp consent` til `azd copilot consent list`

#### Forbedret
- **🧠 AI kapitel vejledning** forklarer nu bedre preview-sensitive `azd ai` opførsel, tenant-specifik login, nuværende udvidelsesbrug, og opdaterede modeldeploy-anbefalinger
- **🧪 Workshop instruktioner** bruger nu mere realistiske versions-eksempler og klarere miljøopsætningssprog til praktiske labs
- **📈 Produktion og fejlfindingsdokumenter** matcher nu bedre aktuelle overvågnings-, fallback-model- og omkostningsniveau eksempler

#### Opdaterede filer
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

#### AZD AI CLI Kommandoer, Indholdsvalidering & Skabelonudvidelse
**Denne version tilføjer `azd ai`, `azd extension`, og `azd mcp` kommando dækning på tværs af alle AI-relaterede kapitler, retter brudte links og forældet kode i agents.md, opdaterer snydearket, og omarbejder afsnittet Eksempel Skabeloner med validerede beskrivelser og nye Azure AI AZD skabeloner.**

#### Tilføjet
- **🤖 AZD AI CLI dækning** på tværs af 7 filer (tidligere kun i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny "Extensions and AI Commands" sektion introducerer `azd extension`, `azd ai agent init`, og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` med sammenligningstabel (skabelon vs manifest tilgang)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" og "Agent-First Deployment" underafsnit
  - `docs/chapter-05-multi-agent/README.md` — Hurtig start viser nu både skabelon- og manifestbaserede deployeringsveje
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy afsnittet inkluderer nu `azd ai agent init` mulighed
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" underafsnit
  - `resources/cheat-sheet.md` — Ny "AI & Extensions Commands" sektion med `azd extension`, `azd ai agent init`, `azd mcp`, og `azd infra generate`
- **📦 Nye AZD AI eksempel skabeloner** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat med Blazor WebAssembly, Semantic Kernel, og stemmechat support
  - **azure-search-openai-demo-java** — Java RAG chat med Langchain4J med ACA/AKS deployeringsmuligheder
  - **contoso-creative-writer** — Multi-agent kreativ skriveapp med Azure AI Agent Service, Bing Grounding, og Prompty
  - **serverless-chat-langchainjs** — Serverless RAG med Azure Functions + LangChain.js + Cosmos DB med Ollama lokal udviklingssupport
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med administrationsportal, Teams-integration og PostgreSQL/Cosmos DB-muligheder
  - **azure-ai-travel-agents** — Multi-agent MCP orkestreringsreferenceapp med servere i .NET, Python, Java og TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastruktur Bicep startskabelon
  - **🔗 Awesome AZD AI Gallery link** — Reference til [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ skabeloner)

#### Rettet
- **🔗 agents.md navigation**: Forrige/Næste links matcher nu kapitel 2 README-lektionsrækkefølge (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md brudte links**: `production-ai-practices.md` rettet til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md forældet kode**: Udskiftede `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttede `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md token optælling**: Udskiftede groft `len//4` estimat med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rettede services fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standard vært ændret oktober 2024)
- **contoso-chat**: Opdateret beskrivelse med reference til Azure AI Foundry + Prompty, som matcher repo'ets faktiske titel og teknologistak

#### Fjernet
- **ai-document-processing**: Fjernet ikke-fungerende skabelonreference (repo ikke offentligt tilgængeligt som AZD-skabelon)

#### Forbedret
- **📝 agents.md øvelser**: Øvelse 1 viser nu forventet output og `azd monitor` trin; Øvelse 2 inkluderer fuld `FunctionTool` registreringskode; Øvelse 3 erstatter vag vejledning med konkrete `prepdocs.py` kommandoer
- **📚 agents.md ressourcer**: Opdaterede dokumentationslinks til aktuelle Azure AI Agent Service-dokumenter og hurtigstart
- **📋 agents.md Næste skridt tabel**: Tilføjet AI Workshop Lab-link for komplet kapitel dækning

#### Opdaterede filer
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
**Denne version forbedrer README.md kapitelnavigation med en forbedret tabelstruktur.**

#### Ændret
- **Kursusoversigtstabel**: Forbedret med direkte lektionslinks, varighedsestimater og kompleksitetsvurderinger
- **Oprydning i mapper**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidering**: Alle 21+ interne links i Kursusoversigtstabel verificeret

### [v3.16.0] - 2026-02-05

#### Opdatering af produktnavne
**Denne version opdaterer produktreferencer til nuværende Microsoft branding.**

#### Ændret
- **Microsoft Foundry → Microsoft Foundry**: Alle referencer opdateret på tværs af ikke-oversatte filer
- **Azure AI Agent Service → Foundry Agents**: Servicenavn opdateret for at afspejle aktuel branding

#### Opdaterede filer
- `README.md` - Hovedkursus landingsside
- `changelog.md` - Versionshistorik
- `course-outline.md` - Kursusstruktur
- `docs/chapter-02-ai-development/agents.md` - AI-agenter guide
- `examples/README.md` - Eksempeldokumentation
- `workshop/README.md` - Workshop landingsside
- `workshop/docs/index.md` - Workshop indeks
- `workshop/docs/instructions/*.md` - Alle workshop instruktionsfiler

---

### [v3.15.0] - 2026-02-05

#### Stor repositorieomstrukturering: Kapitelbaserede mappenavne
**Denne version omstrukturerer dokumentationen i dedikerede kapitelmapper for klarere navigation.**

#### Omdøbning af mapper
Gamle mapper er erstattet med kapitelnummererede mapper:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Tilføjet ny: `docs/chapter-05-multi-agent/`

#### Filer flyttet
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

#### Tilføjet
- **📚 Kapitel README-filer**: Oprettet README.md i hver kapitelmappe med:
  - Læringsmål og varighed
  - Lektionstabel med beskrivelser
  - Hurtigstart-kommandoer
  - Navigation til andre kapitler

#### Ændret
- **🔗 Opdateret alle interne links**: Over 78 stier opdateret i alle dokumentationsfiler
- **🗺️ Hoved README.md**: Opdateret Kursusoversigt med ny kapitelstruktur
- **📝 examples/README.md**: Opdateret krydsreferencer til kapitelmapper

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Omstrukturering af repository: Kapitelnavigation
**Denne version tilføjede kapitelnavigation README-filer (erstattet af v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny AI Agents Guide
**Denne version tilføjer en omfattende guide til implementering af AI-agenter med Azure Developer CLI.**

#### Tilføjet
- **🤖 docs/microsoft-foundry/agents.md**: Fuldt guide dækkende:
  - Hvad AI-agenter er, og hvordan de adskiller sig fra chatbots
  - Tre hurtigt-start agent-skabeloner (Foundry Agents, Prompty, RAG)
  - Agent arkitekturmønstre (enkelt agent, RAG, multi-agent)
  - Værktøjskonfiguration og tilpasning
  - Overvågning og målepunktsporing
  - Omkostningsovervejelser og optimering
  - Almindelige fejlfinding scenarier
  - Tre hands-on øvelser med succes kriterier

#### Indholdsstruktur
- **Introduktion**: Agentbegreber for begyndere
- **Hurtig Start**: Udrulning af agenter med `azd init --template get-started-with-ai-agents`
- **Arkitektur mønstre**: Visuelle diagrammer over agentmønstre
- **Konfiguration**: Værktøjsopsætning og miljøvariabler
- **Overvågning**: Integration med Application Insights
- **Øvelser**: Progressiv hands-on læring (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### Opdatering af DevContainer-miljø
**Denne version opdaterer udviklingscontainers konfiguration med moderne værktøjer og bedre standardindstillinger til AZD læringsoplevelse.**

#### Ændret
- **🐳 Base Image**: Opdateret fra `python:3.12-bullseye` til `python:3.12-bookworm` (seneste Debian stable)
- **📛 Container Navn**: Omdøbt fra "Python 3" til "AZD for Beginners" for klarhed

#### Tilføjet
- **🔧 Nye Dev Container-funktioner**:
  - `azure-cli` med Bicep support aktiveret
  - `node:20` (LTS version til AZD skabeloner)
  - `github-cli` til skabelonstyring
  - `docker-in-docker` til container app udrulninger

- **🔌 Port forwarding**: Forudkonfigurerede porte til almindelig udvikling:
  - 8000 (MkDocs forhåndsvisning)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (API'er)

- **🧩 Nye VS Code-udvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep sprog support
  - `ms-azure-devtools.azure-resource-groups` - Azure ressourcehåndtering
  - `yzhang.markdown-all-in-one` - Markdown redigering
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram support
  - `redhat.vscode-yaml` - YAML support (til azure.yaml)
  - `eamodio.gitlens` - Git visualisering
  - `mhutchie.git-graph` - Git historik

- **⚙️ VS Code-indstillinger**: Tilføjede standardindstillinger for Python interpreter, format ved gem og fjernelse af mellemrum

- **📦 Opdateret requirements-dev.txt**:
  - Tilføjet MkDocs minify plugin
  - Tilføjet pre-commit til kodekvalitet
  - Tilføjet Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Rettet
- **Post-Create Kommando**: Verificerer nu AZD og Azure CLI installation ved containerstart

---

### [v3.11.0] - 2026-02-05

#### Begynder-venlig README-overhaling
**Denne version forbedrer væsentligt README.md til at være mere tilgængelig for begyndere og tilføjer essentielle ressourcer til AI-udviklere.**

#### Tilføjet
- **🆚 Azure CLI vs AZD sammenligning**: Klar forklaring på, hvornår hvert værktøj skal bruges med praktiske eksempler
- **🌟 Awesome AZD Links**: Direkte links til community skabelongalleri og bidragsressourcer:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ klar-til-udrulning skabeloner
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community bidrag
- **🎯 Hurtigstart-guide**: Forenklet 3-trins kom godt i gang sektion (Installer → Login → Udrul)
- **📊 Erfaringsbaseret navigeringstabel**: Klar vejledning i, hvor man skal starte baseret på udviklererfaring

#### Ændret
- **README-struktur**: Omdisponeret til progressiv afsløring - vigtig information først
- **Introduktionsafsnit**: Omskrevet til at forklare "Tryllet med `azd up`" for helt begyndere
- **Fjernet duplikeret indhold**: Fjernet dubleret fejlsøgningsafsnit
- **Fejlfinding kommandoer**: Rettede `azd logs` reference til brug af gyldig `azd monitor --logs`

#### Rettet
- **🔐 Autentificeringskommandoer**: Tilføjede `azd auth login` og `azd auth logout` til cheat-sheet.md
- **Ugyldige kommando-referencer**: Fjernet resterende `azd logs` fra README fejlsøgningssektion

#### Noter
- **Omfang**: Ændringer anvendt på hoved README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer målrettet udviklere nye til AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI kommando-præcision opdatering
**Denne version retter ikke-eksisterende AZD-kommandoer i hele dokumentationen, og sikrer at alle kodeeksempler bruger gyldig Azure Developer CLI syntaks.**

#### Rettet
- **🔧 Ikke-eksisterende AZD-kommandoer fjernet**: Omfattende revision og korrektion af ugyldige kommandoer:
  - `azd logs` (eksisterer ikke) → erstattet med `azd monitor --logs` eller Azure CLI-alternativer
  - `azd service` underkommandoer (eksisterer ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (eksisterer ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flag (eksisterer ikke) → fjernet
  - `azd provision --what-if/--rollback` flag (eksisterer ikke) → opdateret til brug af `--preview`
  - `azd config validate` (eksisterer ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (eksisterer ikke) → fjernet

- **📚 Filer opdateret med kommando-korrektioner**:
  - `resources/cheat-sheet.md`: Stor revision af kommando-reference
  - `docs/deployment/deployment-guide.md`: Rettede rollback og udrulningsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigeret loganalyseafsnit
  - `docs/troubleshooting/common-issues.md`: Opdaterede fejlsøgnings-kommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Rettede AZD debugging sektion
  - `docs/getting-started/azd-basics.md`: Rettede overvågningskommandoer
  - `docs/getting-started/first-project.md`: Opdaterede overvågnings- og fejlfindingseksempler
  - `docs/getting-started/installation.md`: Rettede hjælpe- og versionseksempler
  - `docs/pre-deployment/application-insights.md`: Rettede kommandoer til visning af logfiler
  - `docs/pre-deployment/coordination-patterns.md`: Rettede fejlfinding af agentkommandoer

- **📝 Versionsreference Opdateret**: 
  - `docs/getting-started/installation.md`: Ændret hardkodet `1.5.0` version til generisk `1.x.x` med link til udgivelser

#### Ændret
- **Rollback Strategier**: Opdateret dokumentation til at bruge Git-baseret rollback (AZD har ikke indbygget rollback)
- **Logvisning**: Erstattet `azd logs` referencer med `azd monitor --logs`, `azd monitor --live` og Azure CLI-kommandoer
- **Ydelsesafsnit**: Fjernet ikke-eksisterende parallelle/incrementelle deployments-flags, leveret gyldige alternativer

#### Tekniske Detaljer
- **Gyldige AZD Kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Fjernede Funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Noter
- **Bekræftelse**: Kommandoer valideret mod Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Færdiggørelse af Workshop og Opdatering af Dokumentationskvalitet
**Denne version færdiggør de interaktive workshopmoduler, retter alle ødelagte dokumentationslinks og forbedrer den samlede indholdskvalitet for AI-udviklere, der bruger Microsoft AZD.**

#### Tilføjet
- **📝 CONTRIBUTING.md**: Nyt dokument med retningslinjer for bidrag med:
  - Klare instruktioner til rapportering af problemer og forslag til ændringer
  - Dokumentationsstandarder for nyt indhold
  - Retningslinjer for kodeeksempler og commit-beskeder
  - Information om fællesskabsengagement

#### Færdiggjort
- **🎯 Workshop Modul 7 (Afslutning)**: Fuldstændigt færdiggjort afslutningsmodul med:
  - Omfattende opsummering af workshop-resultater
  - Afsnit med nøglebegreber inden for AZD, skabeloner og Microsoft Foundry
  - Anbefalinger til fortsættelse af læringsrejse
  - Workshop udfordringsøvelser med sværhedsgrader
  - Fællesskabsfeedback og supportlinks

- **📚 Workshop Modul 3 (Nedbrydning)**: Opdaterede læringsmål med:
  - Aktivationsvejledning for GitHub Copilot med MCP-servere
  - Forståelse af AZD skabelonmappestruktur
  - Organiseringsmønstre for infrastruktur-som-kode (Bicep)
  - Praktiske laboratorieinstruktioner

- **🔧 Workshop Modul 6 (Nedtagning)**: Færdiggjort med:
  - Ressourceoprydning og omkostningsstyringsmål
  - Brug af `azd down` til sikker deprovisionering af infrastruktur
  - Vejledning til genopretning af blødt slettede kognitive tjenester
  - Bonusopdagelsesopgaver for GitHub Copilot og Azure Portal

#### Rettet
- **🔗 Løst Ødelagte Links**: Rettede 15+ ødelagte interne dokumentationslinks:
  - `docs/ai-foundry/ai-model-deployment.md`: Rettede sti til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Rettede sti til ai-model-deployment.md og production-ai-practices.md
  - `docs/getting-started/first-project.md`: Erstattede ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Rettede FAQ og fejlfindingvejledninger
  - `examples/container-app/microservices/README.md`: Rettede kursusforside og deploymentsguide
  - `resources/faq.md` og `resources/glossary.md`: Opdaterede AI-kapitelreferencer
  - `course-outline.md`: Rettede instruktørvejledning og AI workshop laboratoriehenvisninger

- **📅 Workshop Status Banner**: Opdateret fra "Under opførelse" til aktiv workshopstatus med dato februar 2026

- **🔗 Workshopnavigation**: Rettede ødelagte navigationslinks i workshop README.md, der pegede på ikke-eksisterende lab-1-azd-basics-mappe

#### Ændret
- **Workshoppræsentation**: Fjernet "under opførelse"-advarsel, workshop er nu færdig og klar til brug
- **Navigationskonsistens**: Sikret at alle workshopmoduler har korrekt navigation mellem moduler
- **Læringssti Referencer**: Opdateret kapitel-krydshenvisninger til at bruge korrekte microsoft-foundry-stier

#### Valideret
- ✅ Alle engelske markdown-filer har gyldige interne links
- ✅ Workshopmoduler 0-7 er komplette med læringsmål
- ✅ Navigation mellem kapitler og moduler fungerer korrekt
- ✅ Indhold er egnet til AI-udviklere, der bruger Microsoft AZD
- ✅ Begyndervenligt sprog og struktur opretholdt gennem hele dokumentet
- ✅ CONTRIBUTING.md giver klare retningslinjer for samfundsbidragsydere

#### Teknisk Implementering
- **Linkvalidering**: Automatiseret PowerShell-script verificerede alle .md interne links
- **Indholdsaudit**: Manuel gennemgang af workshopkomplethed og begyndertilgængelighed
- **Navigationssystem**: Ensartede navigationsmønstre for kapitler og moduler anvendt

#### Noter
- **Omfang**: Ændringer gælder kun for englændsk dokumentation
- **Oversættelser**: Oversættelsesmappen opdateres ikke i denne version (automatisk oversættelse synkroniseres senere)
- **Varighed af Workshop**: Færdig workshop giver nu 3-4 timers praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avanceret Dokumentation: Overvågning, Sikkerhed og Multi-Agent Mønstre
**Denne version tilføjer omfattende A-klasse lektioner om integration af Application Insights, autentificeringsmønstre og multi-agent koordinering til produktionsimplementeringer.**

#### Tilføjet
- **📊 Application Insights Integrationslektion**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuserede deployment med automatisk provisioning
  - Færdige Bicep-skabeloner til Application Insights + Log Analytics
  - Fungerende Python-applikationer med brugerdefineret telemetri (over 1.200 linjer)
  - AI/LLM overvågningsmønstre (Microsoft Foundry Models token-/omkostningssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribueret tracing, telemetristrøm)
  - 3 praktiske øvelser (alarmer, dashboards, AI-overvågning)
  - Kusto-forespørgselseksempler og omkostningsoptimeringsstrategier
  - Live metrikstrøm og fejlsøgning i realtid
  - 40-50 minutters læringstid med produktionsklare mønstre

- **🔐 Autentificerings- og Sikkerhedsmønster Lektion**: i `docs/getting-started/authsecurity.md`:
  - 3 autentificeringsmønstre (forbindelsesstrenge, Key Vault, håndteret identitet)
  - Færdige Bicep infrastruktur skabeloner til sikre implementeringer
  - Node.js applikationskode med Azure SDK integration
  - 3 komplette øvelser (aktiver håndteret identitet, bruger-tildelt identitet, Key Vault rotation)
  - Sikkerhedsbest practices og RBAC-konfigurationer
  - Fejlfinding-vejledning og omkostningsanalyse
  - Produktionsklare passwordless autentificeringsmønstre

- **🤖 Multi-Agent Koordinationsmønstre Lektion**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinationsmønstre (sekventiel, parallel, hierarkisk, hændelsesdrevet, konsensus)
  - Færdig implementering af orkestratorservice (Python/Flask, over 1.500 linjer)
  - 3 specialiserede agentimplementeringer (Research, Writer, Editor)
  - Service Bus integration for beskedkø
  - Cosmos DB tilstandsadministration for distribuerede systemer
  - 6 Mermaid-diagrammer, der viser agentinteraktioner
  - 3 avancerede øvelser (timeout-håndtering, retry-logic, circuit breaker)
  - Omkostningsoversigt ($240-565/måned) med optimeringsstrategier
  - Application Insights integration til overvågning

#### Forbedret
- **Prædeploymentskapitel**: Indeholder nu omfattende overvågnings- og koordinationsmønstre
- **Kom godt i gang kapitel**: Forbedret med professionelle autentificeringsmønstre
- **Produktionsparathed**: Komplett dækning fra sikkerhed til observabilitet
- **Kursusoversigt**: Opdateret til at henvise til nye lektioner i kapitlerne 3 og 6

#### Ændret
- **Læringsprogression**: Bedre integration af sikkerhed og overvågning i hele kurset
- **Dokumentationskvalitet**: Ensartede A-klasse standarder (95-97%) på tværs af nye lektioner
- **Produktionsmønstre**: Komplett end-to-end dækning for enterprise implementeringer

#### Forbedret
- **Udvikleroplevelse**: Klar vej fra udvikling til produktionsovervågning
- **Sikkerhedsstandarder**: Professionelle mønstre for autentificering og hemmelighedshåndtering
- **Observabilitet**: Komplett Application Insights integration med AZD
- **AI Arbejdsbelastninger**: Specialiseret overvågning for Microsoft Foundry Models og multi-agent systemer

#### Valideret
- ✅ Alle lektioner inkluderer komplet funktionsdygtig kode (ikke kun uddrag)
- ✅ Mermaid-diagrammer til visuel læring (19 i alt på tværs af 3 lektioner)
- ✅ Praktiske øvelser med verifikationstrin (9 i alt)
- ✅ Produktionsklare Bicep-skabeloner deployerbare via `azd up`
- ✅ Omkostningsanalyse og optimeringsstrategier
- ✅ Fejlfinding-vejledninger og best practices
- ✅ Videnscheckpunkter med verifikationskommandoer

#### Resultater af Dokumentationsbedømmelse
- **docs/pre-deployment/application-insights.md**: - Omfattende overvågningsvejledning
- **docs/getting-started/authsecurity.md**: - Professionelle sikkerhedsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avancerede multi-agent arkitekturer
- **Samlet Nyt Indhold**: - Ensartede højkvalitetsstandarder

#### Teknisk Implementering
- **Application Insights**: Log Analytics + brugerdefineret telemetri + distribueret tracing
- **Autentificering**: Håndteret Identitet + Key Vault + RBAC-mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvågning**: Live metrics + Kusto-forespørgsler + alarmer + dashboards
- **Omkostningsstyring**: Sampling-strategier, bevarelsespolitikker, budgetkontrol

### [v3.7.0] - 2025-11-19

#### Forbedringer i Dokumentationskvalitet og Nyt Microsoft Foundry Models Eksempel
**Denne version forbedrer dokumentationskvaliteten på tværs af hele arkivet og tilføjer et komplet Microsoft Foundry Models implementeringseksempel med gpt-4.1 chat-interface.**

#### Tilføjet
- **🤖 Microsoft Foundry Models Chat Eksempel**: Komplett gpt-4.1 deployment med fungerende implementering i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models infrastruktur (gpt-4.1 model deployment)
  - Python kommandolinje chat-interface med samtalehistorik
  - Key Vault integration til sikker opbevaring af API-nøgler
  - Token-brugssporing og omkostningsestimater
  - Ratebegrænsning og fejlhåndtering
  - Omfattende README med 35-45 minutters implementeringsvejledning
  - 11 produktionsklare filer (Bicep-skabeloner, Python-app, konfiguration)
- **📚 Dokumentationsøvelser**: Tilføjede praktiske øvelser til konfigurationsvejledning:
  - Øvelse 1: Multi-miljø konfiguration (15 minutter)
  - Øvelse 2: Træning i hemmelighedshåndtering (10 minutter)
  - Klare succes kriterier og verifikationstrin
- **✅ Verifikation af Deployment**: Tilføjet verifikationsafsnit til deploy-guiden:
  - Helbredscheck procedurer
  - Tjekliste for succes kriterier
  - Forventede resultater for alle deploy-kommandoer
  - Hurtig reference til fejlfinding

#### Forbedret
- **examples/README.md**: Opdateret til A-klasse kvalitet (93%):
  - Tilføjet azure-openai-chat til alle relevante afsnit
  - Lokal eksempelantal opdateret fra 3 til 4
  - Tilføjet til AI Applikationseksempler tabel
  - Integreret i Quick Start for mellemliggende brugere
  - Tilføjet til Microsoft Foundry Skabeloner sektion
  - Opdateret Sammenligningsmatrix og teknologifindingssektioner
- **Dokumentationskvalitet**: Forbedret fra B+ (87%) til A- (92%) i docs-mappe:
  - Tilføjet forventede output til kritiske kommandoeksempler
  - Inkluderede verifikationstrin for konfigurationsændringer
  - Forbedret praktisk læring med øvelser

#### Ændret
- **Læringsprogression**: Bedre integration af AI-eksempler til mellemliggende brugere
- **Dokumentationsstruktur**: Mere handlingsorienterede øvelser med klare resultater
- **Verifikationsproces**: Udtrykkelige succes kriterier tilføjet til nøglearbejdsgange

#### Forbedret
- **Udvikleroplevelse**: Microsoft Foundry Models deploy tager nu 35-45 minutter (mod 60-90 for komplekse alternativer)
- **Omkostningstransparens**: Klare omkostningsestimater ($50-200/måned) for Microsoft Foundry Models eksempel
- **Læringssti**: AI-udviklere har klar start med azure-openai-chat
- **Dokumentationsstandarder**: Ensartede forventede output og verifikationstrin

#### Valideret
- ✅ Microsoft Foundry Models eksempel fuldt funktionelt med `azd up`
- ✅ Alle 11 implementeringsfiler er syntaktisk korrekte
- ✅ README-instruktioner matcher faktisk deploy-oplevelse
- ✅ Dokumentationslinks opdateret på 8+ steder
- ✅ Eksempelindeks afspejler præcist 4 lokale eksempler
- ✅ Ingen duplikerede eksterne links i tabeller
- ✅ Alle navigationsreferencer er korrekte

#### Teknisk Implementering
- **Microsoft Foundry Models Arkitektur**: gpt-4.1 + Key Vault + Container Apps mønster
- **Sikkerhed**: Klar til Håndteret Identitet, hemmeligheder i Key Vault
- **Overvågning**: Application Insights integration
- **Omkostningsstyring**: Token-sporing og brugoptimering
- **Deployment**: Enkelt `azd up` kommando til komplet opsætning

### [v3.6.0] - 2025-11-19

#### Større Opdatering: Container App Deployment Eksempler
**Denne version introducerer omfattende, produktionsklare container-applikationsdeployments med Azure Developer CLI (AZD), komplet dokumentation og integration i læringsstien.**

#### Tilføjet
- **🚀 Container App Eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Fuldstændig oversigt over containeriserede deployment, hurtig start, produktion og avancerede mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Begyndervenlig REST API med scale-to-zero, sundhedsprober, overvågning og fejlfinding
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsklar multi-service deployment (API Gateway, Produkt, Ordre, Bruger, Notifikation), asynkron messaging, Service Bus, Cosmos DB, Azure SQL, distribueret tracing, blue-green/canary deployment
- **Best Practices**: Sikkerhed, overvågning, omkostningsoptimering og CI/CD vejledning for containeriserede workloads
- **Code Samples**: Fuldstændige `azure.yaml`, Bicep skabeloner og multi-sprog serviceimplementeringer (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end testsituationer, overvågningskommandoer, fejlfinding vejledning

#### Ændret
- **README.md**: Opdateret til at vise og linke til nye container app eksempler under "Lokale Eksempler - Containerapplikationer"
- **examples/README.md**: Opdateret til at fremhæve container app eksempler, tilføje sammenligningsmatrix poster og opdatere teknologi/arkitekturreferencer
- **Kursusoversigt & Studievejledning**: Opdateret til at referere nye container app eksempler og deploymønstre i relevante kapitler

#### Valideret
- ✅ Alle nye eksempler kan deployeres med `azd up` og følger best practices
- ✅ Dokumentations krydsreferencer og navigation opdateret
- ✅ Eksempler dækker fra begynder til avancerede scenarier, inklusive produktion microservices

#### Noter
- **Omfang**: Kun engelsk dokumentation og eksempler
- **Næste Skridt**: Udvid med yderligere avancerede containermønstre og CI/CD automatisering i fremtidige udgivelser

### [v3.5.0] - 2025-11-19

#### Produkt Rebranding: Microsoft Foundry
**Denne version implementerer en omfattende navneændring af produktet fra "Microsoft Foundry" til "Microsoft Foundry" i hele den engelske dokumentation, som afspejler Microsofts officielle rebranding.**

#### Ændret
- **🔄 Produktnavn Opdatering**: Komplet rebranding fra "Microsoft Foundry" til "Microsoft Foundry"
  - Opdateret alle referencer i den engelske dokumentation i `docs/` mappen
  - Omdøbt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøbt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - IAlt: 23 indholdsreferencer opdateret i 7 dokumentationsfiler

- **📁 Ændringer i mappestruktur**:
  - `docs/ai-foundry/` omdøbt til `docs/microsoft-foundry/`
  - Alle krydsreferencer opdateret til at reflektere ny mappestruktur
  - Navigationslinks valideret på tværs af al dokumentation

- **📄 Fil Omdøbninger**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links opdateret til at referere til nyt filnavn

#### Opdaterede Filer
- **Kapitel Dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation link opdateringer
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnsreferencer opdateret
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bruger allerede Microsoft Foundry (fra tidligere opdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencer opdateret (oversigt, community-feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 krydsreference links opdateret
  - `docs/getting-started/first-project.md` - 2 kapitel navigationslinks opdateret
  - `docs/getting-started/installation.md` - 2 næste kapitel links opdateret
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencer opdateret (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslink opdateret
  - `docs/troubleshooting/debugging.md` - 1 navigationslink opdateret

- **Kursusstruktur Filer** (2 filer):
  - `README.md` - 17 referencer opdateret (kursusoversigt, kapiteltitler, skabelonsektion, community indsigt)
  - `course-outline.md` - 14 referencer opdateret (oversigt, læringsmål, kapitleressourcer)

#### Valideret
- ✅ Ingen resterende "ai-foundry" mappereferencer i engelske dokumenter
- ✅ Ingen resterende "Microsoft Foundry" produktnavnsreferencer i engelske dokumenter
- ✅ Alle navigationslinks fungerer med ny mappestruktur
- ✅ Fil- og mappenavne omdøbt succesfuldt
- ✅ Krydsreferencer mellem kapitler valideret

#### Noter
- **Omfang**: Ændringer anvendt på engelsk dokumentation i `docs/` mappen kun
- **Oversættelser**: Oversættelsesmappen (`translations/`) opdateres ikke i denne version
- **Workshop**: Workshopmaterialer (`workshop/`) opdateres ikke i denne version
- **Eksempler**: Eksempelfiler kan stadig referere til tidligere navngivning (udbedres i fremtidig opdatering)
- **Eksterne Links**: Eksterne URL'er og GitHub repository-referencer forbliver uændrede

#### Migreringsvejledning for bidragydere
Hvis du har lokale grene eller dokumentation, som refererer til den gamle struktur:
1. Opdater mappehenvisninger: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Opdater filhenvisninger: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstat produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Validér at alle interne dokumentationslinks stadig virker

---

### [v3.4.0] - 2025-10-24

#### Infrastruktur Preview og Valideringsforbedringer
**Denne version introducerer omfattende understøttelse af den nye Azure Developer CLI preview-funktion og forbedrer workshop-brugeroplevelsen.**

#### Tilføjet
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattende dækning af den nye infrastruktur-preview mulighed
  - Kommandoreference og brugs-eksempler i snydeark
  - Detaljeret integration i provisioning guide med brugsscenarier og fordele
  - Pre-flight check integration for sikrere deploymentsvalidering
  - Opdateringer i opstartsvejledning med sikkerheds-første deploymentspraksis
- **🚧 Workshop Statusbanner**: Professionelt HTML-banner, der angiver workshopudviklingsstatus
  - Gradientdesign med byggeindikationer for klar brugerkommunikation
  - Sidst opdateret tidsstempel for gennemsigtighed
  - Mobil-responsivt design for alle enhedstyper

#### Forbedret
- **Infrastruktur Sikkerhed**: Preview funktionalitet integreret gennem deployment-dokumentationen
- **Forud Deployment Validering**: Automatiserede scripts inkluderer nu infrastruktur-preview test
- **Udvikler Workflow**: Opdaterede kommando-sekvenser inkluderer preview som best practice
- **Workshopoplevelse**: Klare forventninger sat til brugere omkring indholdets udviklingsstatus

#### Ændret
- **Deployments Best Practices**: Preview-først workflow anbefales nu som tilgang
- **Dokumentationsflow**: Infrastrukturvalidering flyttet tidligere i læringsprocessen
- **Workshop Præsentation**: Professionel statuskommunikation med klar udviklingstidslinje

#### Forbedret
- **Sikkerheds-Første Tilgang**: Infrastrukturændringer kan nu valideres inden deployment
- **Team Samarbejde**: Preview resultater kan deles til gennemgang og godkendelse
- **Omkostningsbevidsthed**: Bedre forståelse af ressourceomkostninger før provisionering
- **Risikoreduktion**: Færre deploymentfejl gennem forudgående validering

#### Teknisk Implementering
- **Multi-dokument Integration**: Preview funktion dokumenteret i 4 nøglefiler
- **Kommandomønstre**: Konsistent syntaks og eksempler gennem dokumentationen
- **Best Practice Integration**: Preview inkluderet i valideringsworkflows og scripts
- **Visuelle Indikatorer**: Klare NYE funktionsmarkeringer for synlighed

#### Workshop Infrastruktur
- **Statuskommunikation**: Professionelt HTML-banner med gradientstil
- **Brugeroplevelse**: Klar udviklingsstatus forhindrer forvirring
- **Professionel Præsentation**: Bevarer repository troværdighed og sætter forventninger
- **Tidslinjegennemsigtighed**: Sidste opdatering oktober 2025 for ansvarlighed

### [v3.3.0] - 2025-09-24

#### Forbedrede Workshopmaterialer og Interaktiv Læringsoplevelse
**Denne version introducerer omfattende workshopmaterialer med browserbaserede interaktive guider og strukturerede læringsveje.**

#### Tilføjet
- **🎥 Interaktiv Workshopguide**: Browserbaseret workshopoplevelse med MkDocs preview funktion
- **📝 Strukturér Workshop Instruktioner**: 7-trins guidet læringsvej fra opdagelse til tilpasning
  - 0-Introduktion: Workshopoversigt og opsætning
  - 1-Vælg-AI-Skabelon: Skabelonopdagelse og udvælgelsesproces
  - 2-Valider-AI-Skabelon: Deployment og valideringsprocedurer
  - 3-Nedbryd-AI-Skabelon: Forståelse af skabelonarkitektur
  - 4-Konfigurer-AI-Skabelon: Konfiguration og tilpasning
  - 5-Tilpas-AI-Skabelon: Avancerede modifikationer og iterationer
  - 6-Nedtag-Infrastruktur: Oprydning og ressourcehåndtering
  - 7-Afslutning: Opsummering og næste skridt
- **🛠️ Workshopværktøjer**: MkDocs konfiguration med Material tema for forbedret læringsoplevelse
- **🎯 Hands-On Læringsvej**: 3-trins metode (Opdagelse → Deployment → Tilpasning)
- **📱 GitHub Codespaces Integration**: Sømfri udviklingsmiljøopsætning

#### Forbedret
- **AI Workshop Lab**: Udvidet med omfattende 2-3 timers struktureret læringsoplevelse
- **Workshop Dokumentation**: Professionel præsentation med navigation og visuelle hjælpemidler
- **Læringsprogression**: Klar trin-for-trin vejledning fra skabelonvalg til produktionsdeployment
- **Udvikleroplevelse**: Integrerede værktøjer for strømlinede udviklingsworkflows

#### Forbedret
- **Tilgængelighed**: Browserbaseret interface med søgning, kopifunktionalitet og temaomskifter
- **Selvstyret Læring**: Fleksibel workshopstruktur, som tilpasses forskellige læringshastigheder
- **Praktisk Anvendelse**: Virkelighedsnære AI-skabelondeploymentscenarier
- **Community Integration**: Discord integration til workshop-support og samarbejde

#### Workshop Funktioner
- **Indbygget Søgning**: Hurtig nøgleord- og lektionopdagelse
- **Kopiér Kodeblokke**: Hover-to-copy funktionalitet for alle kodeeksempler
- **Temaomskifter**: Dark/light mode understøttelse til forskellige præferencer
- **Visuelle Materialer**: Skærmbilleder og diagrammer for forbedret forståelse
- **Hjælpeintegration**: Direkte adgang til Discord for community support

### [v3.2.0] - 2025-09-17

#### Stor Navigationsomstrukturering og Kapitel-baseret Læringssystem
**Denne version introducerer en omfattende kapitelbaseret læringsstruktur med forbedret navigation gennem hele repositoriet.**

#### Tilføjet
- **📚 Kapitel-baseret Læringssystem**: Omstruktureret hele kurset i 8 progressive læringskapitler
  - Kapitel 1: Grundlag & Hurtig Start (⭐ - 30-45 min.)
  - Kapitel 2: AI-Først Udvikling (⭐⭐ - 1-2 timer)
  - Kapitel 3: Konfiguration & Autentificering (⭐⭐ - 45-60 min.)
  - Kapitel 4: Infrastruktur som kode & Deployment (⭐⭐⭐ - 1-1.5 timer)
  - Kapitel 5: Multi-Agent AI Løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapitel 6: Forud Deployment Validering & Planlægning (⭐⭐ - 1 time)
  - Kapitel 7: Fejlfinding & Debugging (⭐⭐ - 1-1.5 timer)
  - Kapitel 8: Produktions- & Enterprise Mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende Navigationssystem**: Konsistente navigationsoverskrifter og -fodér på tværs af al dokumentation
- **🎯 Fremdriftssporing**: Kursusfærdiggørelsescheckliste og læringsverifikationssystem
- **🗺️ Læringsvejsvejledning**: Klare indgangspunkt for forskellige erfaringsniveauer og mål
- **🔗 Krydsreference Navigation**: Relaterede kapitler og forudsætninger tydeligt linket

#### Forbedret
- **README Struktur**: Transformeret til en struktureret læringsplatform med kapitelbaseret organisering
- **Dokumentationsnavigation**: Hver side inkluderer nu kapitelkontext og progressionvejledning
- **Skabelonorganisering**: Eksempler og skabeloner knyttet til passende læringskapitler
- **Ressourceintegration**: Snydeark, FAQs og studievejledninger forbundet til relevante kapitler
- **Workshopintegration**: Hands-on labs knyttet til flere kapitel læringsmål

#### Ændret
- **Læringsprogression**: Flyttet fra lineær dokumentation til fleksibel kapitelbaseret læring
- **Konfigurationsplacering**: Omplaceret konfigurationsguide som Kapitel 3 for bedre læringsflow
- **AI IndholdsIntegration**: Bedre integration af AI-specifikt indhold gennem læringsforløbet
- **Produktionsindhold**: Avancerede mønstre samlet i Kapitel 8 for enterprise-lærende

#### Forbedret
- **Brugeroplevelse**: Klare navigation breadcrumbs og kapitelprogressionsindikatorer
- **Tilgængelighed**: Konsistente navigationsmønstre for nemmere kursusgennemgang
- **Professionel Præsentation**: Universitetslignende kursusstruktur egnet til akademisk og erhvervsmæssig træning
- **Læringseffektivitet**: Reduceret tid til at finde relevant indhold gennem forbedret organisering

#### Teknisk Implementering
- **Navigationsoverskrifter**: Standardiseret kapitelnavigation på tværs af 40+ dokumentationsfiler
- **Footer Navigation**: Konsistent progressionvejledning og kapitelafslutningsindikatorer
- **Krydslinking**: Omfattende internt linkningssystem, der forbinder relaterede begreber
- **Kapitelmapping**: Skabeloner og eksempler klart tilknyttet læringsmål

#### Studievejledningsforbedring
- **📚 Omfattende Læringsmål**: Omstruktureret studievejledning til at stemme overens med 8-kapitel systemet
- **🎯 Kapitel-Baseret Vurdering**: Hvert kapitel inkluderer specifikke læringsmål og praktiske øvelser
- **📋 Fremdriftssporing**: Ugentlig læringsplan med målbare resultater og færdiggørelseschecklister
- **❓ Vurderingsspørgsmål**: Videnvalideringsspørgsmål for hvert kapitel med professionelle resultater
- **🛠️ Praktiske Øvelser**: Hands-on aktiviteter med realistiske deploymente scenarier og fejlfinding
- **📊 Kompetenceprogression**: Klar fremgang fra grundlæggende koncepter til enterprise-mønstre med karriereudviklingsfokus
- **🎓 Certificeringsramme**: Professionelle udviklingsresultater og community-anerkendelsessystem
- **⏱️ Tidsstyring**: Struktureret 10-ugers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede Multi-Agent AI Løsninger
**Denne version forbedrer multi-agent detailhandelsløsningen med bedre agentnavne og forbedret dokumentation.**

#### Ændret
- **Multi-Agent Terminologi**: Erstattet "Cora agent" med "Customer agent" gennem hele retail multi-agent løsningen for klarere forståelse
- **Agentarkitektur**: Opdateret al dokumentation, ARM skabeloner og kodeeksempler til at bruge konsistent "Customer agent" navngivning
- **Konfigurations Eksempler**: Moderniserede agentkonfigurationsmønstre med opdaterede navngivningskonventioner
- **Dokumentationskonsistens**: Sikret at alle referencer bruger professionelle, beskrivende agentnavne

#### Forbedret
- **ARM Skabelonpakke**: Opdateret retail-multiagent-arm-template med Customer agent referencer
- **Arkitekturdiagrammer**: Opdateret Mermaid diagrammer med ajourført agentnavngivning
- **Kodeeksempler**: Python klasser og implementations-eksempler bruger nu CustomerAgent navngivning
- **Miljøvariabler**: Opdateret alle deploymentscripts til at bruge CUSTOMER_AGENT_NAME konventioner

#### Forbedret
- **Udvikleroplevelse**: Klarere agentroller og ansvarsområder i dokumentationen
- **Produktionsparathed**: Bedre tilpasning til virksomhedens navngivningskonventioner
- **Læringsmaterialer**: Mere intuitiv agentnavngivning til uddannelsesformål
- **Skabelonbrugervenlighed**: Forenklet forståelse af agentfunktioner og deployeringsmønstre

#### Tekniske Detaljer
- Opdateret Mermaid arkitekturdiagrammer med CustomerAgent referencer
- Erstattet CoraAgent klassenavne med CustomerAgent i Python eksempler
- Ændret ARM skabelon JSON-konfigurationer til at bruge "customer" agenttype
- Opdateret miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Opdateret alle deployeringskommandoer og containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Store Ændringer - AI Udviklerfokus og Microsoft Foundry Integration
**Denne version forvandler arkivet til en omfattende AI-fokuseret læringsressource med Microsoft Foundry integration.**

#### Tilføjet
- **🤖 AI-Først Læringssti**: Fuldt omstruktureret med prioritet til AI udviklere og ingeniører
- **Microsoft Foundry Integrationsvejledning**: Omfattende dokumentation for forbindelsen mellem AZD og Microsoft Foundry tjenester
- **AI Model Deployering Mønstre**: Detaljeret vejledning om modelvalg, konfiguration og produktionsdeployering strategier
- **AI Workshop Lab**: 2-3 timers hands-on workshop til konvertering af AI-applikationer til AZD-deployerbare løsninger
- **Produktions AI Best Practices**: Erhvervsklar mønstre til skalering, overvågning og sikring af AI workloads
- **AI-Specifik Fejlfindingvejledning**: Omfattende fejlfinding for Microsoft Foundry Modeller, Cognitive Services og AI deployeringsproblemer
- **AI Skabelongalleri**: Udvalgt samling af Microsoft Foundry skabeloner med kompleksitetsvurderinger
- **Workshop Materialer**: Fuldstændig workshopstruktur med hands-on laboratorier og reference materialer

#### Forbedret
- **README Struktur**: AI-udviklerfokus med 45% fællesskabsinteresse data fra Microsoft Foundry Discord
- **Læringsstier**: Dedikeret AI udvikler rejse ved siden af traditionelle stier for studerende og DevOps ingeniører
- **Skabelonanbefalinger**: Udvalgte AI skabeloner inkl. azure-search-openai-demo, contoso-chat, og openai-chat-app-quickstart
- **Fællesskabsintegration**: Forbedret Discord fællesskabsstøtte med AI-specifikke kanaler og diskussioner

#### Sikkerhed & Produktionsfokus
- **Managed Identity Mønstre**: AI-specifik autentificering og sikkerhedskonfigurationer
- **Omkostningsoptimering**: Token-brugsopfølgning og budgetkontrol for AI workloads
- **Multi-Region Deployment**: Strategier for global AI applikationsdeployering
- **Performance Overvågning**: AI-specifikke metrics og Application Insights integration

#### Dokumentationskvalitet
- **Lineær Kursusstruktur**: Logisk progression fra begynder til avancerede AI deployeringsmønstre
- **Validerede URLs**: Alle eksterne arkivlinks kontrolleret og tilgængelige
- **Komplet Referencer**: Alle interne dokumentationslinks valideret og funktionelle
- **Produktionsklar**: Erhvervsdeployeringsmønstre med virkelighedseksempler

### [v2.0.0] - 2025-09-09

#### Store Ændringer - Arkivomstrukturering og Professionel Forbedring
**Denne version repræsenterer en betydelig revision af arkivets struktur og indholdsopbygning.**

#### Tilføjet
- **Struktureret Læringsrammeværk**: Alle dokumentationssider indeholder nu Introduktion, Læringsmål og Læringsudbytte sektioner
- **Navigationssystem**: Tilføjet Forrige/Næste lektion links gennem hele dokumentationen for guidet læringsprogression
- **Studievejledning**: Omfattende study-guide.md med læringsmål, øvelser og evalueringsmaterialer
- **Professionel Præsentation**: Fjernet alle emoji-ikoner for forbedret tilgængelighed og professionelt udseende
- **Forbedret Indholdsstruktur**: Forbedret organisering og flow af læringsmaterialer

#### Ændret
- **Dokumentationsformat**: Standardiseret al dokumentation med konsistent læringsfokuseret struktur
- **Navigationsflow**: Implementeret logisk progression gennem alle læringsmaterialer
- **Indholdspræsentation**: Fjernet dekorative elementer til fordel for klar, professionel formatering
- **Linkstruktur**: Opdateret alle interne links til at understøtte nyt navigationssystem

#### Forbedret
- **Tilgængelighed**: Fjernet emoji-afhængigheder for bedre kompatibilitet med skærmlæsere
- **Professionelt Udseende**: Rent, akademisk præsenteret egnet til erhvervsuddannelse
- **Læringsoplevelse**: Struktureret tilgang med klare mål og resultater for hver lektion
- **Indholdsorganisering**: Bedre logisk flow og sammenhæng mellem relaterede emner

### [v1.0.0] - 2025-09-09

#### Første Udgave - Omfattende AZD Læringsarkiv

#### Tilføjet
- **Kerne Dokumentationsstruktur**
  - Fuldkommen introduktionsserie
  - Omfattende dokumentation for deployering og provisioning
  - Detaljerede fejlfinding og debugging guides
  - Foruddeployering valideringsværktøjer og procedurer

- **Kom-igang Modul**
  - AZD Grundlæggende: Kernekoncepter og terminologi
  - Installationsvejledning: Platforms-specifikke setup-instruktioner
  - Konfigurationsvejledning: Miljøopsætning og autentificering
  - Første Projekttutorial: Trin-for-trin hands-on læring

- **Deployering og Provisioning Modul**
  - Deployering Guide: Fuld arbejdsproces dokumentation
  - Provisioning Guide: Infrastruktur som kode med Bicep
  - Best practices for produktionsdeployering
  - Multi-service arkitektur mønstre

- **Foruddeployering Valideringsmodul**
  - Kapacitetsplanlægning: Azure ressource tilgængelighedsvalidering
  - SKU Valg: Omfattende vejledning om servicetiers
  - Pre-flight Checks: Automatiserede valideringsscripts (PowerShell og Bash)
  - Omkostningsestimering og budgetplanlægningsværktøjer

- **Fejlfinding Modul**
  - Almindelige Problemer: Hyppigt forekommende problemer og løsninger
  - Debugging Guide: Systematiske fejlfindingmetoder
  - Avancerede diagnostiske teknikker og værktøjer
  - Performance overvågning og optimering

- **Ressourcer og Referencer**
  - Kommandooversigt: Hurtig reference til essentielle kommandoer
  - Ordliste: Omfattende terminologi- og forkortelsesdefinitioner
  - FAQ: Detaljerede svar på almindelige spørgsmål
  - Eksterne ressource links og fællesskabsforbindelser

- **Eksempler og Skabeloner**
  - Simpelt Webapplikationseksempel
  - Statisk Website deployeringsskabelon
  - Containerapplikationskonfiguration
  - Database integrationsmønstre
  - Microservices arkitektureksempler
  - Serverless funktionsimplementeringer

#### Funktioner
- **Multi-Platform Support**: Installations- og konfigurationsvejledninger for Windows, macOS og Linux
- **Forskellige Færdighedsniveauer**: Indhold designet til studerende til professionelle udviklere
- **Praktisk Fokus**: Hands-on eksempler og virkelighedsnære scenarier
- **Omfattende Dækning**: Fra grundlæggende koncepter til avancerede virksomhedsmønstre
- **Sikkerhedsførste Tilgang**: Sikkerhedspraksis integreret gennem hele materialet
- **Omkostningsoptimering**: Vejledning i omkostningseffektive deployeringer og ressourcehåndtering

#### Dokumentationskvalitet
- **Detaljerede Kodeeksempler**: Praktiske, testede kodeeksempler
- **Trin-for-trin Instruktioner**: Klare, handlingsorienterede vejledninger
- **Omfattende Fejlhåndtering**: Fejlfinding for almindelige problemer
- **Best Practices Integration**: Branche standarder og anbefalinger
- **Versionskompatibilitet**: Opdateret med de nyeste Azure tjenester og azd funktioner

## Planlagte Fremtidige Forbedringer

### Version 3.1.0 (Planlagt)
#### Udvidelse af AI Platform
- **Multi-Model Support**: Integrationsmønstre for Hugging Face, Azure Machine Learning og specialmodeller
- **AI Agent Frameworks**: Skabeloner til LangChain, Semantic Kernel og AutoGen deployment
- **Avancerede RAG Mønstre**: Vector database muligheder udover Azure AI Search (Pinecone, Weaviate osv.)
- **AI Observability**: Forbedret overvågning af modelperformance, tokenbrug og responskvalitet

#### Udvikleroplevelse
- **VS Code Extension**: Integreret AZD + Microsoft Foundry udvikleroplevelse
- **GitHub Copilot Integration**: AI-understøttet generering af AZD skabeloner
- **Interaktive Tutorials**: Hands-on kodeøvelser med automatiseret validering for AI scenarier
- **Videoindhold**: Supplerende videotutorials for visuelle elever med fokus på AI deployeringer

### Version 4.0.0 (Planlagt)
#### Virksomheds AI Mønstre
- **Governance Framework**: AI model governance, compliance og audit spor
- **Multi-Tenant AI**: Mønstre for at servicere flere kunder med isolerede AI tjenester
- **Edge AI Deployment**: Integration med Azure IoT Edge og container instanser
- **Hybrid Cloud AI**: Multi-cloud og hybrid deployeringsmønstre for AI workloads

#### Avancerede Funktioner
- **AI Pipeline Automatisering**: MLOps integration med Azure Machine Learning pipelines
- **Avanceret Sikkerhed**: Zero-trust mønstre, private endpoints og avanceret trusselbeskyttelse
- **Performanceoptimering**: Avanceret tuning og skalering for AI applikationer med høj gennemstrømning
- **Global Distribution**: Content delivery og edge caching mønstre for AI applikationer

### Version 3.0.0 (Planlagt) - Overgået af Nuværende Udgave
#### Foreslåede Tilføjelser - Nu Implementeret i v3.0.0
- ✅ **AI-Fokuseret Indhold**: Omfattende Microsoft Foundry integration (Fuldført)
- ✅ **Interaktive Tutorials**: Hands-on AI workshop lab (Fuldført)
- ✅ **Avanceret Sikkerhedsmodul**: AI-specifikke sikkerhedsmønstre (Fuldført)
- ✅ **Performanceoptimering**: AI workload tuning strategier (Fuldført)

### Version 2.1.0 (Planlagt) - Delvist Implementeret i v3.0.0
#### Mindre Forbedringer - Nogle Fuldført i Nuværende Udgave
- ✅ **Yderligere Eksempler**: AI-fokuserede deployeringsscenarier (Fuldført)
- ✅ **Udvidet FAQ**: AI-specifikke spørgsmål og fejlfinding (Fuldført)
- **Værktøjsintegration**: Forbedrede IDE og editor integrationsvejledninger
- ✅ **Overvågningsudvidelse**: AI-specifikke overvågnings- og alarmmønstre (Fuldført)

#### Stadig Planlagt til Fremtidig Udgave
- **Mobilvenlig Dokumentation**: Responsivt design til mobil læring
- **Offline Adgang**: Downloadbare dokumentationspakker
- **Forbedret IDE Integration**: VS Code extension til AZD + AI workflows
- **Fællesskabsdashboard**: Real-time fællesskabsmålinger og bidragssporing

## Bidrag til Changelog

### Rapporter Ændringer
Når du bidrager til dette arkiv, skal du sikre at changelog poster indeholder:

1. **Versionsnummer**: Følger semantisk versionering (major.minor.patch)
2. **Dato**: Udgivelses- eller opdateringsdato i YYYY-MM-DD format
3. **Kategori**: Tilføjet, Ændret, Forældet, Fjernet, Rettet, Sikkerhed
4. **Klar Beskrivelse**: Kortfattet beskrivelse af hvad der er ændret
5. **Konsekvensvurdering**: Hvordan ændringer påvirker eksisterende brugere

### Ændringskategorier

#### Tilføjet
- Nye funktioner, dokumentationssektioner eller kapabiliteter
- Nye eksempler, skabeloner eller læringsressourcer
- Yderligere værktøjer, scripts eller hjælpeprogrammer

#### Ændret
- Ændringer i eksisterende funktionalitet eller dokumentation
- Opdateringer der forbedrer klarhed eller nøjagtighed
- Omstrukturering af indhold eller organisering

#### Forældet
- Funktioner eller tilgange der udfases
- Dokumentationssektioner planlagt til fjernelse
- Metoder der har bedre alternativer

#### Fjernet
- Funktioner, dokumentation eller eksempler der ikke længere er relevante
- Forældet information eller forældede tilgange
- Overflødigt eller sammenlagt indhold

#### Rettet
- Korrektioner af fejl i dokumentation eller kode
- Løsning af rapporterede problemer eller fejl
- Forbedringer af nøjagtighed eller funktionalitet

#### Sikkerhed
- Sikkerhedsrelaterede forbedringer eller rettelser
- Opdateringer til sikkerheds bedste praksis
- Løsning af sikkerheds sårbarheder

### Semantiske Versionsvejledninger

#### Major Version (X.0.0)
- Gennemgribende ændringer der kræver brugerhandling
- Betydelig omstrukturering af indhold eller organisering
- Ændringer der ændrer den fundamentale tilgang eller metode

#### Minor Version (X.Y.0)
- Nye funktioner eller indholdsudvidelser
- Forbedringer der opretholder bagudkompatibilitet
- Yderligere eksempler, værktøjer eller ressourcer

#### Patch Version (X.Y.Z)
- Fejlrettelser og korrektioner
- Mindre forbedringer af eksisterende indhold
- Klargørelser og små forbedringer

## Fællesskabsfeedback og Forslag

Vi opfordrer aktivt til fællesskabsfeedback for at forbedre denne læringsressource:

### Sådan Giver Du Feedback
- **GitHub Issues**: Rapportér problemer eller foreslå forbedringer (AI-specifikke issues er velkomne)
- **Discord Diskussioner**: Del idéer og deltag i Microsoft Foundry fællesskabet
- **Pull Requests**: Bidrag med direkte forbedringer til indhold, især AI skabeloner og vejledninger
- **Microsoft Foundry Discord**: Deltag i #Azure kanalen for AZD + AI diskussioner
- **Fællesskabsfora**: Deltag i bredere Azure udviklerdiskussioner

### Feedback Kategorier
- **AI Indholds Nøjagtighed**: Korrektioner til AI service integration og deployeringsinformation
- **Læringsoplevelse**: Forslag til forbedret AI udvikler læringsflow
- **Manglende AI Indhold**: Anmodninger om flere AI skabeloner, mønstre eller eksempler
- **Tilgængelighed**: Forbedringer til mangfoldige læringsbehov
- **AI Værktøjsintegration**: Forslag til bedre AI udviklingsworkflow integration
- **Produktions AI Mønstre**: Anmodninger om erhvervs AI deployeringsmønstre

### Responsforpligtelse
- **Issue Respons**: Inden for 48 timer for rapporterede problemer
- **Funktion Anmodninger**: Evaluering inden for en uge
- **Fællesskabsbidrag**: Gennemgang inden for en uge
- **Sikkerhedsproblemer**: Højeste prioritet med accelereret respons

## Vedligeholdelsesplan

### Regelmæssige Opdateringer
- **Månedlige Gennemgange**: Indholdsnøjagtighed og linkvalidering
- **Kvartalsvise Opdateringer**: Store indholdsudvidelser og forbedringer
- **Halvårlige Gennemgange**: Omfattende omstrukturering og forbedring
- **Årlige Udgivelser**: Store versionsopdateringer med betydelige forbedringer

### Overvågning og Kvalitetssikring
- **Automatiseret Testning**: Regelmæssig validering af kodeeksempler og links
- **Integration af Fællesskabsfeedback**: Regelmæssig indarbejdelse af brugernes forslag
- **Teknologiske Opdateringer**: Tilpasning til de nyeste Azure-tjenester og azd-udgivelser
- **Tilgængelighedsrevisioner**: Regelmæssig gennemgang for inkluderende designprincipper

## Versionsunderstøttelsespolitik

### Understøttelse af Nuværende Version
- **Seneste Store Version**: Fuldt understøttet med regelmæssige opdateringer
- **Forrige Store Version**: Sikkerhedsopdateringer og kritiske rettelser i 12 måneder
- **Ældre Versioner**: Kun fællesskabsunderstøttelse, ingen officielle opdateringer

### Migreringsvejledning
Når der udgives nye store versioner, leverer vi:
- **Migreringsvejledninger**: Trin-for-trin overgangsinstruktioner
- **Kompatibilitetsnoter**: Oplysninger om ændringer, der bryder kompatibilitet
- **Værktøjsunderstøttelse**: Scripts eller hjælpeprogrammer, der assisterer med migration
- **Fællesskabsunderstøttelse**: Dedikerede fora til migrationsspørgsmål

---

**Navigation**
- **Forrige Lektion**: [Studieguide](resources/study-guide.md)
- **Næste Lektion**: Gå tilbage til [Hoved README](README.md)

**Hold dig Opdateret**: Følg dette repository for notifikationer om nye udgivelser og vigtige opdateringer til læringsmaterialerne.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->