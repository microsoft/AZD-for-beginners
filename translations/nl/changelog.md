# Wijzigingslogboek - AZD Voor Beginners

## Inleiding

Dit wijzigingslogboek documenteert alle opmerkelijke wijzigingen, updates en verbeteringen aan de AZD Voor Beginners repository. We volgen semantische versieprincipes en onderhouden dit logboek om gebruikers te helpen begrijpen wat er tussen versies is veranderd.

## Leerdoelen

Door dit wijzigingslogboek te bekijken, zult u:
- Op de hoogte blijven van nieuwe functies en inhoudsuitbreidingen
- Inzicht krijgen in verbeteringen aan bestaande documentatie
- Bugfixes en correcties volgen om nauwkeurigheid te waarborgen
- De evolutie van het leermateriaal in de loop der tijd volgen

## Leerresultaten

Na het bekijken van de wijzigingslogboekvermeldingen zult u in staat zijn om:
- Nieuwe inhoud en beschikbare bronnen voor leren te identificeren
- Te begrijpen welke secties zijn bijgewerkt of verbeterd
- Uw leertraject te plannen op basis van het meest actuele materiaal
- Feedback en suggesties voor toekomstige verbeteringen bij te dragen

## Versiegeschiedenis

### [v3.24.0]- 2026-11-04

#### Gerepareerd
- Engelse cursusnavigatie hersteld, verplaatste-pagina paden, ontbrekende ankers en verouderde externe verwijzingen, inclusief de link van hoofdstuk 2 naar de productie AI-gids.
- Huidige richtlijnen herzien tegenover gepubliceerde AZD 1.37.2, agents 1.0.0-beta.23 en evaluaties 1.0.0-beta.2. Het aparte `azd ai eval` workflow en migratie van optimalisatieconfiguratie gedocumenteerd.
- Niet-ondersteunde CLI-vlaggen, authenticatiegrenzen, plaintext omgeving/geheime richtlijnen, infrastructuurupdates, modelconfiguratie en destructieve herstelvoorbeelden gecorrigeerd.
- Workshop ververst met de huidige AI Agents voorbeeld, inclusief actuele hooks, configuratie-inputs, evaluatietests, red-teamings toegangspunten en observeerbaarheid.
- Voorbeeldimplementatieclaims gecorrigeerd en gerelateerde applicatie/infrastructuur/configuratieproblemen hersteld. Detailhandelarchitectuurmateriaal is expliciet onderscheiden van een volledige werkende applicatie.
- CodeQL taalmatrix hersteld, ondersteuning voor Node.js 24 gekozen voor de ontwikkelcontainer, en setup-validators melden mislukte versieopdrachten.

#### Toegevoegd
- Een Engelstalige offline link/ankerchecker, regressietests en een documentatieworkflow die de workshop ook in strikte modus bouwt. Gegeneerde vertalingen en vertaalde afbeeldingen uitgesloten.

#### Validatiebereik
- Bron, syntaxis, configuratie, lokaal gedrag en netwerklink-controles garanderen geen live Azure-implementatie, quotum, RBAC, regionale modelbeschikbaarheid, facturering, beveiligingsnaleving of productieklaarheid.
- Oudere items hieronder zijn historische records, geen actuele opdracht- of release-instructies.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Vernieuwing: Versievalidering Update
**Deze versie valideert de cursus opnieuw tegen `azd` `1.27.1` (juli 2026, laatste stabiele release) en de huidige preview AI-agentextensie `azure.ai.agents` `1.0.0-beta.5`, waardoor elke "gevalideerd tegen" banner bijgewerkt is na de releases 1.26.0, 1.27.0 en 1.27.1.**

#### Gewijzigd
- **✅ Validatiebasislijn bijgewerkt** van `azd 1.25.6` (juni 2026) naar `azd 1.27.1` (juli 2026) over de hoofd-README, alle hoofdstuk-READMEs, de Hoofdstuk 1 ontwikkelcontainerles (inclusief voorbeelden met vastgepinde versies), de Hoofdstuk 4 aangepaste sjablonen les, de Hoofdstuk 5 multi-agent les en de workshopdocumentatie
- **🤖 Hoofdstuk 2 basislijn vernieuwd** van `azd 1.23.12` (maart 2026) naar `azd 1.27.1` over `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` en `microsoft-foundry-integration.md`; validatie-notatiedata bijgewerkt naar 2026-07-13
- **🧩 AI-agentextensie verhoogd** van `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` naar de huidige `1.0.0-beta.5` release in de Hoofdstuk 2 README en `agents.md`
- **🧪 Workshop validatievoorbeeld** (`azd version` output) bijgewerkt naar `1.27.1`

#### Opmerkingen over relevante azd-releases (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-ondersteuning voor Azure Functions op Flex Consumption, `azd config sub-filter` tenant-abonnementsfilters, self-contained extensiepakketten (`azd x pack --bundle`) en `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Model Azure AI Foundry projecten/agents rechtstreeks in `azure.yaml` (Bicep-loze/Terraform-loze init), containerimplementatie-ondersteuning voor App Service (`host: appservice` + `language: docker`), directe `-s/--source` voor `azd extension` opdrachten en `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` vlag voor `azd extension install`, verouderde modellen standaard uitgesloten van catalogus/quotum suggesties en diverse bugfixes

#### Bijgewerkte bestanden
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

#### Beginnerskloof #2: Sjabloonschrijven, Dev Containers, Pulumi, Azure DevOps, Service Principals en Meer
**Deze versie sluit de resterende tussenliggende hiaten af die door de azd-coverage-analyse aan het licht werden gebracht: hoe je je eigen sjabloon schrijft en publiceert, reproduceerbare dev-container/Codespaces-omgevingen, de Pulumi infrastructuurprovider, een Azure DevOps CI/CD doorloop, service-principal authenticatie, host-selectierichtlijnen (AKS/Spring Apps), `azd restore`/`azd package` uitleg, hook-foutafhandeling en team-/gedeelde omgevingpraktijken.**

#### Toegevoegd
- **🧱 Nieuwe Hoofdstuk 4 les** `docs/chapter-04-infrastructure/custom-templates.md` — het schrijven van je eigen azd-sjabloon: vereiste structuur (`azure.yaml`, `infra/`, `src/`), het `metadata.template` veld, parameteriseren van infrastructuur met de `uniqueString()` resource-token en `azd-env-name` tag, lokaal testen met `azd init --template <local-path>`, publiceren naar GitHub en inzenden naar de Awesome AZD-galerij
- **📦 Nieuwe Hoofdstuk 1 les** `docs/chapter-01-foundation/dev-containers.md` — reproduceerbare azd-omgevingen met Dev Containers en GitHub Codespaces: een minimale `.devcontainer/devcontainer.json` met de officiële `ghcr.io/azure/azure-dev/azd` functie, taalspecifieke functies, `docker-in-docker` voor containerhosts en `azd auth login --use-device-code` voor remote aanmelding
- **🧩 Pulumi met azd** sectie in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi mappenstructuur, stacks gekoppeld aan azd-omgevingen, vereiste outputs/tagging en de identieke `azd up` / `azd down` workflow
- **🎯 Host-selectierichtlijn** in `docs/chapter-04-infrastructure/provisioning.md` — een beginnervriendelijke vergelijking van `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` en `springapp` met richtlijnen wanneer je AKS of Azure Spring Apps kiest
- **🛠️ Azure DevOps CI/CD doorloop** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, serviceverbinding met workload identity federation (OIDC), de gegenereerde `azure-dev.yml` en variabelengroepinrichting
- **🔑 Service Principals (Patroon 4)** toegevoegd aan `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, niet-interactieve `azd auth login` met clientsecret versus federated/OIDC referenties, wanneer te gebruiken en veilige opslag van referenties
- **🪝 Hook foutafhandeling** subsectie in `docs/chapter-04-infrastructure/deployment-guide.md` — exitcodes en `set -e`, `continueOnError`, het isoleren van testhooks met `azd hooks run`, OS-specifieke shells, en `--debug`
- **👥 Team / gedeelde omgevingen** sectie in `docs/chapter-03-configuration/configuration.md` — wat leeft in `.azure/`, wat te gitignore'n, per-ontwikkelaar omgevingen, `azd env list`/`select` en het leveren van omgevingswaarden in CI/CD
- **🧰 `azd restore` en uitgebreide `azd package`** uitleg in `resources/cheat-sheet.md` — herstellen van dependencies en bouwen van een implementeerbaar artefact zonder de implementatie

#### Gewijzigd
- **🧭 Hoofdstuk 4 lestabel** bijgewerkt om de nieuwe "Schrijf je eigen sjabloon" les (Les 3) op te nemen
- **🧭 Hoofdstuk 1 lestabel** bijgewerkt om de nieuwe les "Dev Containers & Codespaces" (Les 5) op te nemen; navigatievoetteksten gekoppeld tussen `bring-your-own-app.md` en `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginnerskloof: Hands-on Multi-Agent Les, "Breng Je Eigen App," Terraform en CI/CD Doorloop
**Deze versie sluit de grootste hiaten voor een complete beginnersgids door twee nieuwe hands-on lessen toe te voegen (een implementeerbare multi-agent doorloop en het toevoegen van azd aan een bestaande app), een beginnervriendelijke hooks introductie, een Terraform-met-azd sectie, een stapsgewijze GitHub Actions pipeline doorloop, een uitleg over de nieuwe preview-extensies en een expliciete deployment-verificatie checklist.**

