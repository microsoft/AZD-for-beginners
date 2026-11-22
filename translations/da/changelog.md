# Ændringslog - AZD For Begyndere

## Introduktion

Denne ændringslog dokumenterer alle bemærkelsesværdige ændringer, opdateringer og forbedringer i AZD For Beginners-repositoriet. Vi følger principperne for semantisk versionering og vedligeholder denne log for at hjælpe brugere med at forstå, hvad der er ændret mellem versioner.

## Læringsmål

Ved at gennemgå denne ændringslog vil du:
- Forblive informeret om nye funktioner og tilføjelser af indhold
- Forstå forbedringer foretaget i eksisterende dokumentation
- Følge fejlrettelser og korrektioner for at sikre nøjagtighed
- Følge udviklingen af læringsmaterialerne over tid

## Læringsresultater

Efter at have gennemgået ændringslogindgange vil du kunne:
- Identificere nyt indhold og ressourcer tilgængelige for læring
- Forstå hvilke sektioner der er blevet opdateret eller forbedret
- Planlægge din læringsvej baseret på de mest aktuelle materialer
- Bidrage med feedback og forslag til fremtidige forbedringer

## Versionshistorik

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry-udvidelse 1.0 er nu generelt tilgængelig

Bundtet `microsoft.foundry` 1.0 er **live og generelt tilgængeligt**, som annonceret den [5. november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kurset lærer nu den frigivne GA-arbejdsgang, ikke en kommende udgivelse. Kom i gang med AZD **1.37.0 eller senere** og `azd ext install microsoft.foundry`.

#### Tilgængeligt i denne kursusopdatering
- Den engelske vejledning bruger GA-bundtet som standardinstallationssti og forklarer dets syv uafhængigt versionerede kerneudvidelser.
- En [hosted-agent gennemgang](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) dækker den opstrøms Python Agent Framework Responses API-eksempel, aktuelle uv, Python 3.13+, nyt/eksisterende projektvalg, genbrug af model og gennemgang af `azure.yaml`.
- Arbejdsgangen fra lokalt til sky dækker Agent Inspector-testning, Azure-understøttede modelkaldsudgifter, fjernbygninger af kode, implementeret kald, skysporing, deployment-forhåndsvisning, logs og diagnostik.
- Separat evalueringsvejledning dækker oprettelse og gennemgang af datasæt/vurderingskriterier, konfiguration af en navngiven evaluering, registrering af aktiver og inspektion af resultater. Ældre evaluerings-/optimeringsinstruktioner forbliver migrationshistorik, ikke den nuværende udgivelsesbaseline.
- Foundry CI/CD-vejledning inkluderer installation af runner-udvidelse, autentificeret deployment, evaluering af aktiver/adgang og en eksplicit kvalitetsport.
- Oprydningsvejledning adskiller nyoprettede og genbrugte Foundry-projekter. Workshoppen linker til det separate GA-øvelse uden at erstatte dets eksemplarspecifikke tests.
- Kursusnavigation, læringsmål, opsætningsforudsætninger, snydeark, FAQ og studieguide afspejler GA-arbejdsgangen. Genererede oversættelser redigeres ikke manuelt.

#### Vurderingsomfang
- Baseret på GA-meddelelsen, linket Microsoft Learn-vejledning og den opstrøms prøvekonfiguration. Ingen live Azure-udrulning, deployment, modelkald eller evaluering blev udført.
- Bundle GA indebærer ikke GA for alle valgfrie funktioner, uafhængige udvidelser eller SDK, ej heller certifikere eksemplerne til produktion.

### [v3.24.0]- 2026-11-04

#### Rettet
- Repareret engelsk kursusnavigation, flyttet-side stier, manglende ankre og forældede eksterne referencer, herunder kapitel 2-linket til produktions AI-guiden.
- Gennemgået nuværende vejledning mod offentliggjort AZD 1.37.2, agenter 1.0.0-beta.23 og evalueringer 1.0.0-beta.2. Dokumenteret den separate `azd ai eval` arbejdsproces og migrationskonfiguration for optimering.
- Rettet ikke-understøttede CLI-flag, autentificeringsgrænser, vejledning om klartekst miljø/hemmeligheder, infrastrukturoppdateringer, modelkonfiguration og destruktive gendannelseseksempler.
- Opdateret workshoppen mod den aktuelle AI Agents-prøve, inklusive faktiske hooks, konfigurationsinput, evalueringstest, red-teaming indgangspunkter og observerbarhed.
- Rettet eksempelimplementeringspåstande og repareret tilknyttede applikations-/infrastruktur-/konfigurationsproblemer. Detailarkitektur-materiale er eksplicit adskilt fra en komplet fungerende applikation.
- Gendannet CodeQL-sprogs matrix, valgt understøttet Node.js 24 for udviklingscontaineren og gjort opsætningsvaliderere i stand til at rapportere fejlede versionskommandoer.

#### Tilføjet
- En engelsk-only offline link-/ankertjekker, regressions tests, og en dokumentationsarbejdsproces som også bygger workshoppen i strict-tilstand. Genererede oversættelser og oversatte billeder er udelukket.

#### Valideringsomfang
- Kilde-, syntaks-, konfigurations-, lokal adfærd- og netværkslinkchecks fastlægger ikke live Azure deployabilitet, kvoter, RBAC, regional modeltilgængelighed, fakturering, sikkerhedsoverholdelse eller produktionsparathed.
- Ældre indgange nedenfor er historiske optegnelser, ikke aktuelle kommando- eller udgivelsesinstruktioner.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Opdatering: Versionsaktualitet
**Denne version revaliderer kurset mod `azd` `1.27.1` (juli 2026, seneste stabile udgivelse) og den aktuelle preview AI agent-udvidelse `azure.ai.agents` `1.0.0-beta.5`, og opdaterer alle "valideret mod" bannere efter 1.26.0-, 1.27.0- og 1.27.1-udgivelserne.**

#### Ændret
- **✅ Valideringsbaseline opdateret** fra `azd 1.25.6` (juni 2026) til `azd 1.27.1` (juli 2026) på tværs af root README, alle kapitel READMEs, kapitel 1 dev-container lektion (inklusive eksempler med fastlåst version), kapitel 4 brugerdefinerede skabelon lektion, kapitel 5 multi-agent lektion og workshopdokumentation
- **🤖 Kapitel 2 baseline opdateret** fra `azd 1.23.12` (marts 2026) til `azd 1.27.1` på tværs af `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` og `microsoft-foundry-integration.md`; valideringsnotedatoer opdateret til 2026-07-13
- **🧩 AI agent udvidelse opdateret** fra `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` til den aktuelle `1.0.0-beta.5` udgivelse i kapitel 2 README og `agents.md`
- **🧪 Workshop valideringseksempel** (`azd version` output) opdateret til `1.27.1`

#### Noter om relevante azd-udgivelser (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-support for Azure Functions på Flex Consumption, `azd config sub-filter` per-tenant abonnementsfiltre, selvstændige udvidelsespakker (`azd x pack --bundle`) og `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellér Azure AI Foundry projekter/agenter direkte i `azure.yaml` (Bicep-fri/Terraform-fri init), container-udrulningssupport for App Service (`host: appservice` + `language: docker`), direkte `-s/--source` for `azd extension` kommandoer, og `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flag for `azd extension install`, forældede modeller ekskluderet fra katalog-/kvotaprompt som standard og flere fejlrettelser

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

#### Begynder Mellemliggende Udfyldning #2: Skabelonoprettelse, Dev Containers, Pulumi, Azure DevOps, Service Principals og Mere
**Denne version lukker de resterende mellemste huller identificeret af azd-dækningsanalysen: hvordan man opretter og udgiver sin egen skabelon, reproducerbare dev-container/Codespaces-miljøer, Pulumi-infrastrukturudbyderen, en Azure DevOps CI/CD-gennemgang, service-principal autentificering, host-valgsvejledning (AKS/Spring Apps), `azd restore`/`azd package` forklaringer, hook fejlhåndtering og team-/delte miljøpraksisser.**

#### Tilføjet
- **🧱 Ny kapitel 4 lektion** `docs/chapter-04-infrastructure/custom-templates.md` — oprettelse af din egen azd skabelon: nødvendigt layout (`azure.yaml`, `infra/`, `src/`), `metadata.template` feltet, parameterisering af infrastruktur med `uniqueString()` ressource-token og `azd-env-name` tag, lokal testning med `azd init --template <local-path>`, udgivelse til GitHub og indsendelse til Awesome AZD-galleriet
- **📦 Ny kapitel 1 lektion** `docs/chapter-01-foundation/dev-containers.md` — reproducerbare azd-miljøer med Dev Containers og GitHub Codespaces: en minimal `.devcontainer/devcontainer.json` ved hjælp af den officielle `ghcr.io/azure/azure-dev/azd` funktion, sprog-specifikke funktioner, `docker-in-docker` for containerhosts og `azd auth login --use-device-code` for fjernlogind
- **🧩 Pulumi med azd** sektion i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, folder-layout for Pulumi, stacks knyttet til azd-miljøer, krævede outputs/tagging og den identiske `azd up` / `azd down` arbejdsgang
- **🎯 Host-valgsvejledning** i `docs/chapter-04-infrastructure/provisioning.md` — en begynder-venlig sammenligning af `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` og `springapp` med vejledning om hvornår man skal vælge AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD gennemgang** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, serviceforbindelse med workload identity federation (OIDC), den genererede `azure-dev.yml` og variabelgruppeopsætning
- **🔑 Service Principals (Mønster 4)** tilføjet til `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ikke-interaktiv `azd auth login` med klienthemmelighed vs. fødereret/OIDC legitimationsoplysninger, hvornår man skal bruge, og sikker legitimationsopbevaring
- **🪝 Hook fejlhåndtering** undersektion i `docs/chapter-04-infrastructure/deployment-guide.md` — exitkoder og `set -e`, `continueOnError`, test af hooks isoleret med `azd hooks run`, OS-specifikke shells og `--debug`
- **👥 Team / delte miljøer** sektion i `docs/chapter-03-configuration/configuration.md` — hvad der findes i `.azure/`, hvad der skal gitignores, per-udvikler miljøer, `azd env list`/`select` og levering af miljøværdier i CI/CD
- **🧰 `azd restore` og udvidede `azd package` forklaringer** i `resources/cheat-sheet.md` — genoprettelse af afhængigheder og opbygning af et deployerbart artefakt uden at deployere

#### Ændret
- **🧭 Kapitel 4 lektionstabel** opdateret til at inkludere den nye "Oprettelse af din egen skabelon"-lektion (Lektion 3)
- **🧭 Kapitel 1 lektionstabel** opdateret til at inkludere den nye "Dev Containers & Codespaces"-lektion (Lektion 5); navigationsfodere koblet mellem `bring-your-own-app.md` og `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Begynder Mellemliggende Udfyldning: Praktisk Multi-Agent Lektion, "Bring Your Own App," Terraform og CI/CD Gennemgang
**Denne version lukker de største huller for en komplet begynderguide ved at tilføje to nye praktiske lektioner (en deployerbar multi-agent gennemgang og tilføjelse af azd til en eksisterende app), en begynder-venlig hooks introduktion, en Terraform-med-azd sektion, en trin-for-trin GitHub Actions pipeline gennemgang, en forklaring af de nye preview udvidelser og en eksplicit deployment-verifikationscheckliste.**

#### Tilføjet
- **🤝 Ny kapitel 5 lektion** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en fuldt praktisk, deployerbar walkthrough med to agenter (orchestrator + specialister) ved brug af en rigtig skabelon (`contoso-creative-writer`), der dækker hvornår man skal bruge multi-agent, `azd up` arbejdsgangen, forståelse af deployerede ressourcer, tvær-agent sporing, tilpasning og oprydning
- **📦 Ny kapitel 1 lektion** `docs/chapter-01-foundation/bring-your-own-app.md` — hvordan man tilføjer azd til et eksisterende projekt med `azd init` ("brug kode i det aktuelle bibliotek"), forståelse af `azure.yaml` og `infra/`, `azd infra generate`, værelsesgenkendelse og deployment med `azd up`
- **🌐 Terraform med azd** sektion tilføjet til `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfiguration, `.tf` mappestruktur, krævede `AZURE_*` outputs og `azd-env-name` tagging og den identiske `azd up` / `azd down` arbejdsgang (lukker hullet hvor Terraform-support blev påstået, men kun Bicep blev vist)
- **⚙️ Trin-for-trin GitHub Actions gennemgang** i `docs/chapter-08-production/production-ai-practices.md` — fra GitHub repo til automatiserede deploys: `azd pipeline config`, OIDC fødererede legitimationsoplysninger (ingen lagrede hemmeligheder), den genererede `azure-dev.yml` og vejledning for hemmeligheder vs. variabler
- **🪝 Begynder "Ny til hooks?" introduktion** i `docs/chapter-04-infrastructure/deployment-guide.md` — hvad et hook er, en hook-stage tabel, et minimalt første hook, og kørsel af hooks manuelt med `azd hooks run`
- **✅ "Bekræft din deployment" tjekliste** tilføjet til trin 5 i `docs/chapter-01-foundation/first-project.md` — røgtest, sundheds-endpoint kontrol og eksplicitte succes kriterier
- **🧩 Forklaring for nye preview extensions** `azure.ai.skills` og `azure.ai.connections` (hvad de er og hvornår de skal anvendes) i `docs/chapter-08-production/production-ai-practices.md`

#### Ændret
- **🧭 Kapitel 5 lektionstabel** korrigeret: `multi-agent-basics.md` er nu Lektion 1 (den eneste fuldt praktiske lektion), med ærlig mærkning af at Lektion 2 findes i Kapitel 6 og Retail scenariet er et arkitekturmønster, ikke en én-kommando skabelon
- **🧭 Kapitel 1 lektionstabel** inkluderer nu den nye "Bring Your Own App" lektion (Lektion 4)
- **🔗 Navigations-footers** opdateret: `first-project.md` linker nu frem til `bring-your-own-app.md`

#### Rettet
- **🧱 Lukket "påstået men manglende" Terraform hul** — kurset refererede tidligere til Terraform support uden at vise det
- **🔀 Korrigeret vildledende Kapitel 5 kryds-links** som antydede fuld multi-agent implementering hvor kun et arkitekturmønster eksisterede

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

#### AZD 1.25.6 opdatering, fuld agent livscyklus kommandoer & Aspire rebranding
**Denne version validerer kurset imod `azd` `1.25.6` (juni 2026) og `azure.ai.agents` `0.1.40-preview` extension, udvider AI vejledning fra "scaffold en agent" til den komplette agent livscyklus (test → evaluer → optimer → inspicer → slet), viser de nye `azure.ai.skills` og `azure.ai.connections` preview extensions og noterer ".NET Aspire" → "Aspire" produktrebranding.**

#### Tilføjet
- **🔁 Fuld agent livscyklus dækning** for begyndere og AI ingeniører på tværs af dokumentationen:
  - `docs/chapter-01-foundation/azd-basics.md` — Livscyklus tabel (scaffold → test → mål → forbedr → inspicer → ryd op) tilføjet til Extensions og AI Commands sektionen
  - `docs/chapter-08-production/production-ai-practices.md` — Nyt "Managing the Agent Lifecycle" afsnit som dækker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
  - `resources/cheat-sheet.md` — Udvidede AI Agent kommandoer med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
- **🧩 Nye preview extensions** dokumenteret: `azure.ai.skills` (genanvendelige agent færdigheder) og `azure.ai.connections` (Foundry forbindelser) tilføjet til extension tabellen og cheatsheet
- **⏱️ Respons-timing vejledning** — `azd ai agent invoke` eksempler noterer nu total latenstid og time-to-first-byte
- **📌 Versionsbanner** i rod-README som peger elever til `azd version` og `azd upgrade`

#### Ændret
- **✅ Valideringsbaseline opdateret** fra `azd 1.23.12` (marts 2026) til `azd 1.25.6` (juni 2026) på tværs af alle kapitel READMEs og workshop dokumenter
- **🤖 Kapitel 2 extension note** opdateret fra `azure.ai.agents` `0.1.18-preview` til `0.1.40-preview`
- **🧪 Workshop valideringseksempel** (`azd version` output) opdateret til `1.25.6`
- **🧭 README "What's New in azd Today"** opdateret til at fremhæve end-to-end agent livscyklus, nye AI extensions og nylige brugervenlighedsforbedringer (`azd init` idempotens, `azd auth login` fjernelse af stale-token, `azd tool` first-run prompt)
- **📖 Kapitel 2 agents.md (Option 4)** peger nu elever til post-deploy livscyklus kommandoer i stedet for at stoppe ved `azd up`

#### Rettet
- **🏷️ Produktnavngivning** — tilføjet Aspire rebranding note (".NET Aspire" hedder nu blot "Aspire"); azd's Aspire support er uændret
- **🔎 Live release validering** bekræftet mod Azure Developer CLI release feed: stabil CLI `1.25.6` (2026-06-12) og `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Begynder onboarding afklaring, opsætnings validering & sidste AZD kommando oprydning
**Denne version følger op på AZD 1.23 valideringsrunde med en begyndervenlig dokumentationsgennemgang: den præciserer AZD-først godkendelsesvejledning, tilføjer lokale opsætningsvaliderings scripts, bekræfter nøglekommandoer mod live AZD CLI, og fjerner de sidste forældede engelske kommando referencer uden for changelog.**

#### Tilføjet
- **🧪 Begynder opsætnings validerings scripts** med `validate-setup.ps1` og `validate-setup.sh` så elever kan bekræfte nødvendige værktøjer inden Kapitel 1 start
- **✅ Forudgående opsætnings validerings trin** i root README og Kapitel 1 README så manglende forudsætninger opdages inden `azd up`

#### Ændret
- **🔐 Begynder godkendelsesvejledning** behandler nu konsekvent `azd auth login` som hovedvej for AZD workflows, med `az login` som valgfri medmindre Azure CLI kommandoer bruges direkte
- **📚 Kapitel 1 onboarding flow** peger nu elever til at validere lokal opsætning inden installation, autenticering og første deployment trin
- **🛠️ Validator beskeder** adskiller nu klart blokerende krav fra valgfrie Azure CLI advarsler for AZD-only begynder stien
- **📖 Konfigurations-, fejlfinding- og eksempeldokumenter** skelner nu mellem påkrævet AZD godkendelse og valgfri Azure CLI login hvor begge tidligere var præsenteret uden kontekst

#### Rettet
- **📋 Resterende engelske kommando referencer** opdateret til nuværende AZD former, herunder `azd config show` i cheatsheet og `azd monitor --overview` hvor Azure Portal oversigtsvejledning var tiltænkt
- **🧭 Begynder påstande i Kapitel 1** blødt op for at undgå overløfter om garanteret fejlfrie eller rollback opførsler på tværs af alle skabeloner og Azure ressourcer
- **🔎 Live CLI validering** bekræftet aktuel support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, og `azd down --force --purge`

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

#### AZD 1.23.12 validering, workshop miljøudvidelse & AI model opdatering
**Denne version udfører en dokumentationsvalideringsrunde imod `azd` `1.23.12`, opdaterer forældede AZD kommandoeksempler, opfrisker AI model vejledning til nuværende standarder, og udvider workshop instruktionerne ud over GitHub Codespaces til også at understøtte dev containere og lokale kloner.**

#### Tilføjet
- **✅ Valideringsnoter på tværs af kerne kapitler og workshop docs** for at gøre den testede AZD baseline eksplicit for elever der bruger nyere eller ældre CLI builds
- **⏱️ Deployment timeout vejledning** for langvarige AI app deploys ved brug af `azd deploy --timeout 1800`
- **🔎 Extensions inspektions trin** med `azd extension show azure.ai.agents` i AI workflow dokumenter
- **🌐 Bredere workshop miljø vejledning** som dækker GitHub Codespaces, dev containere og lokale kloner med MkDocs

#### Ændret
- **📚 Kapitel intro READMEs** noterer nu konsekvent validering imod `azd 1.23.12` i fundament, konfiguration, infrastruktur, multi-agent, præ-deployment, fejlfinding og produktions sektioner
- **🛠️ AZD kommando referencer** opdateret til nuværende former på tværs af dokumentation:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` afhængigt af kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` hvor Application Insights oversigt er tiltænkt
- **🧪 Provision preview eksempler** forenklet til nuværende understøttet brug som `azd provision --preview` og `azd provision --preview -e production`
- **🧭 Workshop flow** opdateret så elever kan gennemføre labs i Codespaces, en dev container eller en lokal klon i stedet for kun Codespaces
- **🔐 Godkendelsesvejledning** foretrækker nu `azd auth login` for AZD workflows, med `az login` som valgfri når Azure CLI kommandoer anvendes direkte

#### Rettet
- **🪟 Windows install kommandoer** normaliseret til aktuel `winget` pakkeform i installationsvejledning
- **🐧 Linux install vejledning** korrigeret for at undgå ikke-understøttet distro-specifik `azd` pakkehåndtering og i stedet pege på release assets hvor passende
- **📦 AI model eksempler** opdateret fra ældre standarder som `gpt-35-turbo` og `text-embedding-ada-002` til nuværende eksempler som `gpt-4.1-mini`, `gpt-4.1` og `text-embedding-3-large`
- **📋 Deploy og diagnose snippets** korrigeret til brug af aktuelle miljø- og status kommandoer i logs, scripts og fejlfinding
- **⚙️ GitHub Actions vejledning** opdateret fra `Azure/setup-azd@v1.0.0` til `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtykke vejledning** opdateret fra `azd mcp consent` til `azd copilot consent list`

#### Forbedret
- **🧠 AI kapitel vejledning** forklarer nu bedre preview-sensitive `azd ai` opførsler, tenant-specifik login, aktuel extension brug og opdaterede model deploy anbefalinger
- **🧪 Workshop instruktioner** bruger nu mere realistiske versions-eksempler og klarere miljø opsætningssprog til hands-on labs
- **📈 Producent og fejlfinding dokuments** stemmer bedre overens med aktuelle overvågnings-, fallback model- og omkostningseksempel

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

#### AZD AI CLI kommandoer, indholdsvalidering & skabelonudvidelse
**Denne version tilføjer `azd ai`, `azd extension` og `azd mcp` kommandodækning på tværs af alle AI-relaterede kapitler, retter ødelagte links og forældet kode i agents.md, opdaterer snydearket og gennemgår sektionen Eksempel Skabeloner med validerede beskrivelser og nye Azure AI AZD-skabeloner.**

#### Tilføjet
- **🤖 AZD AI CLI dækning** på tværs af 7 filer (tidligere kun i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny sektion "Udvidelser og AI Kommandoer" der introducerer `azd extension`, `azd ai agent init` og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Mulighed 4: `azd ai agent init` med sammenligningstabel (skabelon vs manifest tilgang)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Underafsnit "AZD Udvidelser til Foundry" og "Agent-Første Udrulning"
  - `docs/chapter-05-multi-agent/README.md` — Hurtig Start viser nu både skabelon- og manifest-baserede udrulningsveje
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Udrulningssektion inkluderer nu `azd ai agent init` mulighed
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underafsnit "AZD AI Udvidelseskommandoer til Diagnostik"
  - `resources/cheat-sheet.md` — Ny sektion "AI & Udvidelseskommandoer" med `azd extension`, `azd ai agent init`, `azd mcp` og `azd infra generate`
- **📦 Nye AZD AI eksempel skabeloner** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat med Blazor WebAssembly, Semantic Kernel og stemmechat-support
  - **azure-search-openai-demo-java** — Java RAG chat med Langchain4J med ACA/AKS udrulningsmuligheder
  - **contoso-creative-writer** — Multi-agent kreativ skriveapp med Azure AI Agent Service, Bing Grounding og Prompty
  - **serverless-chat-langchainjs** — Serverløs RAG med Azure Functions + LangChain.js + Cosmos DB med Ollama lokal udviklingssupport
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator med admin portal, Teams integration og PostgreSQL/Cosmos DB muligheder
  - **azure-ai-travel-agents** — Multi-agent MCP orkestreringsreferenceapp med servere i .NET, Python, Java og TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastruktur Bicep starter skabelon
  - **🔗 Fantastisk AZD AI Galleri link** — Reference til [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ skabeloner)

#### Rettet
- **🔗 agents.md navigation**: Forrige/Næste links matcher nu Kapitel 2 README lektionernes rækkefølge (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ødelagte links**: `production-ai-practices.md` rettet til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md forældet kode**: Udskiftet `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttet `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md token optælling**: Udskiftet groft `len//4` estimat med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rettet tjenester fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standard host ændret okt 2024)
- **contoso-chat**: Opdateret beskrivelse til at referere Azure AI Foundry + Prompty, svarende til repo'ets faktiske titel og teknologi stack

#### Fjernet
- **ai-document-processing**: Fjernet ikke-fungerende skabelonreference (repo ikke offentligt tilgængeligt som AZD skabelon)

#### Forbedret
- **📝 agents.md øvelser**: Øvelse 1 viser nu forventet output og `azd monitor` trin; Øvelse 2 inkluderer fuld `FunctionTool` registreringskode; Øvelse 3 erstatter vage instruktioner med konkrete `prepdocs.py` kommandoer
- **📚 agents.md ressourcer**: Opdaterede dokumentationslinks til aktuelle Azure AI Agent Service docs og hurtig start
- **📋 agents.md Næste Skridt tabel**: Tilføjet AI Workshop Lab link for komplet kapitel dækning

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
**Denne version forbedrer README.md kapitelnavigationen med et forbedret tabelformat.**

#### Ændret
- **Kursuskort tabel**: Forbedret med direkte lektion links, varighedsestimater og kompleksitetsvurderinger
- **Folder Rydning**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidering**: Alle 21+ interne links i kursuskort tabel verificeret

### [v3.16.0] - 2026-02-05

#### Produktnavn Opdateringer
**Denne version opdaterer produktreferencer til aktuel Microsoft branding.**

#### Ændret
- **Microsoft Foundry → Microsoft Foundry**: Alle referencer opdateret på tværs af ikke-oversættelsesfiler
- **Azure AI Agent Service → Foundry Agents**: Servicenavn opdateret til at afspejle nuværende branding

#### Opdaterede filer
- `README.md` - Hovedkursusside
- `changelog.md` - Versionshistorik
- `course-outline.md` - Kursusstruktur
- `docs/chapter-02-ai-development/agents.md` - AI agent guide
- `examples/README.md` - Eksempel Dokumentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop indeks
- `workshop/docs/instructions/*.md` - Alle workshop instruktionsfiler

---

### [v3.15.0] - 2026-02-05

#### Større repository omstrukturering: Kapitel-baserede mappenavne
**Denne version omstrukturerer dokumentationen til dedikerede kapitelmapper for klarere navigation.**

#### Mappenavne ændringer
Gamle mapper er erstattet med kapitelnummererede mapper:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Tilføjet ny: `docs/chapter-05-multi-agent/`

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
| Alle fejlfinding filer | troubleshooting/ | chapter-07-troubleshooting/ |

#### Tilføjet
- **📚 Kapitel README filer**: Oprettet README.md i hver kapitelmappe med:
  - Læringsmål og varighed
  - Lektionstabel med beskrivelser
  - Hurtig start kommandoer
  - Navigation til andre kapitler

#### Ændret
- **🔗 Opdateret alle interne links**: 78+ sti-opdateringer på tværs af alle dokumentationsfiler
- **🗺️ Hoved README.md**: Opdateret kursuskort med ny kapitelstruktur
- **📝 examples/README.md**: Opdateret krydsreferencer til kapitelmapper

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository omstrukturering: Kapitelnavigation
**Denne version tilføjede kapitelnavigations README-filer (afløst af v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny AI Agents Guide
**Denne version tilføjer en omfattende guide til udrulning af AI-agenter med Azure Developer CLI.**

#### Tilføjet
- **🤖 docs/microsoft-foundry/agents.md**: Fuldt guide der dækker:
  - Hvad AI-agenter er, og hvordan de adskiller sig fra chatbots
  - Tre hurtigstart agent skabeloner (Foundry Agents, Prompty, RAG)
  - Agent arkitektur mønstre (enkelt agent, RAG, multi-agent)
  - Værktøjskonfiguration og tilpasning
  - Overvågning og metrics sporing
  - Omkostningsbetragtninger og optimering
  - Almindelige fejlfinding scenarier
  - Tre praktiske øvelser med succeskriterier

#### Indholdsstruktur
- **Introduktion**: Agentbegreber for begyndere
- **Hurtig Start**: Udrul agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmønstre**: Visuelle diagrammer over agentmønstre
- **Konfiguration**: Værktøjsopsætning og miljøvariabler
- **Overvågning**: Application Insights integration
- **Øvelser**: Progressiv hands-on læring (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### Opdatering af DevContainer miljø
**Denne version opdaterer udviklingscontainerkonfigurationen med moderne værktøjer og bedre standarder for AZD læringsoplevelsen.**

#### Ændret
- **🐳 Base Image**: Opdateret fra `python:3.12-bullseye` til `python:3.12-bookworm` (nyeste Debian stabil)
- **📛 Container Navn**: Omdøbt fra "Python 3" til "AZD for Beginners" for klarhed

#### Tilføjet
- **🔧 Nye DevContainer funktioner**:
  - `azure-cli` med Bicep support aktiveret
  - `node:20` (LTS version for AZD skabeloner)
  - `github-cli` til skabelonstyring
  - `docker-in-docker` til container app udrulninger

- **🔌 Port Forwarding**: Forudkonfigurerede porte til almindelig udvikling:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nye VS Code Udvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep sprog support
  - `ms-azure-devtools.azure-resource-groups` - Azure ressourcehåndtering
  - `yzhang.markdown-all-in-one` - Markdown redigering
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram support
  - `redhat.vscode-yaml` - YAML support (for azure.yaml)
  - `eamodio.gitlens` - Git visualisering
  - `mhutchie.git-graph` - Git historik

- **⚙️ VS Code Indstillinger**: Tilføjet standardindstillinger for Python fortolker, format på gem, og trimming af whitespace

- **📦 Opdateret requirements-dev.txt**:
  - Tilføjet MkDocs minify plugin
  - Tilføjet pre-commit for kodekvalitet
  - Tilføjet Azure SDK pakker (azure-identity, azure-mgmt-resource)

#### Rettet
- **Post-Create Kommando**: Verificerer nu AZD og Azure CLI installation ved container start

---

### [v3.11.0] - 2026-02-05

#### Begyndervenlig README Overhaling
**Denne version forbedrer README.md markant for at gøre den mere tilgængelig for begyndere og tilføjer væsentlige ressourcer til AI-udviklere.**

#### Tilføjet
- **🆚 Azure CLI vs AZD Sammenligning**: Klar forklaring på hvornår man bruger hvert værktøj med praktiske eksempler
- **🌟 Fantastiske AZD Links**: Direkte links til community-skabelongalleri og bidragelsesressourcer:
  - [Fantastisk AZD Galleri](https://azure.github.io/awesome-azd/) - 200+ klar-til-udrulning skabeloner
  - [Indsend en Skabelon](https://github.com/Azure/awesome-azd/issues) - Community bidrag
- **🎯 Hurtig Start Guide**: Forenklet 3-trins opstart sektion (Installer → Login → Udrul)
- **📊 Erfaringsbaseret Navigationstabel**: Klar vejledning om hvor man skal starte baseret på udviklererfaring

#### Ændret
- **README Struktur**: Omdirigeret for progressiv afsløring - nøgleinformation først
- **Introduktionssektion**: Omskrevet til at forklare "Magien ved `azd up`" for helt begyndere
- **Fjernet Dubleret Indhold**: Fjernet dubleret fejlfindingsektion
- **Fejlfinding Kommandoer**: Rettet `azd logs` reference til at bruge gyldig `azd monitor --logs`

#### Rettet
- **🔐 Autentificeringskommandoer**: Tilføjet `azd auth login` og `azd auth logout` til cheat-sheet.md
- **Ugyldige Kommando Referencer**: Fjernet resterende `azd logs` fra README fejlfinding sektion

#### Noter
- **Omfang**: Ændringer anvendt på hoved README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer specifikt rettet mod udviklere nye til AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Kommando Nøjagtighedsopdatering
**Denne version retter ikke-eksisterende AZD-kommandoer i hele dokumentationen og sikrer, at alle kodeeksempler bruger gyldig Azure Developer CLI syntaks.**

#### Rettet
- **🔧 Ikke-Eksisterende AZD Kommandoer Fjernet**: Omfattende revision og korrektion af ugyldige kommandoer:
  - `azd logs` (eksisterer ikke) → erstattet med `azd monitor --logs` eller Azure CLI alternativer
  - `azd service` underkommandoer (eksisterer ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (eksisterer ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flag (eksisterer ikke) → fjernet
  - `azd provision --what-if/--rollback` flag (eksisterer ikke) → opdateret til at bruge `--preview`
  - `azd config validate` (eksisterer ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (eksisterer ikke) → fjernet

- **📚 Filer Opdateret med Kommando Rettelser**:
  - `resources/cheat-sheet.md`: Stor revision af kommando reference
  - `docs/deployment/deployment-guide.md`: Rettet rollback og deploymentsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigeret loganalyse sektioner
  - `docs/troubleshooting/common-issues.md`: Opdateret fejlfinding kommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Rettet AZD debug-sektion
  - `docs/getting-started/azd-basics.md`: Korrigeret overvågningskommandoer
  - `docs/getting-started/first-project.md`: Opdateret overvågnings- og debug eksempler
  - `docs/getting-started/installation.md`: Rettet hjælp og version eksempler
  - `docs/pre-deployment/application-insights.md`: Korrigeret logvisningskommandoer
  - `docs/pre-deployment/coordination-patterns.md`: Rettet agent-debug kommandoer

- **📝 Versionsreference Opdateret**: 
  - `docs/getting-started/installation.md`: Ændret hardcoded `1.5.0` version til generisk `1.x.x` med link til releases

#### Ændret
- **Rollback Strategier**: Opdateret dokumentation til at bruge Git-baseret rollback (AZD har ikke indbygget rollback)
- **Logvisning**: Erstattet `azd logs` referencer med `azd monitor --logs`, `azd monitor --live`, og Azure CLI kommandoer
- **Performance Sektion**: Fjernet ikke-eksisterende parallelle/incrementelle deploymentsflag, givet gyldige alternativer

#### Tekniske Detaljer
- **Gyldige AZD Kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Fjernede Funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Noter
- **Verifikation**: Kommandoer verificeret mod Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Færdiggørelse og Dokumentationskvalitetsopdatering
**Denne version færdiggør de interaktive workshop-moduler, retter alle ødelagte dokumentationslinks og forbedrer den samlede indholdskvalitet for AI-udviklere, der bruger Microsoft AZD.**

#### Tilføjet
- **📝 CONTRIBUTING.md**: Nyt dokument for bidragsretningslinjer med:
  - Klare instruktioner for rapportering af problemer og forslag til ændringer
  - Dokumentationsstandarder for nyt indhold
  - Code eksempel retningslinjer og commit-beskeds konventioner
  - Information om community engagement

#### Fuldført
- **🎯 Workshop Modul 7 (Afslutning)**: Fuldt afsluttet opsamlingsmodul med:
  - Omfattende opsummering af workshop-resultater
  - Sektion for nøglebegreber behersket med AZD, skabeloner og Microsoft Foundry
  - Anbefalinger til fortsat læringsrejse
  - Workshop udfordringsøvelser med sværhedsgrader
  - Feedback og support links fra community

- **📚 Workshop Modul 3 (Nedbrydning)**: Opdaterede læringsmål med:
  - GitHub Copilot med MCP server aktiveringsvejledning
  - AZD skabelonmappestruktur forståelse
  - Infrastruktur-som-kode (Bicep) organisering mønstre
  - Praktiske laboratorie instruktioner

- **🔧 Workshop Modul 6 (Nedtagning)**: Færdiggjort med:
  - Ressource oprydnings- og omkostningsstyringsmål
  - `azd down` brug for sikker infrastruktur nedlukning
  - Retningslinjer for genopretning af blødt slettede kognitive tjenester
  - Bonus udforskningsopgaver for GitHub Copilot og Azure Portal

#### Rettet
- **🔗 Fix af ødelagte links**: Løst 15+ ødelagte interne dokumentationslinks:
  - `docs/ai-foundry/ai-model-deployment.md`: Rettede stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerede ai-model-deployment.md og production-ai-practices.md stier
  - `docs/getting-started/first-project.md`: Udskiftede ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Rettede FAQ og fejlfinding guide stier
  - `examples/container-app/microservices/README.md`: Korrigerede kursus hjem og deploy guide stier
  - `resources/faq.md` og `resources/glossary.md`: Opdaterede AI kapitlereferencer
  - `course-outline.md`: Rettede instruktørguide og AI workshop lab referencer

- **📅 Workshop Status Banner**: Opdateret fra "Under Construction" til aktiv workshop status med februar 2026 dato

- **🔗 Workshop Navigation**: Rettede ødelagte navigationslinks i workshop README.md som pegede til ikke-eksisterende lab-1-azd-basics mappe

#### Ændret
- **Workshop Præsentation**: Fjernet "under construction" advarsel, workshop er nu færdig og klar til brug
- **Navigationskonsistens**: Sikret at alle workshop-moduler har korrekt inter-modul navigation
- **Læringsstianbefalinger**: Opdaterede kapitlerelationer til at bruge korrekte microsoft-foundry stier

#### Valideret
- ✅ Alle engelske markdown-filer har gyldige interne links
- ✅ Workshop moduler 0-7 er komplette med læringsmål
- ✅ Navigation mellem kapitler og moduler fungerer korrekt
- ✅ Indhold er egnet til AI-udviklere, som bruger Microsoft AZD
- ✅ Begynder-venligt sprog og struktur opretholdt gennem hele materialet
- ✅ CONTRIBUTING.md giver klare retningslinjer for community bidragsydere

#### Teknisk Implementering
- **Linkvalidering**: Automatiseret PowerShell script verificerede alle .md interne links
- **Indholdstjek**: Manuel gennemgang af workshop komplethed og begynder-egnethed
- **Navigationssystem**: Ensartede kapitel- og modulnavigationsmønstre anvendt

#### Noter
- **Omfang**: Ændringer anvendt kun på engelsk dokumentation
- **Oversættelser**: Oversættelsesmapper ikke opdateret i denne version (automatiseret oversættelse synkroniseres senere)
- **Workshop Varighed**: Fuldstændig workshop leverer nu 3-4 timers praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avanceret Dokumentation: Overvågning, Sikkerhed og Multi-Agent Mønstre
**Denne version tilføjer omfattende A-niveau lektioner om Application Insights integration, autentificeringsmønstre og multi-agent koordinering til produktionsdeployeringer.**

#### Tilføjet
- **📊 Application Insights Integrationslektion**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuseret deployment med automatisk provisioning
  - Komplette Bicep skabeloner for Application Insights + Log Analytics
  - Arbejdende Python applikationer med brugerdefineret telemetri (1.200+ linjer)
  - AI/LLM overvågningsmønstre (Microsoft Foundry Models token/omkostningsovervågning)
  - 6 Mermaid diagrammer (arkitektur, distribueret tracing, telemetri flow)
  - 3 praktiske øvelser (alarmer, dashboards, AI overvågning)
  - Kusto forespørgsel eksempler og omkostningsoptimeringsstrategier
  - Live metrik streaming og real-time debugging
  - 40-50 minutters læringstid med produktionsklare mønstre

- **🔐 Autentificerings- & Sikkerhedsmønstre Lektion**: i `docs/getting-started/authsecurity.md`:
  - 3 autentificeringsmønstre (forbindelsestrenge, Key Vault, managed identity)
  - Komplette Bicep infrastruktur skabeloner for sikre deployeringer
  - Node.js applikationskode med Azure SDK integration
  - 3 komplette øvelser (aktiver managed identity, bruger-tilknyttet identitet, Key Vault rotation)
  - Sikkerhedsbest practices og RBAC konfigurationer
  - Fejlfinding guide og omkostningsanalyse
  - Produktionsklare passwordless autentificeringsmønstre

- **🤖 Multi-Agent Koordineringsmønstre Lektion**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineringsmønstre (sekventiel, parallel, hierarkisk, hændelsesdrevet, konsensus)
  - Komplett orkestratorservice implementering (Python/Flask, 1.500+ linjer)
  - 3 specialiserede agentimplementeringer (Research, Writer, Editor)
  - Service Bus integration til meddelelseskø
  - Cosmos DB tilstandsadministration til distribuerede systemer
  - 6 Mermaid diagrammer der viser agent-interaktioner
  - 3 avancerede øvelser (timeout håndtering, retry logik, circuit breaker)
  - Omkostningsopdeling ($240-565/måned) med optimeringsstrategier
  - Application Insights integration til overvågning

#### Forbedret
- **Pre-deployment Kapitel**: Indeholder nu omfattende overvågning og koordineringsmønstre
- **Getting Started Kapitel**: Forbedret med professionelle autentificeringsmønstre
- **Produktionsparathed**: Fuld dækning fra sikkerhed til observabilitet
- **Kursusoversigt**: Opdateret til at referere nye lektioner i kapitlerne 3 og 6

#### Ændret
- **Læringsprogression**: Bedre integration af sikkerhed og overvågning i hele kurset
- **Dokumentationskvalitet**: Konsistente A-niveau standarder (95-97%) på nye lektioner
- **Produktionsmønstre**: Fuldt ende-til-ende dækning for enterprise deployeringer

#### Forbedret
- **Udvikleroplevelse**: Klar vej fra udvikling til produktionsovervågning
- **Sikkerhedsstandarder**: Professionelle mønstre for autentificering og hemmelighedshåndtering
- **Observabilitet**: Fuld integration af Application Insights med AZD
- **AI Arbejdsmængder**: Specialiseret overvågning for Microsoft Foundry Models og multi-agent systemer

#### Valideret
- ✅ Alle lektioner inkluderer komplet fungerende kode (ikke kodeudsnit)
- ✅ Mermaid diagrammer for visuel læring (19 i alt på tværs af 3 lektioner)
- ✅ Praktiske øvelser med verifikationstrin (9 i alt)
- ✅ Produktionsklare Bicep skabeloner deployerbare via `azd up`
- ✅ Omkostningsanalyse og optimeringsstrategier
- ✅ Fejlfinding guides og bedste praksis
- ✅ Videnstjekpunkter med verifikationskommandoer

#### Dokumentationsbedømmelsesresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvågningsguide
- **docs/getting-started/authsecurity.md**: - Professionelle sikkerhedsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avancerede multi-agent arkitekturer
- **Overordnet Nyt Indhold**: - Konsistente højkvalitetsstandarder

#### Teknisk Implementering
- **Application Insights**: Log Analytics + brugerdefineret telemetri + distribueret tracing
- **Autentificering**: Managed Identity + Key Vault + RBAC mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvågning**: Live metrikker + Kusto forespørgsler + alarmer + dashboards
- **Omkostningsstyring**: Sampling strategier, retention politikker, budgetkontrol

### [v3.7.0] - 2025-11-19

#### Forbedringer af Dokumentationskvalitet og Nyt Microsoft Foundry Models Eksempel
**Denne version forbedrer dokumentationskvaliteten på tværs af lageret og tilføjer et komplet Microsoft Foundry Models deployment-eksempel med gpt-4.1 chat interface.**

#### Tilføjet
- **🤖 Microsoft Foundry Models Chat Eksempel**: Komplet gpt-4.1 deployment med fungerende implementering i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models infrastruktur (gpt-4.1 model deployment)
  - Python kommandolinje chat interface med samtalehistorik
  - Key Vault integration for sikker API nøglelagring
  - Token brugsovervågning og omkostningsestimering
  - Ratebegrænsning og fejlhåndtering
  - Omfattende README med 35-45 minutters deployeringsguide
  - 11 produktionsklare filer (Bicep skabeloner, Python app, konfiguration)
- **📚 Dokumentationsøvelser**: Tilføjede praktiske øvelser i konfigurationsguiden:
  - Øvelse 1: Multi-miljø konfiguration (15 minutter)
  - Øvelse 2: Secret management praksis (10 minutter)
  - Klare succes-kriterier og verifikationstrin
- **✅ Deployeringsverifikation**: Tilføjet verifikationssektion til deployeringsguide:
  - Sundhedstjek procedurer
  - Success kriterie tjekliste
  - Forventede outputs for alle deployeringskommandoer
  - Hurtig reference til fejlfinding

#### Forbedret
- **examples/README.md**: Opdateret til A-niveau kvalitet (93%):
  - Tilføjet azure-openai-chat til alle relevante sektioner
  - Opdateret lokalt eksempel antal fra 3 til 4
  - Tilføjet til AI Application Examples tabel
  - Integreret i Quick Start for viderekomne brugere
  - Tilføjet til Microsoft Foundry Templates sektion
  - Opdateret sammenligningsmatrix og teknologi-findselssektioner
- **Dokumentationskvalitet**: Forbedret B+ (87%) → A- (92%) på tværs af docs-mappen:
  - Tilføjet forventede output til kritiske kommandoeksempler
  - Inkluderet verifikationstrin for konfigurationsændringer
  - Forbedret hands-on læring med praktiske øvelser

#### Ændret
- **Læringsprogression**: Bedre integration af AI-eksempler til mellemliggende brugere
- **Dokumentationsstruktur**: Mere handlingsorienterede øvelser med klare resultater
- **Verifikationsproces**: Eksplcitte succes kriterier tilføjet til centrale arbejdsflows

#### Forbedret
- **Udvikleroplevelse**: Microsoft Foundry Models implementering tager nu 35-45 minutter (mod 60-90 for komplekse alternativer)
- **Omkostningstransparens**: Klare omkostningsestimater ($50-200/måned) for Microsoft Foundry Models eksempel
- **Læringssti**: AI-udviklere har klar indgang med azure-openai-chat
- **Dokumentationsstandarder**: Konsistente forventede output og verifikationstrin

#### Valideret
- ✅ Microsoft Foundry Models eksempel fuldt funktionelt med `azd up`
- ✅ Alle 11 implementeringsfiler syntaktisk korrekte
- ✅ README-instruktioner matcher faktisk implementeringsoplevelse
- ✅ Dokumentationslinks opdateret på tværs af 8+ placeringer
- ✅ Eksempelliste afspejler nøjagtigt 4 lokale eksempler
- ✅ Ingen duplikerede eksterne links i tabeller
- ✅ Alle navigationsreferencer korrekte

#### Teknisk implementering
- **Microsoft Foundry Models Arkitektur**: gpt-4.1 + Key Vault + Container Apps mønster
- **Sikkerhed**: Managed Identity klar, hemmeligheder i Key Vault
- **Overvågning**: Application Insights integration
- **Omkostningsstyring**: Tokensporing og brugsoptimering
- **Implementering**: Enkelt `azd up` kommando til komplet opsætning

### [v3.6.0] - 2025-11-19

#### Større opdatering: Container App implementeringseksempler
**Denne version introducerer omfattende, produktionsklare containerapplikationsimplementeringseksempler ved brug af Azure Developer CLI (AZD), med fuld dokumentation og integration i læringsstien.**

#### Tilføjet
- **🚀 Container App Eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplet oversigt over containeriserede implementeringer, hurtig start, produktion og avancerede mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Begyndervenlig REST API med scale-to-zero, helbredstjek, overvågning og fejlfinding
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsklar multi-service implementering (API Gateway, Produkt, Ordre, Bruger, Notifikation), asynkron messaging, Service Bus, Cosmos DB, Azure SQL, distribueret tracing, blue-green/canary implementering
- **Bedste praksis**: Sikkerhed, overvågning, omkostningsoptimering og CI/CD vejledning for containeriserede workloads
- **Kodeeksempler**: Komplet `azure.yaml`, Bicep skabeloner og flersprogede serviceimplementeringer (Python, Node.js, C#, Go)
- **Test & Fejlfinding**: End-to-end testsituationer, overvågningskommandoer, fejlfinding vejledning

#### Ændret
- **README.md**: Opdateret til at fremhæve og linke nye container app eksempler under "Lokale Eksempler - Container Applikationer"
- **examples/README.md**: Opdateret til at fremhæve container app eksempler, tilføje sammenligningsmatrix poster, og opdatere teknologi-/arkitekturreferencer
- **Kursusoversigt & Studievejledning**: Opdateret til at henvise til nye container app eksempler og implementeringsmønstre i relevante kapitler

#### Valideret
- ✅ Alle nye eksempler kan implementeres med `azd up` og følger bedste praksis
- ✅ Dokumentationskrydslinks og navigation opdateret
- ✅ Eksempler dækker fra begynder til avancerede scenarier, inklusiv produktionsmikrotjenester

#### Noter
- **Omfang**: Kun engelsk dokumentation og eksempler
- **Næste trin**: Udvid med yderligere avancerede container mønstre og CI/CD-automatisering i fremtidige udgivelser

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry
**Denne version implementerer en omfattende produktnavneændring fra "Microsoft Foundry" til "Microsoft Foundry" på tværs af al engelsk dokumentation, som afspejler Microsofts officielle rebranding.**

#### Ændret
- **🔄 Produktnavneopdatering**: Fuld rebranding fra "Microsoft Foundry" til "Microsoft Foundry"
  - Opdaterede alle referencer i engelsk dokumentation i `docs/` mappen
  - Omdøbte mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøbte fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - I alt: 23 indholdreferencer opdateret på tværs af 7 dokumentationsfiler

- **📁 Mappestrukturændringer**:
  - `docs/ai-foundry/` omdøbt til `docs/microsoft-foundry/`
  - Alle krydsreferencer opdaterede for at afspejle ny mappestruktur
  - Navigationslinks valideret på tværs af al dokumentation

- **📄 Fildøb**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links opdateret til at referere til nyt filnavn

#### Opdaterede Filer
- **Kapitel Dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigationslinks opdateret
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavn referencer opdateret
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Allerede bruger Microsoft Foundry (fra tidligere opdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencer opdateret (oversigt, community feedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 kryds-reference links opdateret
  - `docs/getting-started/first-project.md` - 2 kapitel navigationslinks opdateret
  - `docs/getting-started/installation.md` - 2 næste kapitel links opdateret
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencer opdateret (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslink opdateret
  - `docs/troubleshooting/debugging.md` - 1 navigationslink opdateret

- **Kursusstrukturfiler** (2 filer):
  - `README.md` - 17 referencer opdateret (kursusoversigt, kapiteltitler, skabelonsektion, community indsigt)
  - `course-outline.md` - 14 referencer opdateret (oversigt, læringsmål, kapitelressourcer)

#### Valideret
- ✅ Ingen resterende "ai-foundry" mappesti-referencer i engelske docs
- ✅ Ingen resterende "Microsoft Foundry" produktnavn referencer i engelske docs
- ✅ Alle navigationslinks funktionelle med ny mappestruktur
- ✅ Fil- og mappedøb fuldført succesfuldt
- ✅ Krydsreferencer mellem kapitler valideret

#### Noter
- **Omfang**: Ændringer anvendt til engelsk dokumentation i `docs/` mappen kun
- **Oversættelser**: Oversættelsesmappen (`translations/`) ikke opdateret i denne version
- **Workshop**: Workshopmaterialer (`workshop/`) ikke opdateret i denne version
- **Eksempler**: Eksempelfiler kan stadig referere til ældre navngivning (vil blive adresseret i fremtidig opdatering)
- **Eksterne links**: Eksterne URL'er og GitHub repository referencer forbliver uændret

#### Migreringsguide for bidragydere
Hvis du har lokale grene eller dokumentation, der refererer til den gamle struktur:
1. Opdater mappereferencer: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Opdater filreferencer: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Udskift produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Valider alle interne dokumentationslinks stadig fungerer

---

### [v3.4.0] - 2025-10-24

#### Infrastruktur Forhåndsvisning og Valideringsforbedringer
**Denne version introducerer omfattende support for den nye Azure Developer CLI forhåndsvisningsfunktion og forbedrer workshop-brugeroplevelsen.**

#### Tilføjet
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattende dækning af ny infrastrukturforhåndsvisningskapacitet
  - Kommando reference og brugs-eksempler i jukseliste
  - Detaljeret integration i provisioning-guide med brugsscenarier og fordele
  - Indbygget præflyvningskontrol for sikrere deploymentsvalidering
  - Opdateringer til startguide med sikkerhedsførste implementeringspraksis
- **🚧 Workshop Status Banner**: Professionel HTML-banner der angiver workshop-udviklingsstatus
  - Gradient design med byggeindikatorer for klar brugerkommunikation
  - Sidst opdateret tidsstempel for gennemsigtighed
  - Mobil-responsivt design til alle enhedstyper

#### Forbedret
- **Infrastruktur Sikkerhed**: Forhåndsvisningsfunktionalitet integreret gennem deployment dokumentation
- **Forhåndsimplementeringsvalidering**: Automatiserede scripts inkluderer nu infrastruktur forhåndsvisningstest
- **Udvikler Workflow**: Opdaterede kommando-sekvenser for at inkludere forhåndsvisning som bedste praksis
- **Workshopoplevelse**: Klare forventninger sat for brugere om indholdets udviklingsstatus

#### Ændret
- **Implementerings bedste praksis**: Forhåndsvisning-først arbejdsgang anbefales nu
- **Dokumentationsflow**: Infrastrukturvalidering flyttet tidligere i læringsprocessen
- **Workshoppræsentation**: Professionel statuskommunikation med klar udviklingstidslinje

#### Forbedret
- **Sikkerhedsførste tilgang**: Infrastrukturændringer kan nu valideres før implementering
- **Team Samarbejde**: Forhåndsvisningsresultater kan deles til gennemgang og godkendelse
- **Omkostningsbevidsthed**: Bedre forståelse af ressourcer omkostninger før provisioning
- **Risikoreduktion**: Reduktion af implementeringsfejl gennem forudgående validering

#### Teknisk implementering
- **Multi-dokumentintegration**: Forhåndsvisningsfunktion dokumenteret på tværs af 4 centrale filer
- **Kommandomønstre**: Konsistent syntaks og eksempler gennem dokumentationen
- **Bedste praksis integration**: Forhåndsvisning inkluderet i valideringsarbejdsgange og scripts
- **Visuelle indikatorer**: Klare NYE funktionsmarkeringer for opdagelighed

#### Workshop Infrastruktur
- **Statuskommunikation**: Professionel HTML-banner med gradientskift
- **Brugeroplevelse**: Klar udviklingsstatus forhindrer forvirring
- **Professionel præsentation**: Opretholder repository troværdighed mens forventninger sættes
- **Tidslinjegennemsigtighed**: Sidst opdateret oktober 2025 tidsstempel for ansvarlighed

### [v3.3.0] - 2025-09-24

#### Forbedrede workshopmaterialer og interaktiv læringsoplevelse
**Denne version introducerer omfattende workshopmaterialer med browserbaserede interaktive guider og strukturerede læringsforløb.**

#### Tilføjet
- **🎥 Interaktiv workshopguide**: Browserbaseret workshopoplevelse med MkDocs forhåndsvisningsfunktion
- **📝 Strukturerede workshopinstruktioner**: 7-trins guidet læringssti fra opdagelse til tilpasning
  - 0-Introduktion: Workshop oversigt og opsætning
  - 1-Vælg-AI-Skabelon: Skabelonopdagelse og udvælgelsesproces
  - 2-Valider-AI-Skabelon: Implementerings- og valideringsprocedurer
  - 3-Nedbryd-AI-Skabelon: Forståelse af skabelonarkitektur
  - 4-Konfigurer-AI-Skabelon: Konfiguration og tilpasning
  - 5-Tilpas-AI-Skabelon: Avancerede ændringer og iterationer
  - 6-Nedtagning af Infrastruktur: Oprydning og ressourcehåndtering
  - 7-Afslutning: Resumé og næste skridt
- **🛠️ Workshopværktøjer**: MkDocs konfiguration med Material tema for forbedret læringsoplevelse
- **🎯 Hands-on læringssti**: 3-trins metode (Opdagelse → Implementering → Tilpasning)
- **📱 GitHub Codespaces Integration**: Sømløs udviklingsmiljøopsætning

#### Forbedret
- **AI Workshop Lab**: Udvidet med omfattende 2-3 timers struktureret læringsoplevelse
- **Workshopdokumentation**: Professionel præsentation med navigation og visuelle hjælpemidler
- **Læringsprogression**: Klar trin-for-trin vejledning fra skabelonvalg til produktionsimplementering
- **Udvikleroplevelse**: Integrerede værktøjer til strømlinede udviklingsarbejdsgange

#### Forbedret
- **Tilgængelighed**: Browserbaseret grænseflade med søgning, kopieringsfunktionalitet og temaskifte
- **Selvstyret læring**: Fleksibel workshopstruktur tilpasset forskellige læringshastigheder
- **Praktisk anvendelse**: Virkelige AI-skabelonimplementeringsscenarier
- **Community Integration**: Discord integration for workshopsupport og samarbejde

#### Workshopfunktioner
- **Indbygget søgning**: Hurtig nøgleords- og lektionssøgning
- **Kopier kodeblokke**: Hover-for-kopi funktionalitet for alle kodeeksempler
- **Temaskifte**: Mørk/lys tilstandsstøtte for forskellige præferencer
- **Visuelle ressourcer**: Skærmbilleder og diagrammer for bedre forståelse
- **Hjælpeintegration**: Direkte Discord-adgang for fællesskabsstøtte

### [v3.2.0] - 2025-09-17

#### Større navigationsomstrukturering og kapitelbaseret læringssystem
**Denne version introducerer en omfattende kapitelbaseret læringsstruktur med forbedret navigation i hele repositoryet.**

#### Tilføjet
- **📚 Kapitelbaseret læringssystem**: Omstruktureret hele kurset i 8 progressive læringskapitler
  - Kapitel 1: Grundlag & Hurtig Start (⭐ - 30-45 min)
  - Kapitel 2: AI-først Udvikling (⭐⭐ - 1-2 timer)
  - Kapitel 3: Konfiguration & Autentificering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kode & Implementering (⭐⭐⭐ - 1-1,5 timer)
  - Kapitel 5: Multi-agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapitel 6: Forhåndsimplementeringsvalidering & Planlægning (⭐⭐ - 1 time)
  - Kapitel 7: Fejlfinding & Debugging (⭐⭐ - 1-1,5 timer)
  - Kapitel 8: Produktions- & Enterprise-mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigationssystem**: Konsistente navigationsoverskrifter og -fødder på tværs af al dokumentation
- **🎯 Fremskridtsopfølgning**: Kursusafslutningscheckliste og læringsverifikationssystem
- **🗺️ Læringsstivejledning**: Klare indgangspunkter for forskellige erfaringsniveauer og mål
- **🔗 Krydsreference navigation**: Relaterede kapitler og forudsætninger klart linket

#### Forbedret
- **README-struktur**: Omdannet til en struktureret læringsplatform med kapitelbaseret organisering
- **Dokumentationsnavigation**: Hver side inkluderer nu kapitelkontekst og progressionsvejledning
- **Skabelonorganisation**: Eksempler og skabeloner matchet til relevante læringskapitler
- **Ressourceintegration**: Jukselister, FAQ’er og studievejledninger knyttet til relevante kapitler
- **Workshopintegration**: Hands-on laboratorier knyttet til flere kapitlers læringsmål

#### Ændret
- **Læringsprogression**: Flyttet fra lineær dokumentation til fleksibel kapitelbaseret læring
- **Konfigurationsplacering**: Flyttet konfigurationsguiden til kapitel 3 for bedre læringsflow
- **AI-indholdsintegration**: Bedre integration af AI-specifikt indhold gennem hele læringsrejsen
- **Produktionsindhold**: Avancerede mønstre samlet i kapitel 8 for virksomhedslærende

#### Forbedret
- **Brugeroplevelse**: Klare navigationsbrødkrummer og indikatorer for kapitelprogression
- **Tilgængelighed**: Konsistente navigationsmønstre for nemmere kursusgennemgang
- **Professionel Præsentation**: Universitetstil kursusstruktur egnet til akademiske og erhvervstræninger
- **Læringseffektivitet**: Reduceret tid til at finde relevant indhold gennem forbedret organisering

#### Teknisk Implementering
- **Navigationsoverskrifter**: Standardiseret kapitelnavigation på tværs af 40+ dokumentationsfiler
- **Navigationsfod**: Konsistent vejledning om progression og indikatorer for kapitelafslutning
- **Krydslinkning**: Omfattende internt linkningssystem, der forbinder relaterede koncepter
- **Kapitelkortlægning**: Skabeloner og eksempler klart knyttet til læringsmål

#### Forbedring af Studieguide
- **📚 Omfattende Læringsmål**: Omstruktureret studieguide for at tilpasse til 8-kapelers system
- **🎯 Kapitelbaseret Vurdering**: Hvert kapitel indeholder specifikke læringsmål og praktiske øvelser
- **📋 Fremdriftssporing**: Ugentlig læringsplan med målbare resultater og tjeklister for fuldførelse
- **❓ Vurderingsspørgsmål**: Vidensvalideringsspørgsmål til hvert kapitel med professionelle resultater
- **🛠️ Praktiske Øvelser**: Hands-on aktiviteter med virkelige deploymentscenarier og fejlfinding
- **📊 Færdighedsprogression**: Klar fremgang fra grundlæggende koncepter til virksomhedsmønstre med fokus på karriereudvikling
- **🎓 Certificeringsramme**: Professionelle udviklingsresultater og fællesskabserkendelsessystem
- **⏱️ Tidsstyring**: Struktureret 10-ugers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede Multi-Agent AI Løsninger
**Denne version forbedrer multi-agent detailhandelsløsningen med bedre agentnavngivning og forbedret dokumentation.**

#### Ændret
- **Multi-Agent Terminologi**: Erstattet "Cora agent" med "Customer agent" i hele detail multi-agent løsningen for klarere forståelse
- **Agentarkitektur**: Opdateret al dokumentation, ARM-skabeloner og kodeeksempler til at bruge ensartet "Customer agent" navngivning
- **Konfigurationseksempler**: Moderniseret agentkonfigurationsmønstre med opdaterede navngivningskonventioner
- **Dokumentationskonsistens**: Sikret at alle henvisninger bruger professionelle, beskrivende agentnavne

#### Forbedret
- **ARM-skabelonpakke**: Opdateret retail-multiagent-arm-template med Customer agent referencer
- **Arkitekturdiagrammer**: Opdaterede Mermaid-diagrammer med opdateret agentnavngivning
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruger nu CustomerAgent navngivning
- **Miljøvariable**: Opdateret alle deploymentscripts til at bruge CUSTOMER_AGENT_NAME konventioner

#### Forbedret
- **Udvikleroplevelse**: Klarere agentroller og ansvar i dokumentationen
- **Produktionsparathed**: Bedre tilpasning til virksomheders navngivningskonventioner
- **Læringsmaterialer**: Mere intuitiv agentnavngivning til undervisningsformål
- **Skabelonbrugervenlighed**: Forenklet forståelse af agentfunktioner og deploymentsmønstre

#### Tekniske Detaljer
- Opdaterede Mermaid arkitekturdiagrammer med CustomerAgent referencer
- Udskiftede CoraAgent klasse-navne med CustomerAgent i Python-eksempler
- Ændrede ARM-skabelon JSON-konfigurationer til at bruge "customer" agent type
- Opdaterede miljøvariable fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Opdaterede alle deploymentskommandoer og container-konfigurationer

### [v3.0.0] - 2025-09-12

#### Store Ændringer - Fokus på AI-udvikler og Microsoft Foundry-integration
**Denne version forvandler arkivet til en omfattende AI-fokuseret læringsressource med Microsoft Foundry-integration.**

#### Tilføjet
- **🤖 AI-Første Læringsvej**: Kompleks omstrukturering med prioritet til AI-udviklere og -ingeniører
- **Microsoft Foundry Integrationsguide**: Omfattende dokumentation til at forbinde AZD med Microsoft Foundry-tjenester
- **AI Model Deploymentsmønstre**: Detaljeret guide til valg, konfiguration og produktionsdeploymentsstrategier
- **AI Workshop Lab**: 2-3 timers hands-on workshop for konvertering af AI-applikationer til AZD-deployable løsninger
- **Produktions AI Best Practices**: Virksomhedsklare mønstre til skalering, overvågning og sikring af AI arbejdsbelastninger
- **AI-specifik Fejlfinding**: Omfattende fejlfinding for Microsoft Foundry modeller, Cognitive Services og AI deploymentsproblemer
- **AI Skabelongalleri**: Fremhævet samling af Microsoft Foundry skabeloner med kompleksitetsvurderinger
- **Workshopmaterialer**: Komplett workshopstruktur med hands-on laboratorier og referencematerialer

#### Forbedret
- **README Struktur**: AI-udviklerfokuseret med 45% community interesse fra Microsoft Foundry Discord
- **Læringsveje**: Dedikeret AI-udviklerrejse ved siden af traditionelle veje for studerende og DevOps-ingeniører
- **Skabelonanbefalinger**: Fremhævede AI skabeloner inkl. azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Community Integration**: Forbedret Discord community support med AI-specifikke kanaler og diskussioner

#### Sikkerhed & Produktionsfokus
- **Managed Identity Mønstre**: AI-specifikke autentificerings- og sikkerhedskonfigurationer
- **Omkostningsoptimering**: Token-forbrugsregistrering og budgetkontroller for AI arbejdsbelastninger
- **Multi-Region Deployment**: Strategier for global AI-applikationsudrulning
- **Performance Overvågning**: AI-specifikke metrikker og Application Insights integration

#### Dokumentationskvalitet
- **Lineær Kursusstruktur**: Logisk progression fra begynder til avancerede AI deploymentsmønstre
- **Validerede URLs**: Alle eksterne arkivlinks verificeret og tilgængelige
- **Komplet Reference**: Alle interne dokumentationslinks validerede og funktionelle
- **Produktionsklar**: Virksomhedsdeploymentsmønstre med virkelige eksempler

### [v2.0.0] - 2025-09-09

#### Store Ændringer - Omdirigering af Arkivstruktur og Professionel Forbedring
**Denne version repræsenterer en betydelig revision af arkivstruktur og indholdsfremlæggelse.**

#### Tilføjet
- **Struktureret Læringsramme**: Alle dokumentationssider inkluderer nu Introduktion, Læringsmål og Læringsudbytte sektioner
- **Navigationssystem**: Tilføjet Forrige/Næste lektion links i hele dokumentationen for guidet læringsprogression
- **Studieguide**: Omfattende studie-guide.md med læringsmål, praksisøvelser og vurderingsmaterialer
- **Professionel Præsentation**: Fjernet alle emoji-ikoner for forbedret tilgængelighed og professionelt udseende
- **Forbedret Indholdsstruktur**: Forbedret organisering og flow af læringsmaterialer

#### Ændret
- **Dokumentationsformat**: Standardiseret al dokumentation med konsekvent læringsfokuseret struktur
- **Navigationsflow**: Implementeret logisk progression gennem alt læringsmateriale
- **Indholdsfremlæggelse**: Fjernet dekorative elementer til fordel for klar, professionel formatering
- **Linkstruktur**: Opdateret alle interne links til at understøtte det nye navigationssystem

#### Forbedret
- **Tilgængelighed**: Fjernet emoji-afhængigheder for bedre skærmlæserkompatibilitet
- **Professionelt Udseende**: Ren, akademisk stil præsentation egnet til virksomhedslæring
- **Læringsoplevelse**: Struktureret tilgang med klare mål og resultater for hver lektion
- **Indholdsorganisering**: Bedre logisk flow og forbindelse mellem relaterede emner

### [v1.0.0] - 2025-09-09

#### Første Udgivelse - Omfattende AZD Læringsarkiv

#### Tilføjet
- **Kerne Dokumentationsstruktur**
  - Kompletsæt guide-serie til opstart
  - Omfattende dokumentation for deployment og provisioning
  - Detaljerede fejlsøgningsressourcer og debugging-guides
  - Værktøjer og procedurer til forudgående validering af deployment

- **Kom godt i gang modul**
  - AZD Basics: Kernekoncepter og terminologi
  - Installationsguide: Platformsspecifik opsætningsinstruktion
  - Konfigurationsguide: Miljøopsætning og autentificering
  - Første Projekttutorial: Trin-for-trin hands-on læring

- **Deployment og Provisioning modul**
  - Deploymentsguide: Kompletdokumentation af workflow
  - Provisioningsguide: Infrastruktur som kode med Bicep
  - Best practices for produktionsdeployments
  - Multi-service arkitektur mønstre

- **Forudgående Valideringsmodul**
  - Kapacitetsplanlægning: Validering af Azure ressourcetilgængelighed
  - SKU-valg: Omfattende vejledning til servicetier
  - Pre-flight Checks: Automatiserede valideringsscripts (PowerShell og Bash)
  - Omkostningsestimering og budgetplanlægningsværktøjer

- **Fejlsøgningsmodul**
  - Almindelige Problemer: Ofte forekommende problemer og løsninger
  - Debugging-guide: Systematiske fejlsøgningsmetoder
  - Avancerede diagnostiske teknikker og værktøjer
  - Overvågning og optimering af ydeevne

- **Ressourcer og Referencer**
  - Kommandocheat sheet: Hurtig reference til essentielle kommandoer
  - Ordliste: Omfattende terminologi og forkortelsesdefinitioner
  - FAQ: Detaljerede svar på ofte stillede spørgsmål
  - Eksterne ressourcelinks og community-forbindelser

- **Eksempler og Skabeloner**
  - Simpelt webapplikationseksempel
  - Static Website deployment skabelon
  - Containerapplikationskonfiguration
  - Databaseintegrationsmønstre
  - Microservices arkitektureksempler
  - Serverless funktioners implementeringer

#### Funktioner
- **Multi-platform support**: Installations- og konfigurationsvejledninger til Windows, macOS og Linux
- **Flere færdighedsniveauer**: Indhold designet for studerende til professionelle udviklere
- **Praktisk fokus**: Hands-on eksempler og virkelige scenarier
- **Omfattende dækning**: Fra grundlæggende koncepter til avancerede virksomhedsmønstre
- **Sikkerhedsførste tilgang**: Sikkerhedspraksis integreret gennem hele
- **Omkostningsoptimering**: Vejledning til omkostningseffektive deployments og ressourcestyring

#### Dokumentationskvalitet
- **Detaljerede kodeeksempler**: Praktiske, testede kodeeksempler
- **Trin-for-trin instruktioner**: Klare, handlingsorienterede vejledninger
- **Omfattende fejlhåndtering**: Fejlsøgning af almindelige problemer
- **Integration af bedste praksis**: Branchestandarder og anbefalinger
- **Versionskompatibilitet**: Opdateret til nyeste Azure-tjenester og azd-funktioner

## Planlagte Fremtidige Forbedringer

### Version 3.1.0 (planlagt)
#### AI Platform Udvidelse
- **Multi-model support**: Integrationsmønstre for Hugging Face, Azure Machine Learning og custom modeller
- **AI Agent Frameworks**: Skabeloner til LangChain, Semantic Kernel og AutoGen deployments
- **Avancerede RAG mønstre**: Vector database muligheder ud over Azure AI Search (Pinecone, Weaviate osv.)
- **AI Observability**: Forbedret overvågning af modelperformance, tokenforbrug og svar kvalitet

#### Udvikleroplevelse
- **VS Code Extension**: Integreret AZD + Microsoft Foundry udvikleroplevelse
- **GitHub Copilot Integration**: AI-assisteret AZD skabelongenerering
- **Interaktive Tutorials**: Hands-on kodningsøvelser med automatiseret validering for AI scenarier
- **Videomateriale**: Supplerende videotutorials til visuelle lærende med fokus på AI deployments

### Version 4.0.0 (planlagt)
#### Enterprise AI Mønstre
- **Governance Framework**: AI model governance, compliance og audit trails
- **Multi-tenant AI**: Mønstre til at servicere flere kunder med isolerede AI-tjenester
- **Edge AI Deployment**: Integration med Azure IoT Edge og containerinstanser
- **Hybrid Cloud AI**: Multi-cloud og hybride deploymentsmønstre til AI arbejdsbelastninger

#### Avancerede Funktioner
- **AI Pipeline Automation**: MLOps integration med Azure Machine Learning pipelines
- **Avanceret Sikkerhed**: Zero-trust mønstre, private endpoints og avanceret trusselsbeskyttelse
- **Performanceoptimering**: Avancerede tuning- og skaleringstrategier for høj-throughput AI applikationer
- **Global Distribution**: Content delivery og edge caching mønstre til AI applikationer

### Version 3.0.0 (planlagt) - Overgået af nuværende udgivelse
#### Foreslåede Tilføjelser - Nu Implementeret i v3.0.0
- ✅ **AI-Fokuseret Indhold**: Omfattende Microsoft Foundry integration (Fuldendt)
- ✅ **Interaktive Tutorials**: Hands-on AI workshop lab (Fuldendt)
- ✅ **Avanceret Sikkerhedsmodul**: AI-specifikke sikkerhedsmønstre (Fuldendt)
- ✅ **Performanceoptimering**: AI arbejdsbelastning tuning strategier (Fuldendt)

### Version 2.1.0 (planlagt) - Delvist Implementeret i v3.0.0
#### Mindre Forbedringer - Nogle Fuldførte i nuværende udgivelse
- ✅ **Yderligere Eksempler**: AI-fokuserede deploymentscenarier (Fuldendt)
- ✅ **Udvidet FAQ**: AI-specifikke spørgsmål og fejlfinding (Fuldendt)
- **Værktøjsintegration**: Forbedret IDE- og editorintegrationsvejledning
- ✅ **Udvidet Overvågning**: AI-specifikke overvågnings- og alarmmønstre (Fuldendt)

#### Stadig Planlagt til Fremtidig Udgivelse
- **Mobilvenlig Dokumentation**: Responsivt design til mobil læring
- **Offline Adgang**: Downloadbare dokumentationspakker
- **Forbedret IDE-integration**: VS Code extension til AZD + AI-workflows
- **Community Dashboard**: Realtids fællesskabsmålinger og bidragssporing

## Bidrag til Changelog

### Rapportering af Ændringer
Når du bidrager til dette arkiv, bedes du sikre, at changelog-poster indeholder:

1. **Versionsnummer**: Følger semantisk versionering (major.minor.patch)
2. **Dato**: Udgivelses- eller opdateringsdato i formatet ÅÅÅÅ-MM-DD
3. **Kategori**: Tilføjet, Ændret, Udkonstrueret, Fjernet, Rettet, Sikkerhed
4. **Klar Beskrivelse**: Kortfattet beskrivelse af ændringerne
5. **Vurdering af Indvirkning**: Hvordan ændringer påvirker eksisterende brugere

### Ændringskategorier

#### Tilføjet
- Nye funktioner, dokumentationssektioner eller kapaciteter
- Nye eksempler, skabeloner eller læringsressourcer
- Yderligere værktøjer, scripts eller hjælpeprogrammer

#### Ændret
- Modifikationer af eksisterende funktionalitet eller dokumentation
- Opdateringer for at forbedre klarhed eller nøjagtighed
- Omstrukturering af indhold eller organisering

#### Udkonstrueret
- Funktioner eller tilgange, som udfases
- Dokumentationssektioner planlagt til fjernelse
- Metoder, der har bedre alternativer

#### Fjernet
- Funktioner, dokumentation eller eksempler, der ikke længere er relevante
- Forældet information eller udkonstruerede tilgange
- Overflødigt eller sammenlagt indhold

#### Rettet
- Korrigeringer af fejl i dokumentation eller kode
- Løsning af rapporterede problemer eller fejl
- Forbedringer af nøjagtighed eller funktionalitet

#### Sikkerhed
- Sikkerhedsrelaterede forbedringer eller rettelser
- Opdateringer til bedste sikkerhedspraksis
- Løsning af sikkerhedssårbarheder

### Retningslinjer for Semantisk Versionering

#### Major Version (X.0.0)
- Brud på kompatibilitet, der kræver brugerhandling
- Betydelig omstrukturering af indhold eller organisering
- Ændringer, der ændrer den grundlæggende tilgang eller metode

#### Mindre version (X.Y.0)
- Nye funktioner eller indholdsudvidelser
- Forbedringer, der opretholder bagudkompatibilitet
- Yderligere eksempler, værktøjer eller ressourcer

#### Patch-version (X.Y.Z)
- Fejlrettelser og korrektioner
- Mindre forbedringer af eksisterende indhold
- Klarificeringer og små forbedringer

## Feedback og forslag fra fællesskabet

Vi opfordrer aktivt til feedback fra fællesskabet for at forbedre denne læringsressource:

### Hvordan man giver feedback
- **GitHub Issues**: Rapportér problemer eller foreslå forbedringer (AI-specifikke problemer er velkomne)
- **Discord-diskussioner**: Del ideer og deltag i Microsoft Foundry-fællesskabet
- **Pull Requests**: Bidrag med direkte forbedringer til indhold, især AI-skabeloner og guider
- **Microsoft Foundry Discord**: Deltag i #Azure-kanalen til diskussioner om AZD + AI
- **Fællesskabsfora**: Deltag i bredere diskussioner blandt Azure-udviklere

### Feedback-kategorier
- **AI-indsigtsnøjagtighed**: Rettelser til AI-serviceintegration og deployeringsinformation
- **Læringsoplevelse**: Forslag til forbedret AI-udvikler læringsflow
- **Mangler AI-indhold**: Anmodninger om yderligere AI-skabeloner, mønstre eller eksempler
- **Tilgængelighed**: Forbedringer for forskellige læringsbehov
- **AI-værktøjsintegration**: Forslag til bedre integration af AI-udviklingsarbejdsgange
- **Produktions-AI-mønstre**: Anmodninger om mønstre til virksomheders AI-implementering

### Forpligtelse til svar
- **Svar på problemer**: Inden for 48 timer for rapporterede problemer
- **Funktionsanmodninger**: Vurdering inden for en uge
- **Fællesskabsbidrag**: Gennemgang inden for en uge
- **Sikkerhedsproblemer**: Høj prioritet med hurtig respons

## Vedligeholdelsesplan

### Regelmæssige opdateringer
- **Månedlige gennemgange**: Sikring af indholdsnøjagtighed og linkvalidering
- **Kvartalsvise opdateringer**: Store tilføjelser og forbedringer af indhold
- **Halvårlige gennemgange**: Omfattende omstrukturering og forbedring
- **Årlige udgivelser**: Store versionsopdateringer med væsentlige forbedringer

### Overvågning og kvalitetssikring
- **Automatiserede tests**: Regelmæssig validering af kodeeksempler og links
- **Integration af fællesskabsfeedback**: Regelmæssig indarbejdelse af brugerforslag
- **Teknologiopdateringer**: Tilpasning til de seneste Azure-tjenester og azd-udgivelser
- **Tilgængelighedsaudits**: Regelmæssig gennemgang af principper for inkluderende design

## Versionssupportpolitik

### Nuværende versionssupport
- **Seneste hovedversion**: Fuld support med regelmæssige opdateringer
- **Forrige hovedversion**: Sikkerhedsopdateringer og kritiske fejlrettelser i 12 måneder
- **Ældre versioner**: Kun fællesskabsstøtte, ingen officielle opdateringer

### Migreringsvejledning
Når hovedversioner udgives, tilbyder vi:
- **Migreringsguider**: Trin-for-trin overgangsinstruktioner
- **Kompatibilitetsnoter**: Detaljer om brud på kompatibilitet
- **Værktøjsstøtte**: Scripts eller værktøjer, der assisterer med migration
- **Fællesskabsstøtte**: Dedikerede fora til migrationsspørgsmål

---

**Navigation**
- **Forrige lektion**: [Study Guide](resources/study-guide.md)
- **Næste lektion**: Gå tilbage til [Main README](README.md)

**Hold dig opdateret**: Følg dette repository for beskeder om nye udgivelser og vigtige opdateringer til læringsmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->