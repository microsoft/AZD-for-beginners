# Wijzigingslog - AZD Voor Beginners

## Inleiding

Dit wijzigingslog documenteert alle opvallende wijzigingen, updates en verbeteringen van de AZD Voor Beginners-repository. We volgen de principes van semantische versiebeheer en onderhouden deze log om gebruikers te helpen begrijpen wat er tussen versies is veranderd.

## Leerdoelen

Door dit wijzigingslog te bekijken, zul je:
- Op de hoogte blijven van nieuwe functies en inhoudsto voegingen
- Verbeteringen aan bestaande documentatie begrijpen
- Bugfixes en correcties volgen om nauwkeurigheid te waarborgen
- De evolutie van het leermateriaal in de loop van de tijd volgen

## Leerresultaten

Na het bekijken van de wijzigingslogitems ben je in staat om:
- Nieuwe inhoud en beschikbare bronnen voor het leren te identificeren
- Te begrijpen welke secties zijn bijgewerkt of verbeterd
- Je leerpad te plannen op basis van het meest actuele materiaal
- Feedback en suggesties bij te dragen voor toekomstige verbeteringen

## Versiegeschiedenis

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Vernieuwing: Versie Actualiteit Update
**Deze versie valideert de cursus opnieuw tegen `azd` `1.27.1` (juli 2026, laatste stabiele release) en de huidige preview AI-agent extensie `azure.ai.agents` `1.0.0-beta.5`, waardoor elke "gevalideerd tegen" banner up-to-date is na de 1.26.0, 1.27.0 en 1.27.1 releases.**

#### Gewijzigd
- **✅ Validatie basislijn bijgewerkt** van `azd 1.25.6` (juni 2026) naar `azd 1.27.1` (juli 2026) in de hoofd-README, alle hoofdstuk-READMEs, de Chapter 1 dev-container les (inclusief voorbeelden met vastgepinde versie), de Chapter 4 custom-templates les, de Chapter 5 multi-agent les en de workshop documentatie
- **🤖 Chapter 2 basislijn vernieuwd** van `azd 1.23.12` (maart 2026) naar `azd 1.27.1` in `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` en `microsoft-foundry-integration.md`; validatienoot datums bijgewerkt naar 2026-07-13
- **🧩 AI agent extensie verhoogd** van `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` naar de huidige `1.0.0-beta.5` release in de Chapter 2 README en `agents.md`
- **🧪 Workshop validatievoorbeeld** (`azd version` output) bijgewerkt naar `1.27.1`

#### Notities over relevante azd releases (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-ondersteuning voor Azure Functions op Flex Consumption, `azd config sub-filter` per-tenant abonnementfilters, zelfvoorzienende extensiepakketten (`azd x pack --bundle`), en `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellen van Azure AI Foundry projecten/agentes direct in `azure.yaml` (init zonder Bicep/Terraform), container deployment ondersteuning voor App Service (`host: appservice` + `language: docker`), directe `-s/--source` voor `azd extension` commando’s, en `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` vlag voor `azd extension install`, standaard uitsluiting van verouderde modellen uit catalogus/quota prompts, en diverse bugfixes

#### Bijgewerkte Bestanden
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

#### Beginners-gap-fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals en Meer
**Deze versie sluit de resterende intermediate gaps die door de azd-coverage analyse zijn aangetoond: hoe je je eigen template schrijft en publiceert, reproduceerbare dev-container/Codespaces omgevingen, de Pulumi infrastructuur provider, een Azure DevOps CI/CD walkthrough, service-principal authenticatie, host-selectie richtlijnen (AKS/Spring Apps), `azd restore`/`azd package` uitleg, hook foutafhandeling, en team-/gedeelde-omgeving praktijken.**

#### Toegevoegd
- **🧱 Nieuwe Chapter 4 les** `docs/chapter-04-infrastructure/custom-templates.md` — je eigen azd template schrijven: vereiste structuur (`azure.yaml`, `infra/`, `src/`), het `metadata.template` veld, parameteriseren van infrastructuur met de `uniqueString()` resource token en `azd-env-name` tag, lokaal testen met `azd init --template <local-path>`, publiceren op GitHub, en inzenden naar de Awesome AZD galerij
- **📦 Nieuwe Chapter 1 les** `docs/chapter-01-foundation/dev-containers.md` — reproduceerbare azd omgevingen met Dev Containers en GitHub Codespaces: een minimale `.devcontainer/devcontainer.json` met de officiële `ghcr.io/azure/azure-dev/azd` feature, taal-specifieke features, `docker-in-docker` voor container hosts, en `azd auth login --use-device-code` voor inloggen op afstand
- **🧩 Pulumi met azd** sectie in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi mapstructuur, stacks gekoppeld aan azd omgevingen, vereiste outputs/tagging, en identieke `azd up` / `azd down` workflow
- **🎯 Host-selectie richtlijnen** in `docs/chapter-04-infrastructure/provisioning.md` — een voor beginners begrijpelijke vergelijking van `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, en `springapp`, met advies over wanneer je AKS of Azure Spring Apps kiest
- **🛠️ Azure DevOps CI/CD walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, serviceverbinding met workload identity federation (OIDC), de gegenereerde `azure-dev.yml`, en opzet van variable groups
- **🔑 Service Principals (Pattern 4)** toegevoegd aan `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, niet-interactief `azd auth login` met client secret versus federated/OIDC credentials, wanneer te gebruiken en veilige opslag van credentials
- **🪝 Hook foutafhandeling** subsectie in `docs/chapter-04-infrastructure/deployment-guide.md` — exitcodes en `set -e`, `continueOnError`, hooks isolaat testen met `azd hooks run`, OS-specifieke shells, en `--debug`
- **👥 Team / gedeelde omgevingen** sectie in `docs/chapter-03-configuration/configuration.md` — wat leeft in `.azure/`, wat te gitignore-en, per-developer omgevingen, `azd env list`/`select`, en waarden voor omgeving in CI/CD aanleveren
- **🧰 `azd restore` en uitgebreide `azd package`** uitleg in `resources/cheat-sheet.md` — dependencies herstellen en een deploybaar artefact bouwen zonder uit te rollen

#### Gewijzigd
- **🧭 Hoofdstuk 4 lestabel** bijgewerkt om de nieuwe les "Je eigen template schrijven" op te nemen (Les 3)
- **🧭 Hoofdstuk 1 lestabel** bijgewerkt om de nieuwe les "Dev Containers & Codespaces" op te nemen (Les 5); navigatievoeten verbonden tussen `bring-your-own-app.md` en `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginners-gap-fill: Hands-On Multi-Agent les, "Bring Your Own App," Terraform, en CI/CD walkthrough
**Deze versie sluit de grootste gaten voor een complete beginnersgids door twee nieuwe hands-on lessen toe te voegen (een deploybare multi-agent walkthrough en azd toevoegen aan een bestaande app), een beginnersvriendelijke introduktie van hooks, een Terraform-met-azd sectie, een stapsgewijze GitHub Actions pipeline walkthrough, een uitleg over de nieuwe preview extensies, en een expliciete checklist voor deployment-verificatie.**

#### Toegevoegd
- **🤝 Nieuwe Chapter 5 les** `docs/chapter-05-multi-agent/multi-agent-basics.md` — een volledig hands-on, deploybare twee-agent walkthrough (orchestrator + specialisten) met een echt template (`contoso-creative-writer`), inclusief wanneer multi-agent gebruiken, de `azd up` workflow, begrip van de gedeployde resources, cross-agent tracing, aanpassing, en opruimen
- **📦 Nieuwe Chapter 1 les** `docs/chapter-01-foundation/bring-your-own-app.md` — hoe je azd toevoegt aan een bestaand project met `azd init` ("gebruik code in de huidige map"), begrip van `azure.yaml` en `infra/`, `azd infra generate`, hostdetectie, en deployen met `azd up`
- **🌐 Terraform met azd** sectie toegevoegd aan `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` configuratie, `.tf` mapstructuur, vereiste `AZURE_*` outputs en `azd-env-name` tagging, en identieke `azd up` / `azd down` workflow (sluit het gat waar Terraform-ondersteuning werd geclaimd maar alleen Bicep werd getoond)
- **⚙️ Stapsgewijze GitHub Actions walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — van GitHub repo tot geautomatiseerde deploys: `azd pipeline config`, OIDC gefedereerde credentials (geen opgeslagen geheimen), de gegenereerde `azure-dev.yml`, en handleiding over geheimen versus variabelen
- **🪝 Beginners "Nieuw bij hooks?" introductie** in `docs/chapter-04-infrastructure/deployment-guide.md` — wat een hook is, een hook-stage tabel, een minimale eerste hook, en hooks handmatig draaien met `azd hooks run`
- **✅ "Verifieer je deployment" checklist** toegevoegd aan Stap 5 van `docs/chapter-01-foundation/first-project.md` — rooktest, health-endpoint controle, en expliciete succescriteria
- **🧩 Uitleg over nieuwe preview extensies** `azure.ai.skills` en `azure.ai.connections` (wat ze zijn en wanneer nuttig) in `docs/chapter-08-production/production-ai-practices.md`

#### Gewijzigd
- **🧭 Hoofdstuk 5 lestabel** gecorrigeerd: `multi-agent-basics.md` is nu Les 1 (de enige volledig hands-on les), met duidelijke labeling dat Les 2 in Hoofdstuk 6 zit en dat het Retail scenario een architectuursjabloon is, geen one-command template
- **🧭 Hoofdstuk 1 lestabel** bevat nu de nieuwe les "Bring Your Own App" (Les 4)
- **🔗 Navigatievoetjes** bijgewerkt: `first-project.md` linkt nu door naar `bring-your-own-app.md`

#### Verbeterd
- **🧱 Gesloten de "geclaimde maar ontbrekende" Terraform gap** — de cursus verwees eerder naar Terraform-ondersteuning zonder dit te tonen
- **🔀 Verbeterde misleidende Chapter 5 kruislinks** die suggereerden dat een volledige multi-agent implementatie bestond terwijl het slechts een architectuursjabloon was

#### Bijgewerkte Bestanden
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nieuw)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nieuw)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Vernieuwing, Volledige Agent Lifecycle Commando’s & Aspire Rebrand

**Deze versie valideert de cursus opnieuw tegen `azd` `1.25.6` (juni 2026) en de `azure.ai.agents` `0.1.40-preview` extensie, breidt AI-richtlijnen uit van "een agent scaffolden" naar de volledige agent lifecycle (testen → evalueren → optimaliseren → inspecteren → verwijderen), belicht de nieuwe preview-extensies `azure.ai.skills` en `azure.ai.connections`, en vermeldt de producthernoeming van ".NET Aspire" → "Aspire".**

#### Toegevoegd
- **🔁 Volledige agent lifecycle-dekking** voor beginners en AI-ingenieurs door de documentatie heen:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle-tabel (scaffold → test → meten → verbeteren → inspecteren → opruimen) toegevoegd aan de sectie Extensies en AI-commando's
  - `docs/chapter-08-production/production-ai-practices.md` — Nieuwe sectie "Beheer van de Agent Lifecycle" met `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` en `delete --force`
  - `resources/cheat-sheet.md` — Uitgebreide AI Agent Commando's met `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` en `delete --force`
- **🧩 Nieuwe preview-extensies** gedocumenteerd: `azure.ai.skills` (herbruikbare agent skills) en `azure.ai.connections` (Foundry connecties) toegevoegd aan de extensietabel en cheat sheet
- **⏱️ Richtlijnen voor responstijden** — voorbeelden van `azd ai agent invoke` vermelden nu totale latency en time-to-first-byte
- **📌 Versiebanner** in de hoofddocumentatie die gebruikers wijst op `azd version` en `azd upgrade`

#### Gewijzigd
- **✅ Validatie-baseline bijgewerkt** van `azd 1.23.12` (maart 2026) naar `azd 1.25.6` (juni 2026) in alle hoofdstuk-READMEs en workshopdocumenten
- **🤖 Notitie over extensie in hoofdstuk 2** geüpdatet van `azure.ai.agents` `0.1.18-preview` naar `0.1.40-preview`
- **🧪 Voorbeeld van workshopvalidatie** (`azd version` output) bijgewerkt naar `1.25.6`
- **🧭 README "Wat is er nieuw in azd vandaag"** vernieuwd met nadruk op de end-to-end agent lifecycle, nieuwe AI-extensies, en recente kwaliteitsverbeteringen (`azd init` idempotentie, `azd auth login` verouderde token clearing, `azd tool` eerste-run prompt)
- **📖 Hoofdstuk 2 agents.md (Optie 4)** verwijst nu naar post-deploy lifecycle-commando's in plaats van te stoppen bij `azd up`

#### Opgelost
- **🏷️ Productnaamgeving** — een Aspire rebranding notitie toegevoegd (".NET Aspire" heet nu gewoon "Aspire"); azd’s ondersteuning voor Aspire blijft ongewijzigd
- **🔎 Live release validatie** bevestigd tegen Azure Developer CLI release-feed: stabiele CLI `1.25.6` (2026-06-12) en `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Bijgewerkte bestanden
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

