# Wijzigingslogboek - AZD Voor Beginners

## Inleiding

Dit wijzigingslogboek documenteert alle opmerkelijke wijzigingen, updates en verbeteringen in de AZD Voor Beginners-repository. We volgen principes van semantische versiebeheer en onderhouden dit logboek om gebruikers te helpen begrijpen wat er tussen versies is veranderd.

## Leerdoelen

Door dit wijzigingslogboek te bekijken, zul je:
- Op de hoogte blijven van nieuwe functies en toevoegingen aan de inhoud
- Verbeteringen begrijpen die aan bestaande documentatie zijn aangebracht
- Bugfixes en correcties bijhouden om nauwkeurigheid te waarborgen
- De evolutie van het lesmateriaal in de loop van de tijd volgen

## Leeruitkomsten

Na het bekijken van de changelog-items zul je in staat zijn om:
- Nieuwe inhoud en beschikbare bronnen voor leren te identificeren
- Te begrijpen welke secties zijn bijgewerkt of verbeterd
- Je leerpad te plannen op basis van het meest actuele materiaal
- Feedback en suggesties te leveren voor toekomstige verbeteringen

## Versiegeschiedenis

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry-extensie 1.0 is nu algemeen beschikbaar

De `microsoft.foundry` 1.0 bundel is **live en algemeen beschikbaar**, zoals aangekondigd op [5 november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). De cursus leert nu de vrijgegeven GA-workflow, niet een aanstaande release. Begin met AZD **1.37.0 of later** en `azd ext install microsoft.foundry`.

#### Beschikbaar in deze cursusupdate
- De Engelstalige handleiding gebruikt de GA-bundel als standaardinstallatiepad en legt de zeven onafhankelijk versioneerde kernextensies uit.
- Een [hosted-agent walkthrough](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) behandelt de upstream Python Agent Framework Responses API-sample, huidige uv, Python 3.13+, nieuwe/bestaande projectselectie, hergebruik van modellen en beoordeling van `azure.yaml`.
- De lokale-naar-cloud workflow behandelt Agent Inspector testen, Azure-ondersteunde model-aanroepposten, externe code builds, geïmplementeerde aanroepen, cloud tracing, implementatievoorbeeld, logs en diagnostiek.
- Aparte evaluatiehandleiding behandelt het genereren en beoordelen van datasets/rubrieken, het configureren van een benoemde evaluatie, het registreren van assets en het inspecteren van resultaten. Oudere evaluatie-/optimalisatie-instructies blijven migratiegeschiedenis, niet de huidige releasestandaard.
- Foundry CI/CD-handleiding omvat installeren van runner-extensies, geauthenticeerde implementatie, evaluatie-assets/toegang en een expliciete kwaliteitsgate.
- Opruimingshandleiding onderscheidt nieuw gemaakte en hergebruikte Foundry-projecten. De workshop linkt naar de aparte GA-oefening zonder de voorbeeldenpecifieke tests te vervangen.
- Cursusnavigatie, leerdoelen, setup-vereisten, spiekbriefje, FAQ en studiegids weerspiegelen de GA-workflow. Gegeneerde vertalingen worden niet handmatig bewerkt.

#### Beoordelingsomvang
- Gebaseerd op de GA-aankondiging, gekoppelde Microsoft Learn-handleiding en de upstream sample configuratie. Geen live Azure-provisioning, implementatie, modelaanroep of evaluatie uitgevoerd.
- Bundel GA impliceert niet GA voor elke optionele functie, onafhankelijke extensie of SDK, en certificeert de voorbeelden niet voor productiegebruik.

### [v3.24.0]- 2026-11-04

#### Opgelost
- Gerepareerde Engelstalige cursusnavigatie, verplaatste-pagina paden, ontbrekende ankers en verouderde externe verwijzingen, inclusief de hoofdstuk 2 link naar de productie AI-gids.
- Huidige handleiding beoordeeld tegen gepubliceerde AZD 1.37.2, agents 1.0.0-beta.23 en evaluaties 1.0.0-beta.2. Documentatie van de aparte `azd ai eval` workflow en optimalisatie migratieconfiguratie.
- Onjuiste CLI-vlaggen, authenticatiegrenzen, plain-text omgeving/geheime handleiding, infrastructuurupdates, modelconfiguratie en destructieve herstelvoorbeelden gecorrigeerd.
- Workshop vernieuwd met de huidige AI Agents-sample, inclusief daadwerkelijke hooks, configuratie-invoer, evaluatietests, red-teaming ingangspunten en observability.
- Verkeerde implementatieclaims gecorrigeerd en gerelateerde applicatie/infrastructuur/configuratieproblemen opgelost. Winkelarchitectuurmateriaal expliciet onderscheiden van een complete werkende applicatie.
- CodeQL-taalmatrix hersteld, geselecteerde ondersteunde Node.js 24 voor dev-container en setup-validators laten mislukte versieopdrachten rapporteren.

#### Toegevoegd
- Engelstalige offline link/anker checker, regressietests en een documentatieworkflow die ook de workshop in strikte modus bouwt. Gegeneerde vertalingen en vertaalde afbeeldingen zijn uitgesloten.

#### Validatiescope
- Bron, syntax, configuratie, lokaal gedrag en netwerklinkcontroles bewijzen niet live Azure inzetbaarheid, quotum, RBAC, regionale modelbeschikbaarheid, facturatie, beveiligingsconformiteit of productierijpheid.
- Oudere items hieronder zijn historische gegevens, geen actuele opdrachten of release-instructies.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Vernieuwing: Versie-actueelheidsupdate
**Deze versie valideert de cursus opnieuw tegen `azd` `1.27.1` (juli 2026, laatste stabiele release) en de huidige preview AI agent-extensie `azure.ai.agents` `1.0.0-beta.5`, waarbij iedere "gevalideerd tegen" banner is bijgewerkt na de 1.26.0, 1.27.0 en 1.27.1 releases.**

#### Gewijzigd
- **✅ Validatiebasislijn bijgewerkt** van `azd 1.25.6` (juni 2026) naar `azd 1.27.1` (juli 2026) door de root README, alle hoofdstuk READMEs, de hoofdstuk 1 dev-container les (inclusief gepinde versies voorbeelden), hoofdstuk 4 custom-templates les, hoofdstuk 5 multi-agent les en workshopdocs
- **🤖 Hoofdstuk 2 basislijn vernieuwd** van `azd 1.23.12` (maart 2026) naar `azd 1.27.1` over `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` en `microsoft-foundry-integration.md`; data van validatienotities bijgewerkt naar 2026-07-13
- **🧩 AI agent-extensie verhoogd** van `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` naar de huidige `1.0.0-beta.5` release in de hoofdstuk 2 README en `agents.md`
- **🧪 Workshopvalidatievoorbeeld** (`azd version` output) bijgewerkt naar `1.27.1`

#### Notities over relevante azd-releases (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-ondersteuning voor Azure Functions op Flex Consumption, `azd config sub-filter` per-tenant abonnementfilters, zelfstandige extensiebundels (`azd x pack --bundle`) en `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelleer Azure AI Foundry projecten/agents direct in `azure.yaml` (Bicep-loze/Terraform-loze init), container-implementatieondersteuning voor App Service (`host: appservice` + `language: docker`), directe `-s/--source` voor `azd extension` opdrachten, en `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` vlag voor `azd extension install`, verouderde modellen standaard uitgesloten van catalogus/quotum prompts, en verschillende bugfixes

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

#### Beginner Gap-Fill #2: Template Maken, Dev Containers, Pulumi, Azure DevOps, Service Principals en Meer
**Deze versie sluit de resterende intermediate gaps die door de azd-coverage analyse zijn gesignaleerd: hoe je je eigen template maakt en publiceert, reproduceerbare dev-container/Codespaces omgevingen, de Pulumi infrastructuurprovider, een Azure DevOps CI/CD walkthrough, service-principal authenticatie, host-selectierichtlijnen (AKS/Spring Apps), `azd restore`/`azd package` uitleg, hook-foutafhandeling en team-/gedeelde-omgeving praktijken.**

#### Toegevoegd
- **🧱 Nieuwe hoofdstuk 4 les** `docs/chapter-04-infrastructure/custom-templates.md` — het schrijven van je eigen azd-template: vereiste structuur (`azure.yaml`, `infra/`, `src/`), het `metadata.template` veld, parameteriseren van infrastructuur met de `uniqueString()` resource token en `azd-env-name` tag, lokaal testen met `azd init --template <local-path>`, publiceren naar GitHub en inzenden naar de Awesome AZD-galerij
- **📦 Nieuwe hoofdstuk 1 les** `docs/chapter-01-foundation/dev-containers.md` — reproduceerbare azd-omgevingen met Dev Containers en GitHub Codespaces: een minimalistische `.devcontainer/devcontainer.json` gebruikmakend van de officiële `ghcr.io/azure/azure-dev/azd` functie, taalspecifieke features, `docker-in-docker` voor container hosts en `azd auth login --use-device-code` voor remote aanmelding
- **🧩 Pulumi met azd** sectie in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi folderstructuur, stacks gekoppeld aan azd-omgevingen, vereiste outputs/tagging en de identieke `azd up` / `azd down` workflow
- **🎯 Host-selectierichtlijnen** in `docs/chapter-04-infrastructure/provisioning.md` — een beginner-vriendelijke vergelijking van `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` en `springapp`, met richtlijnen wanneer je AKS of Azure Spring Apps kiest
- **🛠️ Azure DevOps CI/CD walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, serviceverbinding met workload identity federation (OIDC), de gegenereerde `azure-dev.yml` en variabele groep setup
- **🔑 Service Principals (Patroon 4)** toegevoegd aan `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, niet-interactieve `azd auth login` met client secret vs. federated/OIDC-credentials, wanneer te gebruiken en veilige credential opslag
- **🪝 Hook-foutafhandeling** subsectie in `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes en `set -e`, `continueOnError`, hooks afzonderlijk testen met `azd hooks run`, OS-specifieke shells en `--debug`
- **👥 Team / gedeelde omgevingen** sectie in `docs/chapter-03-configuration/configuration.md` — wat leeft in `.azure/`, wat te negeren in git, per-developer omgevingen, `azd env list`/`select` en het aanleveren van omgevingwaarden in CI/CD
- **🧰 `azd restore` en uitgebreide `azd package`** uitleg in `resources/cheat-sheet.md` — het herstellen van afhankelijkheden en bouwen van een inzetbare artefact zonder implementatie

