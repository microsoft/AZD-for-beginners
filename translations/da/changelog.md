# Ændringslog - AZD For Begyndere

## Introduktion

Denne ændringslog dokumenterer alle bemærkelsesværdige ændringer, opdateringer og forbedringer til AZD For Beginners-repositoriet. Vi følger principperne for semantisk versionering og vedligeholder denne log for at hjælpe brugere med at forstå, hvad der er ændret mellem versioner.

## Læringsmål

Ved at gennemgå denne ændringslog vil du:
- Forblive informeret om nye funktioner og indholdsudvidelser
- Forstå forbedringer foretaget i eksisterende dokumentation
- Følge fejlrettelser og korrektioner for at sikre nøjagtighed
- Følge udviklingen af læringsmaterialerne over tid

## Læringsresultater

Efter at have gennemgået ændringsloggen vil du være i stand til at:
- Identificere nyt indhold og ressourcer til rådighed for læring
- Forstå hvilke sektioner der er blevet opdateret eller forbedret
- Planlægge din læringssti baseret på de mest aktuelle materialer
- Bidrage med feedback og forslag til fremtidige forbedringer

## Versionshistorik

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Opdatering: Versionsaktuelt
**Denne version genvaliderer kurset mod `azd` `1.27.1` (juli 2026, seneste stabile udgivelse) og den aktuelle preview AI-agent-udvidelse `azure.ai.agents` `1.0.0-beta.5`, hvilket bringer alle "valideret mod" bannere opdaterede efter versionerne 1.26.0, 1.27.0 og 1.27.1.**

#### Ændret
- **✅ Valideringsbaseline opdateret** fra `azd 1.25.6` (juni 2026) til `azd 1.27.1` (juli 2026) på rodens README, alle kapitel-READMEs, Kapitel 1 dev-container-lektion (inklusive fastlåste versions-eksempler), Kapitel 4 custom-templates-lektion, Kapitel 5 multi-agent-lektion og workshop-dokumenterne
- **🤖 Kapitel 2 baseline opfrisket** fra `azd 1.23.12` (marts 2026) til `azd 1.27.1` på `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` og `microsoft-foundry-integration.md`; valideringsnote-datoer opdateret til 2026-07-13
- **🧩 AI-agent-udvidelse opgraderet** fra `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` til den nuværende `1.0.0-beta.5` udgivelse i Kapitel 2 README og `agents.md`
- **🧪 Workshop-valideringseksempel** (`azd version` output) opdateret til `1.27.1`

#### Noter om relevante azd-udgivelser (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-understøttelse for Azure Functions på Flex Consumption, `azd config sub-filter` pr. lejers abonnementfiltre, selvstændige udvidelsespakker (`azd x pack --bundle`) og `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Model Azure AI Foundry projekter/agenter direkte i `azure.yaml` (init uden Bicep/Terraform), container-udrulningssupport for App Service (`host: appservice` + `language: docker`), direkte `-s/--source` for `azd extension`-kommandoer og `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flag for `azd extension install`, forældede modeller udelukket fra katalog-/kvotaprompter som standard, og flere fejlrettelser

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

#### Begynder-bufringsudfyldning #2: Template-forfatterskab, Dev Containers, Pulumi, Azure DevOps, Service Principals og mere
**Denne version lukker de resterende mellemliggende huller, der blev identificeret af azd-coverage analysen: hvordan man forfatter og udgiver sin egen skabelon, reproducerbare dev-container/Codespaces-miljøer, Pulumi-infrastrukturudbyderen, en Azure DevOps CI/CD gennemgang, service-principal-godkendelse, vært-valg vejledning (AKS/Spring Apps), forklaringer af `azd restore`/`azd package`, hook fejlbehandling og team/delt-miljø praksisser.**

#### Tilføjet
- **🧱 Ny Kapitel 4 lektion** `docs/chapter-04-infrastructure/custom-templates.md` — forfatterskab af din egen azd-skabelon: påkrævet struktur (`azure.yaml`, `infra/`, `src/`), `metadata.template` feltet, parameterisering af infrastruktur med `uniqueString()` ressource-token og `azd-env-name` tag, lokal test med `azd init --template <local-path>`, udgivelse på GitHub og indsendelse til Awesome AZD-galleriet
- **📦 Ny Kapitel 1 lektion** `docs/chapter-01-foundation/dev-containers.md` — reproducerbare azd-miljøer med Dev Containers og GitHub Codespaces: en minimal `.devcontainer/devcontainer.json` med den officielle `ghcr.io/azure/azure-dev/azd` funktion, sprog-specifikke funktioner, `docker-in-docker` til container-værter og `azd auth login --use-device-code` til fjernlogin
- **🧩 Pulumi med azd** sektion i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi mappestruktur, stacks kortlagt til azd miljøer, påkrævede outputs/tagging og samme `azd up` / `azd down` arbejdsgang
- **🎯 Vært-valg vejledning** i `docs/chapter-04-infrastructure/provisioning.md` — en begynder-venlig sammenligning af `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` og `springapp`, med vejledning om hvornår man skal vælge AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD gennemgang** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, serviceforbindelse med workload identity federation (OIDC), den genererede `azure-dev.yml` og opsætning af variabelgruppe
- **🔑 Service Principals (Mønster 4)** tilføjet til `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ikke-interaktiv `azd auth login` med klienthemmelighed vs. fødererede/OIDC-legitimationsoplysninger, hvornår de bruges, og sikker opbevaring af legitimationsoplysninger
- **🪝 Hook fejlbehandling** underafsnit i `docs/chapter-04-infrastructure/deployment-guide.md` — exitkoder og `set -e`, `continueOnError`, test af hooks isoleret med `azd hooks run`, OS-specifikke shells og `--debug`
- **👥 Team / delte miljøer** sektion i `docs/chapter-03-configuration/configuration.md` — hvad der ligger i `.azure/`, hvad man skal gitignore, per-udvikler-miljøer, `azd env list`/`select` og levering af miljøværdier i CI/CD
- **🧰 `azd restore` og udvidede `azd package`** forklaringer i `resources/cheat-sheet.md` — genskabe afhængigheder og bygge et deployerbart artefakt uden at deployere

#### Ændret
- **🧭 Kapitel 4 lektionsoversigt** opdateret til at inkludere den nye "Forfatterskab af egen skabelon"-lektion (Lektion 3)
- **🧭 Kapitel 1 lektionsoversigt** opdateret til at inkludere den nye "Dev Containers & Codespaces" lektion (Lektion 5); navigationsfodere forbundet mellem `bring-your-own-app.md` og `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Begynder-bufringsudfyldning: Praktisk Multi-Agent Lektion, "Bring Your Own App," Terraform og CI/CD gennemgang
**Denne version lukker de største huller for en komplet begyndervejledning ved at tilføje to nye praktiske lektioner (en deployerbar multi-agent gennemgang og tilføjelse af azd til en eksisterende app), en begynder-venlig introduktion til hooks, en Terraform-med-azd sektion, en trinvis GitHub Actions pipeline-gennemgang, en forklaring på de nye preview-udvidelser og en eksplicit udrulnings-verifikationscheckliste.**