#### Verduidelijking voor beginners aan boord, setup-validatie & laatste AZD-commando opschoning
**Deze versie bouwt voort op de AZD 1.23 validatieronde met een beginnergerichte documentatiepassage: het verduidelijkt AZD-eerst authenticatierichtlijnen, voegt lokale setup-validatiescripts toe, controleert sleutelcommando's tegen de live AZD CLI en verwijdert de laatste verouderde commandoreferenties buiten de changelog om.**

#### Toegevoegd
- **🧪 Beginner setup-validatiescripts** met `validate-setup.ps1` en `validate-setup.sh` zodat leerlingen vereiste tools kunnen verifiëren vóór hoofdstuk 1
- **✅ Voorafgaande setup-validatiestappen** in de root README en Hoofdstuk 1 README zodat ontbrekende vereisten worden opgemerkt vóór `azd up`

#### Gewijzigd
- **🔐 Beginners authenticatierichtlijnen** behandelen `azd auth login` nu consequent als primaire route voor AZD-workflows, waarbij `az login` optioneel wordt genoemd behalve bij direct gebruik van Azure CLI-commando's
- **📚 Hoofdstuk 1 onboardingproces** verwijst nu naar het valideren van de lokale setup vóór installatie, authenticatie en eerste implementatiestappen
- **🛠️ Validator-meldingen** onderscheiden nu duidelijk blokkerende vereisten van optionele Azure CLI-waarschuwingen voor het alleen AZD beginnerstraject
- **📖 Configuratie-, troubleshoot- en voorbeelddocumenten** maken nu onderscheid tussen vereiste AZD-authenticatie en optionele Azure CLI sign-in waar dat eerder zonder context werd gepresenteerd

#### Opgelost
- **📋 Overgebleven Engelse commandoreferenties** bijgewerkt naar actuele AZD-versies, inclusief `azd config show` in de cheat sheet en `azd monitor --overview` waar Azure Portal overzicht werd bedoeld
- **🧭 Beginnersclaims in Hoofdstuk 1** verzacht om overbeloften van gegarandeerde foutloze of rollbackgedrag over alle sjablonen en Azure resources heen te vermijden
- **🔎 Live CLI-validatie** bevestigd voor huidige ondersteuning van `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` en `azd down --force --purge`

#### Bijgewerkte bestanden
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

#### AZD 1.23.12 validatie, uitbreiding workshopomgeving & AI model update
**Deze versie voert een documentatievalidatiesweep uit tegen `azd` `1.23.12`, werkt verouderde AZD-commando voorbeelden bij, ververst AI modelrichtlijnen naar actuele standaarden, en verbreedt de workshopinstructies voorbij GitHub Codespaces naar ook dev containers en lokale klonen.**

#### Toegevoegd
- **✅ Validatienotities door kernhoofdstukken en workshopdocs** om de geteste AZD-baseline expliciet te maken voor gebruikers met nieuwere of oudere CLI-builds
- **⏱️ Richtlijnen voor timeouts bij uitrol** van langdurige AI app-deployments met gebruik van `azd deploy --timeout 1800`
- **🔎 Stappen voor inspectie van extensies** met `azd extension show azure.ai.agents` in AI workflow documentatie
- **🌐 Uitgebreidere richtlijnen voor workshopomgeving** die GitHub Codespaces, dev containers en lokale klonen met MkDocs omvat

#### Gewijzigd
- **📚 Hoofdstukintroductie READMEs** geven nu consequent validatie weer tegen `azd 1.23.12` door de foundation, configuratie, infrastructuur, multi-agent, pre-deployment, troubleshooting en productie-secties
- **🛠️ AZD commandoverwijzingen** bijgewerkt naar actuele vormen verspreid door de documenten:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` of `azd env get-value(s)` afhankelijk van context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` waar overzicht met Application Insights bedoeld is
- **🧪 Voorbeeldcommandos voor provision preview** vereenvoudigd naar huidige ondersteunde syntax zoals `azd provision --preview` en `azd provision --preview -e production`
- **🧭 Workshopflow** bijgewerkt zodat leerlingen labs kunnen afronden in Codespaces, dev containers of lokale klonen in plaats van alleen Codespaces
- **🔐 Authenticatierichtlijnen** geven nu de voorkeur aan `azd auth login` voor AZD-workflows, waarbij `az login` optioneel is voor direct gebruik van Azure CLI commando’s

#### Opgelost
- **🪟 Windows installcommando's** genormaliseerd naar huidige `winget` pakketcasing in installatiehandleiding
- **🐧 Linux installatierichtlijnen** gecorrigeerd om niet-ondersteunde distributie-specifieke `azd` package manager instructies te vermijden en in plaats daarvan te verwijzen naar release-assets waar passend
- **📦 AI modele voorbeelden** ververst van oudere standaarden als `gpt-35-turbo` en `text-embedding-ada-002` naar actuele voorbeelden als `gpt-4.1-mini`, `gpt-4.1` en `text-embedding-3-large`
- **📋 Implementatie- en diagnoserespons snippets** gecorrigeerd naar het gebruik van actuele omgeving- en statuscommando's in logboeken, scripts en troubleshooting stappen
- **⚙️ GitHub Actions richtlijnen** bijgewerkt van `Azure/setup-azd@v1.0.0` naar `Azure/setup-azd@v2`
- **🤖 MCP/Copilot toestemmingsrichtlijnen** bijgewerkt van `azd mcp consent` naar `azd copilot consent list`

#### Verbeterd
- **🧠 AI hoofdstukrichtlijnen** verklaren nu beter preview-gevoelig `azd ai` gedrag, tenant-specifieke login, huidig extensiegebruik en bijgewerkte modeldeploy aanbevelingen
- **🧪 Workshopsinstructies** gebruiken nu realistischere versieversies en duidelijkere taal voor omgevingsinstellingen bij hands-on labs
- **📈 Productie- en troubleshootdocumenten** sluiten nu beter aan bij actuele monitoring-, fallbackmodel- en kostenniveau-voorbeelden

#### Bijgewerkte bestanden
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

#### AZD AI CLI-commando's, inhoudsvalidatie & template-uitbreiding
**Deze versie voegt `azd ai`, `azd extension` en `azd mcp` commando-dekking toe aan alle AI-gerelateerde hoofdstukken, repareert gebroken links en verouderde code in agents.md, werkt de cheat sheet bij en vernieuwt de sectie Voorbeeldsjablonen met gevalideerde beschrijvingen en nieuwe Azure AI AZD-templates.**