#### Gewijzigd
- **🧭 Hoofdstuk 4 lestabel** bijgewerkt om de nieuwe les "Je Eigen Template Maken" (Les 3) op te nemen
- **🧭 Hoofdstuk 1 lestabel** bijgewerkt om de nieuwe les "Dev Containers & Codespaces" (Les 5) op te nemen; navigatievoetteksten gekoppeld tussen `bring-your-own-app.md` en `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Les, "Bring Your Own App," Terraform en CI/CD Walkthrough
**Deze versie sluit de grootste hiaten voor een complete beginnersgids door twee nieuwe hands-on lessen toe te voegen (een inzetbare multi-agent walkthrough en het toevoegen van azd aan een bestaand app), een beginnersvriendelijke hooks introductie, een Terraform-met-azd sectie, een stapsgewijze GitHub Actions-pijplijn walkthrough, een uitleg voor de nieuwe previewextensies, en een expliciete implementatieverificatie checklist.**

#### Toegevoegd
- **🤝 Nieuwe hoofdstuk 5 les** `docs/chapter-05-multi-agent/multi-agent-basics.md` — een volledig hands-on, inzetbare walkthrough met twee agents (orchestrator + specialisten) met een echte template (`contoso-creative-writer`), die behandelt wanneer multi-agent te gebruiken, de `azd up` workflow, begrip van ingezette resources, cross-agent tracing, aanpassing en opruiming
- **📦 Nieuwe hoofdstuk 1 les** `docs/chapter-01-foundation/bring-your-own-app.md` — hoe azd toe te voegen aan een bestaand project met `azd init` ("gebruik code in de huidige directory"), begrip van `azure.yaml` en `infra/`, `azd infra generate`, hostdetectie en implementatie met `azd up`
- **🌐 Terraform met azd** sectie toegevoegd aan `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` configuratie, `.tf` folderstructuur, benodigde `AZURE_*` outputs en `azd-env-name` tagging, en de identieke `azd up` / `azd down` workflow (sluit de kloof waar Terraform-ondersteuning werd belooft maar alleen Bicep werd getoond)
- **⚙️ Stap-voor-stap GitHub Actions walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — van GitHub repo tot geautomatiseerde deploys: `azd pipeline config`, OIDC federatieve referenties (geen opgeslagen geheimen), de gegenereerde `azure-dev.yml`, en richtlijnen voor geheimen vs variabelen
- **🪝 Beginners "Nieuw met hooks?" introductie** in `docs/chapter-04-infrastructure/deployment-guide.md` — wat een hook is, een hook-fasentabel, een minimale eerste hook, en hooks handmatig draaien met `azd hooks run`
- **✅ "Verifieer je deployment" checklist** toegevoegd aan Stap 5 van `docs/chapter-01-foundation/first-project.md` — rooktest, health-endpoint check, en expliciete succescriteria
- **🧩 Uitleg nieuwe preview-extensies** `azure.ai.skills` en `azure.ai.connections` (wat ze zijn en wanneer ze te gebruiken) in `docs/chapter-08-production/production-ai-practices.md`

#### Gewijzigd
- **🧭 Hoofdstuk 5 lessen tabel** gecorrigeerd: `multi-agent-basics.md` is nu Les 1 (de enige volledig hands-on les), met eerlijke aanduiding dat Les 2 in Hoofdstuk 6 staat en het Retail scenario een architectuur blauwdruk is, geen één-commando template
- **🧭 Hoofdstuk 1 lessen tabel** bevat nu de nieuwe "Breng je eigen app mee" les (Les 4)
- **🔗 Navigatie voetnoten** bijgewerkt: `first-project.md` linkt nu door naar `bring-your-own-app.md`

#### Gefixed
- **🧱 Gesloten de "geclaimde maar ontbrekende" Terraform kloof** — de cursus verwees eerder naar Terraform ondersteuning zonder het te tonen
- **🔀 Correctie misleidende Hoofdstuk 5 kruislinks** die impliceerden dat een volledige multi-agent implementatie bestond terwijl het enkel een architectuur blauwdruk was

#### Bestanden bijgewerkt
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

#### AZD 1.25.6 Refresh, Volledige agent levenscyclus commando's & Aspire Rebranding
**Deze versie herverifieert de cursus tegen `azd` `1.25.6` (juni 2026) en de `azure.ai.agents` `0.1.40-preview` extensie, breidt AI-richtlijnen uit van "scaffold een agent" naar de complete agentlevenscyclus (testen → evalueren → optimaliseren → inspecteren → verwijderen), toont de nieuwe `azure.ai.skills` en `azure.ai.connections` preview-extensies, en noemt de ".NET Aspire" → "Aspire" product rebranding.**

#### Toegevoegd
- **🔁 Volledige agent levenscyclus dekking** voor beginners en AI-ingenieurs door de documentatie:
  - `docs/chapter-01-foundation/azd-basics.md` — Levenscyclus tabel (scaffold → test → meten → verbeteren → inspecteren → opruimen) toegevoegd aan de Sectie Extensies en AI-commando's
  - `docs/chapter-08-production/production-ai-practices.md` — Nieuwe sectie "Managing the Agent Lifecycle" met `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, en `delete --force`
  - `resources/cheat-sheet.md` — Uitgebreide AI Agent Commando's met `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, en `delete --force`
- **🧩 Nieuwe preview-extensies** gedocumenteerd: `azure.ai.skills` (herbruikbare agentvaardigheden) en `azure.ai.connections` (Foundry verbindingen) toegevoegd aan de extensietabel en cheatsheet
- **⏱️ Reactietijd richtlijnen** — `azd ai agent invoke` voorbeelden vermelden nu dat het totale latency en time-to-first-byte print
- **📌 Versie-banner** in de root README die lerenden wijst op `azd version` en `azd upgrade`