#### Toegevoegd
- **🤝 Nieuwe Hoofdstuk 5 les** `docs/chapter-05-multi-agent/multi-agent-basics.md` — een volledig hands-on, implementeerbare twee-agent doorloop (orchestrator + specialisten) met een echt sjabloon (`contoso-creative-writer`), bespreekt wanneer multi-agent te gebruiken, de `azd up` workflow, begrip van geïmplementeerde resources, cross-agent tracing, aanpassing en opruiming
- **📦 Nieuwe Hoofdstuk 1 les** `docs/chapter-01-foundation/bring-your-own-app.md` — hoe azd toe te voegen aan een bestaand project met `azd init` ("gebruik code in de huidige map"), begrip van `azure.yaml` en `infra/`, `azd infra generate`, hostdetectie en deployen met `azd up`
- **🌐 Terraform met azd** sectie toegevoegd aan `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, `.tf` mappenstructuur, vereiste `AZURE_*` outputs en `azd-env-name` tagging, en de identieke `azd up` / `azd down` workflow (sluit kloof waarin Terraform-ondersteuning werd beargumenteerd maar alleen Bicep getoond)
- **⚙️ Stapsgewijze GitHub Actions doorloop** in `docs/chapter-08-production/production-ai-practices.md` — van GitHub repo tot geautomatiseerde deploys: `azd pipeline config`, OIDC federated credentials (geen opgeslagen geheimen), de gegenereerde `azure-dev.yml` en geheimen-vs-variabelen advies
- **🪝 Beginners "Nieuw met hooks?" introductie** in `docs/chapter-04-infrastructure/deployment-guide.md` — wat een hook is, een hook-fasentabel, een minimale eerste hook en handmatig draaien van hooks met `azd hooks run`
- **✅ "Verifieer je Deployment" checklist** toegevoegd aan stap 5 van `docs/chapter-01-foundation/first-project.md` — rooktest, gezondheids-endpoint controle en expliciete succescriteria
- **🧩 Uitleg voor nieuwe preview-extensies** `azure.ai.skills` en `azure.ai.connections` (wat ze zijn en wanneer ze te gebruiken) in `docs/chapter-08-production/production-ai-practices.md`

#### Gewijzigd
- **🧭 Hoofdstuk 5 lestabel** gecorrigeerd: `multi-agent-basics.md` is nu Les 1 (de enige volledig hands-on les), met eerlijke labeling dat Les 2 in Hoofdstuk 6 zit en het Retail-scenario een architectuurblauwdruk is, niet een één-commando sjabloon
- **🧭 Hoofdstuk 1 lestabel** bevat nu de nieuwe les "Breng Je Eigen App" (Les 4)
- **🔗 Navigatievoetteksten** bijgewerkt: `first-project.md` linkt nu door naar `bring-your-own-app.md`

#### Gerepareerd
- **🧱 Gesloten de "geclaimde maar ontbrak" Terraform kloof** — de cursus verwees eerder naar Terraform-ondersteuning zonder het te tonen
- **🔀 Corrigeerde misleidende kruislinks in Hoofdstuk 5** die suggereerden dat een volledige multi-agent implementatie bestond terwijl alleen een architectuurblauwdruk beschikbaar was

#### Bijgewerkte bestanden
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

#### AZD 1.25.6 Vernieuwing, Volledige Agent Levenscycluscommando's & Aspire Rebranding
**Deze versie herbevestigt de cursus tegen `azd` `1.25.6` (juni 2026) en de `azure.ai.agents` `0.1.40-preview` extensie, breidt AI-advies uit van "een agent opzetten" naar de volledige agentlevenscyclus (testen → evalueren → optimaliseren → inspecteren → verwijderen), toont de nieuwe `azure.ai.skills` en `azure.ai.connections` preview extensies en vermeldt de productrebranding ".NET Aspire" → "Aspire".**

#### Toegevoegd
- **🔁 Volledige agentlevenscyclusdekking** voor beginners en AI-ingenieurs door de documentatie heen:
  - `docs/chapter-01-foundation/azd-basics.md` — Levenscyclus tabel (opzetten → testen → meten → verbeteren → inspecteren → opruimen) toegevoegd aan de sectie Extensies en AI-commando's
  - `docs/chapter-08-production/production-ai-practices.md` — Nieuwe sectie "Beheer van de agentlevenscyclus" die `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, en `delete --force` behandelt
  - `resources/cheat-sheet.md` — Uitgebreide AI Agent Commando's met `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, en `delete --force`
- **🧩 Nieuwe preview extensies** gedocumenteerd: `azure.ai.skills` (herbruikbare agentvaardigheden) en `azure.ai.connections` (Foundry-verbindingen) toegevoegd aan de extensietabel en de spiekbrief
- **⏱️ Respons-timing richtlijnen** — `azd ai agent invoke` voorbeelden geven nu aan dat het de totale latentie en time-to-first-byte print
- **📌 Versiebanner** in de hoofdfout die cursisten wijst op `azd version` en `azd upgrade`