#### Toegevoegd
- **🤖 AZD AI CLI-dekking** in 7 bestanden (voorheen alleen in Hoofdstuk 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nieuwe sectie "Extensies en AI-commando's" die `azd extension`, `azd ai agent init` en `azd mcp` introduceert
  - `docs/chapter-02-ai-development/agents.md` — Optie 4: `azd ai agent init` met vergelijkende tabel (template versus manifestbenadering)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecties "AZD Extensies voor Foundry" en "Agent-First Deployment"

  - `docs/chapter-05-multi-agent/README.md` — Snelle start toont nu zowel sjabloon- als manifest-gebaseerde implementatiepaden
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sectie Implementatie bevat nu optie `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsectie "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nieuwe sectie "AI & Extensions Commands" met `azd extension`, `azd ai agent init`, `azd mcp` en `azd infra generate`
- **📦 Nieuwe AZD AI voorbeeldsjablonen** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chat met Blazor WebAssembly, Semantic Kernel en spraakchatondersteuning
  - **azure-search-openai-demo-java** — Java RAG-chat met Langchain4J met ACA/AKS-implementatieopties
  - **contoso-creative-writer** — Multi-agent creatieve schrijfapp met Azure AI Agent Service, Bing Grounding en Prompty
  - **serverless-chat-langchainjs** — Serverloze RAG met Azure Functions + LangChain.js + Cosmos DB met Ollama lokale ontwikkelondersteuning
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator met admin portal, Teams-integratie en PostgreSQL/Cosmos DB-opties
  - **azure-ai-travel-agents** — Multi-agent MCP orchestratie referentieapp met servers in .NET, Python, Java en TypeScript
  - **azd-ai-starter** — Minimalistisch Azure AI infrastructuur Bicep starttemplate
  - **🔗 Geweldige AZD AI Gallery-link** — Verwijzing naar de [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ sjablonen)

#### Opgelost
- **🔗 agents.md navigatie**: Vorige/Volgende links komen nu overeen met hoofdstuk 2 README-lesvolgorde (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md gebroken links**: `production-ai-practices.md` gecorrigeerd naar `../chapter-08-production/production-ai-practices.md` (3 keer)
- **📦 agents.md verouderde code**: `opencensus` vervangen door `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ongeldige API**: `max_tokens` verplaatst van `create_agent()` naar `create_run()` als `max_completion_tokens`
- **🔢 agents.md token telling**: Groffe `len//4` schatting vervangen door `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Services gecorrigeerd van "Cognitive Search + App Service" naar "Azure AI Search + Azure Container Apps" (standaard host aangepast in okt 2024)
- **contoso-chat**: Beschrijving bijgewerkt om Azure AI Foundry + Prompty te verwijzen, passend bij de daadwerkelijke titel en technische stack van de repo

#### Verwijderd
- **ai-document-processing**: Niet-functionerende sjabloonverwijzing verwijderd (repo niet publiek toegankelijk als AZD-sjabloon)

#### Verbeterd
- **📝 agents.md oefeningen**: Oefening 1 toont nu verwachte output en stap `azd monitor`; Oefening 2 bevat volledige `FunctionTool` registratiecode; Oefening 3 vervangt vage aanwijzingen door concrete `prepdocs.py` commando's
- **📚 agents.md bronnen**: Documentatielinks bijgewerkt naar actuele Azure AI Agent Service docs en snelle start
- **📋 agents.md Volgende Stappen tabel**: AI Workshop Lab link toegevoegd voor volledige hoofdstukdekking

#### Bijgewerkte bestanden
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Verbeterde cursusnavigatie
**Deze versie verbetert README.md hoofdstuknavigatie met een verbeterd tabelformaat.**

#### Gewijzigd
- **Cursuskaarttable**: Uitgebreid met directe leslinks, duurinschattingen en complexiteitsbeoordelingen
- **Mapverschoning**: Overbodige oude mappen verwijderd (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidatie**: Alle 21+ interne links in Cursuskaarttable gecontroleerd

### [v3.16.0] - 2026-02-05

#### Productnaamupdates
**Deze versie werkt productverwijzingen bij naar de huidige Microsoft branding.**

#### Gewijzigd
- **Microsoft Foundry → Microsoft Foundry**: Alle verwijzingen bijgewerkt over niet-vertalingsbestanden
- **Azure AI Agent Service → Foundry Agents**: Servicenaam bijgewerkt om huidige branding weer te geven

#### Bijgewerkte bestanden
- `README.md` - Hoofdpagina van de cursus
- `changelog.md` - Versiegeschiedenis
- `course-outline.md` - Cursusstructuur
- `docs/chapter-02-ai-development/agents.md` - AI-agentengids
- `examples/README.md` - Voorbeelden documentatie
- `workshop/README.md` - Workshop startpagina
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - Alle workshop instructiebestanden

---

### [v3.15.0] - 2026-02-05

#### Grote herstructurering van de repository: hoofdstuk-gebaseerde mappenamen
**Deze versie herstructureert de documentatie in toegewijde hoofdstukmappen voor duidelijkere navigatie.**

#### Maphernoemingen
Oude mappen zijn vervangen door hoofdstukgenummerde mappen:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Nieuw toegevoegd: `docs/chapter-05-multi-agent/`

#### Bestandmigraties
| Bestand | Van | Naar |
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
| Alle pre-deployment bestanden | pre-deployment/ | chapter-06-pre-deployment/ |
| Alle troubleshooting bestanden | troubleshooting/ | chapter-07-troubleshooting/ |

#### Toegevoegd
- **📚 Hoofdstuk README-bestanden**: README.md gemaakt in elke hoofdstukmap met:
  - Leerdoelen en duur
  - Lesoverzichtstabel met beschrijvingen
  - Snelle start commando's
  - Navigatie naar andere hoofdstukken

#### Gewijzigd
- **🔗 Alle interne links bijgewerkt**: 78+ paden bijgewerkt in alle documentatiebestanden
- **🗺️ Hoofd README.md**: Cursuskaart bijgewerkt met nieuwe hoofdstukstructuur
- **📝 examples/README.md**: Kruisverwijzingen bijgewerkt naar hoofdstukmappen

#### Verwijderd
- Oude mapstructuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Herstructurering van repository: hoofdstuknavigatie
**Deze versie voegde navigatie README-bestanden per hoofdstuk toe (vervangen door v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nieuwe AI Agents-gids
**Deze versie voegt een uitgebreide gids toe voor het implementeren van AI-agenten met de Azure Developer CLI.**

#### Toegevoegd
- **🤖 docs/microsoft-foundry/agents.md**: Volledige gids die behandelt:
  - Wat AI-agenten zijn en hoe ze verschillen van chatbots
  - Drie snelle start agent-sjablonen (Foundry Agents, Prompty, RAG)
  - Architectuurpatronen voor agenten (enkele agent, RAG, multi-agent)
  - Toolconfiguratie en aanpassing
  - Monitoring en metriektracking
  - Kostenoverwegingen en optimalisatie
  - Veelvoorkomende scenario's voor probleemoplossing
  - Drie praktische oefeningen met succescriteria

#### Inhoudsstructuur
- **Introductie**: Agentconcepten voor beginners
- **Snelle start**: Agenten implementeren met `azd init --template get-started-with-ai-agents`
- **Architectuurpatronen**: Visuele diagrammen van agentpatronen
- **Configuratie**: Toolsetup en omgevingsvariabelen
- **Monitoring**: Integratie met Application Insights
- **Oefeningen**: Geleidelijke hands-on leermodules (20-45 minuten elk)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-omgeving update
**Deze versie werkt de configuratie van de ontwikkelcontainer bij met moderne tools en betere standaardinstellingen voor de AZD leerervaring.**

#### Gewijzigd
- **🐳 Basisimage**: Bijgewerkt van `python:3.12-bullseye` naar `python:3.12-bookworm` (laatste stabiele Debian)
- **📛 Containernaam**: Hernoemd van "Python 3" naar "AZD for Beginners" voor duidelijkheid

#### Toegevoegd
- **🔧 Nieuwe Dev Container functies**:
  - `azure-cli` met Bicep-ondersteuning ingeschakeld
  - `node:20` (LTS-versie voor AZD-sjablonen)
  - `github-cli` voor sjabloonbeheer
  - `docker-in-docker` voor containerapp-implementaties

- **🔌 Poortforwarding**: Vooraf geconfigureerde poorten voor veelgebruikte ontwikkeling:
  - 8000 (MkDocs preview)
  - 3000 (Webapps)
  - 5000 (Python Flask)
  - 8080 (API's)

- **🧩 Nieuwe VS Code-extensies**:
  - `ms-python.vscode-pylance` - Verbeterde Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions ondersteuning
  - `ms-azuretools.vscode-docker` - Docker ondersteuning
  - `ms-azuretools.vscode-bicep` - Bicep taalondersteuning
  - `ms-azure-devtools.azure-resource-groups` - Azure resourcebeheer
  - `yzhang.markdown-all-in-one` - Markdownbewerking
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagramondersteuning
  - `redhat.vscode-yaml` - YAML-ondersteuning (voor azure.yaml)
  - `eamodio.gitlens` - Git visualisatie
  - `mhutchie.git-graph` - Git geschiedenis

- **⚙️ VS Code-instellingen**: Standaardinstellingen toegevoegd voor Python-interpreter, automatisch formatteren bij opslaan en witruimte verwijderen

- **📦 Bijgewerkte requirements-dev.txt**:
  - MkDocs minify plugin toegevoegd
  - Pre-commit toegevoegd voor codekwaliteit
  - Azure SDK-pakketten toegevoegd (azure-identity, azure-mgmt-resource)

#### Opgelost
- **Post-Create Commando**: Controleert nu installatie van AZD en Azure CLI bij containerstart

---

### [v3.11.0] - 2026-02-05

#### README geschikt voor beginners volledig herzien
**Deze versie verbetert README.md aanzienlijk om beter toegankelijk te zijn voor beginners en voegt essentiële bronnen toe voor AI-ontwikkelaars.**

#### Toegevoegd
- **🆚 Azure CLI vs AZD Vergelijking**: Duidelijke uitleg wanneer welke tool te gebruiken met praktische voorbeelden
- **🌟 Geweldige AZD-links**: Directe links naar communitysjabloongalerij en bijdragebronnen:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ sjablonen klaar voor implementatie
  - [Dien een sjabloon in](https://github.com/Azure/awesome-azd/issues) - Community bijdrage
- **🎯 Snelle start-gids**: Vereenvoudigde 3-stappen introductie (Installeren → Inloggen → Implementeren)
- **📊 Navigatietabel op ervaringsniveau**: Duidelijke aanwijzingen waar te beginnen op basis van ontwikkelaarservaring

#### Gewijzigd
- **README-structuur**: Herzien voor progressieve onthulling - belangrijkste informatie eerst
- **Introductiesectie**: Herschreven om "De magie van `azd up`" uit te leggen voor absolute beginners
- **Duplicaatinhoud verwijderd**: Dubbele probleemoplossingssectie geëlimineerd
- **Probleemoplossingscommando's**: `azd logs` verwijzing hersteld naar juiste `azd monitor --logs`

#### Opgelost

- **🔐 Authenticatie-commando's**: Toegevoegd `azd auth login` en `azd auth logout` aan cheat-sheet.md
- **Ongeldige Commandoverwijzingen**: Verwijderd resterende `azd logs` uit README troubleshooting sectie

#### Notities
- **Reikwijdte**: Wijzigingen toegepast op hoof README.md en resources/cheat-sheet.md
- **Doelgroep**: Verbeteringen specifiek gericht op ontwikkelaars nieuw bij AZD

---

### [v3.10.0] - 2026-02-05

#### Nauwkeurigheidsupdate Azure Developer CLI Commando's
**Deze versie corrigeert niet-bestaande AZD-commando's door de gehele documentatie, zodat alle codevoorbeelden geldige Azure Developer CLI-syntaxis gebruiken.**

#### Opgelost
- **🔧 Niet-Bestaande AZD-commando's Verwijderd**: Uitgebreide audit en correctie van ongeldige commando's:
  - `azd logs` (bestaat niet) → vervangen door `azd monitor --logs` of Azure CLI alternatieven
  - `azd service` subcommando's (bestaan niet) → vervangen door `azd show` en Azure CLI
  - `azd infra import/export/validate` (bestaan niet) → verwijderd of vervangen door geldige alternatieven
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (bestaan niet) → verwijderd
  - `azd provision --what-if/--rollback` flags (bestaan niet) → bijgewerkt naar gebruik van `--preview`
  - `azd config validate` (bestaat niet) → vervangen door `azd config list`
  - `azd info`, `azd history`, `azd metrics` (bestaan niet) → verwijderd

- **📚 Bestanden Bijgewerkt met Commandocorrecties**:
  - `resources/cheat-sheet.md`: Grote revisie van commandoreferentie
  - `docs/deployment/deployment-guide.md`: Correcties in rollback en deployment strategieën
  - `docs/troubleshooting/debugging.md`: Verfijnde loganalyse secties
  - `docs/troubleshooting/common-issues.md`: Bijgewerkte troubleshooting commando's
  - `docs/troubleshooting/ai-troubleshooting.md`: Correctie in AZD debugging sectie
  - `docs/getting-started/azd-basics.md`: Correctie van monitoring commando's
  - `docs/getting-started/first-project.md`: Bijgewerkte voorbeelden voor monitoring en debugging
  - `docs/getting-started/installation.md`: Verbeterde help- en versievoorbeelden
  - `docs/pre-deployment/application-insights.md`: Correctie van logweergave commando's
  - `docs/pre-deployment/coordination-patterns.md`: Verbeterde agent debugging commando's

- **📝 Versiereferentie Bijgewerkt**: 
  - `docs/getting-started/installation.md`: Vaste harde `1.5.0` versie vervangen door generieke `1.x.x` met link naar releases

#### Gewijzigd
- **Rollback Strategieën**: Documentatie aangepast voor gebruik van op Git gebaseerde rollback (AZD heeft geen native rollback)
- **Log Weergave**: `azd logs` verwijzingen vervangen door `azd monitor --logs`, `azd monitor --live` en Azure CLI commando's
- **Performance Sectie**: Niet-bestaande parallelle/incremental deployment flags verwijderd, geldige alternatieven gegeven

#### Technische Details
- **Geldige AZD-commando's**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geldige azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Verwijderde Functies**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notities
- **Verificatie**: Commando's gevalideerd met Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Voltooiing Workshop en Verbetering Documentatiekwaliteit
**Deze versie voltooit interactieve workshopmodules, repareert alle verbroken documentatielinks en verbetert de algehele inhoudskwaliteit voor AI-ontwikkelaars die Microsoft AZD gebruiken.**

#### Toegevoegd
- **📝 CONTRIBUTING.md**: Nieuwe richtlijnen voor bijdragen document met:
  - Duidelijke instructies voor het melden van problemen en voorstellen van wijzigingen
  - Documentatiestandaarden voor nieuwe inhoud
  - Richtlijnen voor codevoorbeelden en conventies voor commitberichten
  - Informatie over communitybetrokkenheid

#### Voltooid
- **🎯 Workshop Module 7 (Afronding)**: Volledig afgeronde afrondingsmodule met:
  - Uitgebreide samenvatting van workshopresultaten
  - Kernconcepten sectie over beheersing van AZD, templates en Microsoft Foundry
  - Aanbevelingen voor voortzetting van leertraject
  - Workshop-uitdagingsoefeningen met moeilijkheidsbeoordelingen
  - Community feedback en ondersteuningslinks

- **📚 Workshop Module 3 (Deconstruct)**: Bijgewerkte leerdoelen met:
  - GitHub Copilot met MCP-servers activatiehandleiding
  - Inzicht in AZD-template mappenstructuur
  - Infrastructuur-als-code (Bicep) organisatiepatronen
  - Praktijkgerichte labinstructies

- **🔧 Workshop Module 6 (Afbreken)**: Voltooid met:
  - Doelen voor resource cleanup en kostenbeheer
  - Gebruik van `azd down` voor veilige infrastructuurdeprovisioning
  - Richtlijnen voor herstel van soft-verwijderde cognitive services
  - Bonus verkenningsstimuli voor GitHub Copilot en Azure Portal

#### Opgelost
- **🔗 Verbetering Verborgen Links**: Opgelost >15 verbroken interne documentatielinks:
  - `docs/ai-foundry/ai-model-deployment.md`: Correcte paden naar microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Correctie van ai-model-deployment.md en production-ai-practices.md paden
  - `docs/getting-started/first-project.md`: Vervangen niet-bestaande cicd-integration.md door deployment-guide.md
  - `examples/retail-scenario.md`: Correctie FAQ en troubleshooting gids paden
  - `examples/container-app/microservices/README.md`: Correctie course home en deployment guide paden
  - `resources/faq.md` en `resources/glossary.md`: Bijgewerkte AI hoofdstukverwijzingen
  - `course-outline.md`: Correctie van instructeursgids en AI-workshop labreferenties

- **📅 Workshop Status Banner**: Bijgewerkt van "Onder Constructie" naar actieve workshopstatus met datum februari 2026

- **🔗 Workshop Navigatie**: Verbeterde verbroken navigatielinks in workshop README.md die verwezen naar niet-bestaande lab-1-azd-basics map

#### Gewijzigd
- **Workshop Presentatie**: Verwijdering van "onder constructie" waarschuwing, workshop is nu voltooid en klaar voor gebruik
- **Navigatieconsistentie**: Gezorgd dat alle workshopmodules juiste inter-module navigatie hebben
- **Leerpadverwijzingen**: Bijgewerkte hoofdstuk cross-referenties naar juiste microsoft-foundry paden

#### Gevalideerd
- ✅ Alle Engelse markdown-bestanden bevatten geldige interne links
- ✅ Workshopmodules 0-7 zijn compleet met leerdoelen
- ✅ Navigatie tussen hoofdstukken en modules werkt correct
- ✅ Inhoud is geschikt voor AI-ontwikkelaars die Microsoft AZD gebruiken
- ✅ Beginner-vriendelijke taal en structuur consistent toegepast
- ✅ CONTRIBUTING.md biedt duidelijke richtlijnen voor community bijdragers

#### Technische Implementatie
- **Linkvalidatie**: Geautomatiseerd PowerShell-script heeft alle .md interne links gecontroleerd
- **Inhoudsaudit**: Handmatige beoordeling van workshopvolledigheid en geschiktheid voor beginners
- **Navigatiesysteem**: Consistente patronen voor hoofdstuk- en module-navigatie toegepast

#### Notities
- **Reikwijdte**: Wijzigingen toegepast alleen op Engelse documentatie
- **Vertalingen**: Vertaalmappen niet bijgewerkt in deze versie (geautomatiseerde vertaling volgt later)
- **Workshopduur**: Volledige workshop biedt nu 3-4 uur praktijkleren

---

### [v3.8.0] - 2025-11-19

#### Geavanceerde Documentatie: Monitoring, Beveiliging en Multi-Agent Patronen
**Deze versie voegt uitgebreide A-niveau lessen toe over integratie van Application Insights, authenticatiepatronen en multi-agent coördinatie voor productie-implementaties.**

#### Toegevoegd
- **📊 Application Insights Integratieles**: in `docs/pre-deployment/application-insights.md`:
  - AZD-gerichte implementatie met automatische provisioning
  - Complete Bicep-templates voor Application Insights + Log Analytics
  - Werkende Python-applicaties met aangepaste telemetrie (1200+ regels)
  - AI/LLM monitoringpatronen (Microsoft Foundry Models token/kosten tracking)
  - 6 Mermaid-diagrammen (architectuur, gedistribueerde tracing, telemetriestroom)
  - 3 praktijkgerichte oefeningen (alerts, dashboards, AI monitoring)
  - Kusto-query voorbeelden en kostoptimalisatiestrategieën
  - Live metrics streaming en real-time debugging
  - 40-50 minuten leertijd met productieklare patronen

- **🔐 Authenticatie & Beveiligingspatronen Les**: in `docs/getting-started/authsecurity.md`:
  - 3 authenticatiepatronen (connection strings, Key Vault, managed identity)
  - Complete Bicep infrastructuurtemplates voor veilige implementaties
  - Node.js applicatiecode met Azure SDK-integratie
  - 3 complete oefeningen (inschakelen managed identity, user-assigned identity, Key Vault rotatie)
  - Beveiligingsbest practices en RBAC-configuraties
  - Troubleshooting gids en kostenanalyse
  - Productieklaar passwordless authenticatiepatronen

- **🤖 Multi-Agent Coördinatiepatronen Les**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coördinatiepatronen (sequentieel, parallel, hiërarchisch, event-driven, consensus)
  - Complete orchestrator service-implementatie (Python/Flask, 1500+ regels)
  - 3 gespecialiseerde agentimplementaties (Research, Writer, Editor)
  - Service Bus-integratie voor message queuing
  - Cosmos DB statusbeheer voor gedistribueerde systemen
  - 6 Mermaid-diagrammen die agentinteracties tonen
  - 3 gevorderde oefeningen (timeout-hantering, retry-logica, circuit breaker)
  - Kostenspecificatie ($240-565/maand) met optimalisatiestrategieën
  - Application Insights integratie voor monitoring

#### Verbeterd
- **Pre-deployment Hoofdstuk**: Nu inclusief uitgebreide monitoring en coördinatiepatronen
- **Getting Started Hoofdstuk**: Verbeterd met professionele authenticatiepatronen
- **Productieklaarheid**: Volledige dekking van beveiliging tot observability
- **Cursusoverzicht**: Bijgewerkt met verwijzingen naar nieuwe lessen in Hoofdstukken 3 en 6

#### Gewijzigd
- **Leerprogressie**: Betere integratie van beveiliging en monitoring door de hele cursus
- **Documentatiekwaliteit**: Consistente A-niveau standaarden (95-97%) in nieuwe lessen
- **Productiepatronen**: Volledige end-to-end dekking voor ondernemingsimplementaties

#### Verbeterd
- **Ontwikkelaars-ervaring**: Duidelijk pad van ontwikkeling naar productiemonitoring
- **Beveiligingsstandaarden**: Professionele patronen voor authenticatie en geheimbeheer
- **Observability**: Volledige Application Insights integratie via AZD
- **AI Workloads**: Gespecialiseerde monitoring voor Microsoft Foundry Models en multi-agent systemen

#### Gevalideerd
- ✅ Alle lessen bevatten volledige werkende code (geen snippets)
- ✅ Mermaid-diagrammen voor visueel leren (19 stuks verdeeld over 3 lessen)
- ✅ Praktijkgerichte oefeningen met verificatiestappen (9 in totaal)
- ✅ Productieklare Bicep-templates inzetbaar via `azd up`
- ✅ Kostenanalyse en optimalisatiestrategieën
- ✅ Troubleshooting gidsen en best practices
- ✅ Kenniscontroles met verificatiecommando's

#### Resultaten Documentatiebeoordeling
- **docs/pre-deployment/application-insights.md**: - Uitgebreide monitoring gids
- **docs/getting-started/authsecurity.md**: - Professionele beveiligingspatronen
- **docs/pre-deployment/coordination-patterns.md**: - Geavanceerde multi-agent architecturen
- **Algemene Nieuwe Inhoud**: - Consistente hoge kwaliteitsstandaarden

#### Technische Implementatie
- **Application Insights**: Log Analytics + aangepaste telemetrie + gedistribueerde tracing
- **Authenticatie**: Managed Identity + Key Vault + RBAC-patronen
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestratie
- **Monitoring**: Live metrics + Kusto-query's + alerts + dashboards
- **Kostenbeheer**: Samplingstrategieën, retentiebeleid, budgetcontrole

### [v3.7.0] - 2025-11-19

#### Verbeteringen Documentatiekwaliteit en Nieuw Microsoft Foundry Models Voorbeeld
**Deze versie verbetert de documentatiekwaliteit door het hele repository en voegt een compleet Microsoft Foundry Models implementatievoorbeeld toe met gpt-4.1 chatinterface.**

#### Toegevoegd
- **🤖 Microsoft Foundry Models Chatvoorbeeld**: Complete gpt-4.1 implementatie met werkende uitvoering in `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructuur (gpt-4.1 modelimplementatie)
  - Python command-line chatinterface met gespreksgeschiedenis
  - Key Vault integratie voor veilige API-sleutelopslag
  - Tokengebruik tracking en kostenraming
  - Rate limiting en foutafhandeling
  - Uitgebreide README met 35-45 minuten implementatiehandleiding
  - 11 productieklare bestanden (Bicep-templates, Python-app, configuratie)
- **📚 Documentatieoefeningen**: Toegevoegd praktijkgerichte oefeningen aan configuratiehandleiding:
  - Oefening 1: Multi-omgeving configuratie (15 minuten)
  - Oefening 2: Geheimenbeheer oefening (10 minuten)
  - Duidelijke succescriteria en verificatiestappen
- **✅ Implementatieverificatie**: Toegevoegd verificatiesectie aan implementatiehandleiding:
  - Gezondheidscontroleprocedures
  - Checklist succescriteria
  - Verwachte outputs voor alle implementatiecommando's
  - Snelle troubleshooting referentie

#### Verbeterd
- **examples/README.md**: Bijgewerkt naar A-niveau kwaliteit (93%):
  - Toegevoegd azure-openai-chat aan alle relevante secties
  - Bijgewerkte lokale voorbeeldenaantal van 3 naar 4
  - Toegevoegd aan AI Applicatievoorbeelden tabel
  - Geïntegreerd in Quick Start voor Gevorderde Gebruikers
  - Toegevoegd aan Microsoft Foundry Templates sectie
  - Bijgewerkte Vergelijkingsmatrix en technologie-vindsecties
- **Documentatiekwaliteit**: Verbeterd van B+ (87%) → A- (92%) over gehele docs-map:

  - Verwachte outputs toegevoegd aan kritieke commandovo voorbeelden
  - Verificatiestappen voor configuratiewijzigingen opgenomen
  - Praktijkgericht leren verbeterd met praktische oefeningen

#### Gewijzigd
- **Leerprogressie**: Betere integratie van AI-voorbeelden voor gevorderde leerlingen
- **Documentatiestructuur**: Meer actiegerichte oefeningen met duidelijke resultaten
- **Verificatieproces**: Expliciete succescriteria toegevoegd aan belangrijke workflows

#### Verbeterd
- **Ervaring Ontwikkelaar**: Microsoft Foundry Models implementatie duurt nu 35-45 minuten (vs 60-90 voor complexe alternatieven)
- **Kosten Transparantie**: Duidelijke kostenramingen ($50-200/maand) voor Microsoft Foundry Models voorbeeld
- **Leerpad**: AI-ontwikkelaars hebben duidelijk instappunt met azure-openai-chat
- **Documentatiestandaarden**: Consistente verwachte outputs en verificatiestappen

#### Gevalideerd
- ✅ Microsoft Foundry Models voorbeeld volledig functioneel met `azd up`
- ✅ Alle 11 implementatiebestanden syntactisch correct
- ✅ README-instructies komen overeen met daadwerkelijke implementatie-ervaring
- ✅ Documentatielinks bijgewerkt op 8+ locaties
- ✅ Voorbeeldindex weerspiegelt nauwkeurig 4 lokale voorbeelden
- ✅ Geen dubbele externe links in tabellen
- ✅ Alle navigatieverwijzingen correct

#### Technische Implementatie
- **Microsoft Foundry Models Architectuur**: gpt-4.1 + Key Vault + Container Apps patroon
- **Beveiliging**: Managed Identity klaar, geheimen in Key Vault
- **Monitoring**: Application Insights integratie
- **Kostenbeheer**: Tokens volgen en gebruik optimaliseren
- **Implementatie**: Enkele `azd up` commando voor volledige setup

### [v3.6.0] - 2025-11-19

#### Grote update: Container App Implementatievoorbeelden
**Deze versie introduceert uitgebreide, productieklare container applicatie-implementatievoorbeelden met Azure Developer CLI (AZD), inclusief volledige documentatie en integratie in het leerpad.**

#### Toegevoegd
- **🚀 Container App Voorbeelden**: Nieuwe lokale voorbeelden in `examples/container-app/`:
  - [Hoofdgids](examples/container-app/README.md): Volledig overzicht van containerized deployments, quick start, productie en geavanceerde patronen
  - [Eenvoudige Flask API](../../examples/container-app/simple-flask-api): Beginnersvriendelijke REST API met scale-to-zero, health probes, monitoring en troubleshooting
  - [Microservices Architectuur](../../examples/container-app/microservices): Productieklaar multi-service implementatie (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Beveiliging, monitoring, kostenoptimalisatie en CI/CD richtlijnen voor container workloads
- **Code Voorbeelden**: Complete `azure.yaml`, Bicep templates, en multi-taal service implementaties (Python, Node.js, C#, Go)
- **Testen & Troubleshooting**: End-to-end testscenario’s, monitoring commando’s, troubleshooting richtlijnen

#### Gewijzigd
- **README.md**: Bijgewerkt om nieuwe container app voorbeelden te tonen en linken onder "Lokale Voorbeelden - Container Toepassingen"
- **examples/README.md**: Bijgewerkt om container app voorbeelden te benadrukken, vergelijkingsmatrix toe te voegen en technologie/architectuur verwijzingen bij te werken
- **Cursusoverzicht & Studiegids**: Bijgewerkt om te verwijzen naar nieuwe container app voorbeelden en implementatiepatronen in relevante hoofdstukken

#### Gevalideerd
- ✅ Alle nieuwe voorbeelden implementeerbaar met `azd up` en volgen best practices
- ✅ Documentatie cross-links en navigatie bijgewerkt
- ✅ Voorbeelden bestrijken beginner tot gevorderde scenario's, inclusief productie microservices

#### Notities
- **Scope**: Engelse documentatie en voorbeelden alleen
- **Volgende Stappen**: Uitbreiden met extra geavanceerde containerpatronen en CI/CD-automatisering in toekomstige versies

### [v3.5.0] - 2025-11-19

#### Producthernoeming: Microsoft Foundry
**Deze versie voert een volledige productnaamswijziging door van "Microsoft Foundry" naar "Microsoft Foundry" in alle Engelse documentatie, ter weerspiegeling van de officiële rebranding door Microsoft.**

#### Gewijzigd
- **🔄 Productnaam Update**: Volledige hernoeming van "Microsoft Foundry" naar "Microsoft Foundry"
  - Alle verwijzingen in Engelse documentatie in `docs/` map bijgewerkt
  - Mapnaam gewijzigd: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Bestandsnaam aangepast: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totaal: 23 inhoudsverwijzingen bijgewerkt in 7 documentatiebestanden

- **📁 Wijzigingen m.b.t. mappenstructuur**:
  - `docs/ai-foundry/` hernoemd naar `docs/microsoft-foundry/`
  - Alle kruisverwijzingen geactualiseerd om nieuwe mappenstructuur te reflecteren
  - Navigatielinks gevalideerd door alle documentatie

- **📄 Bestandsnaamwijzigingen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links bijgewerkt naar nieuwe bestandsnaam

#### Bijgewerkte Bestanden
- **Hoofdstukdocumentatie** (7 bestanden):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigatielinks bijgewerkt
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 productnaamverwijzingen bijgewerkt
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Al gebruikmakend van Microsoft Foundry (van eerdere updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 verwijzingen bijgewerkt (overzicht, community feedback, documentatie)
  - `docs/getting-started/azd-basics.md` - 4 kruisverwijzingen bijgewerkt
  - `docs/getting-started/first-project.md` - 2 hoofdstuknavigatielinks bijgewerkt
  - `docs/getting-started/installation.md` - 2 links naar volgende hoofdstukken bijgewerkt
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 verwijzingen bijgewerkt (navigatie, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigatielink bijgewerkt
  - `docs/troubleshooting/debugging.md` - 1 navigatielink bijgewerkt

- **Bestanden cursusstructuur** (2 bestanden):
  - `README.md` - 17 verwijzingen bijgewerkt (cursusoverzicht, hoofdstuktitels, sjablonensectie, community inzichten)
  - `course-outline.md` - 14 verwijzingen bijgewerkt (overzicht, leerdoelen, hoofdstukhulpmiddelen)

#### Gevalideerd
- ✅ Geen resterende "ai-foundry" mapverwijzingen in Engelse docs
- ✅ Geen resterende "Microsoft Foundry" productnaamverwijzingen in Engelse docs
- ✅ Alle navigatielinks werken met nieuwe mappenstructuur
- ✅ Bestands- en mapnaamwijzigingen succesvol afgerond
- ✅ Kruisverwijzingen tussen hoofdstukken gevalideerd

#### Notities
- **Scope**: Wijzigingen toegepast op Engelse documentatie in `docs/` map alleen
- **Vertalingen**: Vertaalmappen (`translations/`) niet bijgewerkt in deze versie
- **Workshop**: Workshopmaterialen (`workshop/`) niet bijgewerkt in deze versie
- **Voorbeelden**: Voorbeeldbestanden kunnen nog legacy namen bevatten (wordt aangepakt in toekomstige update)
- **Externe Links**: Externe URL's en GitHub repository verwijzingen blijven ongewijzigd

#### Migratiehandleiding voor bijdragers
Als je lokale branches of documentatie hebt die verwijzen naar de oude structuur:
1. Update mapverwijzingen: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update bestandsverwijzingen: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Vervang productnaam: "Microsoft Foundry" → "Microsoft Foundry"
4. Controleer of alle interne documentatielinks nog werken

---

### [v3.4.0] - 2025-10-24

#### Verbeteringen in infrastructuur preview en validatie
**Deze versie introduceert uitgebreide ondersteuning voor de nieuwe Azure Developer CLI preview-functie en verbetert de gebruikerservaring van de workshop.**

#### Toegevoegd
- **🧪 azd provision --preview Feature Documentatie**: Uitgebreide dekking van de nieuwe infrastructuur preview mogelijkheid
  - Commando-referentie en gebruiksvoorbeelden in cheat sheet
  - Gedetailleerde integratie in provisioning gids met use cases en voordelen
  - Pre-flight check integratie voor veiligere deployment validatie
  - Updates van introductiegids met veiligheid voorop bij deployment praktijken
- **🚧 Workshop Status Banner**: Professionele HTML-banner die status van workshopontwikkeling aangeeft
  - Verloopontwerp met bouwindicatoren voor duidelijke communicatie naar gebruiker
  - Laatst bijgewerkt tijdstempel voor transparantie
  - Mobiel-responsief ontwerp voor alle apparaattypes

#### Verbeterd
- **Veiligheid Infrastructuur**: Preview functionaliteit geïntegreerd in hele implementatiedocumentatie
- **Validatie voor Deployment**: Geautomatiseerde scripts bevatten nu infrastructuur preview tests
- **Ontwikkelaar Workflow**: Bijgewerkte commandosequenties om preview als beste praktijk op te nemen
- **Workshop Ervaring**: Duidelijke verwachtingen gesteld voor gebruikers over status van inhoud ontwikkeling

#### Gewijzigd
- **Beste Deployment Praktijken**: Preview-first workflow nu aanbevolen aanpak
- **Documentatiestroom**: Infrastructuurvalidatie vervroegd in leerproces geplaatst
- **Workshop Presentatie**: Professionele statuscommunicatie met duidelijke ontwikkelingsplanning

#### Verbeterd
- **Safety-First Benadering**: Infrastructuurwijzigingen kunnen nu worden gevalideerd voor deployment
- **Team Samenwerking**: Preview resultaten kunnen worden gedeeld voor beoordeling en goedkeuring
- **Kostenbewustzijn**: Beter begrip van resource-kosten voor provisioning
- **Risicobeperking**: Minder implementatiefouten door voorafgaande validatie

#### Technische Implementatie
- **Multi-document Integratie**: Preview-functie gedocumenteerd over 4 belangrijke bestanden
- **Commando Patronen**: Consistente syntaxis en voorbeelden door hele documentatie
- **Best Practice Integratie**: Preview opgenomen in validatieworkflows en scripts
- **Visuele Indicatoren**: Duidelijke NIEUWE functie markeringen voor vindbaarheid

#### Workshop Infrastructuur
- **Statuscommunicatie**: Professionele HTML-banner met verloopstijl
- **Gebruikerservaring**: Duidelijke ontwikkelingsstatus voorkomt verwarring
- **Professionele Presentatie**: Behoudt repository geloofwaardigheid terwijl verwachtingen worden gesteld
- **Tijdlijn Transparantie**: Oktober 2025 laatst bijgewerkt tijdstempel voor verantwoording

### [v3.3.0] - 2025-09-24

#### Verbeterde workshopmaterialen en interactieve leerervaring
**Deze versie introduceert uitgebreide workshopmaterialen met browsergebaseerde interactieve gidsen en gestructureerde leerpaden.**

#### Toegevoegd
- **🎥 Interactieve Workshop Gids**: Browsergebaseerde workshopervaring met MkDocs preview mogelijkheid
- **📝 Gestructureerde Workshop Instructies**: 7-stappen begeleid leerpad van ontdekking tot aanpassing
  - 0-Introductie: Workshopoverzicht en setup
  - 1-Selecteer-AI-Template: Template ontdekking en selectieproces
  - 2-Valideer-AI-Template: Deployment en validatieprocedures
  - 3-Demonteer-AI-Template: Begrip van template architectuur
  - 4-Configureer-AI-Template: Configuratie en aanpassing
  - 5-Personaliseer-AI-Template: Geavanceerde aanpassingen en iteraties
  - 6-Afbreken-Infrastructuur: Opruiming en resourcebeheer
  - 7-Afsluiting: Samenvatting en volgende stappen
- **🛠️ Workshop Tooling**: MkDocs-configuratie met Material theme voor verbeterde leerervaring
- **🎯 Praktisch Leerpad**: 3-stappen methodologie (Ontdekking → Deploy → Aanpassen)
- **📱 GitHub Codespaces Integratie**: naadloze ontwikkelomgeving setup

#### Verbeterd
- **AI Workshop Lab**: Uitgebreid met uitgebreide 2-3 uur gestructureerde leerervaring
- **Workshop Documentatie**: Professionele presentatie met navigatie en visuele hulpmiddelen
- **Leerprogressie**: Duidelijke stapsgewijze begeleiding van template selectie tot productieimplementatie
- **Ervaring Ontwikkelaar**: Geïntegreerde tooling voor gestroomlijnde ontwikkelworkflows

#### Verbeterd
- **Toegankelijkheid**: Browsergebaseerde interface met zoeken, kopieerfunctie en thema-schakelaar
- **Zelfgestuurd Leren**: Flexibele workshopstructuur die verschillende leertempo’s ondersteunt
- **Praktische Toepassing**: Reële AI template implementatiescenario’s
- **Community Integratie**: Discord-integratie voor workshop ondersteuning en samenwerking

#### Workshop Kenmerken
- **Ingebouwde Zoekfunctie**: Snelle trefwoord- en lesontdekking
- **Code Blokken Kopiëren**: Hover-en-kopieer functionaliteit voor alle codevoorbeelden
- **Thema-Schakelaar**: Donker/licht modus ondersteuning voor verschillende voorkeuren
- **Visuele Middelen**: Screenshots en diagrammen voor beter begrip
- **Help Integratie**: Directe Discord-toegang voor community ondersteuning

### [v3.2.0] - 2025-09-17

#### Grote herstructurering van navigatie en hoofdstuk-gebaseerd leersysteem
**Deze versie introduceert een uitgebreide hoofdstuk-gebaseerde leerstructuur met verbeterde navigatie door het volledige repository.**

#### Toegevoegd
- **📚 Hoofdstuk-gebaseerd Leersysteem**: Volledige cursus heringedeeld in 8 progressieve leerhoofdstukken
  - Hoofdstuk 1: Fundament & Quick Start (⭐ - 30-45 min)
  - Hoofdstuk 2: AI-First Ontwikkeling (⭐⭐ - 1-2 uur)
  - Hoofdstuk 3: Configuratie & Authenticatie (⭐⭐ - 45-60 min)
  - Hoofdstuk 4: Infrastructure as Code & Implementatie (⭐⭐⭐ - 1-1.5 uur)
  - Hoofdstuk 5: Multi-Agent AI Oplossingen (⭐⭐⭐⭐ - 2-3 uur)
  - Hoofdstuk 6: Pre-Deployment Validatie & Planning (⭐⭐ - 1 uur)
  - Hoofdstuk 7: Troubleshooting & Debuggen (⭐⭐ - 1-1.5 uur)
  - Hoofdstuk 8: Productie & Enterprise Patronen (⭐⭐⭐⭐ - 2-3 uur)
- **📚 Uitgebreid Navigatiesysteem**: Consistente navigatiekoppen en voetteksten door alle documentatie
- **🎯 Voortgangsregistratie**: Checklist cursusafronding en leerverificatiesysteem
- **🗺️ Leerpad begeleiding**: Duidelijke instappunten voor verschillende ervaringsniveaus en doelen
- **🔗 Kruisverwijzingen Navigatie**: Gerelateerde hoofdstukken en vereisten duidelijk gelinkt

#### Verbeterd
- **README Structuur**: Getransformeerd tot gestructureerd leerplatform met hoofdstuk-gebaseerde organisatie
- **Documentatie Navigatie**: Iedere pagina bevat nu hoofdstukcontext en voortgangsbegeleiding
- **Template Organisatie**: Voorbeelden en sjablonen gekoppeld aan juiste leerhoofdstukken

- **Resource-integratie**: Spiekbriefjes, FAQ's en studiegidsen gekoppeld aan relevante hoofdstukken
- **Workshopintegratie**: Praktische labs gekoppeld aan meerdere leerdoelen van hoofdstukken

#### Gewijzigd
- **Leerprogressie**: Overgegaan van lineaire documentatie naar flexibele, hoofdstuk-gebaseerde leerstructuur
- **Configuratieplaatsing**: Configuratiehandleiding verplaatst naar Hoofdstuk 3 voor betere leerflow
- **AI-inhoudintegratie**: Betere integratie van AI-specifieke inhoud gedurende het leertraject
- **Productie-inhoud**: Geavanceerde patronen geconsolideerd in Hoofdstuk 8 voor enterprise-lerenden

#### Verbeterd
- **Gebruikerservaring**: Duidelijke navigatie-breadcrumbs en voortgangsindicatoren per hoofdstuk
- **Toegankelijkheid**: Consistente navigatiepatronen voor eenvoudiger cursusdoorloop
- **Professionele presentatie**: Universitair-achtige cursusstructuur geschikt voor academische en corporate training
- **Leer efficiëntie**: Minder tijd nodig om relevante inhoud te vinden door verbeterde organisatie

#### Technische implementatie
- **Navigatiekoppelingen Hoofdstukken**: Gestandaardiseerde hoofdstuknavigatie over 40+ documentatiebestanden
- **Footer-navigatie**: Consistente voortgangsaanwijzingen en hoofdstukvoltooiingsindicatoren
- **Cross-linking**: Uitgebreid intern linkingssysteem om gerelateerde concepten te verbinden
- **Hoofdstukmapping**: Sjablonen en voorbeelden duidelijk gekoppeld aan leerdoelen

#### Verbetering studiegids
- **📚 Omvattende leerdoelen**: Studiegids herstructureerd om af te stemmen op 8-hoofdstuksysteem
- **🎯 Hoofdstuk-gebaseerde toetsing**: Elk hoofdstuk bevat specifieke leerdoelen en praktische oefeningen
- **📋 Voortgangsbewaking**: Wekelijks leerschema met meetbare resultaten en checklists voor voltooiing
- **❓ Toetsvragen**: Kenniscontrolevragen per hoofdstuk met professionele uitkomsten
- **🛠️ Praktische oefeningen**: Hands-on activiteiten met realistische inzetscenario's en probleemoplossing
- **📊 Vaardigheidsontwikkeling**: Duidelijke vooruitgang van basale concepten naar enterprise-patronen met focus op loopbaanontwikkeling
- **🎓 Certificeringsraamwerk**: Professionele ontwikkelingsresultaten en community-erkenningssysteem
- **⏱️ Tijdmanagement**: Gestructureerd 10-weken leerplan met validatie van mijlpalen

### [v3.1.0] - 2025-09-17

#### Verbeterde multi-agent AI-oplossingen
**Deze versie verbetert de multi-agent retailoplossing met betere agentnaamgeving en verbeterde documentatie.**

#### Gewijzigd
- **Multi-Agent terminologie**: "Cora agent" is door "Customer agent" vervangen in hele retail multi-agent oplossing voor duidelijker begrip
- **Agentarchitectuur**: Alle documentatie, ARM-sjablonen en codevoorbeelden bijgewerkt naar consistente "Customer agent" naamgeving
- **Configuratievoorbeelden**: Geüpdatete agentconfiguratiepatronen met nieuwe naamgevingsconventies
- **Consistentie documentatie**: Alle verwijzingen gebruiken professionele, beschrijvende agentnamen

#### Verbeterd
- **ARM-sjabloonpakket**: retail-multiagent-arm-template bijgewerkt met Customer agent-verwijzingen
- **Architectuurdiagrammen**: Mermaid-diagrammen vernieuwd met geactualiseerde agentnamen
- **Codevoorbeelden**: Python-klassen en implementatievoorbeelden nu met CustomerAgent naamgeving
- **Omgevingsvariabelen**: Alle deployment-scripts bijgewerkt om CUSTOMER_AGENT_NAME conventies te gebruiken

#### Verbeterd
- **Developer experience**: Duidelijkere agentrollen en verantwoordelijkheden in documentatie
- **Productieklaar**: Betere afstemming met enterprise naamgevingsconventies
- **Leermaterialen**: Intuïtieve agentnaamgeving voor educatieve doeleinden
- **Sjabloonbruikbaarheid**: Eenvoudiger begrip van agentfuncties en deploymentpatronen

#### Technische details
- Mermaid architectuurdiagrammen geüpdatet met CustomerAgent-verwijzingen
- CoraAgent klassenamen vervangen door CustomerAgent in Python-voorbeelden
- ARM-sjabloon JSON-configuraties aangepast om "customer" agent-type te gebruiken
- Omgevingsvariabelen gewijzigd van CORA_AGENT_* naar CUSTOMER_AGENT_* patronen
- Alle deployment-commando's en containerconfiguraties vernieuwd

### [v3.0.0] - 2025-09-12

#### Grote wijzigingen - AI Developer focus en Microsoft Foundry-integratie
**Deze versie transformeert de repository tot een uitgebreide, AI-gerichte leerbron met Microsoft Foundry-integratie.**

#### Toegevoegd
- **🤖 AI-First leerpad**: Complete herstructurering met prioriteit voor AI-ontwikkelaars en engineers
- **Microsoft Foundry integratiehandleiding**: Uitgebreide documentatie voor koppeling van AZD met Microsoft Foundry-services
- **AI model deployment patronen**: Gedetailleerde gids over modelselectie, configuratie en productie-implementatiestrategieën
- **AI Workshop lab**: 2-3 uur durende praktische workshop voor converteren van AI-applicaties naar AZD-deployable oplossingen
- **Productie AI best practices**: Enterprise-klaar patronen voor schalen, monitoren en beveiligen van AI workloads
- **AI-specific troubleshooting guide**: Uitgebreide probleemoplossing voor Microsoft Foundry-modellen, Cognitive Services en AI deploy-issues
- **AI sjabloongalerij**: Uitgelichte collectie Microsoft Foundry sjablonen met complexiteitsschattingen
- **Workshopmaterialen**: Complete workshopstructuur met praktische labs en referentiemateriaal

#### Verbeterd
- **README-structuur**: AI-ontwikkelaar gefocust met 45% community-interessegegevens van Microsoft Foundry Discord
- **Leertrajecten**: Dedicated AI-ontwikkelaarsreis naast traditionele paden voor studenten en DevOps-engineers
- **Sjabloonaanbevelingen**: Uitgelichte AI-sjablonen zoals azure-search-openai-demo, contoso-chat, en openai-chat-app-quickstart
- **Community integratie**: Verbeterde Discord community support met AI-specifieke kanalen en discussies

#### Beveiliging & productie focus
- **Managed Identity patronen**: AI-specifieke authenticatie en beveiligingsconfiguraties
- **Kostenoptimalisatie**: Tokengebruik-tracking en budgetcontroles voor AI workloads
- **Multi-region deployment**: Strategieën voor wereldwijde AI-applicatie-implementaties
- **Prestatie monitoring**: AI-specifieke metrics en Application Insights integratie

#### Documentatiekwaliteit
- **Lineaire cursusstructuur**: Logische voortgang van beginner naar geavanceerde AI deployments
- **Geverifieerde URL's**: Alle externe repositorylinks gecontroleerd en toegankelijk
- **Volledige referentie**: Alle interne documentatielinks gevalideerd en functioneel
- **Productieklaar**: Enterprise deployment-patronen met praktijkvoorbeelden

### [v2.0.0] - 2025-09-09

#### Grote wijzigingen - Herstructurering repository en professionele verbetering
**Deze versie staat voor een ingrijpende herziening van zowel de repositorystructuur als presentatie van de inhoud.**

#### Toegevoegd
- **Gestructureerd leerraamwerk**: Alle documentatiepagina's bevatten nu Introductie, Leerdoelen en Leerresultaten-secties
- **Navigatiesysteem**: Toevoeging van Vorige/Volgende lessenlinks door alle documentatie voor begeleide leerprogressie
- **Studiegids**: Uitgebreide study-guide.md met leerdoelen, oefenopdrachten en toetsingsmateriaal
- **Professionele presentatie**: Alle emoji-iconen verwijderd voor betere toegankelijkheid en professionele uitstraling
- **Verbeterde inhoudsstructuur**: Betere organisatie en doorstroming van leermaterialen

#### Gewijzigd
- **Documentatieformaat**: Alle documentatie gestandaardiseerd met consistente leergerichte structuur
- **Navigatiestroom**: Logische voortgang door alle leermaterialen geïmplementeerd
- **Inhoudspresentatie**: Decoratieve elementen verwijderd ten gunste van heldere professionele opmaak
- **Linkstructuur**: Alle interne links bijgewerkt om nieuw navigatiesysteem te ondersteunen

#### Verbeterd
- **Toegankelijkheid**: Emoji-afhankelijkheden verwijderd voor betere schermlezer-compatibiliteit
- **Professionele uitstraling**: Schone, academisch-georiënteerde presentatie geschikt voor enterprise learning
- **Leerervaring**: Gestructureerde aanpak met duidelijke doelstellingen en resultaten per les
- **Inhoudsorganisatie**: Betere logische samenhang en verbinding tussen gerelateerde onderwerpen

### [v1.0.0] - 2025-09-09

#### Eerste release - Uitgebreide AZD leerrepository

#### Toegevoegd
- **Kernstructuur documentatie**
  - Volledige getting-started gidsreeks
  - Uitgebreide implementatie- en provisioningdocumentatie
  - Gedetailleerde troubleshooting-bronnen en debugginghandleidingen
  - Pre-deployment validatietools en procedures

- **Getting started module**
  - AZD Basics: Kernconcepten en terminologie
  - Installatiehandleiding: Platformspecifieke setupinstructies
  - Configuratiehandleiding: Omgevingsinstellingen en authenticatie
  - Eerste projecttutorial: Stapsgewijze praktische leeractiviteit

- **Deployment en provisioning module**
  - Deployment handleiding: Complete workflow documentatie
  - Provisioninghandleiding: Infrastructure as Code met Bicep
  - Best practices voor productie-implementaties
  - Multi-service architectuurpatronen

- **Pre-deployment validatiemodule**
  - Capaciteitsplanning: Validatie beschikbaarheid Azure resources
  - SKU selectie: Uitgebreide service tier-richtlijnen
  - Pre-flight checks: Geautomatiseerde validatiescripts (PowerShell en Bash)
  - Kostenraming en budgetplanningshulpmiddelen

- **Troubleshooting module**
  - Veelvoorkomende problemen: Frequent voorkomende issues en oplossingen
  - Debugginghandleiding: Systematische probleemoplossmethodieken
  - Geavanceerde diagnostische technieken en tools
  - Prestatiemonitoring en optimalisatie

- **Bronnen en referenties**
  - Commando-spiekbriefje: Snelle referentie voor essentiële commando’s
  - Woordenlijst: Uitgebreide terminologie- en acroniemenverklaringen
  - FAQ: Uitgebreide antwoorden op veelgestelde vragen
  - Externe bronnen links en community koppelingen

- **Voorbeelden en sjablonen**
  - Eenvoudig webapplicatievoorbeeld
  - Statisch website-deployment sjabloon
  - Containerapplicatieconfiguratie
  - Database-integratiepatronen
  - Microservices architectuurvoorbeelden
  - Serverless functie-implementaties

#### Kenmerken
- **Multi-platform ondersteuning**: Installatie- en configuratiehandleidingen voor Windows, macOS en Linux
- **Meerdere vaardigheidsniveaus**: Inhoud ontworpen voor studenten tot professionele ontwikkelaars
- **Praktische focus**: Hands-on voorbeelden en scenario’s uit de praktijk
- **Omvattende dekking**: Van basisconcepten tot geavanceerde enterprise-patronen
- **Security-first aanpak**: Beveiligingsbest practices geïntegreerd door de gehele inhoud
- **Kostenoptimalisatie**: Richtlijnen voor kosteneffectieve implementaties en resourcebeheer

#### Documentatiekwaliteit
- **Gedetailleerde codevoorbeelden**: Praktische, geteste codesamples
- **Stapsgewijze instructies**: Duidelijke, uitvoerbare richtlijnen
- **Uitgebreide foutafhandeling**: Troubleshooting voor veelvoorkomende problemen
- **Integratie beste praktijken**: Industriestandaarden en aanbevelingen
- **Versiecompatibiliteit**: Up-to-date met nieuwste Azure services en azd-functies

## Geplande toekomstige verbeteringen

### Versie 3.1.0 (Gepland)
#### Uitbreiding AI-platform
- **Multi-model ondersteuning**: Integratiepatronen voor Hugging Face, Azure Machine Learning en custom modellen
- **AI-agentframeworks**: Sjablonen voor LangChain, Semantic Kernel en AutoGen implementaties
- **Geavanceerde RAG-patronen**: Vector database-opties buiten Azure AI Search (Pinecone, Weaviate, etc.)
- **AI-observability**: Verbeterde monitoring voor modelprestaties, tokengebruik en responskwaliteit

#### Developerervaring
- **VS Code extensie**: Geïntegreerde AZD + Microsoft Foundry ontwikkelervaring
- **GitHub Copilot integratie**: AI-ondersteunde AZD-sjabloongeneratie
- **Interactieve tutorials**: Hands-on codeeroefeningen met geautomatiseerde validatie voor AI-scenario’s
- **Videomateriaal**: Aanvullende videotutorials voor visuele leerlingen met focus op AI-implementaties

### Versie 4.0.0 (Gepland)
#### Enterprise AI-patronen
- **Governance-framework**: AI-model governance, compliance en audit-trails
- **Multi-tenant AI**: Patronen voor het bedienen van meerdere klanten met geïsoleerde AI-services
- **Edge AI-implementatie**: Integratie met Azure IoT Edge en containerinstanties
- **Hybride cloud AI**: Multi-cloud en hybride implementatiepatronen voor AI workloads

#### Geavanceerde functionaliteit
- **AI-pijplijn automatisering**: MLOps-integratie met Azure Machine Learning-pijplijnen
- **Geavanceerde beveiliging**: Zero-trust patronen, private endpoints en geavanceerde bedreigingsbescherming
- **Prestatieoptimalisatie**: Geavanceerde tuning- en schaalstrategieën voor AI-applicaties met hoge doorvoer
- **Wereldwijde distributie**: Content delivery en edge caching-patronen voor AI-toepassingen

### Versie 3.0.0 (Gepland) - Overtroffen door huidige release
#### Voorgestelde toevoegingen - Nu geïmplementeerd in v3.0.0
- ✅ **AI-gecentreerde inhoud**: Uitgebreide Microsoft Foundry-integratie (Voltooid)
- ✅ **Interactieve tutorials**: Hands-on AI-workshoplab (Voltooid)
- ✅ **Geavanceerde beveiligingsmodule**: AI-specifieke beveiligingspatronen (Voltooid)
- ✅ **Prestatieoptimalisatie**: AI workload afstemming strategieën (Voltooid)

### Versie 2.1.0 (Gepland) - Gedeeltelijk geïmplementeerd in v3.0.0
#### Kleine verbeteringen - Sommige voltooid in huidige release
- ✅ **Extra voorbeelden**: AI-gerichte implementatiescenario’s (Voltooid)
- ✅ **Uitgebreide FAQ**: AI-specifieke vragen en probleemoplossing (Voltooid)
- **Toolintegratie**: Verbeterde IDE en editor integratiehandleidingen
- ✅ **Monitoring uitbreiding**: AI-specifieke monitoring- en alarmpatronen (Voltooid)

#### Nog gepland voor toekomstige release
- **Mobielvriendelijke documentatie**: Responsief ontwerp voor mobiel leren
- **Offline toegang**: Downloadbare documentatiepakketten
- **Verbeterde IDE-integratie**: VS Code-extensie voor AZD + AI-workflows
- **Community dashboard**: Realtime communitystatistieken en bijdrage-tracking

## Bijdragen aan de changelog

### Wijzigingen rapporteren
Bij bijdragen aan deze repository, zorg ervoor dat changelog-items het volgende bevatten:

1. **Versienummer**: Volgt semantische versiebeheer (major.minor.patch)
2. **Datum**: Release- of update datum in formaat JJJJ-MM-DD
3. **Categorie**: Toegevoegd, Gewijzigd, Verouderd, Verwijderd, Opgelost, Beveiliging
4. **Duidelijke omschrijving**: Beknopte beschrijving van de wijziging
5. **Impactbeoordeling**: Hoe wijzigingen bestaande gebruikers beïnvloeden

### Wijzigingscategorieën

#### Toegevoegd
- Nieuwe functies, documentatiesecties of mogelijkheden
- Nieuwe voorbeelden, sjablonen of leerbronnen
- Extra tools, scripts of utilities

#### Gewijzigd
- Wijzigingen aan bestaande functionaliteit of documentatie
- Updates ter verbetering van helderheid of nauwkeurigheid
- Herstructurering van inhoud of organisatie

#### Verouderd
- Functies of benaderingen die worden uitgefaseerd
- Documentatiesecties die gepland staan voor verwijdering
- Methoden die betere alternatieven hebben

#### Verwijderd
- Functies, documentatie of voorbeelden die niet langer relevant zijn
- Verouderde informatie of verouderde benaderingen
- Redundante of geconsolideerde inhoud

#### Opgelost
- Correcties van fouten in documentatie of code
- Oplossingen van gerapporteerde problemen
- Verbeteringen van nauwkeurigheid of functionaliteit


#### Beveiliging
- Verbeteringen of fixes gerelateerd aan beveiliging
- Updates van best practices op het gebied van beveiliging
- Oplossing van beveiligingsproblemen

### Richtlijnen voor Semantische Versiebeheer

#### Major Versie (X.0.0)
- Brekende wijzigingen die actie van de gebruiker vereisen
- Belangrijke herstructurering van inhoud of organisatie
- Wijzigingen die de fundamentele aanpak of methode wijzigen

#### Minor Versie (X.Y.0)
- Nieuwe functies of toevoegingen aan de inhoud
- Verbeteringen die achterwaartse compatibiliteit behouden
- Extra voorbeelden, tools of bronnen

#### Patch Versie (X.Y.Z)
- Bugfixes en correcties
- Kleine verbeteringen aan bestaande inhoud
- Verduidelijkingen en kleine aanpassingen

## Feedback en Suggesties vanuit de Community

We moedigen actief feedback van de community aan om deze leermiddelen te verbeteren:

### Hoe Feedback te Geven
- **GitHub Issues**: Meld problemen of stel verbeteringen voor (AI-specifieke issues zijn welkom)
- **Discord Discussies**: Deel ideeën en ga in gesprek met de Microsoft Foundry community
- **Pull Requests**: Lever directe verbeteringen aan de inhoud, vooral AI-templates en handleidingen
- **Microsoft Foundry Discord**: Neem deel aan het #Azure-kanaal voor AZD + AI-discussies
- **Community Forums**: Neem deel aan bredere Azure ontwikkelaar discussies

### Feedback Categorieën
- **Nauwkeurigheid AI Inhoud**: Correcties aan AI service integratie en implementatie-informatie
- **Leerervaring**: Suggesties voor verbeterde AI ontwikkelaar leerprocessen
- **Ontbrekende AI Inhoud**: Verzoeken om extra AI-templates, patronen of voorbeelden
- **Toegankelijkheid**: Verbeteringen voor diverse leerbehoeften
- **Integratie AI Tools**: Suggesties voor betere integratie in AI ontwikkelworkflow
- **Productie AI Patronen**: Verzoeken voor enterprise AI implementatiepatronen

### Reactie Verplichting
- **Issue Reactie**: Binnen 48 uur voor gemelde problemen
- **Feature Verzoeken**: Evaluatie binnen een week
- **Community Bijdragen**: Review binnen een week
- **Beveiligingsproblemen**: Prioriteit met versnelde reactie

## Onderhoudsschema

### Regelmatige Updates
- **Maandelijkse Reviews**: Nauwkeurigheid inhoud en linkvalidatie
- **Kwartaalupdates**: Belangrijke inhoudelijke toevoegingen en verbeteringen
- **Halfjaarlijkse Reviews**: Uitgebreide herstructurering en verbeteringen
- **Jaarlijkse Releases**: Major versie-updates met significante verbeteringen

### Monitoring en Kwaliteitswaarborg
- **Geautomatiseerde Tests**: Regelmatige validatie van codevoorbeelden en links
- **Integratie van Community Feedback**: Regelmatige verwerking van gebruikerssuggesties
- **Technologie Updates**: Afstemming op de nieuwste Azure services en azd releases
- **Toegankelijkheidsaudits**: Regelmatige beoordeling van inclusieve ontwerpprincipes

## Versie Ondersteuningsbeleid

### Huidige Versie Ondersteuning
- **Laatste Major Versie**: Volledige ondersteuning met regelmatige updates
- **Vorige Major Versie**: Beveiligingsupdates en kritieke fixes gedurende 12 maanden
- **Legacy Versies**: Alleen community-ondersteuning, geen officiële updates

### Migratie Richtlijnen
Wanneer major versies worden uitgebracht, bieden wij:
- **Migratiehandleidingen**: Stapsgewijze overstapinstructies
- **Compatibiliteitsnotities**: Details over brekende wijzigingen
- **Toolondersteuning**: Scripts of hulpmiddelen om migratie te vergemakkelijken
- **Community Ondersteuning**: Toegewijde forums voor migratievragen

---

**Navigatie**
- **Vorige Les**: [Studiegids](resources/study-guide.md)
- **Volgende Les**: Terug naar [Hoofd README](README.md)

**Blijf Op de Hoogte**: Volg deze repository voor meldingen over nieuwe releases en belangrijke updates aan het leermateriaal.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->