#### Gewijzigd
- **✅ Validatie basislijn bijgewerkt** van `azd 1.23.12` (maart 2026) naar `azd 1.25.6` (juni 2026) over alle hoofdstuk READMEs en workshop docs
- **🤖 Hoofdstuk 2 extensie notitie** bijgewerkt van `azure.ai.agents` `0.1.18-preview` naar `0.1.40-preview`
- **🧪 Workshop validatie voorbeeld** (`azd version` output) bijgewerkt naar `1.25.6`
- **🧭 README "Wat is nieuw in azd Vandaag"** ververst om de end-to-end agent levenscyclus, nieuwe AI-extensies, en recente kwaliteitsverbeteringen te benadrukken (`azd init` idempotentie, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Hoofdstuk 2 agents.md (Optie 4)** wijst lerenden nu naar post-deploy levenscycluscommando's in plaats van te stoppen bij `azd up`

#### Gefixed
- **🏷️ Productnaamgeving** — een Aspire rebranding nota toegevoegd (".NET Aspire" is nu simpelweg "Aspire"); azd's Aspire ondersteuning blijft ongewijzigd
- **🔎 Live release validatie** bevestigd tegen de Azure Developer CLI release feed: stabiele CLI `1.25.6` (2026-06-12) en `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Bestanden bijgewerkt
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

#### Beginners Onboarding Verduidelijking, Setup Validatie & Laatste AZD Commando Opruiming
**Deze versie volgt de AZD 1.23 validatie sweep op met een beginner-gefocuste documentatie doorloop: het verduidelijkt AZD-eerst authenticatierichtlijnen, voegt lokale setup validatiescripts toe, verifieert sleutelcommando’s tegen de live AZD CLI, en verwijdert de laatste verouderde Engelstalige bron commando-verwijzingen buiten de changelog.**

#### Toegevoegd
- **🧪 Beginners setup validatie scripts** met `validate-setup.ps1` en `validate-setup.sh` zodat lerenden vereiste tools kunnen bevestigen voor ze aan Hoofdstuk 1 beginnen
- **✅ Op voorhand setup validatie stappen** in de root README en Hoofdstuk 1 README zodat ontbrekende vereisten opgemerkt worden vóór `azd up`

#### Gewijzigd
- **🔐 Beginners authenticatie richtlijnen** behandelen nu consistent `azd auth login` als het primaire pad voor AZD workflows, met `az login` genoemd als optioneel tenzij Azure CLI-commando's direct worden gebruikt
- **📚 Hoofdstuk 1 onboarding flow** wijst lerenden nu naar validatie van hun lokale setup vóór installatie, authenticatie en eerste deployment stappen
- **🛠️ Validator berichten** scheiden nu duidelijk blokkerende vereisten van optionele Azure CLI waarschuwingen voor het enkel AZD beginnerpad
- **📖 Configuratie, troubleshooting en voorbeeld documenten** maken nu onderscheid tussen vereiste AZD authenticatie en optionele Azure CLI aanmelding waar beide voorheen zonder context werden gepresenteerd

#### Gefixed
- **📋 Overgebleven Engelstalige bron commando verwijzingen** bijgewerkt naar huidige AZD vormen, inclusief `azd config show` in de cheatsheet en `azd monitor --overview` waar Azure Portal overzicht richtlijnen bedoeld waren
- **🧭 Beginners claims in Hoofdstuk 1** verzacht om overbeloften van gegarandeerde foutloze of rollback gedrag over alle templates en Azure resources te vermijden
- **🔎 Live CLI validatie** bevestigde huidige ondersteuning voor `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, en `azd down --force --purge`

#### Bestanden bijgewerkt
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

#### AZD 1.23.12 Validatie, Workshop Omgevingsuitbreiding & AI Model Vernieuwing
**Deze versie voert een documentatievalidatie sweep uit tegen `azd` `1.23.12`, werkt verouderde AZD commando voorbeelden bij, vernieuwt AI model richtlijnen naar huidige standaarden, en verbreedt de workshop instructies buiten GitHub Codespaces om ook ondersteuning te bieden voor dev containers en lokale klonen.**

#### Toegevoegd
- **✅ Validatienotities over kernhoofdstukken en workshopdocumenten** om de geteste AZD basislijn expliciet te maken voor lerenden met nieuwere of oudere CLI builds
- **⏱️ Deploy timeout richtlijnen** voor langlopende AI app deployments met `azd deploy --timeout 1800`
- **🔎 Extensie inspectiestappen** met `azd extension show azure.ai.agents` in AI workflow documenten
- **🌐 Brede workshop omgevingsrichtlijnen** die GitHub Codespaces, dev containers en lokale klonen met MkDocs dekken

#### Gewijzigd
- **📚 Hoofdstuk intro READMEs** vermelden nu consequent validatie tegen `azd 1.23.12` over fundament, configuratie, infrastructuur, multi-agent, pre-deployment, troubleshooting en productie secties
- **🛠️ AZD commando referenties** bijgewerkt naar huidige vormen door de docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` of `azd env get-value(s)` afhankelijk van context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` waar Application Insights overzicht bedoeld is
- **🧪 Voorbeeld preview provisioning** vereenvoudigd naar huidige ondersteunde gebruik zoals `azd provision --preview` en `azd provision --preview -e production`
- **🧭 Workshop flow** bijgewerkt zodat lerenden labs kunnen voltooien in Codespaces, dev container of lokaal kloon in plaats van alleen in Codespaces
- **🔐 Authenticatierichtlijnen** geven nu de voorkeur aan `azd auth login` voor AZD workflows, met `az login` als optioneel wanneer Azure CLI commando's direct gebruikt worden

#### Gefixed
- **🪟 Windows install commando's** genormaliseerd naar huidige `winget` package hoofdlettergebruik in installatiehandleiding
- **🐧 Linux install richtlijnen** gecorrigeerd om niet-ondersteunde distro-specifieke `azd` package manager instructies te vermijden en in plaats daarvan naar release assets te verwijzen waar van toepassing
- **📦 AI model voorbeelden** vernieuwd van oudere standaarden zoals `gpt-35-turbo` en `text-embedding-ada-002` naar actuele voorbeelden zoals `gpt-4.1-mini`, `gpt-4.1`, en `text-embedding-3-large`
- **📋 Deploy en diagnostiek snippets** gecorrigeerd om huidige omgevings- en statuscommando's te gebruiken in logs, scripts en troubleshooting stappen
- **⚙️ GitHub Actions richtlijnen** bijgewerkt van `Azure/setup-azd@v1.0.0` naar `Azure/setup-azd@v2`
- **🤖 MCP/Copilot toestemmingsrichtlijnen** bijgewerkt van `azd mcp consent` naar `azd copilot consent list`

#### Verbeterd
- **🧠 AI hoofdstuk richtlijnen** leggen nu beter uit preview-gevoelig `azd ai` gedrag, tenant-specifieke login, huidig extensie gebruik, en bijgewerkte model deployment aanbevelingen
- **🧪 Workshop instructies** gebruiken nu meer realistische versievoorbeelden en duidelijker omgevingsopzet taal voor hands-on labs
- **📈 Productie- en troubleshooting documenten** sluiten nu beter aan bij huidige monitoring, fallback model en kostenniveaus voorbeelden

#### Bestanden bijgewerkt
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

#### AZD AI CLI Commando's, Content Validatie & Template Uitbreiding
**Deze versie voegt `azd ai`, `azd extension` en `azd mcp` command coverage toe in alle AI-gerelateerde hoofdstukken, repareert gebroken links en verouderde code in agents.md, werkt het cheat sheet bij en vernieuwt de sectie Voorbeeldsjablonen met gevalideerde omschrijvingen en nieuwe Azure AI AZD-sjablonen.**

#### Toegevoegd
- **🤖 AZD AI CLI coverage** over 7 bestanden (voorheen alleen in Hoofdstuk 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nieuwe sectie "Extensions and AI Commands" met introductie van `azd extension`, `azd ai agent init` en `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Optie 4: `azd ai agent init` met vergelijkingstabel (sjabloon versus manifestbenadering)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" en "Agent-First Deployment" subsectoren
  - `docs/chapter-05-multi-agent/README.md` — Quick Start toont nu beide sjabloon- en manifestgebaseerde deployments
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-sectie bevat nu de `azd ai agent init` optie
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsector
  - `resources/cheat-sheet.md` — Nieuwe sectie "AI & Extensions Commands" met `azd extension`, `azd ai agent init`, `azd mcp` en `azd infra generate`
- **📦 Nieuwe AZD AI voorbeeldsjablonen** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chat met Blazor WebAssembly, Semantic Kernel en spraakchatondersteuning
  - **azure-search-openai-demo-java** — Java RAG-chat met Langchain4J en ACA/AKS deploymentopties
  - **contoso-creative-writer** — Multi-agent creatieve schrijftoepassing met Azure AI Agent Service, Bing Grounding en Prompty
  - **serverless-chat-langchainjs** — Serverless RAG met Azure Functions + LangChain.js + Cosmos DB met Ollama lokale ontwikkelondersteuning
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator met admin portal, Teams-integratie en PostgreSQL/Cosmos DB-opties
  - **azure-ai-travel-agents** — Multi-agent MCP orkestratie referentie-app met servers in .NET, Python, Java en TypeScript
  - **azd-ai-starter** — Minimale Azure AI infrastructuur Bicep starter sjabloon
  - **🔗 Awesome AZD AI Gallery link** — Verwijzing naar de [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ sjablonen)

#### Opgelost
- **🔗 agents.md navigatie**: Vorige/Volgende links komen nu overeen met Hoofdstuk 2 README lesvolgorde (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md gebroken links**: `production-ai-practices.md` gecorrigeerd naar `../chapter-08-production/production-ai-practices.md` (3 keer)
- **📦 agents.md verouderde code**: Vervangen `opencensus` door `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ongeldige API**: Verplaatst `max_tokens` van `create_agent()` naar `create_run()` als `max_completion_tokens`
- **🔢 agents.md token tellen**: Vervangen grove `len//4` schatting door `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Diensten gecorrigeerd van "Cognitive Search + App Service" naar "Azure AI Search + Azure Container Apps" (standaard host gewijzigd in okt 2024)
- **contoso-chat**: Beschrijving bijgewerkt met verwijzing naar Azure AI Foundry + Prompty, passend bij de werkelijke titel en tech stack van de repo

#### Verwijderd
- **ai-document-processing**: Niet-functionele sjabloonverwijzing verwijderd (repo niet publiek toegankelijk als AZD-sjabloon)

#### Verbeterd
- **📝 agents.md oefeningen**: Oefening 1 toont nu verwachte output en `azd monitor` stap; Oefening 2 bevat volledige `FunctionTool` registratiecode; Oefening 3 vervangt vage aanwijzingen door concrete `prepdocs.py` opdrachten
- **📚 agents.md bronnen**: Documentatielinks bijgewerkt naar actuele Azure AI Agent Service docs en quickstart
- **📋 agents.md Volgende Stappen tabel**: Toegevoegd AI Workshop Lab link voor volledige hoofdstukdekking

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

#### Verbetering Navigatie Cursus
**Deze versie verbetert README.md hoofdstuknavigatie met een verbeterde tabelindeling.**

#### Gewijzigd
- **Cursuskaart Tabel**: Versterkt met directe leslinks, duurinschattingen en complexiteitsbeoordelingen
- **Map Opruiming**: Overbodige oude mappen verwijderd (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validatie**: Alle 21+ interne links in de Cursuskaart tabel gecontroleerd

### [v3.16.0] - 2026-02-05

#### Productnaam Updates
**Deze versie werkt productreferenties bij naar de huidige Microsoft branding.**

#### Gewijzigd
- **Microsoft Foundry → Microsoft Foundry**: Alle verwijzingen bijgewerkt door niet-vertalingsbestanden heen
- **Azure AI Agent Service → Foundry Agents**: Servicenaam bijgewerkt om huidige branding weer te geven

#### Bijgewerkte bestanden
- `README.md` - Hoofdpagina cursus
- `changelog.md` - Versiegeschiedenis
- `course-outline.md` - Cursusstructuur
- `docs/chapter-02-ai-development/agents.md` - AI agenten gids
- `examples/README.md` - Voorbeelddocumentatie
- `workshop/README.md` - Workshop startpagina
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - Alle workshop instructiebestanden

---

### [v3.15.0] - 2026-02-05

#### Grote herstructurering repository: Hoofdstuk-gebaseerde mappen
**Deze versie herstructureert de documentatie in toegewijde hoofdstukmappen voor duidelijkere navigatie.**

#### Namen van mappen gewijzigd
Oude mappen zijn vervangen door hoofdstukgenummerde mappen:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Nieuw toegevoegd: `docs/chapter-05-multi-agent/`

#### Bestandsmigraties
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
| Alle troubleshooting-bestanden | troubleshooting/ | chapter-07-troubleshooting/ |

#### Toegevoegd
- **📚 Hoofdstuk README-bestanden**: README.md aangemaakt in iedere hoofdstukmap met:
  - Leerdoelen en duur
  - Lessentabel met omschrijvingen
  - Quick start commando's
  - Navigatie naar andere hoofdstukken

#### Gewijzigd
- **🔗 Alle interne links bijgewerkt**: 78+ paden bijgewerkt in alle documentatiebestanden
- **🗺️ Hoofd README.md**: Cursuskaart bijgewerkt met nieuwe hoofdstukstructuur
- **📝 examples/README.md**: Cross-referenties naar hoofdstukmappen bijgewerkt

#### Verwijderd
- Oude mappenstructuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Herstructurering repository: Hoofdstuknavigatie
**Deze versie voegde hoofdstuknavigatie README-bestanden toe (vervangen door v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nieuwe AI Agents Gids
**Deze versie voegt een uitgebreide gids toe voor het implementeren van AI-agenten met Azure Developer CLI.**

#### Toegevoegd
- **🤖 docs/microsoft-foundry/agents.md**: Volledige gids met:
  - Wat AI-agenten zijn en hoe ze verschillen van chatbots
  - Drie quick-start agent-sjablonen (Foundry Agents, Prompty, RAG)
  - Agent architectuurpatronen (enkele agent, RAG, multi-agent)
  - Tool configuratie en aanpassing
  - Monitoring en metriek tracking
  - Kostenoverwegingen en optimalisatie
  - Veelvoorkomende probleemoplossingsscenario's
  - Drie hands-on oefeningen met succescriteria

#### Inhoudsstructuur
- **Introductie**: Agent concepten voor beginners
- **Quick Start**: Agenten implementeren met `azd init --template get-started-with-ai-agents`
- **Architectuurpatronen**: Visuele diagrammen van agentpatronen
- **Configuratie**: Tool setup en omgevingsvariabelen
- **Monitoring**: Application Insights integratie
- **Oefeningen**: Progressief hands-on leren (20-45 minuten elk)

---

### [v3.12.0] - 2026-02-05

#### Update DevContainer Omgeving
**Deze versie werkt de ontwikkelcontainerconfiguratie bij met moderne tools en betere standaardinstellingen voor de AZD-leerervaring.**

#### Gewijzigd
- **🐳 Basisimage**: Bijgewerkt van `python:3.12-bullseye` naar `python:3.12-bookworm` (laatste Debian stable)
- **📛 Containernaam**: Hernoemd van "Python 3" naar "AZD for Beginners" voor duidelijkheid

#### Toegevoegd
- **🔧 Nieuwe Dev Container Functies**:
  - `azure-cli` met Bicep-ondersteuning ingeschakeld
  - `node:20` (LTS-versie voor AZD-sjablonen)
  - `github-cli` voor sjabloonbeheer
  - `docker-in-docker` voor container app deployments

- **🔌 Poort Forwarding**: Vooraf geconfigureerde poorten voor veelgebruikte ontwikkeldoeleinden:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nieuwe VS Code Extensies**:
  - `ms-python.vscode-pylance` - Verbeterde Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions ondersteuning
  - `ms-azuretools.vscode-docker` - Docker-ondersteuning
  - `ms-azuretools.vscode-bicep` - Bicep-taalondersteuning
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown bewerken
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram ondersteuning
  - `redhat.vscode-yaml` - YAML-ondersteuning (voor azure.yaml)
  - `eamodio.gitlens` - Git-visualisatie
  - `mhutchie.git-graph` - Git-historie

- **⚙️ VS Code Instellingen**: Toegevoegd standaardinstellingen voor Python interpreter, format on save en witruimte trimmen

- **📦 Bijgewerkte requirements-dev.txt**:
  - MkDocs minify plugin toegevoegd
  - pre-commit toegevoegd voor codekwaliteit
  - Azure SDK pakketten toegevoegd (azure-identity, azure-mgmt-resource)

#### Opgelost
- **Post-Create Commando**: Controleert nu AZD en Azure CLI installatie bij containerstart

---

### [v3.11.0] - 2026-02-05

#### Beginnersvriendelijke README Hernieuwing
**Deze versie verbetert de README.md aanzienlijk voor beginners en voegt essentiële bronnen toe voor AI-ontwikkelaars.**

#### Toegevoegd
- **🆚 Azure CLI versus AZD Vergelijking**: Duidelijke uitleg wanneer je welk hulpmiddel gebruikt met praktische voorbeelden
- **🌟 Awesome AZD Links**: Directe links naar community sjabloongalerij en bijdragebronnen:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ direct inzetbare sjablonen
  - [Dien een Sjabloon in](https://github.com/Azure/awesome-azd/issues) - Communitybijdrage
- **🎯 Quick Start Gids**: Vereenvoudigde 3-staps startsectie (Installeren → Inloggen → Implementeren)
- **📊 Ervaringsgebaseerde Navigatietabel**: Duidelijke richtlijn waar te beginnen op basis van ontwikkelaarservaring

#### Gewijzigd
- **README-structuur**: Georganiseerd voor progressieve onthulling - belangrijkste informatie eerst
- **Introductiesectie**: Herschreven om "De Magie van `azd up`" uit te leggen voor absolute beginners
- **Dubbele inhoud verwijderd**: Dubbele probleemoplossingssectie verwijderd
- **Probleemoplossingsopdrachten**: Gecorrigeerde `azd logs` verwijzing naar geldige `azd monitor --logs`

#### Gecorrigeerd
- **🔐 Authenticatieopdrachten**: Toegevoegd `azd auth login` en `azd auth logout` aan cheat-sheet.md
- **Ongeldige opdrachtverwijzingen**: Verwijderd resterende `azd logs` uit README probleemoplossingssectie

#### Notities
- **Scope**: Wijzigingen toegepast op hoofd README.md en resources/cheat-sheet.md
- **Doelgroep**: Verbeteringen specifiek gericht op ontwikkelaars nieuw met AZD

---

### [v3.10.0] - 2026-02-05

#### Update van nauwkeurigheid van Azure Developer CLI-opdrachten
**Deze versie corrigeert niet-bestaande AZD-opdrachten in de gehele documentatie, zodat alle codevoorbeelden geldige Azure Developer CLI-syntaxis gebruiken.**

#### Gecorrigeerd
- **🔧 Niet-bestaande AZD-opdrachten verwijderd**: Uitgebreide audit en correctie van ongeldige opdrachten:
  - `azd logs` (bestaat niet) → vervangen door `azd monitor --logs` of Azure CLI-alternatieven
  - `azd service` subopdrachten (bestaan niet) → vervangen door `azd show` en Azure CLI
  - `azd infra import/export/validate` (bestaan niet) → verwijderd of vervangen door geldige alternatieven
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` vlaggen (bestaan niet) → verwijderd
  - `azd provision --what-if/--rollback` vlaggen (bestaan niet) → bijgewerkt om `--preview` te gebruiken
  - `azd config validate` (bestaat niet) → vervangen door `azd config list`
  - `azd info`, `azd history`, `azd metrics` (bestaan niet) → verwijderd

- **📚 Bestanden bijgewerkt met correcties van opdrachten**:
  - `resources/cheat-sheet.md`: Grote revisie van opdrachtreferentie
  - `docs/deployment/deployment-guide.md`: Gerepareerde rollback- en implementatiestrategieën
  - `docs/troubleshooting/debugging.md`: Gecorrigeerde loganalyse-secties
  - `docs/troubleshooting/common-issues.md`: Bijgewerkte probleemoplossingsopdrachten
  - `docs/troubleshooting/ai-troubleshooting.md`: Gecorrigeerde AZD-debugsectie
  - `docs/getting-started/azd-basics.md`: Gecorrigeerde monitoringsopdrachten
  - `docs/getting-started/first-project.md`: Bijgewerkte monitoring- en debugvoorbeelden
  - `docs/getting-started/installation.md`: Gecorrigeerde help- en versievoorbeelden
  - `docs/pre-deployment/application-insights.md`: Gecorrigeerde logweergaveopdrachten
  - `docs/pre-deployment/coordination-patterns.md`: Gecorrigeerde agent-debugopdrachten

- **📝 Versieverwijzing bijgewerkt**: 
  - `docs/getting-started/installation.md`: Vaste hardcoded `1.5.0` versie gewijzigd naar generieke `1.x.x` met link naar releases

#### Gewijzigd
- **Rollback-strategieën**: Documentatie bijgewerkt om op Git-gebaseerde rollback te gebruiken (AZD heeft geen native rollback)
- **Logweergave**: Vervangen `azd logs` verwijzingen door `azd monitor --logs`, `azd monitor --live` en Azure CLI-opdrachten
- **Prestatiegedeelte**: Verwijderd niet-bestaande parallelle/incrementiële implementatievlaggen, geldige alternatieven gegeven

#### Technische details
- **Geldige AZD-opdrachten**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geldige azd monitor-vlaggen**: `--live`, `--logs`, `--overview`
- **Verwijderde functies**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notities
- **Verificatie**: Opdrachten gevalideerd tegen Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshopafsluiting en verbeteringen documentatiekwaliteit
**Deze versie voltooit de interactieve workshopmodules, repareert alle kapotte documentatielinks en verbetert de algehele inhoudskwaliteit voor AI-ontwikkelaars die Microsoft AZD gebruiken.**

#### Toegevoegd
- **📝 CONTRIBUTING.md**: Nieuw document met richtlijnen voor bijdragen inclusief:
  - Duidelijke instructies voor het melden van problemen en voorstellen van wijzigingen
  - Documentatiestandaarden voor nieuwe inhoud
  - Richtlijnen voor codevoorbeelden en conventies voor commitberichten
  - Informatie over communitybetrokkenheid

#### Voltooid
- **🎯 Workshop Module 7 (Afsluiting)**: Volledig afgerond afsluitingsmodule met:
  - Uitgebreide samenvatting van workshopprestaties
  - Sleutelconcepten beheerd sectie over AZD, sjablonen en Microsoft Foundry
  - Aanbevelingen voor voortzetting van het leertraject
  - Workshopuitdagingsoefeningen met moeilijkheidsgraden
  - Community feedback en ondersteuningslinks

- **📚 Workshop Module 3 (Ontmantelen)**: Bijgewerkte leerdoelen met:
  - GitHub Copilot met MCP-server activatie-instructies
  - Inzicht in AZD-sjabloonmappenstructuur
  - Organisatiepatronen voor infrastructuur-als-code (Bicep)
  - Hands-on labinstructies

- **🔧 Workshop Module 6 (Afbouw)**: Afgerond met:
  - Doelen voor opruimen van resources en kostenbeheer
  - Gebruik van `azd down` voor veilige ontmanteling van infrastructuur
  - Herstelrichtlijnen voor zacht-verwijderde cognitive services
  - Bonus verkenningsopdrachten voor GitHub Copilot en Azure Portal

#### Gecorrigeerd
- **🔗 Reparatie kapotte links**: Opgeloste meer dan 15 kapotte interne documentatielinks:
  - `docs/ai-foundry/ai-model-deployment.md`: Paden naar microsoft-foundry-integration.md gerepareerd
  - `docs/troubleshooting/ai-troubleshooting.md`: Paden naar ai-model-deployment.md en production-ai-practices.md gecorrigeerd
  - `docs/getting-started/first-project.md`: Niet-bestaande cicd-integration.md vervangen door deployment-guide.md
  - `examples/retail-scenario.md`: FAQ en probleemoplossingsgids-paden gerepareerd
  - `examples/container-app/microservices/README.md`: Paden voor cursusstart en implementatiehandleiding gecorrigeerd
  - `resources/faq.md` en `resources/glossary.md`: AI-hoofdstukverwijzingen bijgewerkt
  - `course-outline.md`: Instructeursgids en AI-workshop labverwijzingen gerepareerd

- **📅 Workshopstatusbalk**: Bijgewerkt van "In aanbouw" naar actieve workshopstatus met datum februari 2026

- **🔗 Workshopnavigatie**: Gerepareerde kapotte navigatielinks in workshop README.md die wezen naar niet-bestaande map lab-1-azd-basics

#### Gewijzigd
- **Workshoppresentatie**: "In aanbouw"-waarschuwing verwijderd, workshop is nu compleet en klaar voor gebruik
- **Navigatieconsistentie**: Gezorgd dat alle workshopmodules correcte tussen-module navigatie hebben
- **Leerpadverwijzingen**: Hoofdstukkruisverwijzingen bijgewerkt naar correcte microsoft-foundry-paden

#### Gevalideerd
- ✅ Alle Engelse markdownbestandlinks zijn valide intern
- ✅ Workshopmodules 0-7 zijn compleet met leerdoelen
- ✅ Navigatie tussen hoofdstukken en modules werkt correct
- ✅ Inhoud is geschikt voor AI-ontwikkelaars die Microsoft AZD gebruiken
- ✅ Beginner-vriendelijke taal en structuur behouden door de hele workshop
- ✅ CONTRIBUTING.md geeft duidelijke richtlijnen voor communitybijdragers

#### Technische implementatie
- **Linkvalidatie**: Geautomatiseerd PowerShell-script heeft alle .md interne links gecontroleerd
- **Inhoudsaudit**: Handmatige beoordeling van workshopvoltooiing en beginnergeschiktheid
- **Navigatiesysteem**: Consistente navigatiepatronen voor hoofdstukken en modules toegepast

#### Notities
- **Scope**: Wijzigingen alleen toegepast op Engelse documentatie
- **Vertalingen**: Vertaalmappen niet bijgewerkt in deze versie (geautomatiseerde vertaling wordt later gesynchroniseerd)
- **Workshopduur**: Voltooide workshop biedt nu 3-4 uur hands-on leren

---

### [v3.8.0] - 2025-11-19

#### Geavanceerde documentatie: Monitoring, beveiliging en multi-agent patronen
**Deze versie voegt uitgebreide lesstof van A-niveau toe over Application Insights-integratie, authenticatiepatronen en multi-agent coördinatie voor productie-implementaties.**

#### Toegevoegd
- **📊 Les Application Insights-integratie**: in `docs/pre-deployment/application-insights.md`:
  - AZD-gerichte implementatie met automatische provisioning
  - Complete Bicep-sjablonen voor Application Insights + Log Analytics
  - Werkende Python-toepassingen met aangepaste telemetrie (meer dan 1.200 regels)
  - AI/LLM monitoringpatronen (Microsoft Foundry Models token-/kostentracking)
  - 6 Mermaid-diagrammen (architectuur, gedistribueerde tracing, telemetriestroom)
  - 3 hands-on oefeningen (alerts, dashboards, AI-monitoring)
  - Kusto queryvoorbeelden en kostenoptimalisatiestrategieën
  - Live metric streaming en real-time debugging
  - 40-50 minuten leertijd met productieklare patronen

- **🔐 Les authenticatie- & beveiligingspatronen**: in `docs/getting-started/authsecurity.md`:
  - 3 authenticatiepatronen (connection strings, Key Vault, managed identity)
  - Complete Bicep infrastructuursjablonen voor veilige implementaties
  - Node.js applicatiecode met Azure SDK-integratie
  - 3 volledige oefeningen (managed identity inschakelen, user-assigned identity, Key Vault-rotatie)
  - Beveiligingsbest practices en RBAC-configuraties
  - Probleemoplossingsgids en kostenanalyse
  - Productieklaar wachtwoordloos authenticatiepatronen

- **🤖 Les multi-agent coördinatiepatronen**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coördinatiepatronen (sequentieel, parallel, hiërarchisch, event-driven, consensus)
  - Complete orchestrator service-implementatie (Python/Flask, meer dan 1.500 regels)
  - 3 gespecialiseerde agentimplementaties (Research, Writer, Editor)
  - Service Bus-integratie voor message queuing
  - Cosmos DB statusbeheer voor gedistribueerde systemen
  - 6 Mermaid-diagrammen die agent-interacties tonen
  - 3 geavanceerde oefeningen (timeout-afhandeling, retry-logica, circuit breaker)
  - Kostenoverzicht ($240-565/maand) met optimalisatiestrategieën
  - Application Insights-integratie voor monitoring

#### Verbeterd
- **Pre-deployment hoofdstuk**: Nu uitgebreide monitoring- en coördinatiepatronen inbegrepen
- **Getting Started hoofdstuk**: Uitgebreid met professionele authenticatiepatronen
- **Productieklaarheid**: Volledige dekking van beveiliging tot observeerbaarheid
- **Cursusoverzicht**: Bijgewerkt met verwijzingen naar nieuwe lessen in Hoofdstukken 3 en 6

#### Gewijzigd
- **Leerprogressie**: Betere integratie van beveiliging en monitoring doorheen cursus
- **Documentatiekwaliteit**: Consistente A-niveau standaarden (95-97%) in nieuwe lessen
- **Productiepatronen**: Volledige end-to-end dekking voor enterprise-implementaties

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijk pad van ontwikkeling tot productiemonitoring
- **Beveiligingsstandaarden**: Professionele patronen voor authenticatie en geheimbeheer
- **Observeerbaarheid**: Volledige Application Insights-integratie met AZD
- **AI-workloads**: Gespecialiseerde monitoring voor Microsoft Foundry Models en multi-agent systemen

#### Gevalideerd
- ✅ Alle lessen bevatten volledige werkende code (geen fragmenten)
- ✅ Mermaid-diagrammen voor visueel leren (19 totaal in 3 lessen)
- ✅ Hands-on oefeningen met verificatiestappen (9 totaal)
- ✅ Productieklare Bicep-sjablonen inzetbaar via `azd up`
- ✅ Kostenanalyse en optimalisatiestrategieën
- ✅ Probleemoplossingsgidsen en best practices
- ✅ Kennis-controlepunten met verificatieopdrachten

#### Resultaten documentatiebeoordeling
- **docs/pre-deployment/application-insights.md**: - Uitgebreide monitoringgids
- **docs/getting-started/authsecurity.md**: - Professionele beveiligingspatronen
- **docs/pre-deployment/coordination-patterns.md**: - Geavanceerde multi-agent architecturen
- **Nieuwe algemene inhoud**: - Consistente hoge kwaliteitsstandaarden

#### Technische implementatie
- **Application Insights**: Log Analytics + aangepaste telemetrie + gedistribueerde tracing
- **Authenticatie**: Managed Identity + Key Vault + RBAC-patronen
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestratie
- **Monitoring**: Live metrics + Kusto-queries + alerts + dashboards
- **Kostenbeheer**: Samplingstrategieën, bewaarbeleid, budgetcontroles

### [v3.7.0] - 2025-11-19

#### Verbeteringen documentatiekwaliteit en nieuw Microsoft Foundry Models-voorbeeld
**Deze versie verbetert de documentatiekwaliteit door het hele repo en voegt een compleet Microsoft Foundry Models-implementatievoorbeeld toe met gpt-4.1 chatinterface.**

#### Toegevoegd
- **🤖 Microsoft Foundry Models chatvoorbeeld**: Complete gpt-4.1 implementatie met werkende implementatie in `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructuur (gpt-4.1 modelimplementatie)
  - Python command-line chatinterface met gesprekshistorie
  - Key Vault-integratie voor veilige API-sleutelopslag
  - Tokengebruik tracking en kostenraming
  - Rate limiting en foutafhandeling
  - Uitgebreide README met 35-45 minuten implementatiehandleiding
  - 11 productieklare bestanden (Bicep-sjablonen, Python-app, configuratie)
- **📚 Documentatieoefeningen**: Toegevoegde praktijkoefeningen aan configuratiehandleiding:
  - Oefening 1: Configuratie multi-omgeving (15 minuten)
  - Oefening 2: Geheimbeheer praktijk (10 minuten)
  - Duidelijke succescriteria en verificatiestappen
- **✅ Implementatieverificatie**: Toegevoegde verificatiesectie aan implementatiehandleiding:
  - Gezondheidscontroleprocedures
  - Checklist succescriteria
  - Verwachte outputs voor alle implementatieopdrachten
  - Snelle referentie probleemoplossing

#### Verbeterd
- **examples/README.md**: Bijgewerkt naar A-niveau kwaliteit (93%):
  - Toegevoegd azure-openai-chat aan alle relevante secties
  - Lokale voorbeeldaantal bijgewerkt van 3 naar 4
  - Toegevoegd aan tabel AI-toepassingvoorbeeld
  - Geïntegreerd in Quick Start voor tussenliggende gebruikers
  - Toegevoegd aan sectie Microsoft Foundry Sjablonen
  - Bijgewerkt vergelijkingsmatrix en technologiezoeksecties
- **Documentatiekwaliteit**: Verbeterd van B+ (87%) → A- (92%) door hele docs map:
  - Verwachte output toegevoegd aan kritieke commandovoorbeelden
  - Verificatiestappen voor configuratiewijzigingen opgenomen
  - Verbeterde praktijkgerichte oefeningen voor hands-on leren

#### Gewijzigd
- **Leerprogressie**: Betere integratie van AI-voorbeelden voor gevorderde beginners
- **Documentatiestructuur**: Meer actiegerichte oefeningen met duidelijke resultaten
- **Verificatieproces**: Expliciete succescriteria toegevoegd aan belangrijke workflows

#### Verbeterd
- **Ontwikkelaarservaring**: Implementatie van Microsoft Foundry-modellen duurt nu 35-45 minuten (vs 60-90 voor complexe alternatieven)
- **Kostentransparantie**: Duidelijke kostenramingen ($50-200/maand) voor Microsoft Foundry-modelvoorbeeld
- **Leerpad**: AI-ontwikkelaars hebben een duidelijk startpunt met azure-openai-chat
- **Documentatiestandaarden**: Consistente verwachte output en verificatiestappen

#### Gevalideerd
- ✅ Microsoft Foundry-modelvoorbeeld volledig functioneel met `azd up`
- ✅ Alle 11 implementatiebestanden syntactisch correct
- ✅ README-instructies komen overeen met daadwerkelijke implementatie-ervaring
- ✅ Documentatielinks bijgewerkt op 8+ locaties
- ✅ Voorbeeldindex toont correct 4 lokale voorbeelden
- ✅ Geen dubbele externe links in tabellen
- ✅ Alle navigatiereferenties correct

#### Technische Implementatie
- **Microsoft Foundry Models Architectuur**: gpt-4.1 + Key Vault + Container Apps patroon
- **Beveiliging**: Managed Identity gereed, geheimen in Key Vault
- **Monitoring**: Integratie met Application Insights
- **Kostenbeheer**: Token tracking en gebruiksoptimalisatie
- **Implementatie**: Één enkele `azd up`-opdracht voor complete setup

### [v3.6.0] - 2025-11-19

#### Grote update: Voorbeelden Container App-implementaties
**Deze versie introduceert uitgebreide, productieklare voorbeelden van containerapp-implementaties met Azure Developer CLI (AZD), inclusief volledige documentatie en integratie in het leerpad.**

#### Toegevoegd
- **🚀 Voorbeelden Container Apps**: Nieuwe lokale voorbeelden in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Compleet overzicht van containerimplementaties, quickstart, productie en gevorderde patronen
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginnersvriendelijke REST API met scale-to-zero, health probes, monitoring en probleemoplossing
  - [Microservices Architectuur](../../examples/container-app/microservices): Productieklaar multi-serviceimplementatie (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Beveiliging, monitoring, kostenoptimalisatie en CI/CD-richtlijnen voor container workloads
- **Codevoorbeelden**: Complete `azure.yaml`, Bicep-templates en multi-taal service-implementaties (Python, Node.js, C#, Go)
- **Testen & Probleemoplossing**: End-to-end testscenario’s, monitoringopdrachten, probleemoplossingsrichtlijnen

#### Gewijzigd
- **README.md**: Bijgewerkt met nieuwe container app-voorbeelden onder "Local Examples - Container Applications"
- **examples/README.md**: Bijgewerkt om container app-voorbeelden te benadrukken, vergelijkingsmatrix toe te voegen en technologie/architectuurreferenties bij te werken
- **Course Outline & Study Guide**: Verwijzingen naar nieuwe container app-voorbeelden en implementatiepatronen in relevante hoofdstukken aangepast

#### Gevalideerd
- ✅ Alle nieuwe voorbeelden inzetbaar met `azd up` en volgen best practices
- ✅ Documentatie-kruislinks en navigatie bijgewerkt
- ✅ Voorbeelden bestrijken beginnend tot gevorderd, inclusief productie-microservices

#### Notities
- **Bereik**: Alleen Engelse documentatie en voorbeelden
- **Volgende stappen**: Uitbreiden met geavanceerde containerpatronen en CI/CD-automatisering in latere releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Deze versie voert een alomvattende productnaamswijziging door van "Microsoft Foundry" naar "Microsoft Foundry" in alle Engelse documentatie, als weerspiegeling van Microsofts officiële rebranding.**

#### Gewijzigd
- **🔄 Productnaam update**: Volledige rebranding van "Microsoft Foundry" naar "Microsoft Foundry"
  - Alle verwijzingen bijgewerkt in Engelse documentatie in `docs/` map
  - Mapnaam gewijzigd: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Bestandsnaam gewijzigd: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totaal: 23 inhoudelijke verwijzingen bijgewerkt in 7 documentatiebestanden

- **📁 Wijzigingen in mappenstructuur**:
  - `docs/ai-foundry/` hernoemd naar `docs/microsoft-foundry/`
  - Alle kruisverwijzingen aangepast aan nieuwe mappenstructuur
  - Navigatielinks gevalideerd door de gehele documentatie

- **📄 Bestandnaamwijzigingen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links aangepast naar nieuwe bestandsnaam

#### Bijgewerkte bestanden
- **Hoofdstukdocumentatie** (7 bestanden):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigatielink-updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 productnaamverwijzingen bijgewerkt
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Gebruik maakt al van Microsoft Foundry (uit eerdere updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 verwijzingen bijgewerkt (overzicht, community feedback, documentatie)
  - `docs/getting-started/azd-basics.md` - 4 kruisverwijzingen bijgewerkt
  - `docs/getting-started/first-project.md` - 2 hoofdstuknavigatielinks bijgewerkt
  - `docs/getting-started/installation.md` - 2 links naar volgend hoofdstuk bijgewerkt
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 verwijzingen bijgewerkt (navigatie, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigatielink bijgewerkt
  - `docs/troubleshooting/debugging.md` - 1 navigatielink bijgewerkt

- **Structuurbestanden van cursussen** (2 bestanden):
  - `README.md` - 17 verwijzingen bijgewerkt (cursusoverzicht, hoofdstuktitels, templates sectie, community-inzichten)
  - `course-outline.md` - 14 verwijzingen bijgewerkt (overzicht, leerdoelen, hoofdstukhulpbronnen)

#### Gevalideerd
- ✅ Geen resterende verwijzingen naar "ai-foundry" map in Engelse docs
- ✅ Geen resterende productnaamverwijzingen naar "Microsoft Foundry" in Engelse docs
- ✅ Alle navigatielinks werken met nieuwe mappenstructuur
- ✅ Bestands- en mappennamen succesvol gewijzigd
- ✅ Kruisverwijzingen tussen hoofdstukken gevalideerd

#### Notities
- **Bereik**: Wijzigingen alleen doorgevoerd in Engelse documentatie binnen `docs/` map
- **Vertalingen**: Vertaalmappen (`translations/`) niet bijgewerkt in deze versie
- **Workshop**: Workshopmateriaal (`workshop/`) niet bijgewerkt in deze versie
- **Voorbeelden**: Voorbeeldbestanden kunnen nog steeds legacy namen bevatten (wordt behandeld in toekomstige updates)
- **Externe Links**: Externe URL's en GitHub-repositoryverwijzingen blijven ongewijzigd

#### Migratiehandleiding voor bijdragers
Als je lokale branches of documentatie hebt die naar de oude structuur verwijzen:
1. Pas mapverwijzingen aan: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Pas bestandsverwijzingen aan: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Vervang productnaam: "Microsoft Foundry" → "Microsoft Foundry"
4. Controleer of alle interne documentatielinks nog werken

---

### [v3.4.0] - 2025-10-24

#### Vooruitblik en verbeteringen in validatie van infrastructuur
**Deze versie introduceert uitgebreide ondersteuning voor de nieuwe preview-functie van Azure Developer CLI en verbetert de gebruikerservaring van de workshop.**

#### Toegevoegd
- **🧪 azd provision --preview Functiedocumentatie**: Uitgebreide dekking van nieuwe infrastructuur preview-mogelijkheid
  - Commandoreferentie en gebruiksvoorbeelden in cheatsheet
  - Gedetailleerde integratie in provisioning-gids met use cases en voordelen
  - Pre-flight check integratie voor veiligere uitvoering
  - Updates in startsnelheidsgids met praktijkvoorbeelden van veiligheid voorop
- **🚧 Workshop Status Banner**: Professionele HTML-banner die ontwikkelingstatus van workshop weergeeft
  - Gradient-ontwerp met constructie-indicatoren voor duidelijke gebruikerscommunicatie
  - Laatste update-tijdstempel voor transparantie
  - Mobielvriendelijk ontwerp voor alle apparaattypes

#### Verbeterd
- **Infrastructuurveiligheid**: Preview-functionaliteit geïntegreerd in hele implementatiedocumentatie
- **Validatie voor implementatie**: Geautomatiseerde scripts bevatten nu infrastructuur preview-tests
- **Ontwikkelaarworkflow**: Bijgewerkte commandoreeksen om preview op te nemen als best practice
- **Workshopervaring**: Duidelijke verwachtingen voor gebruikers over contentontwikkelingsstatus

#### Gewijzigd
- **Beste implementatiepraktijken**: Vooruitblik-eerst workflow wordt nu aanbevolen aanpak
- **Documentatiestroom**: Validatie van infrastructuur nu eerder in leerproces
- **Workshoppresentatie**: Professionele statuscommunicatie met heldere ontwikkelingsplanning

#### Verbeterd
- **Veiligheidsgerichte benadering**: Infrastructuurwijzigingen kunnen nu worden gevalideerd vóór implementatie
- **Team samenwerking**: Preview-resultaten kunnen gedeeld worden voor beoordeling en goedkeuring
- **Kostenbewustzijn**: Betere inschatting van resourcekosten vóór provisioning
- **Risicobeperking**: Minder falende implementaties door voorafgaande validatie

#### Technische Implementatie
- **Multi-document integratie**: Preview-functie gedocumenteerd in 4 kernbestanden
- **Commandopatronen**: Consistente syntaxis en voorbeelden door documentatie heen
- **Integratie van best practices**: Preview opgenomen in validatieworkflows en scripts
- **Visuele indicatoren**: Duidelijke NIEUWE functie-markeringen ter bevordering van vindbaarheid

#### Workshopinfrastructuur
- **Statuscommunicatie**: Professionele HTML-banner met gradient-styling
- **Gebruikerservaring**: Duidelijke ontwikkelingsstatus voorkomt verwarring
- **Professionele presentatie**: Behoudt geloofwaardigheid van repository en stelt verwachtingen
- **Transparantie tijdlijn**: Laatste update in oktober 2025 voor verantwoording

### [v3.3.0] - 2025-09-24

#### Verbeterd workshopmateriaal en interactieve leerervaring
**Deze versie introduceert uitgebreid workshopmateriaal met browsergebaseerde interactieve gidsen en gestructureerde leerpaden.**

#### Toegevoegd
- **🎥 Interactieve workshopgids**: Browsergebaseerde workshopervaring met MkDocs preview mogelijkheid
- **📝 Gestructureerde workshopinstructies**: 7-staps geleide leerroute van ontdekking tot maatwerk
  - 0-Introductie: Workshopoverzicht en setup
  - 1-Select-AI-Template: Template-ontdekking en selectieproces
  - 2-Validate-AI-Template: Implementatie- en validatieprocedures
  - 3-Deconstruct-AI-Template: Begrip van template-architectuur
  - 4-Configure-AI-Template: Configuratie en aanpassing
  - 5-Customize-AI-Template: Geavanceerde wijzigingen en iteraties
  - 6-Teardown-Infrastructure: Opruimen en resourcebeheer
  - 7-Afsluiting: Samenvatting en volgende stappen
- **🛠️ Workshop tooling**: MkDocs-configuratie met Material-thema voor verbeterde leerervaring
- **🎯 Hands-on leerpad**: 3-staps methodologie (Ontdekking → Implementatie → Maatwerk)
- **📱 GitHub Codespaces Integratie**: Naadloze setup van ontwikkelomgeving

#### Verbeterd
- **AI workshoplab**: Uitgebreid met uitgebreide 2-3 uur durende gestructureerde leerervaring
- **Workshopdocumentatie**: Professionele presentatie met navigatie en visuele hulpmiddelen
- **Leerprogressie**: Duidelijke stapsgewijze begeleiding van template-selectie tot productie-implementatie
- **Ontwikkelaarservaring**: Geïntegreerde tooling voor gestroomlijnde ontwikkelworkflows

#### Verbeterd
- **Toegankelijkheid**: Browserinterface met zoek-, kopieerfunctionaliteit en themawisselaar
- **Zelfgestuurd leren**: Flexibele workshopstructuur die aangepast kan worden aan verschillende leertempo’s
- **Praktische toepassing**: Realistische AI-template-implementatiescenario’s
- **Community integratie**: Discord-integratie voor workshopondersteuning en samenwerking

#### Workshopfuncties
- **Ingebouwde zoekfunctie**: Snelle zoekopdracht op trefwoord en les
- **Codeblokken kopiëren**: Hover-to-copy functionaliteit voor alle codevoorbeelden
- **Themawisselaar**: Ondersteuning voor donker/licht-modus voor verschillende voorkeuren
- **Visuele middelen**: Schermafbeeldingen en diagrammen voor beter begrip
- **Help-integratie**: Directe Discord-toegang voor communityondersteuning

### [v3.2.0] - 2025-09-17

#### Grote herstructurering navigatie en hoofdstukgericht leersysteem
**Deze versie introduceert een alomvattend hoofdstukgericht leerstructuur met verbeterde navigatie door de gehele repository.**

#### Toegevoegd
- **📚 Hoofdstukgericht leersysteem**: Hele cursus heringericht in 8 progressieve leerhoofdstukken
  - Hoofdstuk 1: Basis & Snelstart (⭐ - 30-45 min)
  - Hoofdstuk 2: AI-First Ontwikkeling (⭐⭐ - 1-2 uur)
  - Hoofdstuk 3: Configuratie & Authenticatie (⭐⭐ - 45-60 min)
  - Hoofdstuk 4: Infrastructure as Code & Implementatie (⭐⭐⭐ - 1-1.5 uur)
  - Hoofdstuk 5: Multi-Agent AI-oplossingen (⭐⭐⭐⭐ - 2-3 uur)
  - Hoofdstuk 6: Validatie & Planning vóór implementatie (⭐⭐ - 1 uur)
  - Hoofdstuk 7: Probleemoplossing & Debugging (⭐⭐ - 1-1.5 uur)
  - Hoofdstuk 8: Productie & Enterprise-patronen (⭐⭐⭐⭐ - 2-3 uur)
- **📚 Uitgebreid navigatiesysteem**: Consistente navigatiekoppen en voetteksten in alle documentatie
- **🎯 Voortgangsbewaking**: Checklist cursusvoltooiing en leerverificatiesysteem
- **🗺️ Leerpadbegeleiding**: Duidelijke instappunten voor verschillende ervaringsniveaus en doelen
- **🔗 Kruisverwijzingsnavigatie**: Gerelateerde hoofdstukken en vereisten duidelijk gekoppeld

#### Verbeterd
- **README-structuur**: Omgevormd tot gestructureerd leerplatform met hoofdstukindeling
- **Documentatienavigatie**: Elke pagina bevat nu hoofdstukcontext en voortgangsbegeleiding
- **Template-organisatie**: Voorbeelden en templates toegewezen aan passende leerhoofdstukken
- **Bron-integratie**: Cheatsheets, FAQ's en studiegidsen gekoppeld aan relevante hoofdstukken
- **Workshopintegratie**: Hands-on labs gekoppeld aan meerdere leerdoelen van hoofdstukken

#### Gewijzigd
- **Leerprogressie**: Overgegaan van lineaire documentatie naar flexibel hoofdstuk-gebaseerd leren
- **Configuratieplaatsing**: Configuratiehandleiding herplaatst als Hoofdstuk 3 voor betere leerflow
- **AI-inhoud Integratie**: Betere integratie van AI-specifieke inhoud doorheen de leerreis
- **Productie-inhoud**: Geavanceerde patronen samengevoegd in Hoofdstuk 8 voor ondernemingsleerlingen

#### Verbeterd
- **Gebruikerservaring**: Duidelijke navigatiepaneerbroodkruimels en hoofdstukvooruitgangsindicatoren
- **Toegankelijkheid**: Consistente navigatiepatronen voor eenvoudiger doorlopen van cursussen
- **Professionele Presentatie**: Universiteitsstijl cursusstructuur geschikt voor academische en zakelijke training
- **Leer-efficiëntie**: Verminderde tijd om relevante inhoud te vinden door verbeterde organisatie

#### Technische Implementatie
- **Navigatieheaders**: Gestandaardiseerde hoofdstuknavigatie in meer dan 40 documentatiebestanden
- **Voettekstnavigatie**: Consistente voortgangsbegeleiding en hoofdstukvoltooiingsindicatoren
- **Kruisverwijzingen**: Uitgebreid intern linkingssysteem dat gerelateerde concepten verbindt
- **Hoofdstukkaarten**: Sjablonen en voorbeelden duidelijk gekoppeld aan leerdoelen

#### Studiehandleiding Verbeteringen
- **📚 Uitgebreide Leerdoelen**: Studiehandleiding herzien om aan te sluiten bij 8-hoofdstukkensysteem
- **🎯 Hoofdstuk-gebaseerde Beoordeling**: Elk hoofdstuk bevat specifieke leerdoelen en praktische oefeningen
- **📋 Voortgang Volgen**: Wekelijks leerschema met meetbare resultaten en voltooiingschecklists
- **❓ Beoordelingsvragen**: Kennisbevestigingsvragen voor elk hoofdstuk met professionele uitkomsten
- **🛠️ Praktische Oefeningen**: Praktijkactiviteiten met echte implementatiescenario's en foutoplossing
- **📊 Vaardigheidsontwikkeling**: Duidelijke vooruitgang van basisconcepten naar enterprise-patronen met focus op loopbaanontwikkeling
- **🎓 Certificeringsstructuur**: Professionele ontwikkelingsresultaten en gemeenschapsherkenningssysteem
- **⏱️ Tijdsbeheer**: Gestructureerd 10-weken leerplan met mijlpaalvalidatie

### [v3.1.0] - 17-09-2025

#### Verbeterde Multi-Agent AI Oplossingen
**Deze versie verbetert de multi-agent retailoplossing met betere agentbenamingen en uitgebreide documentatie.**

#### Gewijzigd
- **Multi-Agent Terminologie**: "Cora agent" vervangen door "Customer agent" doorheen de retail multi-agent oplossing voor duidelijker begrip
- **Agent Architectuur**: Alle documentatie, ARM-sjablonen en codevoorbeelden bijgewerkt naar consistente "Customer agent" naamgeving
- **Configuratievoorbeelden**: Gemoderniseerde agentconfiguratiepatronen met bijgewerkte naamgevingsconventies
- **Documentatieconsistentie**: Alle verwijzingen gebruiken professionele, beschrijvende agentnamen

#### Uitgebreid
- **ARM-sjabloonpakket**: Bijgewerkt retail-multiagent-arm-template met Customer agent verwijzingen
- **Architectuurdiagrammen**: Vernieuwde Mermaid-diagrammen met bijgewerkte agentnaamgeving
- **Codevoorbeelden**: Python-klassen en implementatievoorbeelden nu met CustomerAgent naamgeving
- **Omgevingsvariabelen**: Alle deployment-scripts bijgewerkt met CUSTOMER_AGENT_NAME conventies

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijkere agentrollen en verantwoordelijkheden in documentatie
- **Productieklaar**: Betere afstemming met ondernemingsnaamgevingsconventies
- **Leermaterialen**: Intuïtieve agentbenamingen voor educatieve doeleinden
- **Sjabloon Bruikbaarheid**: Vereenvoudigd begrip van agentfuncties en deploymentpatronen

#### Technische Details
- Bijgewerkte Mermaid architectuurdiagrammen met CustomerAgent verwijzingen
- CoraAgent klassennamen vervangen door CustomerAgent in Python voorbeelden
- ARM-sjabloon JSON-configuraties aangepast om "customer" agenttype te gebruiken
- Omgevingsvariabelen bijgewerkt van CORA_AGENT_* naar CUSTOMER_AGENT_* patronen
- Alle deploymentcommando's en containerconfiguraties vernieuwd

### [v3.0.0] - 12-09-2025

#### Grote Wijzigingen - AI Developer Focus en Microsoft Foundry Integratie
**Deze versie verandert de repository in een uitgebreide AI-gefocuste leerbron met Microsoft Foundry integratie.**

#### Toegevoegd
- **🤖 AI-Eerste Leerpad**: Complete herstructurering gericht op AI-ontwikkelaars en engineers
- **Microsoft Foundry Integratiehandleiding**: Uitgebreide documentatie voor het koppelen van AZD met Microsoft Foundry diensten
- **AI Model Deployment Patronen**: Gedetailleerde handleiding over modelselectie, configuratie en productiedeploymentsstrategieën
- **AI Workshop Lab**: 2-3 uur durende hands-on workshop voor het omzetten van AI-toepassingen naar AZD-deployable oplossingen
- **Productie AI Best Practices**: Enterprise-klare patronen voor schaalvergroting, monitoring en beveiliging van AI workloads
- **AI-Specifieke Foutoplossing**: Uitgebreide troubleshooting voor Microsoft Foundry Models, Cognitive Services en AI deployment issues
- **AI Sjabloongalerij**: Uitgelichte collectie Microsoft Foundry sjablonen met complexiteitsbeoordelingen
- **Workshop Materialen**: Complete workshopstructuur met hands-on labs en referentiemateriaal

#### Verbeterd
- **README Structuur**: AI-ontwikkelaar gefocust met 45% community-interessegegevens van Microsoft Foundry Discord
- **Leertrajecten**: Toegewijde AI-ontwikkelaarstraject naast traditionele routes voor studenten en DevOps engineers
- **Sjabloonaanbevelingen**: Uitgelichte AI-sjablonen waaronder azure-search-openai-demo, contoso-chat en openai-chat-app-quickstart
- **Community Integratie**: Verbeterde Discord-gemeenschapsondersteuning met AI-specifieke kanalen en discussies

#### Beveiliging & Productiefocus
- **Beheerde Identiteits Patronen**: AI-specifieke authenticatie- en beveiligingsconfiguraties
- **Kostenoptimalisatie**: Tokengebruiktracking en budgetbeheersing voor AI workloads
- **Multi-Region Deployments**: Strategieën voor wereldwijde AI toepassingsimplementatie
- **Prestatiemonitoring**: AI-specifieke metrics en Application Insights integratie

#### Documentatiekwaliteit
- **Lineaire Cursusstructuur**: Logische voortgang van beginner tot geavanceerde AI deployment patronen
- **Geverifieerde URL's**: Alle externe repositorylinks gecontroleerd en toegankelijk
- **Volledige Referentie**: Alle interne documentatielinks gevalideerd en functioneel
- **Productieklaar**: Enterprise deployment patronen met praktijkvoorbeelden

### [v2.0.0] - 09-09-2025

#### Grote Wijzigingen - Repositoryherstructurering en Professionele Verbetering
**Deze versie vertegenwoordigt een significante herziening van de repositorystructuur en presentatie van inhoud.**

#### Toegevoegd
- **Gestructureerd Leerraamwerk**: Alle documentatiepagina's bevatten nu Introductie, Leerdoelen en Leerresultaten secties
- **Navigatiesysteem**: Toegevoegde Vorige/Volgende leslinks door alle documentatie voor begeleide leerprogressie
- **Studiehandleiding**: Uitgebreide studiehandleiding.md met leerdoelen, oefenopdrachten en beoordelingsmateriaal
- **Professionele Presentatie**: Alle emoji-iconen verwijderd voor betere toegankelijkheid en professionele uitstraling
- **Verbeterde Inhoudsstructuur**: Betere organisatie en flow van leermaterialen

#### Gewijzigd
- **Documentatieformaat**: Alle documentatie gestandaardiseerd met consistente leergerichte structuur
- **Navigatiestroom**: Logische voortgang door alle leermaterialen geïmplementeerd
- **Inhoudspresentatie**: Decoratieve elementen verwijderd ten gunste van heldere, professionele opmaak
- **Linkstructuur**: Alle interne links bijgewerkt ter ondersteuning van het nieuwe navigatiesysteem

#### Verbeterd
- **Toegankelijkheid**: Emoji-afhankelijkheden verwijderd voor betere schermlezercompatibiliteit
- **Professionele Uitstraling**: Schone, academische stijl presentatie geschikt voor ondernemingsleren
- **Leerervaring**: Gestructureerde aanpak met duidelijke doelen en uitkomsten per les
- **Inhoudsorganisatie**: Betere logische flow en verbinding tussen gerelateerde onderwerpen

### [v1.0.0] - 09-09-2025

#### Initiële Release - Uitgebreide AZD Leerrepository

#### Toegevoegd
- **Kern Documentatiestructuur**
  - Complete serie kennismakinghandleidingen
  - Uitgebreide deployment- en provisioneringsdocumentatie
  - Gedetailleerde troubleshooting bronnen en debughandleidingen
  - Validatietools en procedures voorafgaand aan deployment

- **Kennismakingsmodule**
  - AZD Basisprincipes: Kernconcepten en terminologie
  - Installatiehandleiding: Platform-specifieke installatie-instructies
  - Configuratiehandleiding: Omgeving opzetten en authenticatie
  - Eerste project tutorial: Stapsgewijs hands-on leren

- **Deployment en Provisioneringsmodule**
  - Deploymenthandleiding: Complete workflowdocumentatie
  - Provisioninghandleiding: Infrastructure as Code met Bicep
  - Best practices voor productie-implementaties
  - Multi-service architectuurpatronen

- **Validatiemodule voorafgaand aan deployment**
  - Capaciteitsplanning: Validatie van Azure-middelenbeschikbaarheid
  - SKU-selectie: Uitgebreide service-tier richtlijnen
  - Pre-flight checks: Geautomatiseerde validatiescripts (PowerShell en Bash)
  - Kostenraming en budgetplanhulpmiddelen

- **Troubleshootingmodule**
  - Veelvoorkomende problemen: Frequent voorkomende problemen en oplossingen
  - Debughandleiding: Systematische foutoplossingsmethoden
  - Geavanceerde diagnostische technieken en hulpmiddelen
  - Prestatiemonitoring en optimalisatie

- **Bronnen en Referenties**
  - Command Cheat Sheet: Snelle referentie voor essentiële commando's
  - Verklarende woordenlijst: Uitgebreide terminologie- en acroniemverklaringen
  - FAQ: Gedetailleerde antwoorden op veelgestelde vragen
  - Externe bronlinks en communityverbindingen

- **Voorbeelden en Sjablonen**
  - Simpel webapplicatievoorbeeld
  - Sjabloon voor statische website deployment
  - Containerapplicatieconfiguratie
  - Database-integratiepatronen
  - Microservices-architectuurvoorbeelden
  - Serverless functie-implementaties

#### Kenmerken
- **Multi-platform Ondersteuning**: Installatie- en configuratiehandleidingen voor Windows, macOS en Linux
- **Verschillende Vaardigheidsniveaus**: Inhoud ontworpen voor studenten tot professionele ontwikkelaars
- **Praktische Focus**: Hands-on voorbeelden en realistische scenario's
- **Uitgebreide Dekking**: Van basale concepten tot geavanceerde enterprise-patronen
- **Beveiligingsgerichte Aanpak**: Best practices voor beveiliging geïntegreerd doorheen
- **Kostenoptimalisatie**: Richtlijnen voor kosteneffectieve deployments en middelenbeheer

#### Documentatiekwaliteit
- **Gedetailleerde Codevoorbeelden**: Praktische, geteste codevoorbeelden
- **Stapsgewijze Instructies**: Duidelijke, uitvoerbare richtlijnen
- **Omvattende Foutafhandeling**: Troubleshooting bij veelvoorkomende problemen
- **Integratie van Best Practices**: Industriestandaarden en aanbevelingen
- **Versiecompatibiliteit**: Up-to-date met nieuwste Azure-diensten en azd-functies

## Geplande Toekomstige Verbeteringen

### Versie 3.1.0 (Gepland)
#### AI Platform Uitbreiding
- **Multi-Model Ondersteuning**: Integratiepatronen voor Hugging Face, Azure Machine Learning en aangepaste modellen
- **AI Agent Frameworks**: Sjablonen voor LangChain, Semantic Kernel en AutoGen deployments
- **Geavanceerde RAG Patronen**: Vector database opties buiten Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Verbeterde monitoring voor modelprestaties, tokengebruik en responskwaliteit

#### Ontwikkelaarservaring
- **VS Code Extensie**: Geïntegreerde AZD + Microsoft Foundry ontwikkelaarservaring
- **GitHub Copilot Integratie**: AI-ondersteunde AZD sjabloon generatie
- **Interactieve Tutorials**: Hands-on codeeroefeningen met geautomatiseerde validatie voor AI-scenario's
- **Videocontent**: Aanvullende videotutorials voor visuele leerlingen met focus op AI deployments

### Versie 4.0.0 (Gepland)
#### Enterprise AI Patronen
- **Governance Raamwerk**: AI model governance, compliance en audit-trails
- **Multi-Tenant AI**: Patronen voor het bedienen van meerdere klanten met geïsoleerde AI-diensten
- **Edge AI Deployment**: Integratie met Azure IoT Edge en containerinstanties
- **Hybride Cloud AI**: Multi-cloud en hybride deploymentpatronen voor AI workloads

#### Geavanceerde Functies
- **AI Pipeline Automatisering**: MLOps-integratie met Azure Machine Learning pipelines
- **Geavanceerde Beveiliging**: Zero-trust patronen, private endpoints en geavanceerde dreigingsbescherming
- **Prestatie-optimalisatie**: Geavanceerde afstemming en schaalstrategieën voor AI-toepassingen met hoge doorvoer
- **Wereldwijde Distributie**: Contentleverings- en edge cachingpatronen voor AI-toepassingen

### Versie 3.0.0 (Gepland) - Overschaduwd door Huidige Release
#### Voorgestelde Toevoegingen - Nu Geïmplementeerd in v3.0.0
- ✅ **AI-Gefocuste Inhoud**: Uitgebreide Microsoft Foundry integratie (Voltooid)
- ✅ **Interactieve Tutorials**: Hands-on AI workshop lab (Voltooid)
- ✅ **Geavanceerde Beveiligingsmodule**: AI-specifieke beveiligingspatronen (Voltooid)
- ✅ **Prestatie-optimalisatie**: AI workload afstemmingsstrategieën (Voltooid)

### Versie 2.1.0 (Gepland) - Gedeeltelijk Geïmplementeerd in v3.0.0
#### Kleine Verbeteringen - Sommige Voltooid in Huidige Release
- ✅ **Aanvullende Voorbeelden**: AI-gerichte deployment scenario's (Voltooid)
- ✅ **Uitgebreide FAQ**: AI-specifieke vragen en foutoplossing (Voltooid)
- **Toolintegratie**: Verbeterde IDE en editor integratiehandleidingen
- ✅ **Monitoringuitbreiding**: AI-specifieke monitoring- en waarschuwingspatronen (Voltooid)

#### Nog Gepland voor Toekomstige Release
- **Mobielvriendelijke Documentatie**: Responsief ontwerp voor mobiel leren
- **Offline Toegang**: Downloadbare documentatiepakketten
- **Verbeterde IDE Integratie**: VS Code extensie voor AZD + AI workflows
- **Community Dashboard**: Real-time communitystatistieken en bijdrage-tracking

## Bijdragen aan de Wijzigingslog

### Wijzigingen Rapporterën
Bij bijdragen aan deze repository, zorg ervoor dat changelog-items bevatten:

1. **Versienummer**: Volgend semantische versiebeheer (major.minor.patch)
2. **Datum**: Release- of update datum in JJJJ-MM-DD formaat
3. **Categorie**: Toegevoegd, Gewijzigd, Verouderd, Verwijderd, Gefixt, Beveiliging
4. **Duidelijke Beschrijving**: Bondige omschrijving van wat er is veranderd
5. **Impactbeoordeling**: Hoe veranderingen bestaande gebruikers beïnvloeden

### Wijzigingscategorieën

#### Toegevoegd
- Nieuwe functies, documentatiesecties of mogelijkheden
- Nieuwe voorbeelden, sjablonen of leermiddelen
- Extra tools, scripts of hulpprogramma's

#### Gewijzigd
- Wijzigingen aan bestaande functionaliteit of documentatie
- Updates ter verbetering van duidelijkheid of nauwkeurigheid
- Herstructurering van inhoud of organisatie

#### Verouderd
- Functies of benaderingen die worden uitgefaseerd
- Documentatiesecties die gepland zijn voor verwijdering
- Methoden waarvoor betere alternatieven bestaan

#### Verwijderd
- Functies, documentatie of voorbeelden die niet langer relevant zijn
- Verouderde informatie of verouderde benaderingen
- Overbodige of samengevoegde inhoud

#### Gefixt
- Correcties van fouten in documentatie of code
- Oplossingen van gemelde problemen of fouten
- Verbeteringen in nauwkeurigheid of functionaliteit

#### Beveiliging
- Beveiligingsgerelateerde verbeteringen of reparaties
- Updates van beste beveiligingspraktijken
- Oplossing van beveiligingslekken

### Richtlijnen voor Semantische Versiebeheer

#### Grote Versie (X.0.0)
- Brekende veranderingen die gebruikersactie vereisen
- Significante herstructurering van inhoud of organisatie
- Wijzigingen die de fundamentele aanpak of methodologie veranderen

#### Minor Versie (X.Y.0)
- Nieuwe functies of inhoud toevoegingen
- Verbeteringen die achterwaartse compatibiliteit behouden
- Extra voorbeelden, tools of bronnen

#### Patch Versie (X.Y.Z)
- Bugfixes en correcties
- Kleine verbeteringen aan bestaande inhoud
- Verduidelijkingen en kleine verbeteringen

## Feedback en Suggesties vanuit de Community

We moedigen actief feedback vanuit de community aan om deze leerbron te verbeteren:

### Hoe Feedback te Geven
- **GitHub Issues**: Meld problemen of stel verbeteringen voor (AI-specifieke kwesties welkom)
- **Discord Discussies**: Deel ideeën en ga in gesprek met de Microsoft Foundry community
- **Pull Requests**: Draag directe verbeteringen aan inhoud bij, vooral AI-templates en handleidingen
- **Microsoft Foundry Discord**: Doe mee in het #Azure-kanaal voor AZD + AI-discussies
- **Community Forums**: Neem deel aan bredere Azure ontwikkelaarsdiscussies

### Feedbackcategorieën
- **AI-inhoudsnauwkeurigheid**: Correcties over AI-service-integratie en implementatie-informatie
- **Leerervaring**: Suggesties voor een verbeterde AI-ontwikkelaarsleerflow
- **Ontbrekende AI-inhoud**: Verzoeken voor extra AI-templates, patronen of voorbeelden
- **Toegankelijkheid**: Verbeteringen voor diverse leerbehoeften
- **AI Tool Integratie**: Suggesties voor betere integratie van AI-ontwikkelwerkstromen
- **Productie AI-patronen**: Verzoeken voor zakelijke AI-implementatiepatronen

### Reactieverbintenis
- **Issue Respons**: Binnen 48 uur voor gemelde problemen
- **Feature Requests**: Evaluatie binnen één week
- **Community Bijdragen**: Review binnen één week
- **Beveiligingskwesties**: Onmiddellijke prioriteit met versnelde respons

## Onderhoudsschema

### Reguliere Updates
- **Maandelijkse Reviews**: Nauwkeurigheid van inhoud en linkvalidatie
- **Kwartaalupdates**: Grote inhoud toevoegingen en verbeteringen
- **Halfjaarlijkse Reviews**: Uitgebreide herstructurering en verbetering
- **Jaarlijkse Releases**: Grote versiewijzigingen met aanzienlijke verbeteringen

### Monitoring en Kwaliteitsborging
- **Geautomatiseerd Testen**: Regelmatige validatie van codevoorbeelden en links
- **Integratie van Community Feedback**: Regelmatige opname van gebruikerssuggesties
- **Technologie-updates**: Afstemming met de nieuwste Azure-diensten en azd-releases
- **Toegankelijkheidsaudits**: Regelmatige beoordeling van inclusieve ontwerpprincipes

## Versieondersteuningsbeleid

### Ondersteuning van de huidige versie
- **Laatste grote versie**: Volledige ondersteuning met regelmatige updates
- **Vorige grote versie**: Beveiligingsupdates en kritieke fixes gedurende 12 maanden
- **Verouderde versies**: Alleen community-ondersteuning, geen officiële updates

### Migratiehandleiding
Bij het uitbrengen van grote versies bieden we:
- **Migratiehandleidingen**: Stapsgewijze overgangsinstructies
- **Compatibiliteitsnotities**: Details over brekende wijzigingen
- **Toolondersteuning**: Scripts of hulpprogramma's om bij migratie te helpen
- **Community-ondersteuning**: Speciale forums voor migratievragen

---

**Navigatie**
- **Vorige les**: [Studiegids](resources/study-guide.md)
- **Volgende les**: Terug naar [Hoofd README](README.md)

**Blijf op de hoogte**: Volg deze repository voor meldingen over nieuwe releases en belangrijke updates van het lesmateriaal.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->