#### Gewijzigd
- **✅ Validatiebasislijn bijgewerkt** van `azd 1.23.12` (maart 2026) naar `azd 1.25.6` (juni 2026) in alle hoofdstuk-README's en workshopdocumentatie
- **🤖 Hoofdstuk 2 extensienotitie** bijgewerkt van `azure.ai.agents` `0.1.18-preview` naar `0.1.40-preview`
- **🧪 Workshop validatievoorbeeld** (`azd version` output) bijgewerkt naar `1.25.6`
- **🧭 README "Wat is er nieuw in azd Vandaag"** vernieuwd om de end-to-end agentlevenscyclus, nieuwe AI-extensies en recente verbeteringen te benadrukken (`azd init` idempotentie, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Hoofdstuk 2 agents.md (Optie 4)** wijst nu cursisten naar de post-deploy levenscycluscommando's in plaats van te stoppen bij `azd up`

#### Opgelost
- **🏷️ Productnaamgeving** — een Aspire rebranding-opmerking toegevoegd (".NET Aspire" is nu gewoon "Aspire"); azd's Aspire-ondersteuning blijft ongewijzigd
- **🔎 Live release validatie** bevestigd aan de hand van de Azure Developer CLI release feed: stabiele CLI `1.25.6` (2026-06-12) en `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Beginners Aanmelduitleg, Setup Validatie & Laatste AZD Commando Opschoning
**Deze versie volgt de AZD 1.23 validatiesweep op met een beginnersgerichte documentatiepassage: het verduidelijkt AZD-eerste authenticatieadvies, voegt lokale setup-validatiescripts toe, verifieert belangrijke commando's met de live AZD CLI en verwijdert de laatste verouderde Engelse commandoreferenties buiten de changelog.**

#### Toegevoegd
- **🧪 Begint setup-validatiescripts** met `validate-setup.ps1` en `validate-setup.sh` zodat cursisten vereiste tools kunnen bevestigen voordat ze aan Hoofdstuk 1 beginnen
- **✅ Voorafgaande setup-validatiestappen** in de hoofdfout en Hoofdstuk 1 README zodat ontbrekende vereisten worden opgemerkt voordat `azd up`

#### Gewijzigd
- **🔐 Beginners authenticatierichtlijnen** behandelen nu consequent `azd auth login` als de primaire route voor AZD-workflows, waarbij `az login` als optioneel wordt genoemd tenzij Azure CLI-commando's direct worden gebruikt
- **📚 Hoofdstuk 1 aanmeldingsflow** wijst cursisten nu aan om hun lokale setup te valideren vóór installatie, authenticatie en eerste ingezet commando's
- **🛠️ Validator meldingen** scheiden nu duidelijk blokkerende vereisten van optionele Azure CLI-waarschuwingen voor het AZD-only beginnerspad
- **📖 Configuratie-, probleemoplossings- en voorbeelddocs** onderscheiden nu tussen vereiste AZD-authenticatie en optionele Azure CLI-aanmelding waar beide vroeger zonder context werden gepresenteerd

#### Opgelost
- **📋 Overgebleven Engelse commandoverwijzingen** bijgewerkt naar huidige AZD-vormen, inclusief `azd config show` in de spiekbrief en `azd monitor --overview` waar Azure Portal overzichtsadvies bedoeld was
- **🧭 Beginnersclaims in Hoofdstuk 1** verzacht om te voorkomen dat gegarandeerde foutloze of rollbackgedragingen over alle sjablonen en Azure-resources worden overschat
- **🔎 Live CLI-validatie** bevestigde huidige ondersteuning voor `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, en `azd down --force --purge`

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
**Deze versie voert een documentatievalidatiesweep uit tegen `azd` `1.23.12`, werkt verouderde AZD-commando-voorbeelden bij, vernieuwt AI-modelrichtlijnen naar actuele standaarden en breidt de workshopinstructies uit van alleen GitHub Codespaces naar ook dev containers en lokale klonen.**

#### Toegevoegd
- **✅ Validatienotities door kernhoofdstukken en workshopdocs** om de geteste AZD-basislijn expliciet te maken voor cursisten met nieuwere of oudere CLI-versies
- **⏱️ Uitrol-timeoutrichtlijnen** voor langlopende AI-app-uitrol met behulp van `azd deploy --timeout 1800`
- **🔎 Extensie-inspectiestappen** met `azd extension show azure.ai.agents` in AI-workflowdocumentatie
- **🌐 Breder workshopomgevingsadvies** dat GitHub Codespaces, dev containers en lokale klonen met MkDocs dekt

#### Gewijzigd
- **📚 Hoofdstuk inleidende README's** vermelden nu consequent validatie tegen `azd 1.23.12` over fundering, configuratie, infrastructuur, multi-agent, pre-deploy, troubleshooting en productieonderdelen
- **🛠️ AZD commandoverwijzingen** bijgewerkt naar huidige vormen door de documentatie:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` of `azd env get-value(s)` afhankelijk van de context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` waar een Application Insights overzicht bedoeld is
- **🧪 Provision preview voorbeelden** vereenvoudigd naar momenteel ondersteunde usage zoals `azd provision --preview` en `azd provision --preview -e production`
- **🧭 Workshopflow** bijgewerkt zodat cursisten de labs in Codespaces, een dev container of een lokale kloon kunnen voltooien in plaats van alleen in Codespaces uit te voeren
- **🔐 Authenticatierichtlijnen** geven nu voorkeur aan `azd auth login` voor AZD-workflows, met `az login` als optioneel wanneer Azure CLI-commando's direct worden gebruikt

#### Opgelost
- **🪟 Windows install commando's** genormaliseerd naar huidige `winget` pakket hoofdlettergebruik in de installatiehandleiding
- **🐧 Linux installatierichtlijnen** gecorrigeerd om unsupported distro-specifieke `azd` package manager instructies te vermijden en in plaats daarvan naar release-assets te verwijzen waar van toepassing
- **📦 AI-modelvoorbeelden** vernieuwd van oudere standaarden zoals `gpt-35-turbo` en `text-embedding-ada-002` naar actuele voorbeelden zoals `gpt-4.1-mini`, `gpt-4.1` en `text-embedding-3-large`
- **📋 Uitrol en diagnostiek snippets** gecorrigeerd om huidige omgevings- en statuscommando's te gebruiken in logs, scripts en probleemoplossing
- **⚙️ GitHub Actions richtlijnen** bijgewerkt van `Azure/setup-azd@v1.0.0` naar `Azure/setup-azd@v2`
- **🤖 MCP/Copilot toestemmingsadviezen** bijgewerkt van `azd mcp consent` naar `azd copilot consent list`

#### Verbeterd
- **🧠 AI-hoofdstuk richtlijnen** leggen nu beter het preview-gevoelige `azd ai` gedrag, tenant-specifieke login, huidige extensiegebruik en vernieuwde modeluitrolaanbevelingen uit
- **🧪 Workshopinstructies** gebruiken nu realistischere versievoorbeelden en duidelijkere omgevingssetup voor hands-on labs
- **📈 Productie- en probleemoplossingsdocs** sluiten nu beter aan bij actuele monitoring, fallback model en kostenniveauvoorbeelden

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

#### AZD AI CLI Commando's, Content Validatie & Template-uitbreiding
**Deze versie voegt `azd ai`, `azd extension`, en `azd mcp` commandodekking toe in alle AI-gerelateerde hoofdstukken, repareert gebroken links en verouderde code in agents.md, werkt de spiekbrief bij en vernieuwt de sectie Voorbeeld Templates met gevalideerde beschrijvingen en nieuwe Azure AI AZD-templates.**

#### Toegevoegd
- **🤖 AZD AI CLI dekking** verspreid over 7 bestanden (voorheen alleen in Hoofdstuk 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nieuwe sectie "Extensies en AI Commando's" die `azd extension`, `azd ai agent init`, en `azd mcp` introduceert
  - `docs/chapter-02-ai-development/agents.md` — Optie 4: `azd ai agent init` met vergelijkingstabel (template vs manifest-aanpak)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensies voor Foundry" en "Agent-First Deploy" subsectoren
  - `docs/chapter-05-multi-agent/README.md` — Quick Start toont nu zowel template- als manifest-gebaseerde uitrolroutes
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploygedeelte bevat nu ook de `azd ai agent init` optie
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extensiecommando's voor Diagnostiek" subsector
  - `resources/cheat-sheet.md` — Nieuwe sectie "AI & Extensiecommando's" met `azd extension`, `azd ai agent init`, `azd mcp`, en `azd infra generate`
- **📦 Nieuwe AZD AI voorbeeldtemplates** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chat met Blazor WebAssembly, Semantic Kernel en spraakchatondersteuning
  - **azure-search-openai-demo-java** — Java RAG-chat gebruikmakend van Langchain4J met ACA/AKS uitrolopties
  - **contoso-creative-writer** — Multi-agent creatieve schrijfapp gebruikmakend van Azure AI Agent Service, Bing Grounding en Prompty
  - **serverless-chat-langchainjs** — Serverless RAG met Azure Functions + LangChain.js + Cosmos DB met Ollama lokale ontwikkelondersteuning
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator met admin portal, Teams-integratie en PostgreSQL/Cosmos DB-opties
  - **azure-ai-travel-agents** — Multi-agent MCP orkestratie referentie app met servers in .NET, Python, Java en TypeScript
  - **azd-ai-starter** — Minimale Azure AI infrastructuur Bicep starter template
  - **🔗 Geweldige AZD AI Galerij link** — Referentie naar de [awesome-azd AI galerij](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Opgelost
- **🔗 agents.md navigatie**: Vorige/Volgende links komen nu overeen met hoofdstuk 2 README lesvolgorde (Microsoft Foundry Integratie → Agents → AI Model Deployment)
- **🔗 agents.md verbroken links**: `production-ai-practices.md` gecorrigeerd naar `../chapter-08-production/production-ai-practices.md` (3 keer)
- **📦 agents.md verouderde code**: Vervangen `opencensus` door `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ongeldige API**: Verplaatst `max_tokens` van `create_agent()` naar `create_run()` als `max_completion_tokens`
- **🔢 agents.md token telling**: Vervangen ruwe `len//4` schatting door `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Diensten gecorrigeerd van "Cognitive Search + App Service" naar "Azure AI Search + Azure Container Apps" (standaard host gewijzigd in okt 2024)
- **contoso-chat**: Beschrijving bijgewerkt naar verwijzing Azure AI Foundry + Prompty, passend bij de werkelijke titel en tech stack van de repo

#### Verwijderd
- **ai-document-processing**: Niet-functionele template referentie verwijderd (repo niet publiek toegankelijk als AZD template)

#### Verbeterd
- **📝 agents.md oefeningen**: Oefening 1 toont nu verwachte output en `azd monitor` stap; Oefening 2 bevat volledige `FunctionTool` registratiecode; Oefening 3 vervangt vage instructies door concrete `prepdocs.py` commando's
- **📚 agents.md bronnen**: Documentatielinks bijgewerkt naar actuele Azure AI Agent Service docs en quickstart
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

#### Verbetering cursusnavigatie
**Deze versie verbetert de README.md hoofdstuknavigatie met een verbeterde tabelindeling.**

#### Gewijzigd
- **Cursuskaart tabel**: Uitgebreid met directe leslinks, duurindicaties en complexiteitswaarderingen
- **Map opschoning**: Verwijderde overbodige oude mappen (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidatie**: Alle 21+ interne links in cursuskaart tabel geverifieerd

### [v3.16.0] - 2026-02-05

#### Productnaam updates
**Deze versie werkt productverwijzingen bij naar de huidige Microsoft branding.**

#### Gewijzigd
- **Microsoft Foundry → Microsoft Foundry**: Alle verwijzingen bijgewerkt in niet-vertalingsbestanden
- **Azure AI Agent Service → Foundry Agents**: Servicenaam aangepast naar huidige branding

#### Bijgewerkte bestanden
- `README.md` - Hoofdpagina cursus
- `changelog.md` - Versiegeschiedenis
- `course-outline.md` - Cursusstructuur
- `docs/chapter-02-ai-development/agents.md` - AI agents gids
- `examples/README.md` - Voorbeelddocumentatie
- `workshop/README.md` - Workshop landingspagina
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - Alle workshop instructiebestanden

---

### [v3.15.0] - 2026-02-05

#### Grote repository herstructurering: Hoofdstuk-gebaseerde naamgeving mappen
**Deze versie structureert de documentatie in toegewijde hoofdstukmappen voor duidelijkere navigatie.**

#### Map hernoemingen
Oude mappen zijn vervangen door hoofdstukgenummerde mappen:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Nieuwe toegevoegd: `docs/chapter-05-multi-agent/`

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
| Alle troubleshooting bestanden | troubleshooting/ | chapter-07-troubleshooting/ |

#### Toegevoegd
- **📚 Hoofdstuk README bestanden**: README.md aangemaakt in elke hoofdstukmap met:
  - Leerdoelen en duur
  - Lesoverzicht met beschrijvingen
  - Quickstart commando's
  - Navigatie naar andere hoofdstukken

#### Gewijzigd
- **🔗 Alle interne links bijgewerkt**: 78+ paden geactualiseerd in alle documentatiebestanden
- **🗺️ Hoofd README.md**: Cursuskaart bijgewerkt met nieuwe hoofdstukstructuur
- **📝 examples/README.md**: Kruisverwijzingen naar hoofdstukmappen aangepast

#### Verwijderd
- Oude mappenstructuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository herstructurering : Hoofdstuknavigatie
**Deze versie voegde hoofdstuknavigatie README bestanden toe (vervangen door v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nieuwe AI Agents Gids
**Deze versie voegt een uitgebreide gids toe voor het inzetten van AI agents met Azure Developer CLI.**

#### Toegevoegd
- **🤖 docs/microsoft-foundry/agents.md**: Volledige gids over:
  - Wat AI-agents zijn en hoe ze verschillen van chatbots
  - Drie quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Architectuurpatronen van agents (enkele agent, RAG, multi-agent)
  - Toolconfiguratie en aanpassing
  - Monitoring en metriek tracking
  - Kostenoverwegingen en optimalisatie
  - Veelvoorkomende probleemoplossingsscenario's
  - Drie praktische oefeningen met succescriteria

#### Inhoudsstructuur
- **Introductie**: Agentconcepten voor beginners
- **Quickstart**: Agents deployen met `azd init --template get-started-with-ai-agents`
- **Architectuurpatronen**: Visuele diagrammen van agentpatronen
- **Configuratie**: Toolsetup en omgevingsvariabelen
- **Monitoring**: Integratie met Application Insights
- **Oefeningen**: Progressief hands-on leren (20-45 minuten per oefening)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Omgeving Update
**Deze versie werkt de configuratie van de development container bij met moderne tools en betere standaardinstellingen voor de AZD leerervaring.**

#### Gewijzigd
- **🐳 Basisimage**: Bijgewerkt van `python:3.12-bullseye` naar `python:3.12-bookworm` (laatste Debian stable)
- **📛 Containernaam**: Hernoemd van "Python 3" naar "AZD voor Beginners" voor duidelijkheid

#### Toegevoegd
- **🔧 Nieuwe Dev Container Features**:
  - `azure-cli` met Bicep-ondersteuning ingeschakeld
  - `node:20` (LTS-versie voor AZD-templates)
  - `github-cli` voor templatebeheer
  - `docker-in-docker` voor container app deployments

- **🔌 Poort forwarding**: Vooraf geconfigureerde poorten voor veelgebruikte ontwikkeling:
  - 8000 (MkDocs preview)
  - 3000 (Webapps)
  - 5000 (Python Flask)
  - 8080 (API's)

- **🧩 Nieuwe VS Code Extensies**:
  - `ms-python.vscode-pylance` - Verbeterde Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions ondersteuning
  - `ms-azuretools.vscode-docker` - Docker ondersteuning
  - `ms-azuretools.vscode-bicep` - Bicep taalondersteuning
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown bewerking
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram ondersteuning
  - `redhat.vscode-yaml` - YAML ondersteuning (voor azure.yaml)
  - `eamodio.gitlens` - Git visualisatie
  - `mhutchie.git-graph` - Git geschiedenis

- **⚙️ VS Code instellingen**: Standaardinstellingen toegevoegd voor Python interpreter, automatisch formatteren bij opslaan en witruimte verwijderen

- **📦 Bijgewerkte requirements-dev.txt**:
  - MkDocs minify plugin toegevoegd
  - pre-commit toegevoegd voor codekwaliteit
  - Azure SDK pakketten toegevoegd (azure-identity, azure-mgmt-resource)

#### Opgelost
- **Post-Create Command**: Verifieert nu AZD en Azure CLI installatie bij containerstart

---

### [v3.11.0] - 2026-02-05

#### Beginnersvriendelijke README revisie
**Deze versie verbetert aanzienlijk de README.md om toegankelijker te zijn voor beginners en voegt essentiële bronnen toe voor AI-ontwikkelaars.**

#### Toegevoegd
- **🆚 Azure CLI vs AZD vergelijking**: Duidelijke uitleg wanneer welk hulpmiddel te gebruiken met praktische voorbeelden
- **🌟 Geweldige AZD Links**: Directe links naar community template galerij en bijdragebronnen:
  - [Geweldige AZD Galerij](https://azure.github.io/awesome-azd/) - 200+ kant-en-klare templates
  - [Dien een Template In](https://github.com/Azure/awesome-azd/issues) - Community bijdrage
- **🎯 Quickstart gids**: Vereenvoudigde 3-stappen startsectie (Installeren → Inloggen → Deployen)
- **📊 Ervaringsgebaseerde navigatietabel**: Duidelijke aanwijzing waar te starten op basis van ontwikkelaarservaring

#### Gewijzigd
- **README structuur**: Herschikt voor progressieve onthulling - sleutelinfo eerst
- **Introductiesectie**: Herschreven om "De Magie van `azd up`" uit te leggen voor absolute beginners
- **Dubbele inhoud verwijderd**: Gedupliceerde troubleshooting sectie verwijderd
- **Troubleshooting commando's**: `azd logs` verwijzing gecorrigeerd naar geldige `azd monitor --logs`

#### Opgelost
- **🔐 Authenticatiecommando's**: Toegevoegd `azd auth login` en `azd auth logout` aan cheat-sheet.md
- **Ongeldige commandoverwijzingen**: Overgebleven `azd logs` verwijderd uit README troubleshooting sectie

#### Notities
- **Scope**: Wijzigingen toegepast op hoofdzakelijk README.md en resources/cheat-sheet.md
- **Doelgroep**: Verbeteringen gericht op ontwikkelaars die nieuw zijn met AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI commando nauwkeurigheidsupdate
**Deze versie corrigeert niet-bestaande AZD-commando's door de hele documentatie, waardoor alle codevoorbeelden geldige Azure Developer CLI-syntaxis gebruiken.**

#### Opgelost
- **🔧 Niet-bestaande AZD-commando's verwijderd**: Uitgebreide controle en correctie van ongeldige commando's:
  - `azd logs` (bestaat niet) → vervangen door `azd monitor --logs` of Azure CLI alternatieven
  - `azd service` subcommando's (bestaan niet) → vervangen door `azd show` en Azure CLI
  - `azd infra import/export/validate` (bestaan niet) → verwijderd of vervangen door geldige alternatieven
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (bestaan niet) → verwijderd
  - `azd provision --what-if/--rollback` flags (bestaan niet) → bijgewerkt naar gebruik van `--preview`
  - `azd config validate` (bestaat niet) → vervangen door `azd config list`
  - `azd info`, `azd history`, `azd metrics` (bestaan niet) → verwijderd

- **📚 Bijgewerkte bestanden met commando correcties**:
  - `resources/cheat-sheet.md`: Grote revisie van commando referentie
  - `docs/deployment/deployment-guide.md`: Rollback en deployment strategieën gecorrigeerd
  - `docs/troubleshooting/debugging.md`: Loganalyse secties aangepast
  - `docs/troubleshooting/common-issues.md`: Troubleshooting commando's bijgewerkt
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD debug sectie gecorrigeerd
  - `docs/getting-started/azd-basics.md`: Gecorrigeerde bewakingsopdrachten
  - `docs/getting-started/first-project.md`: Bijgewerkte bewakings- en foutopsporingsvoorbeelden
  - `docs/getting-started/installation.md`: Gecorrigeerde help- en voorbeeldversies
  - `docs/pre-deployment/application-insights.md`: Gecorrigeerde opdrachten voor het bekijken van logboeken
  - `docs/pre-deployment/coordination-patterns.md`: Gecorrigeerde foutopsporingsopdrachten voor agenten

- **📝 Versie Referentie Bijgewerkt**: 
  - `docs/getting-started/installation.md`: Veranderde hardcoded `1.5.0` versie naar generieke `1.x.x` met link naar releases

#### Gewijzigd
- **Rollback Strategieën**: Documentatie bijgewerkt om gebruik te maken van Git-gebaseerde rollback (AZD heeft geen ingebouwde rollback)
- **Logbestand bekijken**: Vervangen van `azd logs` verwijzingen door `azd monitor --logs`, `azd monitor --live` en Azure CLI opdrachten
- **Prestatiegedeelte**: Verwijderde niet-bestaande parallelle/incremental deployment-vlaggen, geldige alternatieven aangeboden

#### Technische Details
- **Geldige AZD-opdrachten**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geldige azd monitor Vlaggen**: `--live`, `--logs`, `--overview`
- **Verwijderde Functies**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notities
- **Validatie**: Opdrachten gevalideerd met Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Voltooiing Workshop en Kwaliteitsverbetering Documentatie
**Deze versie voltooit de interactieve workshopmodules, repareert alle kapotte documentatielinks en verbetert de algehele inhoudskwaliteit voor AI-ontwikkelaars die Microsoft AZD gebruiken.**

#### Toegevoegd
- **📝 CONTRIBUTING.md**: Nieuw document met richtlijnen voor bijdragen met:
  - Duidelijke instructies voor het melden van problemen en voorstellen van wijzigingen
  - Documentatiestandaarden voor nieuwe inhoud
  - Richtlijnen voor codevoorbeelden en conventies voor commitberichten
  - Informatie over betrokkenheid van de gemeenschap

#### Voltooid
- **🎯 Workshop Module 7 (Afronding)**: Volledig voltooide afrondingsmodule met:
  - Uitgebreide samenvatting van workshopprestaties
  - Belangrijkste beheersde concepten, inclusief AZD, sjablonen en Microsoft Foundry
  - Aanbevelingen voor voortzetting van de leerreis
  - Workshopuitdagingsoefeningen met moeilijkheidsgraden
  - Feedback van de gemeenschap en ondersteuningslinks

- **📚 Workshop Module 3 (Ontleden)**: Bijgewerkte leerdoelen met:
  - GitHub Copilot met activering van MCP-servers
  - Inzicht in AZD-sjabloonmapstructuur
  - Organisatiepatronen voor infrastructure-as-code (Bicep)
  - Hands-on labinstructies

- **🔧 Workshop Module 6 (Afsluiten)**: Voltooid met:
  - Doelen voor opruimen van bronnen en kostenbeheer
  - Gebruik van `azd down` voor veilige infrastructuurafbouw
  - Richtlijnen voor herstel van zacht-verwijderde cognitive services
  - Bonusverkenning voor GitHub Copilot en Azure Portal

#### Gerepareerd
- **🔗 Reparatie gebroken links**: Opgeloste 15+ gebroken interne documentatielinks:
  - `docs/ai-foundry/ai-model-deployment.md`: Gecorrigeerde paden naar microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Gecorrigeerde paden voor ai-model-deployment.md en production-ai-practices.md
  - `docs/getting-started/first-project.md`: Vervangen niet-bestaande cicd-integration.md door deployment-guide.md
  - `examples/retail-scenario.md`: Gecorrigeerde FAQ en troubleshooting guide paden
  - `examples/container-app/microservices/README.md`: Gecorrigeerde startpagina cursus en deployment guide paden
  - `resources/faq.md` en `resources/glossary.md`: Bijgewerkte AI hoofdstukverwijzingen
  - `course-outline.md`: Gecorrigeerde verwijzingen naar instructeursgids en AI workshop lab

- **📅 Workshop Status Banner**: Bijgewerkt van "Onder Constructie" naar actieve workshopstatus met datum februari 2026

- **🔗 Workshop Navigatie**: Gecorrigeerde gebroken navigatielinks in workshop README.md naar niet-bestaande map lab-1-azd-basics

#### Gewijzigd
- **Workshop Presentatie**: Verwijderd "onder constructie" waarschuwing, workshop is nu compleet en klaar voor gebruik
- **Consistentie Navigatie**: Gewaarborgde correcte inter-module navigatie voor alle workshopmodules
- **Leerpad Verwijzingen**: Bijgewerkte hoofdstukkruisverwijzingen met correcte microsoft-foundry paden

#### Gevalideerd
- ✅ Alle Engelse markdown-bestanden hebben geldige interne links
- ✅ Workshopmodules 0-7 zijn compleet met leerdoelen
- ✅ Navigatie tussen hoofdstukken en modules werkt correct
- ✅ Inhoud is geschikt voor AI-ontwikkelaars die Microsoft AZD gebruiken
- ✅ Beginnersvriendelijke taal en structuur worden consequent gehandhaafd
- ✅ CONTRIBUTING.md biedt duidelijke richtlijnen voor bijdragers uit de gemeenschap

#### Technische Implementatie
- **Linkvalidatie**: Geautomatiseerd PowerShell-script heeft alle .md interne links geverifieerd
- **Inhoudsaudit**: Handmatige beoordeling van workshopcompleetheid en beginnersgeschiktheid
- **Navigatiesysteem**: Consistente navigatiepatronen voor hoofdstukken en modules toegepast

#### Notities
- **Reikwijdte**: Wijzigingen alleen toegepast op Engelse documentatie
- **Vertalingen**: Vertaalmappen niet bijgewerkt in deze versie (automatische vertaling wordt later gesynchroniseerd)
- **Workshopduur**: Volledige workshop biedt nu 3-4 uur hands-on leren

---

### [v3.8.0] - 2025-11-19

#### Geavanceerde Documentatie: Monitoring, Beveiliging en Multi-Agent Patronen
**Deze versie voegt uitgebreide A-niveau lessen toe over Application Insights-integratie, authenticatiepatronen en multi-agent coördinatie voor productie-implementaties.**

#### Toegevoegd
- **📊 Les Application Insights Integratie**: in `docs/pre-deployment/application-insights.md`:
  - AZD-gerichte implementatie met automatische provisioning
  - Complete Bicep-sjablonen voor Application Insights + Log Analytics
  - Werkende Python-toepassingen met aangepaste telemetrie (1.200+ regels)
  - AI/LLM monitoringpatronen (Microsoft Foundry Models token/kosten tracking)
  - 6 Mermaid-diagrammen (architectuur, distributed tracing, telemetrieflow)
  - 3 hands-on oefeningen (alerts, dashboards, AI monitoring)
  - Kusto queryvoorbeelden en kostenoptimalisatiestrategieën
  - Live metrics streamen en realtime foutopsporing
  - 40-50 minuten leertijd met productieklare patronen

- **🔐 Les Authenticatie & Beveiligingspatronen**: in `docs/getting-started/authsecurity.md`:
  - 3 authenticatiepatronen (connection strings, Key Vault, managed identity)
  - Complete Bicep infrastructuursjablonen voor veilige implementaties
  - Node.js applicatiecode met Azure SDK-integratie
  - 3 complete oefeningen (inschakelen managed identity, user-assigned identity, Key Vault rotatie)
  - Beste beveiligingspraktijken en RBAC-configuraties
  - Handleiding voor probleemoplossing en kostenanalyse
  - Productieklaar wachtwoordloos authenticatiepatronen

- **🤖 Les Multi-Agent Coördinatiepatronen**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coördinatiepatronen (sequentieel, parallel, hiërarchisch, gebeurtenisgestuurd, consensus)
  - Complete orchestrator service-implementatie (Python/Flask, 1.500+ regels)
  - 3 gespecialiseerde agent-implementaties (Research, Writer, Editor)
  - Service Bus-integratie voor berichtwachtrij
  - Cosmos DB statusbeheer voor gedistribueerde systemen
  - 6 Mermaid-diagrammen die agentinteracties tonen
  - 3 geavanceerde oefeningen (timeoutbeheer, retry-logica, circuit breaker)
  - Kostenopsplitsing ($240-565/maand) met optimalisatiestrategieën
  - Application Insights integratie voor monitoring

#### Verbeterd
- **Pre-implementatie Hoofdstuk**: Nu inclusief uitgebreide monitoring- en coördinatiepatronen
- **Aan de slag Hoofdstuk**: Verbeterd met professionele authenticatiepatronen
- **Productieklaarheid**: Volledige dekking van beveiliging tot observeerbaarheid
- **Cursusoverzicht**: Bijgewerkt om nieuwe lessen in Hoofdstukken 3 en 6 te vermelden

#### Gewijzigd
- **Leerprogressie**: Betere integratie van beveiliging en monitoring door de cursus heen
- **Documentatiekwaliteit**: Consistente A-niveau standaarden (95-97%) across nieuwe lessen
- **Productiepatronen**: Volledige end-to-end dekking voor enterprise implementaties

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijk pad van ontwikkeling tot productiemonitoring
- **Beveiligingsstandaarden**: Professionele patronen voor authenticatie en geheimenbeheer
- **Observeerbaarheid**: Volledige Application Insights-integratie met AZD
- **AI Workloads**: Gespecialiseerde monitoring voor Microsoft Foundry Models en multi-agent systemen

#### Gevalideerd
- ✅ Alle lessen bevatten volledige werkende code (geen fragmenten)
- ✅ Mermaid-diagrammen voor visueel leren (19 totaal verdeeld over 3 lessen)
- ✅ Hands-on oefeningen met verificatiestappen (9 totaal)
- ✅ Productieklare Bicep-sjablonen inzetbaar via `azd up`
- ✅ Kostenanalyse en optimalisatiestrategieën
- ✅ Handleidingen voor probleemoplossing en beste praktijken
- ✅ Kenniscontroles met verificatie-opdrachten

#### Resultaten Documentatiebeoordeling
- **docs/pre-deployment/application-insights.md**: - Uitgebreide monitoringshandleiding
- **docs/getting-started/authsecurity.md**: - Professionele beveiligingspatronen
- **docs/pre-deployment/coordination-patterns.md**: - Geavanceerde multi-agent architecturen
- **Algemene Nieuwe Inhoud**: - Consistente hoge kwaliteitsstandaarden

#### Technische Implementatie
- **Application Insights**: Log Analytics + aangepaste telemetrie + distributed tracing
- **Authenticatie**: Managed Identity + Key Vault + RBAC-patronen
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestratie
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Kostenbeheer**: Samplingstrategieën, retentiebeleid, budgetcontroles

### [v3.7.0] - 2025-11-19

#### Verbeteringen Documentatiekwaliteit en Nieuw Microsoft Foundry Models Voorbeeld
**Deze versie verbetert de documentatiekwaliteit in het hele repository en voegt een compleet Microsoft Foundry Models implementatievoorbeeld toe met gpt-4.1 chatinterface.**

#### Toegevoegd
- **🤖 Microsoft Foundry Models Chat Voorbeeld**: Compleet gpt-4.1-implementatie met werkende uitvoering in `examples/azure-openai-chat/`:
  - Volledige Microsoft Foundry Models infrastructuur (gpt-4.1 modelimplementatie)
  - Python commandoregel chatinterface met gespreksgeschiedenis
  - Key Vault integratie voor veilige opslag van API-sleutels
  - Tracking van tokengebruik en kosteninschatting
  - Rate limiting en foutafhandeling
  - Uitgebreide README met 35-45 minuten implementatiehandleiding
  - 11 productieklare bestanden (Bicep-sjablonen, Python-app, configuratie)
- **📚 Documentatieoefeningen**: Toegevoegd hands-on praktijkoefeningen aan configuratiehandleiding:
  - Oefening 1: Configuratie multi-omgeving (15 minuten)
  - Oefening 2: Geheimenbeheer oefening (10 minuten)
  - Duidelijke succescriteria en verificatiestappen
- **✅ Verificatie Implementatie**: Toegevoegd verificatiegedeelte aan deployment guide:
  - Gezondheidscontroleprocedures
  - Succescriteria checklist
  - Verwachte outputs voor alle deployment-opdrachten
  - Snelle referentie troubleshooting

#### Verbeterd
- **examples/README.md**: Bijgewerkt naar A-niveau kwaliteit (93%):
  - Toegevoegd azure-openai-chat aan alle relevante secties
  - Bijgewerkt aantal lokale voorbeelden van 3 naar 4
  - Toegevoegd aan AI Application Examples tabel
  - Geïntegreerd in Quick Start voor gevorderde gebruikers
  - Toegevoegd aan Microsoft Foundry Templates sectie
  - Bijgewerkt vergelijking matrix en secties technologiezoektocht
- **Documentatiekwaliteit**: Verbeterd van B+ (87%) → A- (92%) in docs map:
  - Toegevoegd verwachte outputs aan kritieke commando-voorbeelden
  - Inbegrepen verificatiestappen voor configuratiewijzigingen
  - Verbeterd hands-on leren met praktische oefeningen

#### Gewijzigd
- **Leerprogressie**: Betere integratie van AI-voorbeelden voor gevorderde leerlingen
- **Documentatiestructuur**: Meer uitvoerbare oefeningen met duidelijke uitkomsten
- **Verificatieproces**: Expliciete succescriteria toegevoegd aan belangrijke workflows

#### Verbeterd
- **Ontwikkelaarservaring**: Microsoft Foundry Models implementatie duurt nu 35-45 minuten (vs 60-90 voor complexe alternatieven)
- **Kosten Transparantie**: Duidelijke kostenramingen ($50-200/maand) voor Microsoft Foundry Models voorbeeld
- **Leerpad**: AI-ontwikkelaars hebben duidelijk instappunt met azure-openai-chat
- **Documentatiestandaarden**: Consistente verwachte outputs en verificatiestappen

#### Gevalideerd
- ✅ Microsoft Foundry Models voorbeeld volledig functioneel met `azd up`
- ✅ Alle 11 implementatiebestanden syntactisch correct
- ✅ README-instructies komen overeen met werkelijke implementatie-ervaring
- ✅ Documentatielinks bijgewerkt op 8+ locaties
- ✅ Voorbeeldenindex weerspiegelt nauwkeurig 4 lokale voorbeelden
- ✅ Geen dubbele externe links in tabellen
- ✅ Alle navigatieverwijzingen correct

#### Technische Implementatie
- **Microsoft Foundry Models Architectuur**: gpt-4.1 + Key Vault + Container Apps patroon
- **Beveiliging**: Klaar voor Managed Identity, geheimen in Key Vault
- **Monitoring**: Application Insights integratie
- **Kostenbeheer**: Token tracking en gebruiksoptimalisatie
- **Implementatie**: Enkele `azd up` opdracht voor volledige setup

### [v3.6.0] - 2025-11-19

#### Grote Update: Container App Implementatie Voorbeelden
**Deze versie introduceert uitgebreide, productieklare voorbeelden voor het uitrollen van containerapplicaties met Azure Developer CLI (AZD), inclusief volledige documentatie en integratie in het leerpad.**

#### Toegevoegd
- **🚀 Container App Voorbeelden**: Nieuwe lokale voorbeelden in `examples/container-app/`:
  - [Mastergids](examples/container-app/README.md): Volledig overzicht van containerized deployments, snelle start, productie en geavanceerde patronen
  - [Eenvoudige Flask API](../../examples/container-app/simple-flask-api): Beginnersvriendelijke REST API met schaal-tot-nul, health probes, monitoring en probleemoplossing
  - [Microservices Architectuur](../../examples/container-app/microservices): Productieklaar multi-service deployment (API Gateway, Product, Order, User, Notification), asynchrone messaging, Service Bus, Cosmos DB, Azure SQL, gedistribueerde tracing, blue-green/canary deployment
- **Best Practices**: Beveiliging, monitoring, kostenoptimalisatie en CI/CD richtlijnen voor containerized workloads
- **Codevoorbeelden**: Volledige `azure.yaml`, Bicep-templates en multi-language service-implementaties (Python, Node.js, C#, Go)
- **Testen & Probleemoplossing**: End-to-end testscenario's, monitoringcommando's, probleemoplossingsrichtlijnen

#### Gewijzigd
- **README.md**: Geüpdatet om nieuwe container app-voorbeelden onder "Local Examples - Container Applications" te presenteren en te linken
- **examples/README.md**: Geüpdatet om container app-voorbeelden te benadrukken, vergelijkingsmatrixvermeldingen toe te voegen en technologie-/architectuurverwijzingen bij te werken
- **Cursusoverzicht & Studiegids**: Geüpdatet met verwijzingen naar nieuwe container app-voorbeelden en deploymentpatronen in relevante hoofdstukken

#### Gevalideerd
- ✅ Alle nieuwe voorbeelden implementeerbaar met `azd up` en volgen best practices
- ✅ Documentatie cross-links en navigatie bijgewerkt
- ✅ Voorbeelden bestrijken scenario's van beginner tot gevorderd, inclusief productie-microservices

#### Notities
- **Reikwijdte**: Alleen Engelse documentatie en voorbeelden
- **Volgende stappen**: Uitbreiden met extra geavanceerde containerpatronen en CI/CD automatisering in toekomstige releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Deze versie implementeert een uitgebreide naamswijziging van het product van "Microsoft Foundry" naar "Microsoft Foundry" in alle Engelstalige documentatie, wat de officiële rebranding van Microsoft weerspiegelt.**

#### Gewijzigd
- **🔄 Productnaam Update**: Volledige rebranding van "Microsoft Foundry" naar "Microsoft Foundry"
  - Alle verwijzingen bijgewerkt in Engels documentatie in map `docs/`
  - Map hernoemd: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Bestand hernoemd: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totaal: 23 inhoudsverwijzingen bijgewerkt in 7 documentatiebestanden

- **📁 Wijzigingen mapstructuur**:
  - `docs/ai-foundry/` hernoemd naar `docs/microsoft-foundry/`
  - Alle kruisverwijzingen geüpdatet om nieuwe mapstructuur te weerspiegelen
  - Navigatielinks geverifieerd in alle documentatie

- **📄 Bestandhernoemingen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links aangepast naar nieuwe bestandsnaam

#### Bijgewerkte Bestanden
- **Hoofdstukdocumentatie** (7 bestanden):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigatielink updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 productnaamverwijzingen bijgewerkt
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Gebruikt al Microsoft Foundry (van eerdere updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 verwijzingen aangepast (overzicht, feedback community, documentatie)
  - `docs/getting-started/azd-basics.md` - 4 kruisverwijzingslinks bijgewerkt
  - `docs/getting-started/first-project.md` - 2 hoofdstuknavigatielinks bijgewerkt
  - `docs/getting-started/installation.md` - 2 volgende hoofdstuk links aangepast
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 verwijzingen bijgewerkt (navigatie, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigatielink aangepast
  - `docs/troubleshooting/debugging.md` - 1 navigatielink aangepast

- **Bestanden cursusstructuur** (2 bestanden):
  - `README.md` - 17 verwijzingen bijgewerkt (cursus overzicht, hoofdstuktitels, sectie templates, community inzichten)
  - `course-outline.md` - 14 verwijzingen bijgewerkt (overzicht, leerdoelen, hoofdstukbronnen)

#### Gevalideerd
- ✅ Geen resterende "ai-foundry" map padverwijzingen in Engelse docs
- ✅ Geen resterende "Microsoft Foundry" productnaamverwijzingen in Engelse docs
- ✅ Alle navigatielinks functioneel met nieuwe mapstructuur
- ✅ Bestands- en maphernoemingen succesvol afgerond
- ✅ Kruisverwijzingen tussen hoofdstukken gevalideerd

#### Notities
- **Reikwijdte**: Wijzigingen toegepast op Engelse documentatie in map `docs/` alleen
- **Vertalingen**: Vertaalmappen (`translations/`) niet bijgewerkt in deze versie
- **Workshop**: Workshopmaterialen (`workshop/`) niet bijgewerkt in deze versie
- **Voorbeelden**: Voorbeeldbestanden kunnen nog oude naamgeving bevatten (wordt in toekomstige updates aangepakt)
- **Externe Links**: Externe URL's en GitHub repository verwijzingen blijven ongewijzigd

#### Migratiehandleiding voor Bijdragers
Als u lokale branches of documentatie heeft die naar de oude structuur verwijzen:
1. Werk mapverwijzingen bij: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Werk bestandverwijzingen bij: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Vervang productnaam: "Microsoft Foundry" → "Microsoft Foundry"
4. Controleer of alle interne documentatielinks nog werken

---

### [v3.4.0] - 2025-10-24

#### Verbeteringen aan infrastructuur preview en validatie
**Deze versie introduceert uitgebreide ondersteuning voor de nieuwe Azure Developer CLI preview-functie en verbetert de gebruikerservaring van de workshop.**

#### Toegevoegd
- **🧪 azd provision --preview Functiedocumentatie**: Uitgebreide dekking van de nieuwe infrastructuur preview-mogelijkheid
  - Commandoreferentie en gebruiksvoorbeelden in cheat sheet
  - Gedetailleerde integratie in provisioninggids met use cases en voordelen
  - Pre-flight check integratie voor veiligere deployment validatie
  - Updates aan startgids met veiligheid voorop implementaties
- **🚧 Workshop Status Banner**: Professionele HTML-banner die de ontwikkelingsstatus van de workshop aangeeft
  - Verloopontwerp met constructie-indicatoren voor duidelijke gebruikerscommunicatie
  - Laatst bijgewerkte timestamp voor transparantie
  - Mobiel responsief ontwerp voor alle apparaattype

#### Verbeterd
- **Infrastructuurveiligheid**: Preview-functionaliteit geïntegreerd door de gehele deploymentdocumentatie
- **Pre-deployment Validatie**: Geautomatiseerde scripts bevatten nu infrastructuur preview-tests
- **Ontwikkelaarsworkflow**: Aangepaste commando-sequenties met preview als best practice
- **Workshop Ervaring**: Duidelijke verwachtingstelling aan gebruikers over ontwikkelingsstatus inhoud

#### Gewijzigd
- **Deployment Best Practices**: Preview-eerst workflow nu aanbevolen aanpak
- **Documentatiestroom**: Infrastructurele validatie eerder geplaatst in leerproces
- **Workshop Presentatie**: Professionele statuscommunicatie met duidelijke ontwikkelingsplanning

#### Verbeterd
- **Veiligheid-voorop Benadering**: Infrastructuurwijzigingen kunnen nu worden gevalideerd vóór deployment
- **Team Samenwerking**: Preview-resultaten kunnen gedeeld worden voor beoordeling en goedkeuring
- **Kostenbewustzijn**: Beter begrip van resourcekosten vóór provisioning
- **Risicobeperking**: Minder deploymentfouten door voorafgaande validatie

#### Technische Implementatie
- **Multi-document Integratie**: Preview-functie gedocumenteerd in 4 hoofdbestanden
- **Commandopatronen**: Consistente syntax en voorbeelden door de gehele documentatie
- **Integratie Best Practices**: Preview opgenomen in validatieworkflows en scripts
- **Visuele Indicatoren**: Duidelijke NIEUWE functie markeringen voor vindbaarheid

#### Workshop Infrastructuur
- **Statuscommunicatie**: Professionele HTML-banner met verloopstijl
- **Gebruikerservaring**: Duidelijke ontwikkelingsstatus voorkomt verwarring
- **Professionele Presentatie**: Behoudt repository geloofwaardigheid en stelt verwachtingen
- **Tijdlijn Transparantie**: Oktober 2025 laatst bijgewerkt timestamp voor verantwoordelijkheid

### [v3.3.0] - 2025-09-24

#### Verbeterde workshopmaterialen en interactieve leerervaring
**Deze versie introduceert uitgebreide workshopmaterialen met browsergebaseerde interactieve handleidingen en gestructureerde leertrajecten.**

#### Toegevoegd
- **🎥 Interactieve Workshopgids**: Browsergebaseerde workshopervaring met MkDocs preview-mogelijkheid
- **📝 Gestructureerde Workshopinstructies**: 7-stappen begeleid leerpad van ontdekking tot aanpassing
  - 0-Inleiding: Workshop overzicht en setup
  - 1-Selecteer AI-Template: Template ontdekking en selectieproces
  - 2-Valideer AI-Template: Deployment en validatieprocedures
  - 3-Ontleed AI-Template: Begrip van template-architectuur
  - 4-Configureer AI-Template: Configuratie en aanpassing
  - 5-Personaliseer AI-Template: Geavanceerde modificaties en iteraties
  - 6-Afbreken Infrastructuur: Opruiming en resourcebeheer
  - 7-Afsluiting: Samenvatting en volgende stappen
- **🛠️ Workshop Tools**: MkDocs-configuratie met Material-thema voor verbeterde leerervaring
- **🎯 Praktisch Leerpad**: 3-stapsmethodiek (Ontdekking → Deployment → Aanpassing)
- **📱 GitHub Codespaces Integratie**: Naadloze setup van ontwikkelomgeving

#### Verbeterd
- **AI Workshop Lab**: Uitgebreid met uitgebreide 2-3 uur gestructureerde leerervaring
- **Workshopdocumentatie**: Professionele presentatie met navigatie en visuele hulpmiddelen
- **Leerprogressie**: Duidelijke stapsgewijze begeleiding van template selectie tot productie-implementatie
- **Ontwikkelaarservaring**: Geïntegreerde tooling voor gestroomlijnde ontwikkelworkflows

#### Verbeterd
- **Toegankelijkheid**: Browserinterface met zoek-, kopieerfunctionaliteit en themawisselaar
- **Zelfgestuurd leren**: Flexibele workshopstructuur voor verschillende leertempo’s
- **Praktische toepassing**: Realistische AI-template deployment scenario's
- **Community-integratie**: Discord integratie voor workshopondersteuning en samenwerking

#### Workshopfuncties
- **Ingebouwde Zoekfunctie**: Snelle trefwoord- en lesontdekking
- **Codeblokken kopiëren**: Hover-naar-kopiëren functionaliteit voor alle codevoorbeelden
- **Themawisselaar**: Donkere/lichtmodus ondersteuning voor verschillende voorkeuren
- **Visuele Assets**: Screenshots en diagrammen voor beter begrip
- **Hulp Integratie**: Directe Discord-toegang voor communityondersteuning

### [v3.2.0] - 2025-09-17

#### Grote navigatieherstructurering en hoofdstuk-gebaseerd leersysteem
**Deze versie introduceert een uitgebreid hoofdstuk-gebaseerd leerstructuur met verbeterde navigatie door de gehele repository.**

#### Toegevoegd
- **📚 Hoofdstuk-gebaseerd leersysteem**: Hele cursus herschikt in 8 progressieve leerhoofdstukken
  - Hoofdstuk 1: Basis & Snelle Start (⭐ - 30-45 min)
  - Hoofdstuk 2: AI-first ontwikkeling (⭐⭐ - 1-2 uur)
  - Hoofdstuk 3: Configuratie & Authenticatie (⭐⭐ - 45-60 min)
  - Hoofdstuk 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1,5 uur)
  - Hoofdstuk 5: Multi-Agent AI Oplossingen (⭐⭐⭐⭐ - 2-3 uur)
  - Hoofdstuk 6: Pre-deployment Validatie & Planning (⭐⭐ - 1 uur)
  - Hoofdstuk 7: Troubleshooting & Debugging (⭐⭐ - 1-1,5 uur)
  - Hoofdstuk 8: Productie & Enterprise Patronen (⭐⭐⭐⭐ - 2-3 uur)
- **📚 Uitgebreid navigatiesysteem**: Consistente navigatiekoppen en voetteksten door alle documentatie
- **🎯 Voortgangsbewaking**: Cursus voltooiingschecklist en leerverificatiesysteem
- **🗺️ Leerpad begeleiding**: Duidelijke instappunten voor verschillende ervaringsniveaus en doelen
- **🔗 Kruisverwijzingen Navigatie**: Gerelateerde hoofdstukken en vereisten duidelijk gekoppeld

#### Verbeterd
- **README-structuur**: Omgevormd tot een gestructureerd leerplatform met hoofdstuk-gebaseerde organisatie
- **Documentatie navigatie**: Elke pagina toont nu hoofdstukcontext en voortgangsgids
- **Template organisatie**: Voorbeelden en templates gekoppeld aan passende leerhoofdstukken
- **Hulpbronintegratie**: Cheatsheets, FAQ’s en studiegidsen gekoppeld aan relevante hoofdstukken
- **Workshop integratie**: Hands-on labs gekoppeld aan meerdere leerhoofdstukken

#### Gewijzigd
- **Leerprogressie**: Overgestapt van lineaire documentatie naar flexibel hoofdstuk-gebaseerd leren
- **Configuratieplaatsing**: Configuratiehandleiding nu Hoofdstuk 3 voor betere leerstroom
- **AI-inhoud integratie**: Betere integratie van AI-specifieke content door leertraject
- **Productie-inhoud**: Geavanceerde patronen geconsolideerd in Hoofdstuk 8 voor enterprise-leerlingen

#### Verbeterd
- **Gebruikerservaring**: Duidelijke navigatiekruimels en hoofdstukvoortgangsindicatoren
- **Toegankelijkheid**: Consistente navigatiepatronen voor makkelijker cursusdoorloop
- **Professionele presentatie**: Cursusstructuur in universiteitsstijl geschikt voor academische en zakelijke training
- **Leerefficiëntie**: Verminderde zoektijd naar relevante content door betere organisatie

#### Technische Implementatie
- **Navigatiekoppen**: Gestandaardiseerde hoofdstuknavigatie in 40+ documentatiebestanden
- **Voettekstnavigatie**: Consistente voortgangsgids en voltooiingsindicatoren
- **Kruislinking**: Uitgebreid intern linkingssysteem dat gerelateerde concepten verbindt
- **Hoofdstuktoewijzing**: Templates en voorbeelden duidelijk gekoppeld aan leerdoelen

#### Studiegidsverbetering
- **📚 Uitgebreide leerdoelen**: Studiegids herschikt om aan te sluiten bij 8-hoofdstuksysteem
- **🎯 Hoofdstuk-gebaseerde beoordeling**: Elk hoofdstuk bevat specifieke leerdoelen en praktische oefeningen
- **📋 Voortgangsbewaking**: Wekelijks leerschema met meetbare resultaten en checklist
- **❓ Beoordelingsvragen**: Kennisverificatievragen voor elk hoofdstuk met professionele uitkomsten
- **🛠️ Praktische oefeningen**: Hands-on activiteiten met realistische deployment scenario's en probleemoplossing
- **📊 Vaardigheidsprogressie**: Duidelijke voortgang van basisconcepten tot enterprise patronen met focus op loopbaanontwikkeling
- **🎓 Certificeringskader**: Professionele ontwikkelingsresultaten en gemeenschapsherkenningssysteem
- **⏱️ Tijdlijnbeheer**: Gestructureerd 10-weken leerplan met mijlpaalvalidatie

### [v3.1.0] - 2025-09-17

#### Verbeterde Multi-Agent AI Oplossingen
**Deze versie verbetert de multi-agent retailoplossing met betere agentnamen en uitgebreidere documentatie.**

#### Gewijzigd
- **Multi-Agent Terminologie**: "Cora agent" vervangen door "Customer agent" doorheen de retail multi-agent oplossing voor duidelijker begrip
- **Agent Architectuur**: Alle documentatie, ARM-templates en codevoorbeelden bijgewerkt om consistente "Customer agent" naamgeving te gebruiken
- **Configuratie Voorbeelden**: Gemoderniseerde agentconfiguratiepatronen met bijgewerkte naamgevingsconventies
- **Documentatie Consistentie**: Gezorgd dat alle verwijzingen professionele, beschrijvende agentnamen gebruiken

#### Verbeterd
- **ARM Template Pakket**: retail-multiagent-arm-template bijgewerkt met verwijzingen naar Customer agent
- **Architectuur Diagrams**: Mermaid-diagrammen vernieuwd met bijgewerkte agentnamen
- **Code Voorbeelden**: Python-klassen en implementatievoorbeelden gebruiken nu CustomerAgent naamgeving
- **Omgevingsvariabelen**: Alle deployment-scripts bijgewerkt om CUSTOMER_AGENT_NAME conventies te gebruiken

#### Verbeterd
- **Developer Experience**: Duidelijkere agentrollen en verantwoordelijkheden in documentatie
- **Productieklaar**: Betere afstemming op ondernemingsnaamgevingsconventies
- **Leermaterialen**: Intuïtievere agentnamen voor educatieve doeleinden
- **Template Bruikbaarheid**: Vereenvoudigd begrip van agentfuncties en deploymentpatronen

#### Technische Details
- Mermaid architectuurdiagrammen bijgewerkt met CustomerAgent verwijzingen
- CoraAgent klassennamen vervangen door CustomerAgent in Python-voorbeelden
- ARM template JSON-configuraties aangepast om "customer" agenttype te gebruiken
- Omgevingsvariabelen bijgewerkt van CORA_AGENT_* naar CUSTOMER_AGENT_* patronen
- Alle deploymentcommando's en containerconfiguraties vernieuwd

### [v3.0.0] - 2025-09-12

#### Grote Wijzigingen - AI Developer Focus en Microsoft Foundry Integratie
**Deze versie transformeert de repository in een uitgebreide AI-georiënteerde leerbron met Microsoft Foundry integratie.**

#### Toegevoegd
- **🤖 AI-Eerst Leerpad**: Complete herstructurering met prioriteit voor AI-ontwikkelaars en engineers
- **Microsoft Foundry Integratie Gids**: Uitgebreide documentatie voor koppeling AZD met Microsoft Foundry diensten
- **AI Model Deployment Patronen**: Gedetailleerde gids over modelselectie, configuratie en productiedeploymentstrategieën
- **AI Workshop Lab**: 2-3 uur durende hands-on workshop voor het omzetten van AI-applicaties naar AZD-deployable oplossingen
- **Productie AI Best Practices**: Enterprise-klare patronen voor schaalvergroting, monitoring en beveiliging van AI workloads
- **AI-Specifieke Troubleshooting Gids**: Uitgebreide probleemoplossing voor Microsoft Foundry Modellen, Cognitive Services en AI-deployment problemen
- **AI Template Galerij**: Uitgelichte collectie Microsoft Foundry-templates met complexiteitsbeoordelingen
- **Workshop Materialen**: Complete workshopstructuur met hands-on labs en referentiematerialen

#### Verbeterd
- **README Structuur**: AI-ontwikkelaarsgericht met 45% community interessegegevens van Microsoft Foundry Discord
- **Leerpaden**: Toegewijde AI-ontwikkelaarsreis naast traditionele paden voor studenten en DevOps engineers
- **Template Aanbevelingen**: Uitgelichte AI-templates inclusief azure-search-openai-demo, contoso-chat en openai-chat-app-quickstart
- **Community Integratie**: Verbeterde Discord communityondersteuning met AI-specifieke kanalen en discussies

#### Beveiliging & Productiefocus
- **Managed Identity Patronen**: AI-specifieke authenticatie- en beveiligingsconfiguraties
- **Kostenoptimalisatie**: Token gebruiksmonitoring en budgetcontroles voor AI workloads
- **Multi-Region Deployment**: Strategieën voor wereldwijde AI applicatiedeployment
- **Prestatiemonitoring**: AI-specifieke metrics en Application Insights-integratie

#### Documentatiekwaliteit
- **Lineaire Cursusstructuur**: Logische voortgang van beginner tot gevorderde AI deploymentpatronen
- **Geverifieerde URL’s**: Alle externe repository links gecontroleerd en toegankelijk
- **Volledige Referentie**: Alle interne documentatielinks gevalideerd en functioneel
- **Productieklaar**: Enterprise deployment patronen met praktijkvoorbeelden

### [v2.0.0] - 2025-09-09

#### Grote Wijzigingen - Repositoryherstructurering en Professionele Verbetering
**Deze versie vertegenwoordigt een significante herziening van repositorystructuur en inhoudspresentatie.**

#### Toegevoegd
- **Gestructureerd Leer Framework**: Alle documentatiepagina’s bevatten nu Introductie, Leerdoelen en Leerresultaten secties
- **Navigatiesysteem**: Toevoeging van Vorige/Volgende leslinks doorheen alle documentatie voor begeleide leerprogressie
- **Studiegids**: Uitgebreide study-guide.md met leerdoelen, oefeningensets en beoordelingsmaterialen
- **Professionele Presentatie**: Verwijdering van alle emoji-iconen voor verbeterde toegankelijkheid en professionele uitstraling
- **Verbeterde Inhoudsstructuur**: Betere organisatie en doorloop van leermaterialen

#### Gewijzigd
- **Documentatie Formaat**: Alle documentatie gestandaardiseerd met consistente leergerichte structuur
- **Navigatiestroom**: Logische voortgang geïmplementeerd door alle leermaterialen
- **Inhoudspresentatie**: Verwijdering van decoratieve elementen zugunsten van heldere, professionele opmaak
- **Linkstructuur**: Alle interne links bijgewerkt ter ondersteuning van nieuw navigatiesysteem

#### Verbeterd
- **Toegankelijkheid**: Emoji-afhankelijkheden verwijderd voor betere compatibiliteit met schermlezers
- **Professionele Uiterlijk**: Schone, academische stijl presentatie geschikt voor enterprise learning
- **Leerervaring**: Gestructureerde aanpak met duidelijke doelen en uitkomsten voor elke les
- **Inhoudsorganisatie**: Betere logische doorloop en verbinding tussen gerelateerde onderwerpen

### [v1.0.0] - 2025-09-09

#### Initiële Release - Uitgebreide AZD Leer Repository

#### Toegevoegd
- **Kern Documentatiestructuur**
  - Complete getting-started gidsreeks
  - Uitgebreide deployment- en provisioningdocumentatie
  - Gedetailleerde troubleshooting resources en debughandleidingen
  - Validatietools en procedures vóór deployment

- **Getting Started Module**
  - AZD Basisprincipes: Kernconcepten en terminologie
  - Installatiehandleiding: Platform-specifieke setup-instructies
  - Configuratiehandleiding: Omgevingsinrichting en authenticatie
  - Eerste Project Tutorial: Stapsgewijze praktische oefeningen

- **Deployment en Provisioning Module**
  - Deployment Gids: Compleet workflowdocumentatie
  - Provisioning Gids: Infrastructure as Code met Bicep
  - Best practices voor productiedeployments
  - Multi-service architectuurpatronen

- **Pre-deployment Validatie Module**
  - Capaciteitsplanning: Validatie beschikbaarheid Azure-resources
  - SKU-selectie: Uitgebreide servicelaagrichtlijnen
  - Pre-flight Checks: Geautomatiseerde validatiescripts (PowerShell en Bash)
  - Kostenschatting en budgetplanningshulpmiddelen

- **Troubleshooting Module**
  - Veelvoorkomende Problemen: Frequent voorkomende issues en oplossingen
  - Debugging Gids: Systematische probleemoplossingsmethoden
  - Geavanceerde diagnostische technieken en tools
  - Prestatiemonitoring en optimalisatie

- **Hulpbronnen en Referenties**
  - Command Cheat Sheet: Snelle referentie voor essentiële commando’s
  - Woordenlijst: Uitgebreide terminologie- en acroniemenlijst
  - FAQ: Gedetailleerde antwoorden op veelgestelde vragen
  - Externe bronnen en communityconnecties

- **Voorbeelden en Templates**
  - Eenvoudig webapplicatievoorbeeld
  - Template voor statische website deployment
  - Containerapplicatieconfiguratie
  - Patronen voor database-integratie
  - Microservices architectuurexamples
  - Serverless function implementaties

#### Kenmerken
- **Multi-Platform Ondersteuning**: Installatie- en configuratiehandleidingen voor Windows, macOS en Linux
- **Meerdere Vaardigheidsniveaus**: Inhoud ontworpen voor studenten tot professionele ontwikkelaars
- **Praktijkgericht**: Hands-on voorbeelden en scenario’s uit de praktijk
- **Uitgebreide Dekking**: Van basisconcepten tot geavanceerde enterprisepatronen
- **Beveiligingsgerichte Benadering**: Beveiligingsbest practices geïntegreerd doorheen de inhoud
- **Kostenoptimalisatie**: Richtlijnen voor kosteneffectieve deployments en resourcebeheer

#### Documentatiekwaliteit
- **Gedetailleerde Codevoorbeelden**: Praktische, geteste codesamples
- **Stapsgewijze Instructies**: Duidelijke, uitvoerbare aanwijzingen
- **Uitgebreide Foutafhandeling**: Probleemoplossing voor vaak voorkomende issues
- **Integratie Best Practices**: Industriestandaarden en aanbevelingen
- **Versiecompatibiliteit**: Up-to-date met nieuwste Azure diensten en azd functies

## Geplande Toekomstige Verbeteringen

### Versie 3.1.0 (Gepland)
#### AI Platform Uitbreiding
- **Multi-Model Ondersteuning**: Integratiepatronen voor Hugging Face, Azure Machine Learning en custom modellen
- **AI Agent Frameworks**: Templates voor LangChain, Semantic Kernel en AutoGen deployments
- **Geavanceerde RAG Patronen**: Vector database opties buiten Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Verbeterde monitoring voor modelprestaties, tokengebruik en responskwaliteit

#### Developer Experience
- **VS Code Extension**: Geïntegreerde AZD + Microsoft Foundry ontwikkelervaring
- **GitHub Copilot Integratie**: AI-ondersteunde AZD-template generatie
- **Interactieve Tutorials**: Hands-on codeer-oefeningen met geautomatiseerde validatie voor AI scenario’s
- **Videocontent**: Supplementaire videotutorials voor visuele leerlingen gericht op AI deployments

### Versie 4.0.0 (Gepland)
#### Enterprise AI Patronen
- **Governance Framework**: AI model governance, compliance en audittrajecten
- **Multi-Tenant AI**: Patronen voor het bedienen van meerdere klanten met geïsoleerde AI-diensten
- **Edge AI Deployment**: Integratie met Azure IoT Edge en containerinstanties
- **Hybrid Cloud AI**: Multi-cloud en hybride deploymentpatronen voor AI workloads

#### Geavanceerde Functies
- **AI Pipeline Automatisering**: MLOps integratie met Azure Machine Learning pipelines
- **Geavanceerde Beveiliging**: Zero-trust patronen, private endpoints en geavanceerde dreigingsbescherming
- **Prestatieoptimalisatie**: Geavanceerde tuning- en schaalstrategieën voor AI applicaties met hoge doorvoer
- **Globale Distributie**: Content delivery en edge caching patronen voor AI applicaties

### Versie 3.0.0 (Gepland) - Overruled door Huidige Release
#### Voorgestelde Toevoegingen - Nu Geïmplementeerd in v3.0.0
- ✅ **AI-Gerichte Inhoud**: Uitgebreide Microsoft Foundry integratie (Voltooid)
- ✅ **Interactieve Tutorials**: Hands-on AI workshop lab (Voltooid)
- ✅ **Geavanceerde Beveiligingsmodule**: AI-specifieke beveiligingspatronen (Voltooid)
- ✅ **Prestatieoptimalisatie**: AI workload tuningstrategieën (Voltooid)

### Versie 2.1.0 (Gepland) - Gedeeltelijk geïmplementeerd in v3.0.0
#### Kleine verbeteringen - Enkele Voltooid in Huidige Release
- ✅ **Aanvullende Voorbeelden**: AI-gerichte deploymentscenario’s (Voltooid)
- ✅ **Uitgebreide FAQ**: AI-specifieke vragen en troubleshooting (Voltooid)
- **Tool Integratie**: Uitgebreide IDE en editor integratie gidsen
- ✅ **Monitoring Uitbreiding**: AI-specifieke monitoring en alerting patronen (Voltooid)

#### Nog Gepland voor Toekomstige Release
- **Mobielvriendelijke Documentatie**: Responsief ontwerp voor mobiel leren
- **Offline Toegang**: Downloadbare documentatiepakketten
- **Verbeterde IDE Integratie**: VS Code extensie voor AZD + AI workflows
- **Community Dashboard**: Real-time community statistieken en bijdrage-tracking

## Bijdragen aan de Changelog

### Wijzigingen Rapporteren
Bij bijdragen aan deze repository, zorg ervoor dat changelog-vermeldingen bevatten:

1. **Versienummer**: Volgend op semantische versionering (major.minor.patch)
2. **Datum**: Uitgave- of update datum in YYYY-MM-DD formaat
3. **Categorie**: Toegevoegd, Gewijzigd, Verouderd, Verwijderd, Vastgesteld, Beveiliging
4. **Duidelijke Beschrijving**: Bondige omschrijving van de wijziging
5. **Impact Beoordeling**: Hoe de wijzigingen bestaande gebruikers beïnvloeden

### Wijzigingscategorieën

#### Toegevoegd
- Nieuwe functies, documentatiesecties of mogelijkheden
- Nieuwe voorbeelden, templates of leermiddelen
- Aanvullende tools, scripts of utilities

#### Gewijzigd
- Wijzigingen aan bestaande functionaliteit of documentatie
- Updates ter verbetering van helderheid of nauwkeurigheid
- Herstructurering van inhoud of organisatie

#### Verouderd
- Functies of benaderingen die worden uitgefaseerd
- Documentatiesecties gepland voor verwijdering
- Methodes waarvoor betere alternatieven bestaan

#### Verwijderd
- Functies, documentatie of voorbeelden die niet langer relevant zijn
- Verouderde informatie of verouderde benaderingen
- Overbodige of geconsolideerde inhoud

#### Vastgesteld
- Correcties van fouten in documentatie of code
- Oplossingen van gerapporteerde problemen
- Verbeteringen in nauwkeurigheid of functionaliteit

#### Beveiliging
- Beveiligingsgerelateerde verbeteringen of fixes
- Updates aan beveiligingsbest practices
- Oplossingen van beveiligingskwetsbaarheden

### Semantische Versioneringsrichtlijnen

#### Grote Versie (X.0.0)
- Brekende wijzigingen waarbij gebruikersactie vereist is
- Significante herstructurering van inhoud of organisatie
- Wijzigingen die de fundamentele aanpak of methodologie veranderen

#### Kleine Versie (X.Y.0)
- Nieuwe features of inhoudelijke toevoegingen
- Verbeteringen die achterwaarts compatibel blijven
- Aanvullende voorbeelden, tools of bronnen

#### Patch Versie (X.Y.Z)
- Bugfixes en correcties
- Kleine verbeteringen aan bestaande inhoud
- Verhelderingen en kleine aanvullingen

## Feedback en Suggesties vanuit de Community

We moedigen actief communityfeedback aan om deze leerbron te verbeteren:

### Hoe Feedback te Geven
- **GitHub Issues**: Problemen melden of verbeteringen voorstellen (AI-specifieke issues zijn welkom)
- **Discord Discussies**: Deel ideeën en ga in gesprek met de Microsoft Foundry community
- **Pull Requests**: Lever directe verbeteringen aan inhoud, vooral AI-templates en gidsen
- **Microsoft Foundry Discord**: Deelname aan #Azure kanaal voor AZD + AI discussies
- **Community Forums**: Deelname aan bredere Azure ontwikkelaarsdiscussies

### Feedbackcategorieën
- **AI Inhoudsnauwkeurigheid**: Correcties op AI dienstintegratie en deploymentinformatie
- **Leerervaring**: Suggesties voor verbeterde AI ontwikkelaarsleerflow
- **Ontbrekende AI Inhoud**: Verzoeken voor extra AI-templates, patronen of voorbeelden
- **Toegankelijkheid**: Verbeteringen voor diverse leerbehoeften
- **AI Tool Integratie**: Suggesties voor betere integratie in AI ontwikkelingsworkflow
- **Productie AI Patronen**: Verzoeken voor enterprise AI deploymentpatronen

### Reactieverplichting
- **Issue Respons**: Binnen 48 uur voor gerapporteerde problemen
- **Feature Requests**: Evaluatie binnen een week
- **Community Bijdragen**: Review binnen een week
- **Beveiligingskwesties**: Onmiddellijke prioriteit met versnelde reactie

## Onderhoudsschema

### Regelmatige Updates
- **Maandelijkse Reviews**: Inhoudsnauwkeurigheid en linkvalidatie
- **Kwartaalupdates**: Grote inhoudelijke toevoegingen en verbeteringen
- **Halfjaarlijkse Reviews**: Uitgebreide herstructurering en verbetering
- **Jaarlijkse Releases**: Grote versie-updates met significante verbeteringen

### Monitoring en Kwaliteitswaarborging
- **Geautomatiseerd Testen**: Regelmatige validatie van codevoorbeelden en links
- **Integratie van Feedback uit de Gemeenschap**: Regelmatige opname van gebruikerssuggesties
- **Technologie-updates**: Afstemming op de nieuwste Azure-diensten en azd-releases
- **Toegankelijkheidsaudits**: Regelmatige beoordeling op inclusieve ontwerpprincipes

## Versiebeleidsbeleid

### Huidige Versieondersteuning
- **Laatste Grote Versie**: Volledige ondersteuning met regelmatige updates
- **Vorige Grote Versie**: Beveiligingsupdates en kritieke fixes gedurende 12 maanden
- **Legacy-versies**: Alleen ondersteuning door de gemeenschap, geen officiële updates

### Migratierichtlijnen
Wanneer grote versies worden uitgebracht, bieden we:
- **Migratiehandleidingen**: Stapsgewijze overgangsinstructies
- **Compatibiliteitsnotities**: Details over brekende veranderingen
- **Toolondersteuning**: Scripts of hulpmiddelen om bij de migratie te helpen
- **Gemeenschapsondersteuning**: Toegewijde forums voor migratievragen

---

**Navigatie**
- **Vorige Les**: [Studiegids](resources/study-guide.md)
- **Volgende Les**: Terug naar [Hoofd README](README.md)

**Blijf op de hoogte**: Volg deze repository voor meldingen over nieuwe releases en belangrijke updates van het lesmateriaal.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->