#### Tilføjet
- **🤝 Ny Kapitel 5 lektion** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en fuldt praktisk, deployerbar to-agent gennemgang (orchestrator + specialister) med en rigtig skabelon (`contoso-creative-writer`), der dækker, hvornår multi-agent bruges, `azd up` arbejdsgangen, forståelse af deployerede ressourcer, cross-agent tracing, tilpasning og oprydning
- **📦 Ny Kapitel 1 lektion** `docs/chapter-01-foundation/bring-your-own-app.md` — hvordan man tilføjer azd til et eksisterende projekt med `azd init` ("brug kode i den nuværende mappe"), forståelse af `azure.yaml` og `infra/`, `azd infra generate`, værtregistrering og deploy med `azd up`
- **🌐 Terraform med azd** sektion tilføjet i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfiguration, `.tf` mappestruktur, nødvendige `AZURE_*` outputs og `azd-env-name` tagging og samme `azd up` / `azd down` arbejdsgang (lukker hullet, hvor Terraform støtte blev påstået men kun Bicep vist)
- **⚙️ Trin-for-trin GitHub Actions gennemgang** i `docs/chapter-08-production/production-ai-practices.md` — fra GitHub repo til automatiserede udrulninger: `azd pipeline config`, OIDC fødererede legitimationsoplysninger (ingen gemte hemmeligheder), den genererede `azure-dev.yml` og vejledning om hemmeligheder vs. variable
- **🪝 Begynder-introduktion til "Ny til hooks?"** i `docs/chapter-04-infrastructure/deployment-guide.md` — hvad en hook er, en hook-fases tabel, en minimal første hook og manuel kørsel af hooks med `azd hooks run`
- **✅ "Verificer din udrulning" checkliste** tilføjet til trin 5 i `docs/chapter-01-foundation/first-project.md` — smoke test, sundheds-endpoint kontrol og eksplicit succes kriterium
- **🧩 Forklaring på nye preview udvidelser** `azure.ai.skills` og `azure.ai.connections` (hvad de er, og hvornår man skal bruge dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Ændret
- **🧭 Kapitel 5 lektionsoversigt** rettet: `multi-agent-basics.md` er nu Lektion 1 (den eneste fuldt praktiske lektion), med ærlig mærkning om at Lektion 2 findes i Kapitel 6, og Retail scenariet er en arkitektur blueprint, ikke en one-command skabelon
- **🧭 Kapitel 1 lektionsoversigt** inkluderer nu den nye "Bring Your Own App" lektion (Lektion 4)
- **🔗 Navigationsfodere** opdateret: `first-project.md` linker nu frem til `bring-your-own-app.md`

#### Rettet
- **🧱 Lukket det "påståede men manglende" Terraform hul** — kurset refererede tidligere til Terraform-support uden at vise det
- **🔀 Rettet vildledende Kapitel 5 kryds-links** der antydede en fuld multi-agent implementering eksisterede, når kun en arkitektur blueprint gjorde

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

#### AZD 1.25.6 Opdatering, Fuld Agent Livscyklus Kommandoer & Aspire Rebrand

**Denne version genvaliderer kurset mod `azd` `1.25.6` (juni 2026) og `azure.ai.agents` `0.1.40-preview` udvidelsen, udvider AI-vejledning fra "skabelon til agent" til den komplette agentlivscyklus (test → evaluér → optimer → inspicér → slet), fremhæver de nye `azure.ai.skills` og `azure.ai.connections` preview-udvidelser og bemærker ".NET Aspire" → "Aspire" produktrebrandingen.**

#### Tilføjet
- **🔁 Fuld agentlivscyklusdækning** for begyndere og AI-ingeniører på tværs af dokumenterne:
  - `docs/chapter-01-foundation/azd-basics.md` — Livscyklustabel (skabelon → test → mål → forbedr → inspicér → ryd op) tilføjet til sektionen Extensions og AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Ny sektion "Håndtering af agentlivscyklussen" som dækker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` og `delete --force`
  - `resources/cheat-sheet.md` — Udvidede AI Agent Commands med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` og `delete --force`
- **🧩 Nye preview-udvidelser** dokumenteret: `azure.ai.skills` (genanvendelige agentfærdigheder) og `azure.ai.connections` (Foundry-forbindelser) tilføjet til udvidelsestabellen og snydearket
- **⏱️ Respons-tids vejledning** — `azd ai agent invoke` eksempler bemærker nu, at den udskriver total latenstid og tid-til-første-byte
- **📌 Versionsbanner** i rod-README som peger elever til `azd version` og `azd upgrade`

#### Ændret
- **✅ Valideringsbaseline opdateret** fra `azd 1.23.12` (marts 2026) til `azd 1.25.6` (juni 2026) på tværs af alle kapitel-README'er og workshop-dokumenter
- **🤖 Kapitel 2 udvidelsesnote** opdateret fra `azure.ai.agents` `0.1.18-preview` til `0.1.40-preview`
- **🧪 Workshop valideringseksempel** (`azd version` output) opdateret til `1.25.6`
- **🧭 README "Hvad er nyt i azd i dag"** opfrisket for at fremhæve end-to-end agentlivscyklus, nye AI-udvidelser og nylige livskvalitetsforbedringer (`azd init` idempotens, `azd auth login` rydning af udløbet token, `azd tool` første-kørsel prompt)
- **📖 Kapitel 2 agents.md (Option 4)** peger nu elever til post-deploy livscykluskommandoer i stedet for at stoppe ved `azd up`

#### Rettet
- **🏷️ Produktnavngivning** — tilføjet en Aspire rebrand note (".NET Aspire" er nu blot "Aspire"); azd's Aspire support er uændret
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

#### Begynder ombordstigningsafklaring, opsætningsvalidering & endelig AZD-kommando-rensning
**Denne version følger op på AZD 1.23 valideringsgennemgang med et begynderfokuseret dokumentationsgennemløb: den præciserer AZD-først autentificeringsvejledning, tilføjer lokale opsætningsvalideringsscripts, bekræfter nøglekommandoer mod live AZD CLI og fjerner de sidste forældede engelsksprogede kommando-referencer uden for changeloggen.**

#### Tilføjet
- **🧪 Begynder opsætningsvalideringsscripts** med `validate-setup.ps1` og `validate-setup.sh` så elever kan bekræfte nødvendige værktøjer før de starter Kapitel 1
- **✅ Forudgående opsætningsvalideringstrin** i rod-README og Kapitel 1 README så manglende forudsætninger fanges før `azd up`

#### Ændret
- **🔐 Begynder autentificeringsvejledning** behandler nu konsekvent `azd auth login` som den primære sti for AZD arbejdsgange, med `az login` nævnt som valgfri medmindre Azure CLI kommandoer anvendes direkte
- **📚 Kapitel 1 onboardingflow** peger nu elever til at validere deres lokale opsætning før installations-, autentificerings- og første deploy-trin
- **🛠️ Validatorbeskeder** adskiller nu tydeligt blokerende krav fra valgfrie Azure CLI-advarsler for den kun AZD-baserede begyndersti
- **📖 Konfigurering, fejlfinding og eksempel-dokumenter** skelner nu mellem påkrævet AZD-autentificering og valgfrie Azure CLI login, hvor begge tidligere blev præsenteret uden kontekst

#### Rettet
- **📋 Restende engelsksprogede kommando-referencer** opdateret til aktuelle AZD-former, inklusive `azd config show` i snydearket og `azd monitor --overview` hvor Azure Portal oversigtsvejledning var tilsigtet
- **🧭 Begynderudsagn i Kapitel 1** blødt op for at undgå at love garanteret fejl- eller rollback-frit forløb på tværs af alle skabeloner og Azure-ressourcer
- **🔎 Live CLI-validering** bekræftet nuværende support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` og `azd down --force --purge`

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

#### AZD 1.23.12 Validering, Workshop Miljøudvidelse & AI Model Opfriskning
**Denne version udfører en dokumentationsvalideringsgennemgang mod `azd` `1.23.12`, opdaterer forældede AZD-kommandoeksempler, opfrisker AI-modelvejledningen til aktuelle standarder og udvider workshopinstruktioner ud over GitHub Codespaces til også at understøtte dev-containere og lokale kloner.**

#### Tilføjet
- **✅ Valideringsnoter på tværs af kernekapitler og workshop-dokumenter** for at gøre den testede AZD-baseline tydelig for elever, der bruger nyere eller ældre CLI-builds
- **⏱️ Udrulningstimeout vejledning** for langvarige AI-app-udrulninger ved brug af `azd deploy --timeout 1800`
- **🔎 Udvidelsesinspektionstrin** med `azd extension show azure.ai.agents` i AI-arbejdsgangs-dokumenter
- **🌐 Bredere workshop-miljøvejledning** som dækker GitHub Codespaces, dev-containere og lokale kloner med MkDocs

#### Ændret
- **📚 Kapitel introduktions-READMEs** noterer nu konsekvent validering mod `azd 1.23.12` på tværs af foundation, konfiguration, infrastruktur, multi-agent, pre-deployment, fejlfinding og produktion sektioner
- **🛠️ AZD-kommando-referencer** opdateret til aktuelle former på tværs af dokumenterne:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` afhængigt af kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` hvor Application Insights oversigt er tilsigtet
- **🧪 Provision preview eksempler** forsimplet til nuværende understøttet brug såsom `azd provision --preview` og `azd provision --preview -e production`
- **🧭 Workshop flow** opdateret så elever kan gennemføre lab-øvelserne i Codespaces, en dev-container eller en lokal klon i stedet for kun at antage Codespaces
- **🔐 Autentificeringsvejledning** foretrækker nu `azd auth login` for AZD-arbejdsgange, med `az login` som valgfri når Azure CLI kommandoer anvendes direkte

#### Rettet
- **🪟 Windows installationskommandoer** normaliseret til aktuelt `winget` pakke-casing i installationsguiden
- **🐧 Linux installationsvejledning** rettet til at undgå ikke-understøttede distro-specifikke `azd` pakke-manager instruktioner og i stedet pege på release-assets hvor relevant
- **📦 AI-model eksempler** opdateret fra ældre standarder som `gpt-35-turbo` og `text-embedding-ada-002` til nuværende eksempler såsom `gpt-4.1-mini`, `gpt-4.1` og `text-embedding-3-large`
- **📋 Udrulnings- og diagnosticeringssnippets** rettet til brug af aktuelle miljø- og status-kommandoer i logs, scripts og fejlfindingstrin
- **⚙️ GitHub Actions vejledning** opdateret fra `Azure/setup-azd@v1.0.0` til `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtykkevejledning** opdateret fra `azd mcp consent` til `azd copilot consent list`

#### Forbedret
- **🧠 AI kapitelvejledning** forklarer nu bedre preview-følsom `azd ai` adfærd, tenant-specifik login, aktuel udvidelsesbrug og opdaterede model-udrulningsanbefalinger
- **🧪 Workshop instruktioner** bruger nu mere realistiske versionseksempler og klarere miljøopsætningssprog til hands-on labs
- **📈 Produktions- og fejlfinding docs** stemmer nu bedre overens med aktuelle overvågnings-, fallback-model- og omkostningsniveaueksempler

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
**Denne version tilføjer `azd ai`, `azd extension` og `azd mcp` kommando-dækning på tværs af alle AI-relaterede kapitler, retter brudte links og forældet kode i agents.md, opdaterer snydearket og omstrukturerer Example Templates-sektionen med validerede beskrivelser og nye Azure AI AZD-skabeloner.**

#### Tilføjet
- **🤖 AZD AI CLI dækning** på tværs af 7 filer (tidligere kun i Kapitel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny sektion "Extensions and AI Commands" som introducerer `azd extension`, `azd ai agent init` og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` med sammenligningstabel (skabelon vs manifest tilgang)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Undersektioner "AZD Extensions for Foundry" og "Agent-First Deployment"

  - `docs/chapter-05-multi-agent/README.md` — Hurtig start viser nu både skabelon- og manifest-baserede udrulningsveje
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Udrulningsafsnittet inkluderer nu `azd ai agent init`-mulighed
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underafsnit "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nyt afsnit "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp`, og `azd infra generate`
- **📦 Nye AZD AI eksempelskabeloner** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat med Blazor WebAssembly, Semantic Kernel, og stemmechat-support
  - **azure-search-openai-demo-java** — Java RAG chat med Langchain4J med ACA/AKS udrulningsmuligheder
  - **contoso-creative-writer** — Multi-agent kreativitetsapp til skrivning ved brug af Azure AI Agent Service, Bing Grounding, og Prompty
  - **serverless-chat-langchainjs** — Serverless RAG med Azure Functions + LangChain.js + Cosmos DB med Ollama lokal udviklingssupport
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator med admin-portal, Teams-integration, og PostgreSQL/Cosmos DB valgmuligheder
  - **azure-ai-travel-agents** — Multi-agent MCP orkestrerings-referenceapp med servere i .NET, Python, Java, og TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastruktuur Bicep startskabelon
  - **🔗 Fantastisk AZD AI Galleri link** — Reference til [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ skabeloner)

#### Rettet
- **🔗 agents.md navigation**: Forrige/Næste links matcher nu Kapitel 2 README lektion rækkefølge (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md døde links**: `production-ai-practices.md` rettet til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md udgået kode**: `opencensus` erstattet med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttede `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md token optælling**: Grov `len//4` estimering erstattet med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rettede services fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standard host ændret okt 2024)
- **contoso-chat**: Opdateret beskrivelse for at referere til Azure AI Foundry + Prompty, svarende til repoets faktiske titel og teknologistak

#### Fjernet
- **ai-document-processing**: Fjernet ikke-funktionel skabelonreference (repo ikke offentligt tilgængeligt som AZD skabelon)

#### Forbedret
- **📝 agents.md øvelser**: Øvelse 1 viser nu forventet output og `azd monitor` trin; Øvelse 2 inkluderer fuld `FunctionTool` registreringskode; Øvelse 3 erstatter vag vejledning med konkrete `prepdocs.py` kommandoer
- **📚 agents.md ressourcer**: Opdaterede dokumentationslinks til aktuelle Azure AI Agent Service dokumenter og quickstart
- **📋 agents.md Næste Skridt tabel**: Tilføjet AI Workshop Lab link til komplet kapitel dækning

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
**Denne version forbedrer README.md kapitelnavigation med et forbedret tabelformat.**

#### Ændret
- **Kursusoversigtstabel**: Forbedret med direkte lektion links, varighedsskøn, og kompleksitetsbedømmelser
- **Rydning af mapper**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidering**: Alle 21+ interne links i Kursusoversigtstabel verificeret

### [v3.16.0] - 2026-02-05

#### Opdateringer af produktnavne
**Denne version opdaterer produktreferencer til nuværende Microsoft branding.**

#### Ændret
- **Microsoft Foundry → Microsoft Foundry**: Alle referencer opdateret på tværs af ikk-oversatte filer
- **Azure AI Agent Service → Foundry Agents**: Servicenavn opdateret for at afspejle nuværende branding

#### Opdaterede filer
- `README.md` - Hovedkursus landingsside
- `changelog.md` - Versionshistorik
- `course-outline.md` - Kursusstruktur
- `docs/chapter-02-ai-development/agents.md` - AI agent vejledning
- `examples/README.md` - Eksempeldokumentation
- `workshop/README.md` - Workshop landingsside
- `workshop/docs/index.md` - Workshop indeks
- `workshop/docs/instructions/*.md` - Alle workshop instruktion filer

---

### [v3.15.0] - 2026-02-05

#### Stor omstrukturering af repository: kapitelnavne i mapper
**Denne version omstrukturerer dokumentationen til dedikerede kapitelmapper for klarere navigation.**

#### Mappenavne ændret
Gamle mapper er erstattet med kapitelnummererede mapper:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Tilføjet ny: `docs/chapter-05-multi-agent/`

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
| Alle pre-deployment filer | pre-deployment/ | chapter-06-pre-deployment/ |
| Alle troubleshooting filer | troubleshooting/ | chapter-07-troubleshooting/ |

#### Tilføjet
- **📚 Kapitel README filer**: Oprettet README.md i hver kapitelmappe med:
  - Læringsmål og varighed
  - Lektionstabel med beskrivelser
  - Hurtigstart kommandoer
  - Navigation til andre kapitler

#### Ændret
- **🔗 Opdaterede alle interne links**: 78+ stier opdateret på tværs af alle dokumentationsfiler
- **🗺️ Hoved README.md**: Opdateret Kursuskort med ny kapitelstruktur
- **📝 examples/README.md**: Opdateret krydsreferencer til kapitelmapper

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Omstrukturering af repository: Kapitelnavigation
**Denne version tilføjede kapitelnavigation README filer (erstattet af v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny AI Agent Guide
**Denne version tilføjer en omfattende vejledning til udrulning af AI agenter med Azure Developer CLI.**

#### Tilføjet
- **🤖 docs/microsoft-foundry/agents.md**: Komplet guide, der dækker:
  - Hvad AI agenter er, og hvordan de adskiller sig fra chatbots
  - Tre hurtigstart agent skabeloner (Foundry Agents, Prompty, RAG)
  - Agent arkitektur mønstre (enkelt agent, RAG, multi-agent)
  - Konfiguration og tilpasning af værktøjer
  - Overvågning og målsporing
  - Omkostningsovervejelser og optimering
  - Almindelige fejlsøgningsscenarier
  - Tre praktiske øvelser med succeskriterier

#### Indholdsstruktur
- **Introduktion**: Agentkoncepter for begyndere
- **Hurtig start**: Udrul agenter med `azd init --template get-started-with-ai-agents`
- **Arkitektur mønstre**: Visuelle diagrammer af agentmønstre
- **Konfiguration**: Værktøjsopsætning og miljøvariabler
- **Overvågning**: Application Insights integration
- **Øvelser**: Progressiv praktisk læring (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### Opdatering af DevContainer miljø
**Denne version opdaterer udviklingscontainerkonfigurationen med moderne værktøjer og bedre standarder for AZD læringsoplevelsen.**

#### Ændret
- **🐳 Base Image**: Opdateret fra `python:3.12-bullseye` til `python:3.12-bookworm` (seneste Debian stabile)
- **📛 Container Navn**: Omdøbt fra "Python 3" til "AZD for Beginners" for klarhed

#### Tilføjet
- **🔧 Nye Dev Container Funktioner**:
  - `azure-cli` med Bicep support aktiveret
  - `node:20` (LTS version til AZD skabeloner)
  - `github-cli` til skabelonstyring
  - `docker-in-docker` til container app udrulning

- **🔌 Port Forwarding**: Forhåndskonfigurerede porte til almindelig udvikling:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nye VS Code Extensions**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep sprogsupport
  - `ms-azure-devtools.azure-resource-groups` - Azure ressourcehåndtering
  - `yzhang.markdown-all-in-one` - Markdown redigering
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram support
  - `redhat.vscode-yaml` - YAML support (til azure.yaml)
  - `eamodio.gitlens` - Git visualisering
  - `mhutchie.git-graph` - Git historik

- **⚙️ VS Code Indstillinger**: Tilføjede standardindstillinger for Python fortolker, format ved gem, og trimning af mellemrum

- **📦 Opdaterede requirements-dev.txt**:
  - Tilføjet MkDocs minify plugin
  - Tilføjet pre-commit til kodekvalitet
  - Tilføjet Azure SDK pakker (azure-identity, azure-mgmt-resource)

#### Rettet
- **Post-oprettelseskommando**: Verificerer nu AZD og Azure CLI installation ved container start

---

### [v3.11.0] - 2026-02-05

#### Begynder-venlig README omstrukturering
**Denne version forbedrer README.md betydeligt for at være mere tilgængelig for begyndere og tilføjer essentielle ressourcer for AI-udviklere.**

#### Tilføjet
- **🆚 Azure CLI vs AZD sammenligning**: Klar forklaring på hvornår hvert værktøj bør bruges med praktiske eksempler
- **🌟 Fantastiske AZD links**: Direkte links til community skabelongalleri og bidragsressourcer:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ klar-til-udrulnings skabeloner
  - [Indsend en Skabelon](https://github.com/Azure/awesome-azd/issues) - Community bidrag
- **🎯 Hurtigstart Guide**: Forenklet 3-trins kom i gang afsnit (Installér → Login → Udrul)
- **📊 Erfaringsbaseret navigationstabel**: Klar vejledning om hvor man starter baseret på udviklererfaring

#### Ændret
- **README Struktur**: Omorganiseret for progressiv afsløring - vigtig information først
- **Introduktionsafsnit**: Omskrevet for at forklare "The Magic of `azd up`" for helt begyndere
- **Fjernet Dobbelt Indhold**: Fjernet dubleret fejlsøgningsafsnit
- **Fejlsøgningskommandoer**: Rettet `azd logs` reference til at bruge gyldig `azd monitor --logs`

#### Rettet

- **🔐 Autentificeringskommandoer**: Tilføjet `azd auth login` og `azd auth logout` til cheat-sheet.md
- **Ugyldige kommando-referencer**: Fjernet resterende `azd logs` fra README-fejlfinding sektionen

#### Noter
- **Omfang**: Ændringer anvendt på hoved-README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer specifikt rettet mod udviklere nye i AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI kommando-nøjagtighedsopdatering
**Denne version retter ikke-eksisterende AZD-kommandoer gennem dokumentationen og sikrer, at alle kodeeksempler bruger gyldig Azure Developer CLI syntaks.**

#### Rettet
- **🔧 Ikke-eksisterende AZD-kommandoer fjernet**: Omfattende gennemgang og rettelse af ugyldige kommandoer:
  - `azd logs` (findes ikke) → erstattet med `azd monitor --logs` eller Azure CLI alternativer
  - `azd service` underkommandoer (findes ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (findes ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flag (findes ikke) → fjernet
  - `azd provision --what-if/--rollback` flag (findes ikke) → opdateret til at bruge `--preview`
  - `azd config validate` (findes ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (findes ikke) → fjernet

- **📚 Filer opdateret med kommando-korrektioner**:
  - `resources/cheat-sheet.md`: Omfattende revision af kommando-referencen
  - `docs/deployment/deployment-guide.md`: Rettet rollback- og implementeringsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigeret sektioner for log-analyse
  - `docs/troubleshooting/common-issues.md`: Opdaterede fejlfindingskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Rettet AZD debugging sektion
  - `docs/getting-started/azd-basics.md`: Korrigerede overvågningskommandoer
  - `docs/getting-started/first-project.md`: Opdaterede eksempler til overvågning og debugging
  - `docs/getting-started/installation.md`: Rettede hjælpe- og versionseksempler
  - `docs/pre-deployment/application-insights.md`: Korrigerede kommandoer til log-visning
  - `docs/pre-deployment/coordination-patterns.md`: Rettede debugging-kommandoer for agenter

- **📝 Versionsreferencer opdateret**: 
  - `docs/getting-started/installation.md`: Ændret hardkodet `1.5.0` version til generisk `1.x.x` med link til releases

#### Ændret
- **Rollback-strategier**: Opdateret dokumentation til at bruge Git-baseret rollback (AZD har ikke indbygget rollback)
- **Log-visning**: Erstattet `azd logs` referencer med `azd monitor --logs`, `azd monitor --live` og Azure CLI kommandoer
- **Performance sektion**: Fjernet ikke-eksisterende parallelle/incremental implementeringsflag, leveret gyldige alternativer

#### Tekniske detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor旗er**: `--live`, `--logs`, `--overview`
- **Fjernede funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Noter
- **Verifikation**: Kommandoer valideret mod Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop færdiggørelse og dokumentationskvalitetsopdatering
**Denne version færdiggør de interaktive workshopmoduler, retter alle ødelagte dokumentationslinks og forbedrer den samlede indholdskvalitet for AI-udviklere, der bruger Microsoft AZD.**

#### Tilføjet
- **📝 CONTRIBUTING.md**: Nyt dokument med retningslinjer for bidrag med:
  - Klare instruktioner til rapportering af problemer og forslag til ændringer
  - Dokumentationsstandarder for nyt indhold
  - Retningslinjer for kodeeksempler og commit-beskeder
  - Information om fællesskabsengagement

#### Færdiggjort
- **🎯 Workshop Modul 7 (Afslutning)**: Fuldstændigt færdiggjort wrap-up modul med:
  - Omfattende opsummering af workshop-præstationer
  - Sektion med mestrerede nøglebegreber om AZD, skabeloner og Microsoft Foundry
  - Anbefalinger til fortsættelse af læringsrejse
  - Workshop udfordringsøvelser med sværhedsgrader
  - Fællesskabsfeedback og supportlinks

- **📚 Workshop Modul 3 (Deconstruct)**: Opdaterede læringsmål med:
  - GitHub Copilot med MCP-servere aktiveringsvejledning
  - Forståelse af AZD skabelon-mappe struktur
  - Infrastruktursomkode (Bicep) organisationsmønstre
  - Praktiske laboratorieinstruktioner

- **🔧 Workshop Modul 6 (Nedtagning)**: Færdiggjort med:
  - Ressource-rensning og omkostningsstyringsmål
  - `azd down` brug til sikker fjernelse af infrastruktur
  - Vejledning til gendannelse af blødt slettede kognitive tjenester
  - Bonus-udforskning af GitHub Copilot og Azure Portal

#### Rettet
- **🔗 Fikse ødelagte links**: Løst 15+ ødelagte interne dokumentationslinks:
  - `docs/ai-foundry/ai-model-deployment.md`: Rettede stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerede sti til ai-model-deployment.md og production-ai-practices.md
  - `docs/getting-started/first-project.md`: Erstattede ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Rettede FAQ- og fejlfinding-vejledningsstier
  - `examples/container-app/microservices/README.md`: Korrigerede kursushjemmeside og implementeringsguide-stier
  - `resources/faq.md` og `resources/glossary.md`: Opdaterede AI-kapitlereferencer
  - `course-outline.md`: Rettede instruktørguide og AI-workshop-laboratoriereferencer

- **📅 Workshop statusbanner**: Opdateret fra "Under Construction" til aktiv workshop-status med februar 2026 dato

- **🔗 Workshop navigation**: Rettede ødelagte navigationslinks i workshop README.md, som pegede på ikke-eksisterende lab-1-azd-basics mappe

#### Ændret
- **Workshop præsentation**: Fjernet "under construction" advarsel, workshop er nu komplet og klar til brug
- **Navigationens konsistens**: Sikret at alle workshopmoduler har korrekt navigation mellem moduler
- **Læringssti henvisninger**: Opdaterede kapitel-cross-referencer til korrekte microsoft-foundry-stier

#### Valideret
- ✅ Alle engelsksprogede markdown-filer har gyldige interne links
- ✅ Workshopmoduler 0-7 er komplette med læringsmål
- ✅ Navigation mellem kapitler og moduler fungerer korrekt
- ✅ Indholdet er egnet til AI-udviklere, der bruger Microsoft AZD
- ✅ Begyndervenligt sprog og struktur er opretholdt gennem hele materialet
- ✅ CONTRIBUTING.md giver klare retningslinjer for bidragsydere i fællesskabet

#### Teknisk implementering
- **Linkvalidering**: Automatiseret PowerShell-script verificerede alle .md interne links
- **Indholdsevaluering**: Manuel gennemgang af workshop komplethed og begynderegnede egenskaber
- **Navigationssystem**: Konsistente navigationsmønstre for kapitler og moduler anvendt

#### Noter
- **Omfang**: Ændringer anvendt på engelsk dokumentation kun
- **Oversættelser**: Oversættelsesmapper er ikke opdateret i denne version (automatisk oversættelse synkroniseres senere)
- **Workshop varighed**: Færdig workshop tilbyder nu 3-4 timers praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avanceret dokumentation: Overvågning, Sikkerhed og Multi-Agent Mønstre
**Denne version tilføjer omfattende A-niveau lektioner om Application Insights integration, autentificeringsmønstre og multi-agent koordinering til produktionsimplementeringer.**

#### Tilføjet
- **📊 Application Insights integrationslektion**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuseret implementering med automatisk provisioning
  - Færdige Bicep-skabeloner til Application Insights + Log Analytics
  - Fungerende Python-applikationer med tilpasset telemetri (1200+ linjer)
  - AI/LLM overvågningsmønstre (Microsoft Foundry Models token/omkostningssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribueret sporing, telemetri-flow)
  - 3 hands-on øvelser (alarmer, dashboards, AI overvågning)
  - Kusto-forespørgselseksempler og omkostningsoptimeringsstrategier
  - Live metrics streaming og realtids-debugging
  - 40-50 minutters læringstid med produktions-klare mønstre

- **🔐 Autentificering & sikkerhedsmønstre lektion**: i `docs/getting-started/authsecurity.md`:
  - 3 autentificeringsmønstre (forbindelsesstrenge, Key Vault, managed identity)
  - Færdige Bicep infrastruktur-skabeloner til sikre implementeringer
  - Node.js applikationskode med Azure SDK integration
  - 3 komplette øvelser (aktivering af managed identity, bruger-tildelt identity, Key Vault rotation)
  - Sikkerheds bedste praksis og RBAC-konfigurationer
  - Fejlfinding og omkostningsanalyse
  - Produktionsklare passwordless autentificeringsmønstre

- **🤖 Multi-Agent koordinationsmønstre lektion**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinationsmønstre (sekventiel, parallel, hierarkisk, hændelsesdrevet, konsensus)
  - Færdig implementering af orchestrator-service (Python/Flask, 1500+ linjer)
  - 3 specialiserede agent-implementeringer (Research, Writer, Editor)
  - Service Bus integration til meddelelseskøer
  - Cosmos DB tilstandsadministration for distribuerede systemer
  - 6 Mermaid-diagrammer, der viser agentinteraktioner
  - 3 avancerede øvelser (timeout håndtering, retry logik, circuit breaker)
  - Omkostningsopdeling ($240-565/måned) med optimeringsstrategier
  - Application Insights integration til overvågning

#### Forbedret
- **Forudimplementeringskapitel**: Indeholder nu omfattende overvågnings- og koordinationsmønstre
- **Kom godt i gang kapitel**: Forbedret med professionelle autentificeringsmønstre
- **Produktionsparathed**: Fuld dækning fra sikkerhed til observerbarhed
- **Kursusoversigt**: Opdateret til at henvise til nye lektioner i kapitlerne 3 og 6

#### Ændret
- **Læringsprogression**: Bedre integration af sikkerhed og monitorering gennem kurset
- **Dokumentationskvalitet**: Konsistente A-niveau standarder (95-97%) på tværs af nye lektioner
- **Produktionsmønstre**: Fuld end-to-end dækning for virksomhedens implementeringer

#### Forbedret
- **Udvikleroplevelse**: Klar sti fra udvikling til produktionsmonitorering
- **Sikkerhedsstandarder**: Professionelle mønstre til autentificering og hemmelighedsstyring
- **Observerbarhed**: Fuldstændig Application Insights integration med AZD
- **AI-arbejdsbelastninger**: Specialiseret overvågning for Microsoft Foundry Models og multi-agent systemer

#### Valideret
- ✅ Alle lektioner inkluderer fuldt fungerende kode (ikke kodeudsnit)
- ✅ Mermaid-diagrammer til visuel læring (19 i alt på tværs af 3 lektioner)
- ✅ Praktiske øvelser med verifikationstrin (9 i alt)
- ✅ Produktionsklare Bicep-skabeloner implementerbare via `azd up`
- ✅ Omkostningsanalyse og optimeringsstrategier
- ✅ Fejlfinding og bedste praksisser
- ✅ Viden- og verifikationscheckpoint-kommandoer

#### Dokumentationsbedømmelsesresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvågningsvejledning
- **docs/getting-started/authsecurity.md**: - Professionelle sikkerhedsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avanceret multi-agent arkitektur
- **Samlet nyt indhold**: - Konsistente højkvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + tilpasset telemetri + distribueret sporing
- **Autentificering**: Managed Identity + Key Vault + RBAC mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvågning**: Live metrics + Kusto-forespørgsler + alarmer + dashboards
- **Omkostningsstyring**: Sampling strategier, fastholdelsespolitikker, budgetkontrol

### [v3.7.0] - 2025-11-19

#### Dokumentationskvalitetsforbedringer og nyt Microsoft Foundry Models eksempel
**Denne version forbedrer dokumentationskvaliteten i hele arkivet og tilføjer et komplet Microsoft Foundry Models implementeringseksempel med gpt-4.1 chat-interface.**

#### Tilføjet
- **🤖 Microsoft Foundry Models chat-eksempel**: Komplet gpt-4.1-implementering med fungerende i `examples/azure-openai-chat/`:
  - Fuld Microsoft Foundry Models infrastruktur (gpt-4.1 model implementering)
  - Python kommandolinje-chat-interface med samtalehistorik
  - Key Vault integration til sikker API-nøglelagring
  - Tokenforbrugs-tracking og omkostningsestimering
  - Ratebegrænsning og fejlbehandling
  - Omfattende README med 35-45 minutters implementeringsvejledning
  - 11 produktionsklare filer (Bicep skabeloner, Python-app, konfiguration)
- **📚 Dokumentationsøvelser**: Tilføjede praksisøvelser til konfigurationsvejledning:
  - Øvelse 1: Multi-miljøkonfiguration (15 minutter)
  - Øvelse 2: Hemmelighedshåndtering praksis (10 minutter)
  - Klare succescriteria og verifikationstrin
- **✅ Implementeringsverifikation**: Tilføjet verifikationssektion til implementeringsvejledning:
  - Sundhedstjek-procedurer
  - Tjekliste for succescriteria
  - Forventede output for alle implementeringskommandoer
  - Hurtig reference til fejlfinding

#### Forbedret
- **examples/README.md**: Opdateret til A-niveau kvalitet (93%):
  - Tilføjet azure-openai-chat til alle relevante sektioner
  - Opdateret lokalt eksempel antal fra 3 til 4
  - Tilføjet til AI applikationseksempel-tabel
  - Integreret i Quick Start for mellemniveau brugere
  - Tilføjet til Microsoft Foundry skabelonsektion
  - Opdateret sammenligningsmatrix og teknologifindingssektioner
- **Dokumentationskvalitet**: Forbedret fra B+ (87%) til A- (92%) på tværs af docs-mappen:

  - Tilføjet forventede output til kritiske kommandoeksempler
  - Inkluderet verifikationstrin for konfigurationsændringer
  - Forbedret praktisk læring med øvelser

#### Ændret
- **Læringsprogression**: Bedre integration af AI-eksempler til mellemstadieelever
- **Dokumentationsstruktur**: Mere handlingsorienterede øvelser med klare resultater
- **Verifikationsproces**: Udtrykkelige succes kriterier tilføjet til nøglearbejdsgange

#### Forbedret
- **Udvikleroplevelse**: Microsoft Foundry Models-udrulning tager nu 35-45 minutter (mod 60-90 for komplekse alternativer)
- **Omkostningstransparens**: Klare omkostningsestimater ($50-200/måned) for Microsoft Foundry Models-eksempel
- **Læringssti**: AI-udviklere har klart startpunkt med azure-openai-chat
- **Dokumentationsstandarder**: Konsistente forventede output og verifikationstrin

#### Valideret
- ✅ Microsoft Foundry Models-eksempel fuldt funktionelt med `azd up`
- ✅ Alle 11 implementeringsfiler syntaktisk korrekte
- ✅ README-instruktioner stemmer overens med faktisk udrulningserfaring
- ✅ Dokumentationslinks opdateret på over 8 steder
- ✅ Eksempelindeks afspejler præcist 4 lokale eksempler
- ✅ Ingen dublerede eksterne links i tabeller
- ✅ Alle navigationsreferencer korrekte

#### Teknisk Implementering
- **Microsoft Foundry Models Arkitektur**: gpt-4.1 + Key Vault + Container Apps-mønster
- **Sikkerhed**: Managed Identity klar, hemmeligheder i Key Vault
- **Overvågning**: Application Insights-integration
- **Omkostningsstyring**: Token-sporing og brugsoptimering
- **Udrulning**: Én enkelt `azd up`-kommando til komplet opsætning

### [v3.6.0] - 2025-11-19

#### Større opdatering: Container App udrulningseksempler
**Denne version introducerer omfattende, produktionsklare containerapplikationsudrulningseksempler ved brug af Azure Developer CLI (AZD), med fuld dokumentation og integration i læringsstien.**

#### Tilføjet
- **🚀 Container App Eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Fuld oversigt over containeriserede udrulninger, hurtig start, produktion og avancerede mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Begynder-venligt REST API med scale-to-zero, sundhedskontroller, overvågning og fejlsøgning
  - [Microservices Arkitektur](../../examples/container-app/microservices): Produktionsklar multi-service udrulning (API Gateway, Produkt, Ordre, Bruger, Notifikation), asynkron messaging, Service Bus, Cosmos DB, Azure SQL, distribueret tracing, blue-green/canary deployment
- **Bedste Praksis**: Sikkerhed, overvågning, omkostningsoptimering og CI/CD-råd for containeriserede workloads
- **Kodeeksempler**: Fuldt `azure.yaml`, Bicep-skabeloner og fler-sprogstjeneste-implementeringer (Python, Node.js, C#, Go)
- **Test & Fejlfinding**: End-to-end testsituationer, overvågningskommandoer, fejlfindingstips

#### Ændret
- **README.md**: Opdateret til at fremhæve og linke til nye container app-eksempler under "Lokale Eksempler - Container Applikationer"
- **examples/README.md**: Opdateret til at fremhæve container app-eksempler, tilføje sammenligningsmatrix-poster og opdatere teknologi-/arkitekturreferencer
- **Kursusoversigt & Studieguide**: Opdateret til at henvise til nye container app-eksempler og udrulningsmønstre i relevante kapitler

#### Valideret
- ✅ Alle nye eksempler kan udrulles med `azd up` og følger bedste praksis
- ✅ Dokumentationens krydslinks og navigation opdateret
- ✅ Eksempler dækker begynder- til avancerede scenarier, inklusive produktionsmikrotjenester

#### Noter
- **Omfang**: Kun engelsk dokumentation og eksempler
- **Næste Skridt**: Udvid med yderligere avancerede containermønstre og CI/CD-automatisering i fremtidige udgivelser

### [v3.5.0] - 2025-11-19

#### Produkt Rebranding: Microsoft Foundry
**Denne version implementerer en omfattende produktnavneændring fra "Microsoft Foundry" til "Microsoft Foundry" i al engelsk dokumentation, som afspejler Microsofts officielle rebranding.**

#### Ændret
- **🔄 Produktnavneopdatering**: Fuld rebranding fra "Microsoft Foundry" til "Microsoft Foundry"
  - Opdateret alle referencer i engelsk dokumentation i `docs/`-mappen
  - Omdøbt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøbt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - I alt: 23 indholdsreferencer opdateret i 7 dokumentationsfiler

- **📁 Mappeændringer**:
  - `docs/ai-foundry/` omdøbt til `docs/microsoft-foundry/`
  - Alle krydsreferencer opdateret til ny mappestruktur
  - Navigationslinks valideret i hele dokumentationen

- **📄 Filomdøbninger**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links opdateret til at referere til nyt filnavn

#### Opdaterede filer
- **Kapitel Dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigationslinkopdateringer
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnreferencer opdateret
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Allerede Microsoft Foundry (fra tidligere opdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencer opdateret (oversigt, fællesskabsfeedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 krydsreferencelinks opdateret
  - `docs/getting-started/first-project.md` - 2 kapitel navigationslinks opdateret
  - `docs/getting-started/installation.md` - 2 links til næste kapitel opdateret
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencer opdateret (navigation, Discord-fællesskab)
  - `docs/troubleshooting/common-issues.md` - 1 navigationslink opdateret
  - `docs/troubleshooting/debugging.md` - 1 navigationslink opdateret

- **Kursusstrukturfiler** (2 filer):
  - `README.md` - 17 referencer opdateret (kursusoversigt, kapiteloverskrifter, skabelonafsnit, fællesskabsindsigt)
  - `course-outline.md` - 14 referencer opdateret (oversigt, læringsmål, kapitleressourcer)

#### Valideret
- ✅ Ingen resterende "ai-foundry" mappestireferencer i engelske dokumenter
- ✅ Ingen resterende "Microsoft Foundry" produktnavnreferencer i engelske dokumenter
- ✅ Alle navigationslinks fungerer med ny mappestruktur
- ✅ Fil- og mappenavnændringer gennemført succesfuldt
- ✅ Krydsreferencer mellem kapitler valideret

#### Noter
- **Omfang**: Ændringer anvendt kun til engelsk dokumentation i `docs/`-mappen
- **Oversættelser**: Oversættelsesmapper (`translations/`) ikke opdateret i denne version
- **Workshop**: Workshop-materialer (`workshop/`) ikke opdateret i denne version
- **Eksempler**: Eksempelfiler kan stadig indeholde ældre navngivning (til at blive adresseret i fremtidig opdatering)
- **Eksterne links**: Eksterne URL'er og GitHub-repositoriumreferencer forbliver uændrede

#### Migreringsvejledning for bidragydere
Hvis du har lokale grene eller dokumentation, der refererer til den gamle struktur:
1. Opdater mappehenvisninger: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Opdater filhenvisninger: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstat produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Validér at alle interne dokumentationslinks stadig virker

---

### [v3.4.0] - 2025-10-24

#### Infrastruktur Preview og Valideringsforbedringer
**Denne version introducerer omfattende support for den nye Azure Developer CLI preview-funktion og forbedrer workshop-brugeroplevelsen.**

#### Tilføjet
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattende dækning af den nye infrastruktur preview-capability
  - Kommando-reference og eksempler i jukseliste
  - Detaljeret integration i provisioning-guide med brugsscenarier og fordele
  - Forhåndstjek-integration for sikrere udrulningsvalidering
  - Opdateringer i opstartsvejledning med sikkerheds-først udrulningspraksis
- **🚧 Workshop Status Banner**: Professionelt HTML-banner, der angiver status for workshop-udvikling
  - Gradientdesign med byggeindikatorer for klar brugerkommunikation
  - Sidst opdateret tidsstempel for gennemsigtighed
  - Mobilresponsivt design til alle enhedstyper

#### Forbedret
- **Infrastruktursikkerhed**: Preview-funktionalitet integreret i hele udrulningsdokumentationen
- **Forudgående validering**: Automatiserede scripts inkluderer nu infrastruktur preview-test
- **Udviklerarbejdsgang**: Opdaterede kommando sekvenser til at inkludere preview som bedste praksis
- **Workshopoplevelse**: Klare forventninger sat for brugere om indholdsudviklingsstatus

#### Ændret
- **Bedste praksis for udrulning**: Workflow med preview-først anbefales nu
- **Dokumentationsflow**: Infrastrukturvalidering flyttet tidligere i læringsprocessen
- **Workshoppræsentation**: Professionel statuskommunikation med klar udviklingstidslinje

#### Forbedret
- **Sikkerheds-første tilgang**: Infrastruktursændringer kan nu valideres før udrulning
- **Team-samarbejde**: Preview-resultater kan deles til gennemgang og godkendelse
- **Omkostningsbevidsthed**: Bedre forståelse af ressourceomkostninger før provisioning
- **Risikoreduktion**: Mindre udrulningsfejl gennem forudgående validering

#### Teknisk Implementering
- **Multi-dokument integration**: Preview-funktion dokumenteret på tværs af 4 nøglefiler
- **Kommandomønstre**: Konsistent syntaks og eksempler i hele dokumentationen
- **Bedste praksis integration**: Preview inkluderet i valideringsarbejdsgange og scripts
- **Visuelle indikatorer**: Klare NYE funktionsmarkeringer for opdagelighed

#### Workshop Infrastruktur
- **Statuskommunikation**: Professionelt HTML-banner med gradient-styling
- **Brugeroplevelse**: Klar udviklingsstatus forhindrer forvirring
- **Professionel præsentation**: Opretholder repository troværdighed mens forventninger sættes
- **Tidslinjegennemsigtighed**: Oktober 2025 sidst opdateret tidsstempel for ansvarlighed

### [v3.3.0] - 2025-09-24

#### Forbedrede workshopmaterialer og interaktiv læring
**Denne version introducerer omfattende workshopmaterialer med browserbaserede interaktive guider og strukturerede læringsstier.**

#### Tilføjet
- **🎥 Interaktiv Workshop Guide**: Browserbaseret workshopoplevelse med MkDocs preview-funktion
- **📝 Strukturerede workshopinstruktioner**: 7-trins guidet læringssti fra opdagelse til tilpasning
  - 0-Introduktion: Workshopoversigt og opsætning
  - 1-Vælg-AI-Skabelon: Skabelonopdagelse og udvælgelsesproces
  - 2-Validér-AI-Skabelon: Udrulnings- og valideringsprocedurer
  - 3-Nedbryd-AI-Skabelon: Forståelse af skabelonarkitektur
  - 4-Konfigurer-AI-Skabelon: Konfiguration og tilpasning
  - 5-Tilpas-AI-Skabelon: Avancerede ændringer og iterationer
  - 6-Nedtag-Infrastruktur: Rydning og ressourcehåndtering
  - 7-Afslutning: Resumé og næste skridt
- **🛠️ Workshopværktøjer**: MkDocs-konfiguration med Material tema for forbedret læringsoplevelse
- **🎯 Praktisk læringssti**: 3-trins metode (Opdagelse → Udrulning → Tilpasning)
- **📱 GitHub Codespaces-integration**: Problemfri udviklingsmiljøopsætning

#### Forbedret
- **AI Workshop Lab**: Udvidet med omfattende 2-3 timers struktureret læringsoplevelse
- **Workshopdokumentation**: Professionel præsentation med navigation og visuelle hjælpemidler
- **Læringsprogression**: Klar trin-for-trin vejledning fra skabelonvalg til produktionsudrulning
- **Udvikleroplevelse**: Integrerede værktøjer til strømlinede udviklingsarbejdsgange

#### Forbedret
- **Tilgængelighed**: Browserbaseret interface med søgning, kopi-funktionalitet og temaomskifter
- **Selvstyret læring**: Fleksibel workshopstruktur tilpasset forskellige læringshastigheder
- **Praktisk anvendelse**: Virkelige AI-skabelonu drulningsscenarier
- **Fællesskabsintegration**: Discord integration til workshop-support og samarbejde

#### Workshop Funktioner
- **Indbygget søgning**: Hurtig søgning efter nøgleord og lektioner
- **Kopier kodeblokke**: Hold musen over for at kopiere funktionalitet i alle kodeeksempler
- **Temaomskifter**: Understøttelse af mørk/lys tilstand for forskellige præferencer
- **Visuelle ressourcer**: Skærmbilleder og diagrammer for bedre forståelse
- **Hjælpeintegration**: Direkte Discord-adgang til fællesskabsstøtte

### [v3.2.0] - 2025-09-17

#### Større navigationsomstrukturering og kapitelbaseret læringssystem
**Denne version introducerer en omfattende kapitelbaseret læringsstruktur med forbedret navigation gennem hele repositoryet.**

#### Tilføjet
- **📚 Kapitelbaseret læringssystem**: Omstruktureret hele kurset til 8 progressive læringskapitler
  - Kapitel 1: Fundament & Hurtig start (⭐ - 30-45 min)
  - Kapitel 2: AI-Første udvikling (⭐⭐ - 1-2 timer)
  - Kapitel 3: Konfiguration & Autentificering (⭐⭐ - 45-60 min)
  - Kapitel 4: Infrastruktur som kode & Udrulning (⭐⭐⭐ - 1-1,5 time)
  - Kapitel 5: Multi-Agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapitel 6: Forud-udrulnings validering & planlægning (⭐⭐ - 1 time)
  - Kapitel 7: Fejlfinding & Debugging (⭐⭐ - 1-1,5 time)
  - Kapitel 8: Produktions- & Enterprise-mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigationssystem**: Konsistente navigationsoverskrifter og -fod på tværs af al dokumentation
- **🎯 Fremdriftssporing**: Kursusfærdiggørelsestjekliste og læringsverifikationssystem
- **🗺️ Læringssti vejledning**: Klare startpunkter for forskellige erfaringsniveauer og mål
- **🔗 Krydsreference-navigation**: Relaterede kapitler og forudsætninger klart linket

#### Forbedret
- **README-struktur**: Omdannet til en struktureret læringsplatform med kapitelbaseret organisering
- **Dokumentationsnavigation**: Hver side inkluderer nu kapitelkontekst og progressionsvejledning
- **Skabelonorganisation**: Eksempler og skabeloner kortlagt til passende læringskapitler

- **Ressourceintegration**: Snydeark, FAQ'er og studieguider tilknyttet relevante kapitler
- **Workshopintegration**: Praktiske laboratorier tilknyttet flere kapitel-læringsmål

#### Ændret
- **Læringsprogression**: Flyttet fra lineær dokumentation til fleksibel kapitelbaseret læring
- **Konfigurationsplacering**: Flyttet konfigurationsvejledningen til Kapitel 3 for bedre læringsflow
- **AI-indholdsintegration**: Bedre integration af AI-specifikt indhold gennem hele læringsforløbet
- **Produktionsindhold**: Avancerede mønstre samlet i Kapitel 8 for erhvervsbrugere

#### Forbedret
- **Brugeroplevelse**: Klare navigationsbrødkrummer og kapitelprogressionsindikatorer
- **Tilgængelighed**: Konsistente navigationsmønstre for nemmere kursusgennemførelse
- **Professionel præsentation**: Universitetsstil kursusstruktur egnet til akademisk og virksomhedstræning
- **Læringseffektivitet**: Reduceret tid til at finde relevant indhold gennem forbedret organisering

#### Teknisk Implementering
- **Navigationsoverskrifter**: Standardiseret kapitelnavigation på tværs af 40+ dokumentationsfiler
- **Footer-navigation**: Konsistent vejledning i progression og indikatorer for kapitelafslutning
- **Krydslinkning**: Omfattende internt linkningssystem der forbinder relaterede begreber
- **Kapitelkortlægning**: Skabeloner og eksempler tydeligt tilknyttet læringsmål

#### Forbedring af studieguide
- **📚 Omfattende læringsmål**: Omstruktureret studieguide tilpasset 8-kapitel system
- **🎯 Kapitelbaseret vurdering**: Hvert kapitel inkluderer specifikke læringsmål og praksisøvelser
- **📋 Fremdriftssporing**: Ugentlig læringsplan med målbare resultater og tjeklister for færdiggørelse
- **❓ Vurderingsspørgsmål**: Spørgsmål til vidensvalidering for hvert kapitel med professionelle resultater
- **🛠️ Praktiske øvelser**: Praktiske aktiviteter med virkelige implementeringsscenarier og fejlfinding
- **📊 Færdighedsprogression**: Klar fremdrift fra grundlæggende koncepter til erhvervsmønstre med fokus på karriereudvikling
- **🎓 Certificeringsrammeværk**: Professionelle udviklingsresultater og anerkendelsessystem i fællesskabet
- **⏱️ Tidsstyring**: Struktureret 10-ugers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede multi-agent AI-løsninger
**Denne version forbedrer multi-agent detailhandelsløsningen med bedre agentnavngivning og forbedret dokumentation.**

#### Ændret
- **Multi-agent terminologi**: Udskiftet "Cora agent" med "Kundeagent" i hele detailhandels multi-agent løsning for bedre forståelse
- **Agentarkitektur**: Opdateret al dokumentation, ARM-skabeloner og kodeeksempler til konsistent "Kundeagent" navngivning
- **Konfigurationseksempler**: Moderniserede agentkonfigurationsmønstre med opdaterede navngivningskonventioner
- **Dokumentationskonsistens**: Sikret at alle referencer bruger professionelle, beskrivende agentnavne

#### Forbedret
- **ARM-skabelonpakke**: Opdateret retail-multiagent-arm-template med Kundeagent-referencer
- **Arkitekturdiagrammer**: Opfriskede Mermaid-diagrammer med opdateret agentnavngivning
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruger nu CustomerAgent-navngivning
- **Miljøvariabler**: Opdateret alle implementeringsscripts til at bruge CUSTOMER_AGENT_NAME-konventioner

#### Forbedret
- **Udvikleroplevelse**: Klarere agentroller og ansvar i dokumentationen
- **Produktionsparathed**: Bedre tilpasning til erhvervsnavngivningskonventioner
- **Læringsmaterialer**: Mere intuitiv agentnavngivning til undervisningsformål
- **Skabelonbrugervenlighed**: Forenklet forståelse af agentfunktioner og implementeringsmønstre

#### Tekniske detaljer
- Opdateret Mermaid-arkitekturdiagrammer med CustomerAgent-referencer
- Udskiftet CoraAgent klasse-navne med CustomerAgent i Python-eksempler
- Ændret ARM-skabelon JSON-konfigurationer til at bruge "customer" agent-type
- Opdateret miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Opfrisket alle implementeringskommandoer og containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Store ændringer - AI-udviklerfokus og Microsoft Foundry-integration
**Denne version transformer repository til en omfattende AI-fokuseret læringsressource med Microsoft Foundry integration.**

#### Tilføjet
- **🤖 AI-første læringssti**: Fuld omstrukturering med prioritering af AI-udviklere og ingeniører
- **Microsoft Foundry integrationsvejledning**: Omfattende dokumentation for tilslutning af AZD med Microsoft Foundry-tjenester
- **AI-modelimplementeringsmønstre**: Detaljeret vejledning om modelvalg, konfiguration og produktionsimplementeringsstrategier
- **AI-workshoplaboratorium**: 2-3 timers praktisk workshop for at konvertere AI-applikationer til AZD-implementerbare løsninger
- **Produktions AI bedste praksis**: Erhvervsklare mønstre til skalering, overvågning og sikring af AI-arbejdsbelastninger
- **AI-specifik fejlfinding**: Omfattende fejlfinding for Microsoft Foundry modeller, kognitive tjenester og AI-implementeringsproblemer
- **AI-skabelongalleri**: Udvalgt samling af Microsoft Foundry-skabeloner med kompleksitetsvurderinger
- **Workshopmaterialer**: Fuldstændig workshopstruktur med praktiske laboratorier og reference-materialer

#### Forbedret
- **README-struktur**: AI-udviklerfokus med 45 % fællesskabsinteresse data fra Microsoft Foundry Discord
- **Læringsforløb**: Dedikeret AI-udviklerrejse ved siden af traditionelle ruter for studerende og DevOps-ingeniører
- **Skabelonanbefalinger**: Fremhævede AI-skabeloner inkl. azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Fællesskabsintegration**: Forbedret Discord-fællesskabsstøtte med AI-specifikke kanaler og diskussioner

#### Sikkerhed og produktionsfokus
- **Managed Identity-mønstre**: AI-specifik autentifikation og sikkerhedskonfigurationer
- **Omkostningsoptimering**: Overvågning af tokenbrug og budgetkontroller for AI-arbejdsbelastninger
- **Multi-region implementering**: Strategier for global AI-applikationsimplementering
- **Ydelsesovervågning**: AI-specifikke målinger og Application Insights-integration

#### Dokumentationskvalitet
- **Lineær kursusstruktur**: Logisk progression fra begynder til avancerede AI-implementeringsmønstre
- **Validerede URL'er**: Alle eksterne repository-links verificeret og tilgængelige
- **Fuldstændig reference**: Alle interne dokumentationslinks valideret og funktionelle
- **Produktionsklart**: Erhvervsimplementeringsmønstre med virkelighedsnære eksempler

### [v2.0.0] - 2025-09-09

#### Store ændringer - Repository-omstrukturering og professionel forbedring
**Denne version repræsenterer en væsentlig revision af repositorystruktur og indholdspræsentation.**

#### Tilføjet
- **Struktureret læringsramme**: Alle dokumentationssider indeholder nu Introduktion, Læringsmål og Læringsresultater sektioner
- **Navigationssystem**: Tilføjet Forrige/Næste lektion links i hele dokumentationen for guidet læringsprogression
- **Studieguide**: Omfattende studie-guide.md med læringsmål, praktikøvelser og vurderingsmaterialer
- **Professionel præsentation**: Fjernede alle emoji-ikoner for forbedret tilgængelighed og professionelt udseende
- **Forbedret indholdsstruktur**: Forbedret organisering og flow af læringsmaterialer

#### Ændret
- **Dokumentationsformat**: Standardiseret al dokumentation med konsistent læringsfokuseret struktur
- **Navigationsflow**: Implementeret logisk progression gennem alle læringsmaterialer
- **Indholds-præsentation**: Fjernet dekorative elementer til fordel for klar, professionel formatering
- **Linkstruktur**: Opdateret alle interne links til at understøtte nyt navigationssystem

#### Forbedret
- **Tilgængelighed**: Fjernet afhængighed af emoji for bedre screenreader-kompatibilitet
- **Professionelt udseende**: Ren, akademisk stil præsentation egnet til virksomhedslæring
- **Læringsoplevelse**: Struktureret tilgang med klare mål og resultater for hver lektion
- **Indholdsorganisering**: Bedre logisk flow og forbindelse mellem relaterede emner

### [v1.0.0] - 2025-09-09

#### Første udgivelse - Omfattende AZD læringsrepository

#### Tilføjet
- **Kerne-dokumentationsstruktur**
  - Fuldstændig guide-serie til at komme i gang
  - Omfattende dokumentation for implementering og provisionering
  - Detaljerede fejlfinding-ressourcer og debugging-guider
  - Værktøjer og procedurer til validering før implementering

- **Kom godt i gang modul**
  - AZD Grundlæggende: Kernekoncepter og terminologi
  - Installationsvejledning: Platformsspecifik opsætning
  - Konfigurationsvejledning: Miljøopsætning og autentifikation
  - Første projekt-tutorial: Trin-for-trin praktisk læring

- **Implementerings- og provisioneringsmodul**
  - Implementeringsvejledning: Fuld arbejdsgangs dokumentation
  - Provisioneringsvejledning: Infrastruktur som kode med Bicep
  - Bedste praksis for produktionsimplementeringer
  - Multi-service arkitektur mønstre

- **Validering før implementering modul**
  - Kapacitetsplanlægning: Validering af Azure-ressource tilgængelighed
  - SKU-udvælgelse: Omfattende vejledning til servicelag
  - Pre-flight checks: Automatiserede valideringsscripts (PowerShell og Bash)
  - Omkostningsestimering og budgetplanlægningsværktøjer

- **Fejlfinding modul**
  - Almindelige problemer: Hyppigt opståede problemer og løsninger
  - Debugging-vejledning: Systematiske fejlfindingmetoder
  - Avancerede diagnostiske teknikker og værktøjer
  - Overvågning og optimering af ydeevne

- **Ressourcer og referencer**
  - Kommando-snydeark: Hurtig reference for essentielle kommandoer
  - Glossar: Omfattende terminologi- og forkortelsesdefinitioner
  - FAQ: Detaljerede svar på almindelige spørgsmål
  - Eksterne ressourcelinks og fællesskabsforbindelser

- **Eksempler og skabeloner**
  - Simpelt webapplikationseksempel
  - Statisk webside-implementeringsskabelon
  - Konfiguration af containerapplikation
  - Mønstre for databaseintegration
  - Eksempler på mikrotjenestearkitektur
  - Serverløse funktionsimplementeringer

#### Funktioner
- **Multi-platform support**: Installations- og konfigurationsvejledninger til Windows, macOS og Linux
- **Forskellige færdighedsniveauer**: Indhold designet til studerende til professionelle udviklere
- **Praktisk fokus**: Praktiske eksempler og virkelighedsnære scenarier
- **Omfattende dækning**: Fra grundlæggende koncepter til avancerede erhvervsmønstre
- **Sikkerhedsførste tilgang**: Sikkerhedspraksis integreret overalt
- **Omkostningsoptimering**: Vejledning til omkostningseffektive implementeringer og ressourceadministration

#### Dokumentationskvalitet
- **Detaljerede kodeeksempler**: Praktiske, testede kodeeksempler
- **Trin-for-trin instruktioner**: Klare, handlingsorienterede vejledninger
- **Omfattende fejlbehandling**: Fejlfinding for almindelige problemer
- **Integration af bedste praksis**: Branchestandarder og anbefalinger
- **Versionskompatibilitet**: Opdateret med seneste Azure-tjenester og azd-funktioner

## Planlagte fremtidige forbedringer

### Version 3.1.0 (Planlagt)
#### AI-platform udvidelse
- **Multi-model support**: Integrationsmønstre for Hugging Face, Azure Machine Learning og egne modeller
- **AI-agent frameworks**: Skabeloner til LangChain, Semantic Kernel og AutoGen implementeringer
- **Avancerede RAG-mønstre**: Vector-database muligheder ud over Azure AI Search (Pinecone, Weaviate osv.)
- **AI observability**: Forbedret overvågning af modelpræstation, token-brug og svartilstand

#### Udvikleroplevelse
- **VS Code extension**: Integreret AZD + Microsoft Foundry udviklingsoplevelse
- **GitHub Copilot integration**: AI-assisteret AZD-skabelongenerering
- **Interaktive tutorials**: Praktiske kodningsøvelser med automatiseret validering for AI-scenarier
- **Videomateriale**: Supplerende videotutorials for visuelle elever med fokus på AI-implementeringer

### Version 4.0.0 (Planlagt)
#### Erhvervs AI-mønstre
- **Governance-rammeværk**: AI-model governance, compliance og revisionsspor
- **Multi-tenant AI**: Mønstre til at servicere flere kunder med isolerede AI-tjenester
- **Edge AI-implementering**: Integration med Azure IoT Edge og container-instans
- **Hybrid Cloud AI**: Multi-cloud og hybrid implementeringsmønstre for AI-arbejdsbelastninger

#### Avancerede funktioner
- **AI pipeline-automatisering**: MLOps-integration med Azure Machine Learning pipelines
- **Avanceret sikkerhed**: Zero-trust mønstre, private endpoints og avanceret trusselsbeskyttelse
- **Ydelsesoptimering**: Avancerede tuning- og skaleringstrategier for høj-gennemstrømnings AI-applikationer
- **Global distribution**: Indholdslevering og edge caching mønstre for AI-applikationer

### Version 3.0.0 (Planlagt) - Afløst af nuværende udgivelse
#### Forslåede tilføjelser - Nu implementeret i v3.0.0
- ✅ **AI-fokuseret indhold**: Omfattende Microsoft Foundry integration (Fuldført)
- ✅ **Interaktive tutorials**: Praktisk AI workshop laboratorium (Fuldført)
- ✅ **Avanceret sikkerhedsmodul**: AI-specifikke sikkerhedsmønstre (Fuldført)
- ✅ **Ydelsesoptimering**: AI-arbejdsbelastning tuningstrategier (Fuldført)

### Version 2.1.0 (Planlagt) - Delvist implementeret i v3.0.0
#### Mindre forbedringer - Nogle fuldført i nuværende udgivelse
- ✅ **Yderligere eksempler**: AI-fokuserede implementeringsscenarier (Fuldført)
- ✅ **Udvidet FAQ**: AI-specifikke spørgsmål og fejlfinding (Fuldført)
- **Værktøjsintegration**: Forbedrede IDE- og editorintegrationsvejledninger
- ✅ **Udvidet overvågning**: AI-specifikke overvågnings- og alarmeringsmønstre (Fuldført)

#### Stadig planlagt til fremtidig udgivelse
- **Mobilvenlig dokumentation**: Responsivt design til mobil læring
- **Offline adgang**: Downloadbare dokumentationspakker
- **Forbedret IDE-integration**: VS Code extension til AZD + AI arbejdsgange
- **Fællesskabsdashboard**: Realtidsmålinger for fællesskab og bidragsovervågning

## Bidrag til ændringsloggen

### Rapportering af ændringer
Ved bidrag til dette repository, sørg for at ændringslogposter inkluderer:

1. **Versionsnummer**: Følger semantisk versionering (major.minor.patch)
2. **Dato**: Udgivelses- eller opdateringsdato i YYYY-MM-DD format
3. **Kategori**: Tilføjet, Ændret, Udadopteret, Fjernet, Rettet, Sikkerhed
4. **Klar beskrivelse**: Kortfattet beskrivelse af hvad der er ændret
5. **Konsekvensvurdering**: Hvordan ændringer påvirker eksisterende brugere

### Ændringskategorier

#### Tilføjet
- Nye funktioner, dokumentationsafsnit eller kapabiliteter
- Nye eksempler, skabeloner eller læringsressourcer
- Yderligere værktøjer, scripts eller hjælpeprogrammer

#### Ændret
- Ændringer i eksisterende funktionalitet eller dokumentation
- Opdateringer for at forbedre klarhed eller nøjagtighed
- Omstrukturering af indhold eller organisering

#### Udadopteret
- Funktioner eller tilgange der udfases
- Dokumentationsafsnit planlagt til fjernelse
- Metoder der har bedre alternativer

#### Fjernet
- Funktioner, dokumentation eller eksempler der ikke længere er relevante
- Forældet information eller udkastede tilgange
- Overflødigt eller konsolideret indhold

#### Rettet
- Korrigeringer af fejl i dokumentation eller kode
- Løsning af rapporterede problemer eller fejl
- Forbedringer af nøjagtighed eller funktionalitet


#### Sikkerhed
- Forbedringer eller rettelser relateret til sikkerhed
- Opdateringer til bedste sikkerhedspraksis
- Løsning af sikkerhedssårbarheder

### Retningslinjer for semantisk versionering

#### Major Version (X.0.0)
- Brydende ændringer, der kræver brugerhandling
- Betydelig omstrukturering af indhold eller organisering
- Ændringer, der ændrer den grundlæggende tilgang eller metode

#### Minor Version (X.Y.0)
- Nye funktioner eller indholdsudvidelser
- Forbedringer, der opretholder bagudkompatibilitet
- Yderligere eksempler, værktøjer eller ressourcer

#### Patch Version (X.Y.Z)
- Fejlrettelser og korrektioner
- Mindre forbedringer til eksisterende indhold
- Præciseringer og små forbedringer

## Feedback og forslag fra fællesskabet

Vi opfordrer aktivt til feedback fra fællesskabet for at forbedre denne læringsressource:

### Sådan giver du feedback
- **GitHub Issues**: Rapportér problemer eller foreslå forbedringer (AI-specifikke spørgsmål er velkomne)
- **Discord Diskussioner**: Del ideer og engagér dig med Microsoft Foundry fællesskabet
- **Pull Requests**: Bidrag med direkte forbedringer af indhold, især AI-skabeloner og guider
- **Microsoft Foundry Discord**: Deltag i #Azure-kanalen for AZD + AI diskussioner
- **Fællesskabsfora**: Deltag i bredere Azure udviklerdiskussioner

### Feedback-kategorier
- **AI Indholds Nøjagtighed**: Rettelser til AI service-integration og implementeringsinformation
- **Læringsoplevelse**: Forslag til forbedret AI udvikler læringsflow
- **Manglende AI Indhold**: Anmodninger om yderligere AI skabeloner, mønstre eller eksempler
- **Tilgængelighed**: Forbedringer til forskellige læringsbehov
- **AI Værktøjsintegration**: Forslag til bedre AI udviklingsarbejdsgang integration
- **Produktion AI Mønstre**: Anmodninger om AI implementeringsmønstre til virksomheder

### Responsforpligtelse
- **Svar på problemer**: Inden for 48 timer for rapporterede problemer
- **Funktion-anmodninger**: Evaluering inden for en uge
- **Fællesskabsbidrag**: Gennemgang inden for en uge
- **Sikkerhedsproblemer**: Øjeblikkelig prioritet med hurtig respons

## Vedligeholdelsesplan

### Regelmæssige opdateringer
- **Månedlige gennemgange**: Kontrol af indholdsnøjagtighed og linkvalidering
- **Kvartalsopdateringer**: Store indholdsudvidelser og forbedringer
- **Halvårlige gennemgange**: Omfattende omstrukturering og forbedring
- **Årlige udgivelser**: Store versionsopdateringer med betydelige forbedringer

### Overvågning og kvalitetskontrol
- **Automatiseret test**: Regelmæssig validering af kodeeksempler og links
- **Fællesskabsfeedback integration**: Regelmæssig inkorporering af brugerforslag
- **Teknologiske opdateringer**: Tilpasning til nyeste Azure tjenester og azd-udgivelser
- **Tilgængelighedsrevisioner**: Regelmæssig gennemgang af inkluderende design principper

## Versionssupportpolitik

### Nuværende versionssupport
- **Seneste major version**: Fuld support med regelmæssige opdateringer
- **Forrige major version**: Sikkerhedsopdateringer og kritiske rettelser i 12 måneder
- **Ældre versioner**: Kun fællesskabsupport, ingen officielle opdateringer

### Vejledning til migration
Når major versioner udgives, leverer vi:
- **Flyttevejledninger**: Trin-for-trin overgangsinstruktioner
- **Kompatibilitetsnoter**: Detaljer om brydende ændringer
- **Værktøjsupport**: Scripts eller værktøjer til hjælp med migration
- **Fællesskabsupport**: Dedikerede fora til migrationsspørgsmål

---

**Navigation**
- **Forrige lektion**: [Studieguide](resources/study-guide.md)
- **Næste lektion**: Gå tilbage til [Hoved README](README.md)

**Hold dig opdateret**: Følg dette lager for notifikationer om nye udgivelser og vigtige opdateringer til læringsmaterialerne.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->