# Wijzigingslogboek - AZD For Beginners

## Inleiding

Dit wijzigingslogboek documenteert alle opmerkelijke wijzigingen, updates en verbeteringen aan de AZD For Beginners repository. We volgen semantische versiebeheerprincipes en onderhouden dit logboek om gebruikers te helpen begrijpen wat er tussen versies is veranderd.

## Leerdoelen

Door dit wijzigingslogboek te bekijken, zult u:
- Op de hoogte blijven van nieuwe functies en toegevoegde inhoud
- Verbeteringen aan bestaande documentatie begrijpen
- Bugfixes en correcties volgen om nauwkeurigheid te waarborgen
- De evolutie van het lesmateriaal in de loop van de tijd volgen

## Leerresultaten

Na het bekijken van de changelog-items, zult u in staat zijn om:
- Nieuwe inhoud en bronnen die beschikbaar zijn voor leren te identificeren
- Te begrijpen welke secties zijn bijgewerkt of verbeterd
- Uw leerpad te plannen op basis van het meest actuele materiaal
- Feedback en suggesties bij te dragen voor toekomstige verbeteringen

## Versiegeschiedenis

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Deze versie sluit de resterende intermediate-gaten die naar voren kwamen in de azd-coverage-analyse: hoe je je eigen template kunt maken en publiceren, reproduceerbare dev-container/Codespaces-omgevingen, de Pulumi-infrastructuurprovider, een Azure DevOps CI/CD walkthrough, service-principal authenticatie, host-selectie begeleiding (AKS/Spring Apps), `azd restore`/`azd package` uitleg, foutafhandeling voor hooks, en team-/gedeelde-omgeving praktijken.**

#### Added
- **🧱 Nieuwe Hoofdstuk 4 les** `docs/chapter-04-infrastructure/custom-templates.md` — het schrijven van je eigen azd-template: vereiste structuur (`azure.yaml`, `infra/`, `src/`), het `metadata.template` veld, het parameteriseren van infrastructuur met de `uniqueString()` resource token en `azd-env-name` tag, lokaal testen met `azd init --template <local-path>`, publiceren naar GitHub, en indienen bij de Awesome AZD-galerij
- **📦 Nieuwe Hoofdstuk 1 les** `docs/chapter-01-foundation/dev-containers.md` — reproduceerbare azd-omgevingen met Dev Containers en GitHub Codespaces: een minimale `.devcontainer/devcontainer.json` die de officiële `ghcr.io/azure/azure-dev/azd` feature gebruikt, taalspecifieke features, `docker-in-docker` voor container hosts, en `azd auth login --use-device-code` voor aanmelding op afstand
- **🧩 Pulumi met azd** sectie in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi mapindeling, stacks gemapt naar azd-omgevingen, vereiste outputs/tagging, en de identieke `azd up` / `azd down` workflow
- **🎯 Host-selectie begeleiding** in `docs/chapter-04-infrastructure/provisioning.md` — een beginner-vriendelijke vergelijking van `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, en `springapp`, met uitleg wanneer je AKS of Azure Spring Apps zou kiezen
- **🛠️ Azure DevOps CI/CD walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection met workload identity federation (OIDC), de gegenereerde `azure-dev.yml`, en variabele-groep setup
- **🔑 Service Principals (Pattern 4)** toegevoegd aan `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, niet-interactieve `azd auth login` met client secret versus gefedereerde/OIDC-credentials, wanneer te gebruiken, en veilige opslag van referenties
- **🪝 Foutafhandeling voor hooks** subsectie in `docs/chapter-04-infrastructure/deployment-guide.md` — exitcodes en `set -e`, `continueOnError`, het testen van hooks in isolatie met `azd hooks run`, OS-specifieke shells, en `--debug`
- **👥 Team / gedeelde omgevingen** sectie in `docs/chapter-03-configuration/configuration.md` — wat er in `.azure/` leeft, wat je moet gitignore'en, per-developer omgevingen, `azd env list`/`select`, en het leveren van omgevingswaarden in CI/CD
- **🧰 `azd restore` en uitgebreide `azd package`** uitleg in `resources/cheat-sheet.md` — het herstellen van afhankelijkheden en het bouwen van een inzetbaar artifact zonder te deployen

#### Changed
- **🧭 Hoofdstuk 4 lessen tabel** bijgewerkt om de nieuwe "Authoring Your Own Template" les (Les 3) op te nemen
- **🧭 Hoofdstuk 1 lessen tabel** bijgewerkt om de nieuwe "Dev Containers & Codespaces" les (Les 5) op te nemen; navigatie voetnoten verbonden tussen `bring-your-own-app.md` en `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Deze versie sluit de grootste gaten voor een complete beginnersgids door twee nieuwe hands-on lessen toe te voegen (een deployable multi-agent walkthrough en het toevoegen van azd aan een bestaand app), een beginner-vriendelijke hooks-introductie, een Terraform-met-azd sectie, een stapsgewijze GitHub Actions pipeline walkthrough, een uitleg voor de nieuwe preview-extensies, en een expliciete deployment-verificatie checklist.**

#### Added
- **🤝 Nieuwe Hoofdstuk 5 les** `docs/chapter-05-multi-agent/multi-agent-basics.md` — een volledig hands-on, deployable twee-agent walkthrough (orchestrator + specialisten) met een echte template (`contoso-creative-writer`), behandelend wanneer je multi-agent gebruikt, de `azd up` workflow, begrip van de gedeployde resources, cross-agent tracing, aanpassing, en cleanup
- **📦 Nieuwe Hoofdstuk 1 les** `docs/chapter-01-foundation/bring-your-own-app.md` — hoe je azd toevoegt aan een bestaand project met `azd init` ("use code in the current directory"), begrip van `azure.yaml` en `infra/`, `azd infra generate`, host-detectie, en deployen met `azd up`
- **🌐 Terraform met azd** sectie toegevoegd aan `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, `.tf` mapindeling, vereiste `AZURE_*` outputs en `azd-env-name` tagging, en de identieke `azd up` / `azd down` workflow (sluit het gat waarin Terraform-ondersteuning werd genoemd maar alleen Bicep werd getoond)
- **⚙️ Stapsgewijze GitHub Actions walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — van GitHub repo naar geautomatiseerde deploys: `azd pipeline config`, OIDC gefedereerde credentials (geen opgeslagen secrets), de gegenereerde `azure-dev.yml`, en geheimen-versus-variabelen advies
- **🪝 Beginner "Nieuw met hooks?" introductie** in `docs/chapter-04-infrastructure/deployment-guide.md` — wat een hook is, een hook-stage tabel, een minimale eerste hook, en het handmatig uitvoeren van hooks met `azd hooks run`
- **✅ "Verifieer je Deployment" checklist** toegevoegd aan Stap 5 van `docs/chapter-01-foundation/first-project.md` — smoke test, health-endpoint controle, en expliciete succescriteria
- **🧩 Uitleg voor nieuwe preview-extensies** `azure.ai.skills` en `azure.ai.connections` (wat ze zijn en wanneer je ze zou gebruiken) in `docs/chapter-08-production/production-ai-practices.md`

#### Changed
- **🧭 Hoofdstuk 5 lessen tabel** gecorrigeerd: `multi-agent-basics.md` is nu Les 1 (de enige volledig hands-on les), met eerlijke labeling dat Les 2 in Hoofdstuk 6 leeft en het Retail-scenario een architectuurblueprint is, geen one-command template
- **🧭 Hoofdstuk 1 lessen tabel** bevat nu de nieuwe "Bring Your Own App" les (Les 4)
- **🔗 Navigatie voetnoten** bijgewerkt: `first-project.md` linkt nu vooruit naar `bring-your-own-app.md`

#### Fixed
- **🧱 Sluiting van het "genoemd maar ontbrekend" Terraform-gat** — de cursus verwees eerder naar Terraform-ondersteuning zonder het te laten zien
- **🔀 Gecorrigeerde misleidende cross-links in Hoofdstuk 5** die suggereerden dat een volledige multi-agent implementatie bestond terwijl alleen een architectuurblueprint aanwezig was

#### Bestanden Bijgewerkt
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

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Deze versie valideert de cursus opnieuw tegen `azd` `1.25.6` (juni 2026) en de `azure.ai.agents` `0.1.40-preview` extensie, breidt AI-richtlijnen uit van "scaffold een agent" tot de volledige agent lifecycle (test → evaluate → optimize → inspect → delete), belicht de nieuwe `azure.ai.skills` en `azure.ai.connections` preview-extensies, en vermeldt de ".NET Aspire" → "Aspire" product rebranding.**

#### Added
- **🔁 Volledige agent lifecycle dekking** voor beginners en AI-engineers door de documentatie:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle tabel (scaffold → test → measure → improve → inspect → clean up) toegevoegd aan de Extensions en AI Commands sectie
  - `docs/chapter-08-production/production-ai-practices.md` — Nieuwe sectie "Managing the Agent Lifecycle" die `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, en `delete --force` behandelt
  - `resources/cheat-sheet.md` — Uitgebreide AI Agent Commands met `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, en `delete --force`
- **🧩 Nieuwe preview-extensies** gedocumenteerd: `azure.ai.skills` (herbruikbare agent skills) en `azure.ai.connections` (Foundry connections) toegevoegd aan de extensietabel en cheat sheet
- **⏱️ Richtlijnen voor responstijd** — `azd ai agent invoke` voorbeelden geven nu aan dat het totale latency en time-to-first-byte print
- **📌 Versiebanner** in de root README die lerenden wijst op `azd version` en `azd upgrade`

#### Changed
- **✅ Validatiebaseline bijgewerkt** van `azd 1.23.12` (maart 2026) naar `azd 1.25.6` (juni 2026) in alle hoofdstuk-READMEs en workshopdocumentatie
- **🤖 Hoofdstuk 2 extensie-opmerking** bijgewerkt van `azure.ai.agents` `0.1.18-preview` naar `0.1.40-preview`
- **🧪 Workshop validatievoorbeeld** (`azd version` output) bijgewerkt naar `1.25.6`
- **🧭 README "What's New in azd Today"** ververst om de end-to-end agent lifecycle, nieuwe AI-extensies, en recente quality-of-life fixes (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt) te benadrukken
- **📖 Hoofdstuk 2 agents.md (Optie 4)** verwijst nu lerenden naar de post-deploy lifecycle-commando's in plaats van te stoppen bij `azd up`

#### Fixed
- **🏷️ Productnaamgeving** — toevoeging van een Aspire rebrand-opmerking (".NET Aspire" is nu simpelweg "Aspire"); de Aspire-ondersteuning in azd is ongewijzigd
- **🔎 Live release validatie** bevestigd tegen de Azure Developer CLI release feed: stabiele CLI `1.25.6` (2026-06-12) en `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Bestanden Bijgewerkt
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
#### Beginners-onboarding verduidelijking, setup-validatie & definitieve AZD-commando opschoning
**Deze versie bouwt voort op de AZD 1.23 validatie-sweep met een documentatiepassage gericht op beginners: het verduidelijkt AZD-eerst authenticatieadvies, voegt lokale setup-validatiescripts toe, verifieert sleutelcommando's tegen de live AZD CLI, en verwijdert de laatste verouderde Engelstalige commandoverwijzingen buiten de changelog.**

#### Toegevoegd
- **🧪 Beginners setup-validatiescripts** met `validate-setup.ps1` en `validate-setup.sh` zodat leerlingen vereiste tools kunnen bevestigen voordat ze aan Hoofdstuk 1 beginnen
- **✅ Voorafgaande setup-validatiestappen** in de root README en Hoofdstuk 1 README zodat missende vereisten worden opgemerkt vóór `azd up`

#### Gewijzigd
- **🔐 Beginners authenticatieadvies** behandelt nu consequent `azd auth login` als de primaire route voor AZD-workflows, met `az login` als optioneel tenzij Azure CLI-commando's direct worden gebruikt
- **📚 Hoofdstuk 1 onboarding-flow** verwijst nu naar het valideren van de lokale setup vóór installatie, authenticatie en eerste deployment-stappen
- **🛠️ Validator-berichten** scheiden nu duidelijk blokkerende vereisten van optionele Azure CLI-waarschuwingen voor het AZD-enkelvoudige beginnende pad
- **📖 Configuratie-, probleemoplossings- en voorbeelddocs** onderscheiden nu vereiste AZD-authenticatie en optionele Azure CLI-aanmelding waar beide eerder zonder context werden gepresenteerd

#### Opgelost
- **📋 Overgebleven Engelstalige commandoverwijzingen** bijgewerkt naar huidige AZD-vormen, inclusief `azd config show` in het spiekbriefje en `azd monitor --overview` waar Azure Portal overview-advies bedoeld was
- **🧭 Beginnersclaims in Hoofdstuk 1** verzacht om overbeloftes over gegarandeerde foutloze of rollback-gedrag over alle templates en Azure-resources te vermijden
- **🔎 Live CLI-validatie** bevestigd huidige ondersteuning voor `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, en `azd down --force --purge`

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

#### AZD 1.23.12 validatie, workshop-omgevingsuitbreiding & AI-modelverversing
**Deze versie voert een documentatievalidatie uit tegen `azd` `1.23.12`, werkt verouderde AZD-commandovoorbeelden bij, ververst AI-modeladvies naar huidige standaarden, en breidt de workshopinstructies uit voorbij GitHub Codespaces om ook dev containers en lokale clones te ondersteunen.**

#### Toegevoegd
- **✅ Validatienotities door kernhoofdstukken en workshopdocs** om de geteste AZD-baseline expliciet te maken voor leerlingen die nieuwere of oudere CLI-builds gebruiken
- **⏱️ Deployment time-out advies** voor langlopende AI-app deployments met `azd deploy --timeout 1800`
- **🔎 Extensies inspectiestappen** met `azd extension show azure.ai.agents` in AI-workflow docs
- **🌐 Breder workshop-omgevingsadvies** dat GitHub Codespaces, dev containers en lokale clones met MkDocs dekt

#### Gewijzigd
- **📚 Hoofdstuk-intro READMEs** noteren nu consequent validatie tegen `azd 1.23.12` in foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting en production secties
- **🛠️ AZD-commandoverwijzingen** bijgewerkt naar huidige vormen door de docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` of `azd env get-value(s)` afhankelijk van context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` waar Application Insights overview bedoeld is
- **🧪 Provision preview voorbeelden** vereenvoudigd naar huidige ondersteunde gebruiksvormen zoals `azd provision --preview` en `azd provision --preview -e production`
- **🧭 Workshop-flow** bijgewerkt zodat leerlingen de labs kunnen voltooien in Codespaces, een dev container of een lokale clone in plaats van aan te nemen dat alleen Codespaces wordt gebruikt
- **🔐 Authenticatieadvies** geeft nu de voorkeur aan `azd auth login` voor AZD-workflows, met `az login` gepositioneerd als optioneel wanneer Azure CLI-commando's direct worden gebruikt

#### Opgelost
- **🪟 Windows install-commando's** genormaliseerd naar huidige `winget` package-schrijfwijze in de installatiegids
- **🐧 Linux install-advies** gecorrigeerd om onondersteunde distro-specifieke `azd` package manager instructies te vermijden en in plaats daarvan naar release-artifacts te verwijzen waar passend
- **📦 AI-modelvoorbeelden** ververst van oudere defaults zoals `gpt-35-turbo` en `text-embedding-ada-002` naar actuele voorbeelden zoals `gpt-4.1-mini`, `gpt-4.1`, en `text-embedding-3-large`
- **📋 Deployment- en diagnostieksnippets** gecorrigeerd om huidige environment- en statuscommando's in logs, scripts en troubleshooting-stappen te gebruiken
- **⚙️ GitHub Actions advies** bijgewerkt van `Azure/setup-azd@v1.0.0` naar `Azure/setup-azd@v2`
- **🤖 MCP/Copilot consent-advies** bijgewerkt van `azd mcp consent` naar `azd copilot consent list`

#### Verbeterd
- **🧠 AI-hoofdstukadvies** legt nu beter uit hoe preview-gevoelig `azd ai` gedrag is, tenant-specifieke login, huidige extensie-gebruik en bijgewerkte model-deploy aanbevelingen
- **🧪 Workshopinstructies** gebruiken nu realistischere versievoorbeelden en duidelijkere omgevingssetuptaal voor hands-on labs
- **📈 Production- en troubleshooting-docs** sluiten nu beter aan bij huidige monitoring-, fallback-model- en kostenlaagvoorbeelden

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

#### AZD AI CLI-commando's, contentvalidatie & template-uitbreiding
**Deze versie voegt dekking toe voor `azd ai`, `azd extension` en `azd mcp` commando's in alle AI-gerelateerde hoofdstukken, repareert gebroken links en verouderde code in agents.md, werkt het spiekbriefje bij, en vernieuwt de sectie Voorbeeldtemplates met gevalideerde beschrijvingen en nieuwe Azure AI AZD-templates.**

#### Toegevoegd
- **🤖 AZD AI CLI-dekking** verspreid over 7 bestanden (voorheen alleen in Hoofdstuk 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nieuwe sectie "Extensions and AI Commands" die `azd extension`, `azd ai agent init`, en `azd mcp` introduceert
  - `docs/chapter-02-ai-development/agents.md` — Optie 4: `azd ai agent init` met vergelijkende tabel (template vs manifest-benadering)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" en "Agent-First Deployment" subsecties
  - `docs/chapter-05-multi-agent/README.md` — Quick Start toont nu zowel template- als manifest-gebaseerde deploymentpaden
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-sectie bevat nu `azd ai agent init` optie
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsectie
  - `resources/cheat-sheet.md` — Nieuwe sectie "AI & Extensions Commands" met `azd extension`, `azd ai agent init`, `azd mcp`, en `azd infra generate`
- **📦 Nieuwe AZD AI voorbeeldtemplates** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat met Blazor WebAssembly, Semantic Kernel, en voice chat ondersteuning
  - **azure-search-openai-demo-java** — Java RAG chat met Langchain4J met ACA/AKS deployment-opties
  - **contoso-creative-writer** — Multi-agent creatieve schrijversapp met Azure AI Agent Service, Bing Grounding, en Prompty
  - **serverless-chat-langchainjs** — Serverless RAG met Azure Functions + LangChain.js + Cosmos DB en Ollama lokale dev-ondersteuning
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator met admin portal, Teams-integratie, en PostgreSQL/Cosmos DB opties
  - **azure-ai-travel-agents** — Multi-agent MCP orkestratie referentie-app met servers in .NET, Python, Java, en TypeScript
  - **azd-ai-starter** — Minimale Azure AI infrastructuur Bicep starter-template
  - **🔗 Awesome AZD AI Gallery link** — Referentie naar de [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Opgelost
- **🔗 agents.md navigatie**: Vorige/Volgende links komen nu overeen met de lesvolgorde in Hoofdstuk 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md gebroken links**: `production-ai-practices.md` gecorrigeerd naar `../chapter-08-production/production-ai-practices.md` (3 keer)
- **📦 agents.md verouderde code**: Vervangen van `opencensus` door `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ongeldige API**: Verplaatst `max_tokens` van `create_agent()` naar `create_run()` als `max_completion_tokens`
- **🔢 agents.md token-telling**: Vervangen van ruwe `len//4` schatting door `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Diensten gecorrigeerd van "Cognitive Search + App Service" naar "Azure AI Search + Azure Container Apps" (standaardhost gewijzigd in okt 2024)
- **contoso-chat**: Beschrijving bijgewerkt om Azure AI Foundry + Prompty te refereren, passend bij de repo's werkelijke titel en tech stack

#### Verwijderd
- **ai-document-processing**: Niet-functionele templateverwijzing verwijderd (repo niet publiek toegankelijk als AZD-template)

#### Verbeterd
- **📝 agents.md oefeningen**: Oefening 1 toont nu verwachte output en `azd monitor` stap; Oefening 2 bevat volledige `FunctionTool` registratiecode; Oefening 3 vervangt vage aanwijzingen door concrete `prepdocs.py` commando's
- **📚 agents.md bronnen**: Documentatielinks bijgewerkt naar huidige Azure AI Agent Service docs en quickstart
- **📋 agents.md Volgende-stappen tabel**: AI Workshop Lab-link toegevoegd voor volledige hoofdstukdekking

#### Bestanden bijgewerkt
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### Verbetering van cursusnavigatie
**Deze versie verbetert de hoofdstuknavigatie in README.md met een verbeterd tabelindeling.**

#### Gewijzigd
- **Cursusoverzichtstabel**: Verrijkt met directe leslinks, geschatte duur en complexiteitsbeoordelingen
- **Opruimen van mappen**: Verwijderde overbodige oude mappen (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkvalidatie**: Alle 21+ interne links in de Cursusoverzichtstabel gecontroleerd

### [v3.16.0] - 2026-02-05

#### Bijgewerkte productnamen
**Deze versie werkt productverwijzingen bij naar de huidige Microsoft-branding.**

#### Gewijzigd
- **Microsoft Foundry → Microsoft Foundry**: Alle verwijzingen bijgewerkt in niet-vertalingsbestanden
- **Azure AI Agent Service → Foundry Agents**: Servicenaam bijgewerkt om de huidige branding te weerspiegelen

#### Bijgewerkte bestanden
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Grote herschikking van repository: hoofdstukgebaseerde mapnamen
**Deze versie herstructureert de documentatie in aparte hoofdstukmappen voor duidelijkere navigatie.**

#### Hernoemen van mappen
Oude mappen zijn vervangen door hoofdstukgenummerde mappen:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Toegevoegd
- **📚 Hoofdstuk README-bestanden**: README.md aangemaakt in elke hoofdstukmap met:
  - Leerdoelen en duur
  - Lessentabel met beschrijvingen
  - Snelstartopdrachten
  - Navigatie naar andere hoofdstukken

#### Gewijzigd
- **🔗 Alle interne links bijgewerkt**: 78+ paden bijgewerkt in alle documentatiebestanden
- **🗺️ Hoofd-README.md**: Cursusoverzicht bijgewerkt met nieuwe hoofdstukstructuur
- **📝 examples/README.md**: Kruisverwijzingen naar hoofdstukmappen bijgewerkt

#### Verwijderd
- Oude mappenstructuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-herschikking: hoofdstuknavigatie
**Deze versie voegde hoofdstuknavigatie-README-bestanden toe (vervangen door v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nieuwe AI-agentsgids
**Deze versie voegt een uitgebreide gids toe voor het implementeren van AI-agents met Azure Developer CLI.**

#### Toegevoegd
- **🤖 docs/microsoft-foundry/agents.md**: Volledige gids die omvat:
  - Wat AI-agents zijn en hoe ze verschillen van chatbots
  - Drie snelstart-agenttemplates (Foundry Agents, Prompty, RAG)
  - Architectuurpatronen voor agents (enkele agent, RAG, multi-agent)
  - Configuratie en aanpassing van tools
  - Monitoring en metriek-tracking
  - Kostenoverwegingen en optimalisatie
  - Veelvoorkomende foutoplossingsscenario's
  - Drie praktijkgerichte oefeningen met succescriteria

#### Inhoudsstructuur
- **Inleiding**: Agentconcepten voor beginners
- **Snelstart**: Agents implementeren met `azd init --template get-started-with-ai-agents`
- **Architectuurpatronen**: Visuele diagrammen van agentpatronen
- **Configuratie**: Toolconfiguratie en omgevingsvariabelen
- **Monitoring**: Integratie met Application Insights
- **Oefeningen**: Stapsgewijs praktijkleren (20-45 minuten elk)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-omgevingsupdate
**Deze versie werkt de configuratie van de ontwikkelingscontainer bij met moderne tools en betere standaardinstellingen voor de AZD-leerervaring.**

#### Gewijzigd
- **🐳 Basisimage**: Bijgewerkt van `python:3.12-bullseye` naar `python:3.12-bookworm` (meest recente stabiele Debian)
- **📛 Containernaam**: Hernoemd van "Python 3" naar "AZD for Beginners" voor duidelijkheid

#### Toegevoegd
- **🔧 Nieuwe DevContainer-functies**:
  - `azure-cli` met Bicep-ondersteuning ingeschakeld
  - `node:20` (LTS-versie voor AZD-templates)
  - `github-cli` voor templatebeheer
  - `docker-in-docker` voor implementaties van container-apps

- **🔌 Poortdoorsturing**: Vooraf geconfigureerde poorten voor veelvoorkomende ontwikkeling:
  - 8000 (MkDocs-voorbeeld)
  - 3000 (webapps)
  - 5000 (Python Flask)
  - 8080 (API's)

- **🧩 Nieuwe VS Code-extensies**:
  - `ms-python.vscode-pylance` - Verbeterde Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Ondersteuning voor Azure Functions
  - `ms-azuretools.vscode-docker` - Docker-ondersteuning
  - `ms-azuretools.vscode-bicep` - Bicep-taalondersteuning
  - `ms-azure-devtools.azure-resource-groups` - Beheer van Azure-resources
  - `yzhang.markdown-all-in-one` - Markdown-bewerking
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid-diagramondersteuning
  - `redhat.vscode-yaml` - YAML-ondersteuning (voor azure.yaml)
  - `eamodio.gitlens` - Git-visualisatie
  - `mhutchie.git-graph` - Gitgeschiedenis

- **⚙️ VS Code-instellingen**: Standaardinstellingen toegevoegd voor Python-interpreter, automatisch formatteren bij opslaan en witruimteverwijdering

- **📦 requirements-dev.txt bijgewerkt**:
  - MkDocs-minify-plugin toegevoegd
  - pre-commit toegevoegd voor codekwaliteit
  - Azure SDK-pakketten toegevoegd (azure-identity, azure-mgmt-resource)

#### Opgelost
- **Post-Create-opdracht**: Controleert nu de installatie van AZD en Azure CLI bij het starten van de container

---

### [v3.11.0] - 2026-02-05

#### README grondig herzien voor beginners
**Deze versie verbetert README.md aanzienlijk om toegankelijker te zijn voor beginners en voegt essentiële bronnen toe voor AI-ontwikkelaars.**

#### Toegevoegd
- **🆚 Vergelijking Azure CLI vs AZD**: Duidelijke uitleg wanneer elk hulpmiddel te gebruiken met praktische voorbeelden
- **🌟 Awesome AZD-links**: Directe links naar de communitytemplategalerij en bijdragebronnen:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ kant-en-klare templates om te implementeren
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Communitybijdrage
- **🎯 Quickstartgids**: Vereenvoudigde 3-stappen 'aan de slag' sectie (Install → Login → Deploy)
- **📊 Ervaringsgebaseerde navigatietabel**: Duidelijke richtlijnen waar te beginnen op basis van ontwikkelaarservaring

#### Gewijzigd
- **README-structuur**: Herschikt voor progressieve onthulling - eerst belangrijke informatie
- **Inleidingssectie**: Herschreven om „The Magic of `azd up`” uit te leggen voor volledige beginners
- **Duplicaatinhoud verwijderd**: Gedeelde troubleshooting-sectie verwijderd
- **Foutopsporingsopdrachten**: `azd logs`-verwijzing gecorrigeerd naar het geldige `azd monitor --logs`

#### Opgelost
- **🔐 Authenticatieopdrachten**: `azd auth login` en `azd auth logout` toegevoegd aan cheat-sheet.md
- **Ongeldige opdrachtverwijzingen**: Resterende `azd logs` uit de README-troubleshootingsectie verwijderd

#### Opmerkingen
- **Scope**: Wijzigingen toegepast op hoofd-README.md en resources/cheat-sheet.md
- **Doelgroep**: Verbeteringen specifiek gericht op ontwikkelaars die nieuw zijn met AZD

---

### [v3.10.0] - 2026-02-05

#### Correctie van Azure Developer CLI-commando's
**Deze versie corrigeert niet-bestaande AZD-commando's door de documentatie, zodat alle codevoorbeelden geldige Azure Developer CLI-syntaxis gebruiken.**

#### Opgelost
- **🔧 Niet-bestaande AZD-commando's verwijderd**: Uitgebreide audit en correctie van ongeldige opdrachten:
  - `azd logs` (bestaat niet) → vervangen door `azd monitor --logs` of Azure CLI-alternatieven
  - `azd service` subcommands (bestaan niet) → vervangen door `azd show` en Azure CLI
  - `azd infra import/export/validate` (bestaan niet) → verwijderd of vervangen door geldige alternatieven
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (bestaan niet) → verwijderd
  - `azd provision --what-if/--rollback` flags (bestaan niet) → bijgewerkt naar gebruik van `--preview`
  - `azd config validate` (bestaat niet) → vervangen door `azd config list`
  - `azd info`, `azd history`, `azd metrics` (bestaan niet) → verwijderd

- **📚 Bestanden bijgewerkt met opdrachtcorrecties**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

#### Gewijzigd
- **Rollbackstrategieën**: Documentatie bijgewerkt om Git-gebaseerde rollback te gebruiken (AZD heeft geen native rollback)
- **Logweergave**: `azd logs`-verwijzingen vervangen door `azd monitor --logs`, `azd monitor --live` en Azure CLI-opdrachten
- **Prestatiegedeelte**: Niet-bestaande parallel-/incrementele implementatieflags verwijderd, geldige alternatieven gegeven

#### Technische details
- **Geldige AZD-opdrachten**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Geldige azd monitor-vlaggen**: `--live`, `--logs`, `--overview`
- **Verwijderde functies**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opmerkingen
- **Verificatie**: Opdrachten gevalideerd tegen Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Voltooiing van workshop en kwaliteitsverbetering van documentatie
**Deze versie voltooit de interactieve workshopmodules, repareert alle verbroken documentatielinks en verbetert de algehele inhoudskwaliteit voor AI-ontwikkelaars die Microsoft AZD gebruiken.**

#### Toegevoegd
- **📝 CONTRIBUTING.md**: Nieuw document met bijdrage-richtlijnen met:
  - Duidelijke instructies voor het melden van problemen en het voorstellen van wijzigingen
  - Documentatiestandaarden voor nieuwe inhoud
  - Richtlijnen voor codevoorbeelden en conventies voor commit-berichten
  - Informatie over betrokkenheid van de community

#### Voltooid
- **🎯 Workshop Module 7 (Wrap-up)**: Volledig afgeronde wrap-upmodule met:
  - Uitgebreide samenvatting van de behaalde resultaten van de workshop
  - Sectie met belangrijkste beheersde concepten over AZD, templates en Microsoft Foundry
  - Aanbevelingen voor voortzetting van het leertraject
  - Workshop-oefeningen met moeilijkheidsbeoordelingen
  - Links voor communityfeedback en ondersteuning

- **📚 Workshop Module 3 (Deconstruct)**: Bijgewerkte leerdoelen met:
  - Stappen voor het activeren van GitHub Copilot met MCP-servers
  - Inzicht in de mapstructuur van AZD-templates
  - Organisatiepatronen voor Infrastructure-as-Code (Bicep)
  - Praktische labinstructies

- **🔧 Workshop Module 6 (Teardown)**: Voltooid met:
  - Doelstellingen voor opruimen van resources en kostenbeheer
  - Gebruik van `azd down` voor veilige verwijdering van infrastructuur
  - Richtlijnen voor herstel van soft-verwijderde cognitive services
  - Bonus verkenningsopdrachten voor GitHub Copilot en Azure Portal

#### Opgelost
- **🔗 Opgeloste kapotte links**: 15+ gebroken interne documentatielinks opgelost:
  - `docs/ai-foundry/ai-model-deployment.md`: Gecorrigeerde paden naar microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Gecorrigeerde paden naar ai-model-deployment.md en production-ai-practices.md
  - `docs/getting-started/first-project.md`: Vervangen van niet-bestaande cicd-integration.md door deployment-guide.md
  - `examples/retail-scenario.md`: Gecorrigeerde paden naar FAQ- en troubleshootinggids
  - `examples/container-app/microservices/README.md`: Gecorrigeerde paden naar course home en deployment guide
  - `resources/faq.md` and `resources/glossary.md`: AI-hoofdstukverwijzingen bijgewerkt
  - `course-outline.md`: Verwijzingen naar instructor guide en AI workshop lab gecorrigeerd

- **📅 Workshop Status Banner**: Bijgewerkt van "Under Construction" naar actieve workshopstatus met februari 2026 datum

- **🔗 Workshop Navigation**: Kapotte navigatielinks in workshop README.md die verwezen naar de niet-bestaande map lab-1-azd-basics gecorrigeerd

#### Gewijzigd
- **Workshop Presentation**: Waarschuwing "under construction" verwijderd, workshop is nu compleet en klaar voor gebruik
- **Navigation Consistency**: Ervoor gezorgd dat alle workshopmodules een juiste inter-modulenavigatie hebben
- **Learning Path References**: Hoofdstukcrossreferenties bijgewerkt om de juiste microsoft-foundry-paden te gebruiken

#### Gevalideerd
- ✅ Alle Engelse markdownbestanden hebben geldige interne links
- ✅ Workshopmodules 0-7 zijn compleet met leerdoelen
- ✅ Navigatie tussen hoofdstukken en modules werkt correct
- ✅ Inhoud is geschikt voor AI-ontwikkelaars die Microsoft AZD gebruiken
- ✅ Beginnersvriendelijke taal en structuur zijn overal behouden
- ✅ CONTRIBUTING.md biedt duidelijke richtlijnen voor communitybijdragers

#### Technische implementatie
- **Linkvalidatie**: Automatisch PowerShell-script heeft alle .md interne links geverifieerd
- **Inhoudsaudit**: Handmatige beoordeling van de volledigheid van de workshop en geschiktheid voor beginners
- **Navigatiesysteem**: Consistente patronen voor hoofdstuk- en modulenavigatie toegepast

#### Opmerkingen
- **Scope**: Wijzigingen alleen toegepast op Engelse documentatie
- **Vertalingen**: Vertaalmappen niet bijgewerkt in deze versie (geautomatiseerde vertaling zal later synchroniseren)
- **Duur van de workshop**: Complete workshop biedt nu 3-4 uur praktijkgericht leren

---

### [v3.8.0] - 2025-11-19

#### Geavanceerde documentatie: Monitoring, beveiliging en multi-agentpatronen
**Deze versie voegt uitgebreide A-gradelessen toe over Application Insights-integratie, authenticatiepatronen en coördinatie van multi-agents voor productie-deployments.**

#### Toegevoegd
- **📊 Les over Application Insights-integratie**: in `docs/pre-deployment/application-insights.md`:
  - AZD-gerichte implementatie met automatische provisioning
  - Volledige Bicep-templates voor Application Insights + Log Analytics
  - Werkende Python-applicaties met aangepaste telemetry (1,200+ regels)
  - AI/LLM-monitoringpatronen (token-/kostentracking voor Microsoft Foundry Models)
  - 6 Mermaid-diagrammen (architectuur, gedistribueerde tracing, telemetriestroom)
  - 3 praktijkopdrachten (waarschuwingen, dashboards, AI-monitoring)
  - Kusto-queryvoorbeelden en strategieën voor kostenoptimalisatie
  - Live metrics-streaming en realtime debuggen
  - 40-50 minuten leertijd met productieklare patronen

- **🔐 Les over authenticatie- & beveiligingspatronen**: in `docs/getting-started/authsecurity.md`:
  - 3 authenticatiepatronen (connection strings, Key Vault, managed identity)
  - Volledige Bicep-infrastructuurtemplates voor veilige implementaties
  - Node.js-applicatiecode met Azure SDK-integratie
  - 3 volledige oefeningen (managed identity inschakelen, user-assigned identity, Key Vault-rotatie)
  - Beveiligingsbest practices en RBAC-configuraties
  - Probleemoplossingsgids en kostenanalyse
  - Productieklare wachtwoordloze authenticatiepatronen

- **🤖 Les over multi-agent coördinatiepatronen**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coördinatiepatronen (sequentieel, parallel, hiërarchisch, gebeurtenisgestuurd, consensus)
  - Volledige implementatie van een orkestratorservice (Python/Flask, 1,500+ regels)
  - 3 gespecialiseerde agentimplementaties (Research, Writer, Editor)
  - Service Bus-integratie voor berichtwachtrij
  - Cosmos DB-statebeheer voor gedistribueerde systemen
  - 6 Mermaid-diagrammen die agentinteracties tonen
  - 3 geavanceerde oefeningen (timeout-afhandeling, retry-logica, circuit breaker)
  - Kostenopdeling ($240-565/maand) met optimalisatiestrategieën
  - Application Insights-integratie voor monitoring

#### Verbeterd
- **Pre-deployment-hoofdstuk**: Bevat nu uitgebreide monitoring- en coördinatiepatronen
- **Getting Started-hoofdstuk**: Uitgebreid met professionele authenticatiepatronen
- **Productieklaarheid**: Volledige dekking van beveiliging tot observeerbaarheid
- **Cursusoverzicht**: Bijgewerkt om te verwijzen naar nieuwe lessen in Hoofdstuk 3 en 6

#### Gewijzigd
- **Leerprogressie**: Betere integratie van beveiliging en monitoring door de hele cursus
- **Documentatiekwaliteit**: Consistente A-grade standaarden (95-97%) voor nieuwe lessen
- **Productiepatronen**: Volledige end-to-end dekking voor enterprise-implementaties

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijk pad van ontwikkeling naar productie-monitoring
- **Beveiligingsstandaarden**: Professionele patronen voor authenticatie en beheer van geheimen
- **Observeerbaarheid**: Volledige Application Insights-integratie met AZD
- **AI-workloads**: Gespecialiseerde monitoring voor Microsoft Foundry Models en multi-agent systemen

#### Gevalideerd
- ✅ Alle lessen bevatten volledige werkende code (geen fragmenten)
- ✅ Mermaid-diagrammen voor visueel leren (19 in totaal over 3 lessen)
- ✅ Praktijkopdrachten met verificatiestappen (9 in totaal)
- ✅ Productieklare Bicep-templates inzetbaar via `azd up`
- ✅ Kostenanalyse en optimalisatiestrategieën
- ✅ Probleemoplossingsgidsen en best practices
- ✅ Kenniscontroles met verificatiecommando's

#### Documentatiebeoordelingsresultaten
- **docs/pre-deployment/application-insights.md**: - Uitgebreide monitoringgids
- **docs/getting-started/authsecurity.md**: - Professionele beveiligingspatronen
- **docs/pre-deployment/coordination-patterns.md**: - Geavanceerde multi-agentarchitecturen
- **Algemene nieuwe inhoud**: - Consistente hoogwaardige standaarden

#### Technische implementatie
- **Application Insights**: Log Analytics + aangepaste telemetry + gedistribueerde tracing
- **Authenticatie**: Managed Identity + Key Vault + RBAC-patronen
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestratie
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Kostenbeheer**: Sampling-strategieën, retentiebeleid, budgetcontroles

### [v3.7.0] - 2025-11-19

#### Verbeteringen in documentatiekwaliteit en nieuw Microsoft Foundry Models-voorbeeld
**Deze versie verbetert de documentatiekwaliteit over de hele repository en voegt een compleet Microsoft Foundry Models-implementatievoorbeeld toe met een gpt-4.1 chatinterface.**

#### Toegevoegd
- **🤖 Microsoft Foundry Models chatvoorbeeld**: Volledige gpt-4.1-implementatie met werkende implementatie in `examples/azure-openai-chat/`:
  - Volledige Microsoft Foundry Models-infrastructuur (gpt-4.1 modelimplementatie)
  - Python commandline-chatinterface met conversatiegeschiedenis
  - Key Vault-integratie voor veilige opslag van API-sleutels
  - Tracking van tokengebruik en kostenraming
  - Rate limiting en foutafhandeling
  - Uitgebreide README met 35-45 minuten implementatiehandleiding
  - 11 productieklare bestanden (Bicep-templates, Python-app, configuratie)
- **📚 Documentatie-oefeningen**: Praktijkoefeningen toegevoegd aan configuratiehandleiding:
  - Oefening 1: Multi-omgevingconfiguratie (15 minuten)
  - Praktijkoefening geheimenbeheer (10 minuten)
  - Duidelijke succescriteria en verificatiestappen
- **✅ Deployment Verification**: Verificatiesectie toegevoegd aan de deployment-handleiding:
  - Healthcheckprocedures
  - Checklist met succescriteria
  - Verwachte uitvoer voor alle deployment-opdrachten
  - Snelle referentie voor probleemoplossing

#### Verbeterd
- **examples/README.md**: Bijgewerkt naar A-grade kwaliteit (93%):
  - azure-openai-chat toegevoegd aan alle relevante secties
  - Aantal lokale voorbeelden bijgewerkt van 3 naar 4
  - Toegevoegd aan tabel met AI-voorbeeldtoepassingen
  - Geïntegreerd in Quick Start voor gevorderde gebruikers
  - Toegevoegd aan sectie Microsoft Foundry Templates
  - Vergelijkingsmatrix en secties over technologiebeoordeling bijgewerkt
- **Documentatiekwaliteit**: Verbeterd van B+ (87%) → A- (92%) in de docs-map:
  - Verwachte uitvoer toegevoegd aan kritieke commandovoorbeelden
  - Verificatiestappen opgenomen voor configuratiewijzigingen
  - Praktijkgericht leren versterkt met praktische oefeningen

#### Gewijzigd
- **Leerprogressie**: Betere integratie van AI-voorbeelden voor gevorderde deelnemers
- **Documentatiestructuur**: Meer actiegerichte oefeningen met duidelijke uitkomsten
- **Verificatieproces**: Expliciete succescriteria toegevoegd aan belangrijke workflows

#### Verbeterd
- **Ontwikkelaarservaring**: Microsoft Foundry Models-implementatie duurt nu 35-45 minuten (vs 60-90 voor complexe alternatieven)
- **Kostentransparantie**: Duidelijke kostenramingen ($50-200/maand) voor Microsoft Foundry Models-voorbeeld
- **Leerpad**: AI-ontwikkelaars hebben een duidelijk instappunt met azure-openai-chat
- **Documentatiestandaarden**: Consistente verwachte outputs en verificatiestappen

#### Gevalideerd
- ✅ Microsoft Foundry Models-voorbeeld volledig functioneel met `azd up`
- ✅ Alle 11 implementatiebestanden syntactisch correct
- ✅ README-instructies komen overeen met daadwerkelijke implementatie-ervaring
- ✅ Documentatielinks bijgewerkt op meer dan 8 locaties
- ✅ Voorbeeldenindex weerspiegelt nauwkeurig 4 lokale voorbeelden
- ✅ Geen dubbele externe links in tabellen
- ✅ Alle navigatieverwijzingen correct

#### Technische implementatie
- **Microsoft Foundry Models-architectuur**: gpt-4.1 + Key Vault + Container Apps-patroon
- **Beveiliging**: Gereed voor Managed Identity, geheimen in Key Vault
- **Monitoring**: Application Insights-integratie
- **Kostenbeheer**: Token-tracking en gebruiksoptimalisatie
- **Implementatie**: Enkel `azd up`-commando voor volledige setup

### [v3.6.0] - 2025-11-19

#### Grote update: Container App-implementatievoorbeelden
**Deze versie introduceert uitgebreide, productieklare voorbeelden voor het implementeren van containerapplicaties met Azure Developer CLI (AZD), met volledige documentatie en integratie in het leerpad.**

#### Toegevoegd
- **🚀 Container App-voorbeelden**: Nieuwe lokale voorbeelden in `examples/container-app/`:
  - [Mastergids](examples/container-app/README.md): Volledig overzicht van containerimplementaties, snelstart, productie en geavanceerde patronen
  - [Eenvoudige Flask-API](../../examples/container-app/simple-flask-api): Beginnervriendelijke REST-API met scale-to-zero, health probes, monitoring en probleemoplossing
  - [Microservices Architectuur](../../examples/container-app/microservices): Productieklare multi-service-implementatie (API Gateway, Product, Order, User, Notification), asynchrone berichtgeving, Service Bus, Cosmos DB, Azure SQL, gedistribueerde tracing, blue-green/canary-implementatie
- **Best Practices**: Beveiliging, monitoring, kostenoptimalisatie en CI/CD-richtlijnen voor containerworkloads
- **Codevoorbeelden**: Volledige `azure.yaml`, Bicep-templates en meertalige service-implementaties (Python, Node.js, C#, Go)
- **Testen & Probleemoplossing**: End-to-end testscripts, monitoringcommando's, probleemoplossingsrichtlijnen

#### Gewijzigd
- **README.md**: Bijgewerkt om de nieuwe container app-voorbeelden te tonen en te linken onder "Local Examples - Container Applications"
- **examples/README.md**: Bijgewerkt om container app-voorbeelden te benadrukken, vergelijkingsmatrix-items toe te voegen en technologie-/architectuurverwijzingen bij te werken
- **Cursusoverzicht & Studiegids**: Bijgewerkt om te verwijzen naar nieuwe container app-voorbeelden en implementatiepatronen in relevante hoofdstukken

#### Gevalideerd
- ✅ Alle nieuwe voorbeelden inzetbaar met `azd up` en volgen best practices
- ✅ Documentatiekruisverwijzingen en navigatie bijgewerkt
- ✅ Voorbeelden bestrijken scenario's van beginner tot gevorderd, inclusief productie-microservices

#### Opmerkingen
- **Scope**: Alleen Engelse documentatie en voorbeelden
- **Vervolgstappen**: Uitbreiden met aanvullende geavanceerde containerpatronen en CI/CD-automatisering in toekomstige releases

### [v3.5.0] - 2025-11-19

#### Productrebranding: Microsoft Foundry
**Deze versie voert een uitgebreide naamswijziging van het product door van "Microsoft Foundry" naar "Microsoft Foundry" in alle Engelse documentatie, ter reflectie van Microsoft's officiële rebranding.**

#### Gewijzigd
- **🔄 Productnaamupdate**: Volledige rebranding van "Microsoft Foundry" naar "Microsoft Foundry"
  - Alle verwijzingen in de Engelse documentatie in de `docs/`-map bijgewerkt
  - Map hernoemd: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Bestand hernoemd: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totaal: 23 inhoudsverwijzingen bijgewerkt in 7 documentatiebestanden

- **📁 Wijzigingen in mappstructuur**:
  - `docs/ai-foundry/` hernoemd naar `docs/microsoft-foundry/`
  - Alle kruisverwijzingen bijgewerkt om de nieuwe mappstructuur te weerspiegelen
  - Navigatielinks gevalideerd in alle documentatie

- **📄 Bestandsnamen gewijzigd**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne links bijgewerkt om naar de nieuwe bestandsnaam te verwijzen

#### Bijgewerkte bestanden
- **Hoofdstukdocumentatie** (7 bestanden):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigatielinks bijgewerkt
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 productnaamverwijzingen bijgewerkt
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Gebruikt al Microsoft Foundry (van vorige updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 verwijzingen bijgewerkt (overzicht, community feedback, documentatie)
  - `docs/getting-started/azd-basics.md` - 4 kruisverwijzingslinks bijgewerkt
  - `docs/getting-started/first-project.md` - 2 hoofdstuknavigatielinks bijgewerkt
  - `docs/getting-started/installation.md` - 2 volgende-hoofdstuklinks bijgewerkt
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 verwijzingen bijgewerkt (navigatie, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigatielink bijgewerkt
  - `docs/troubleshooting/debugging.md` - 1 navigatielink bijgewerkt

- **Cursusstructuurbestanden** (2 bestanden):
  - `README.md` - 17 verwijzingen bijgewerkt (cursusoverzicht, hoofdstuktitels, sjabloonsectie, community-inzichten)
  - `course-outline.md` - 14 verwijzingen bijgewerkt (overzicht, leerdoelen, hoofdstukbronnen)

#### Gevalideerd
- ✅ Geen resterende "ai-foundry" folder path verwijzingen in Engelse documentatie
- ✅ Geen resterende "Microsoft Foundry" productnaamverwijzingen in Engelse documentatie
- ✅ Alle navigatielinks functioneel met de nieuwe mappstructuur
- ✅ Bestands- en maphernoemingen succesvol voltooid
- ✅ Kruisverwijzingen tussen hoofdstukken gevalideerd

#### Notities
- **Omvang**: Wijzigingen toegepast op Engelse documentatie in de map `docs/` alleen
- **Vertalingen**: Vertaalmappen (`translations/`) niet bijgewerkt in deze versie
- **Workshop**: Workshopmateriaal (`workshop/`) niet bijgewerkt in deze versie
- **Voorbeelden**: Voorbeeldbestanden kunnen nog steeds legacy-benamingen bevatten (aan te pakken in toekomstige update)
- **Externe links**: Externe URL's en GitHub-repositoryverwijzingen blijven ongewijzigd

#### Migratiegids voor bijdragers
Als je lokale branches of documentatie hebt die naar de oude structuur verwijzen:
1. Update mapverwijzingen: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update bestandsverwijzingen: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Vervang productnaam: "Microsoft Foundry" → "Microsoft Foundry"
4. Valideer dat alle interne documentatielinks nog steeds werken

---

### [v3.4.0] - 2025-10-24

#### Verbeteringen aan infrastructuurpreview en validatie
**Deze versie introduceert uitgebreide ondersteuning voor de nieuwe preview-functie van Azure Developer CLI en verbetert de workshopgebruikerservaring.**

#### Toegevoegd
- **🧪 azd provision --preview Feature Documentation**: Omvattende dekking van de nieuwe infrastructuur-preview functionaliteit
  - Commandooverzicht en gebruiksvoorbeelden in de cheat sheet
  - Gedetailleerde integratie in de provisioning-gids met use cases en voordelen
  - Integratie van preflight-controles voor veiligere deployment-validatie
  - Updates in de Aan de slag-gids met safety-first deploymentpraktijken
- **🚧 Workshop Status Banner**: Professionele HTML-banner die de ontwikkelingsstatus van de workshop aangeeft
  - Verloopontwerp met in-aanbouw-indicatoren voor duidelijke communicatie naar gebruikers
  - Tijdstempel met laatste update voor transparantie
  - Mobiel-responsief ontwerp voor alle apparaattypen

#### Versterkt
- **Infrastructuurveiligheid**: Preview-functionaliteit geïntegreerd in hele deploymentdocumentatie
- **Pre-deployvalidatie**: Geautomatiseerde scripts bevatten nu infrastructuur-preview tests
- **Ontwikkelaarsworkflow**: Bijgewerkte commandosequenties waarin preview als best practice is opgenomen
- **Workshopervaring**: Duidelijke verwachtingen voor gebruikers over de ontwikkelstatus van de inhoud

#### Gewijzigd
- **Deployment Best Practices**: Preview-first workflow nu aanbevolen aanpak
- **Documentatiestroom**: Infrastructuurvalidatie eerder in het leerproces geplaatst
- **Workshoppresentatie**: Professionele statuscommunicatie met duidelijke ontwikkeltijdlijn

#### Verbeterd
- **Safety-First Aanpak**: Infrastructuurwijzigingen kunnen nu worden gevalideerd vóór deployment
- **Teamcollaboratie**: Previewresultaten kunnen worden gedeeld voor review en goedkeuring
- **Kostenbewustzijn**: Beter inzicht in resourcekosten vóór provisioning
- **Risicobeperking**: Minder deployment-fouten door voorafgaande validatie

#### Technische implementatie
- **Meerdocumentintegratie**: Preview-functie gedocumenteerd in 4 belangrijke bestanden
- **Commandopatronen**: Consistente syntaxis en voorbeelden door de documentatie heen
- **Best practice-integratie**: Preview opgenomen in validatieworkflows en scripts
- **Visuele indicatoren**: Duidelijke NIEUW-aanduidingen voor betere vindbaarheid

#### Workshopinfrastructuur
- **Statuscommunicatie**: Professionele HTML-banner met verloopstyling
- **Gebruikerservaring**: Duidelijke ontwikkelstatus voorkomt verwarring
- **Professionele presentatie**: Behoudt repository-credibiliteit en stelt verwachtingen
- **Tijdlijntransparantie**: Laatst bijgewerkt oktober 2025 tijdstempel voor verantwoording

### [v3.3.0] - 2025-09-24

#### Versterkt workshopmateriaal en interactieve leerervaring
**Deze versie introduceert uitgebreide workshopmaterialen met browsergebaseerde interactieve handleidingen en gestructureerde leerpaden.**

#### Toegevoegd
- **🎥 Interactieve Workshop Guide**: Browsergebaseerde workshopervaring met MkDocs-previewfunctionaliteit
- **📝 Gestructureerde Workshopinstructies**: 7-stappen begeleid leerpad van ontdekking tot maatwerk
  - 0-Introduction: Overzicht van de workshop en setup
  - 1-Select-AI-Template: Sjabloonontdekking en selectieproces
  - 2-Validate-AI-Template: Deployment- en validatieprocedures
  - 3-Deconstruct-AI-Template: Begrijpen van sjabloonarchitectuur
  - 4-Configure-AI-Template: Configuratie en aanpassing
  - 5-Customize-AI-Template: Geavanceerde aanpassingen en iteraties
  - 6-Teardown-Infrastructure: Opruiming en resourcebeheer
  - 7-Wrap-up: Samenvatting en volgende stappen
- **🛠️ Workshoptooling**: MkDocs-configuratie met Material-theme voor verbeterde leerervaring
- **🎯 Hands-on Leerpad**: 3-stapsmethodologie (Ontdekking → Deployment → Maatwerk)
- **📱 GitHub Codespaces Integratie**: Naadloze setup van ontwikkelomgeving

#### Versterkt
- **AI Workshop Lab**: Uitgebreid met een allesomvattende 2-3 uur gestructureerde leerervaring
- **Workshopdocumentatie**: Professionele presentatie met navigatie en visuele hulpmiddelen
- **Leerprogressie**: Duidelijke stapsgewijze begeleiding van sjabloonselectie tot productie-deployment
- **Ontwikkelaarservaring**: Geïntegreerde tooling voor gestroomlijnde ontwikkelworkflows

#### Verbeterd
- **Toegankelijkheid**: Browsergebaseerde interface met zoekfunctie, kopieerfunctionaliteit en thema-schakelaar
- **Zelfgestuurd leren**: Flexibele workshopstructuur die verschillende leersnelheden ondersteunt
- **Praktische toepassing**: Realistische AI-sjabloondeploymentscenario's
- **Community-integratie**: Discord-integratie voor workshopondersteuning en samenwerking

#### Workshopfuncties
- **Ingebouwde zoekfunctie**: Snelle trefwoord- en lesontdekking
- **Kopieer codeblokken**: Hover-to-copy functionaliteit voor alle codevoorbeelden
- **Thema-schakelaar**: Donker/licht modus ondersteuning voor voorkeuren
- **Visuele assets**: Screenshots en diagrammen voor beter begrip
- **Helpintegratie**: Directe Discord-toegang voor communityondersteuning

### [v3.2.0] - 2025-09-17

#### Grote navigatieherschikking en hoofdstukgebaseerd leersysteem
**Deze versie introduceert een uitgebreid hoofdstukgebaseerd leersysteem met verbeterde navigatie door de hele repository.**

#### Toegevoegd
- **📚 Hoofdstukgebaseerd leersysteem**: Hele cursus heringedeeld in 8 progressieve leerhoofdstukken
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 min)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 uur)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 min)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 uur)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 uur)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 uur)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 uur)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 uur)
- **📚 Uitgebreid navigatiesysteem**: Consistente navigatiekoppen en voetteksten door alle documentatie
- **🎯 Voortgangsregistratie**: Cursus voltooiingschecklist en leerverificatiesysteem
- **🗺️ Leerpadbegeleiding**: Duidelijke instappunten voor verschillende ervaringsniveaus en doelen
- **🔗 Kruisverwijzingsnavigatie**: Gerelateerde hoofdstukken en vereisten duidelijk gekoppeld

#### Versterkt
- **README-structuur**: Getransformeerd tot een gestructureerd leerplatform met hoofdstukorganisatie
- **Documentatienavigatie**: Elke pagina bevat nu hoofdstukcontext en voortgangsaanwijzingen
- **Sjabloonorganisatie**: Voorbeelden en sjablonen toegewezen aan passende leerhoofdstukken
- **Resource-integratie**: Cheat sheets, FAQ's en studiehandleidingen gekoppeld aan relevante hoofdstukken
- **Workshopintegratie**: Hands-on labs toegewezen aan meerdere leerdoelen van hoofdstukken

#### Gewijzigd
- **Leerprogressie**: Overgegaan van lineaire documentatie naar flexibel hoofdstukgebaseerd leren
- **Configuratieplaatsing**: Configuratiehandleiding verplaatst naar Hoofdstuk 3 voor betere leerstroom
- **AI-inhoudsintegratie**: Betere integratie van AI-specifieke inhoud door het leertraject heen
- **Productiecontent**: Geavanceerde patronen geconsolideerd in Hoofdstuk 8 voor enterprise-learneres

#### Verbeterd
- **Gebruikerservaring**: Duidelijke navigatiekruimelsporen en hoofdstukvoortgangsindicatoren
- **Toegankelijkheid**: Consistente navigatiepatronen voor eenvoudigere cursusnavigatie
- **Professionele presentatie**: Universitaire cursusstructuur geschikt voor academische en corporate training
- **Leer efficiëntie**: Minder tijd nodig om relevante inhoud te vinden dankzij verbeterde organisatie

#### Technische implementatie
- **Navigatiekoppen**: Gestandaardiseerde hoofdstuknavigatie in meer dan 40 documentatiebestanden
- **Voettekstnavigatie**: Consistente voortgangsaanwijzingen en hoofdstukvoltooiingsindicatoren
- **Kruislinking**: Omvattend intern linksysteem dat gerelateerde concepten verbindt
- **Hoofdstukmapping**: Sjablonen en voorbeelden duidelijk gekoppeld aan leerdoelen

#### Studiehandleidingversterking
- **📚 Uitgebreide leerdoelen**: Studiehandleiding herstructureerd om te aligneren met 8-hoofdstukssysteem
- **🎯 Hoofdstukgebaseerde beoordeling**: Elk hoofdstuk bevat specifieke leerdoelen en praktische oefeningen
- **📋 Voortgangsregistratie**: Wekelijks leerschema met meetbare uitkomsten en voltooiingschecklists
- **❓ Beoordelingsvragen**: Kennisverificatievragen voor elk hoofdstuk met professionele uitkomsten
- **🛠️ Praktische oefeningen**: Hands-on activiteiten met echte deployment-scenario's en foutoplossing
- **📊 Vaardigheidsprogressie**: Duidelijke voortgang van basisconcepten naar enterprisepatronen met focus op loopbaanontwikkeling
- **🎓 Certificeringskader**: Professionele ontwikkelingsresultaten en communityerkenningssysteem
- **⏱️ Tijdlijnbeheer**: Gestructureerd 10-weken leerplan met mijlpaalverificatie

### [v3.1.0] - 2025-09-17

#### Verbeterde Multi-Agent AI-oplossingen
**Deze versie verbetert de multi-agent retailoplossing met betere agentbenamingen en uitgebreide documentatie.**

#### Gewijzigd
- **Multi-Agent Terminologie**: "Cora agent" vervangen door "Customer agent" in de gehele retail multi-agentoplossing voor betere duidelijkheid
- **Agentarchitectuur**: Alle documentatie, ARM-sjablonen en codevoorbeelden bijgewerkt om consistente "Customer agent" benaming te gebruiken
- **Configuratievoorbeelden**: Gemoderniseerde agentconfiguratiepatronen met bijgewerkte naamgevingsconventies
- **Documentatieconsistentie**: Zorg gedragen dat alle verwijzingen professionele, beschrijvende agentnamen gebruiken

#### Versterkt
- **ARM Template Package**: retail-multiagent-arm-template bijgewerkt met Customer agent verwijzingen
- **Architectuurdiagrammen**: Mermaid-diagrammen vernieuwd met bijgewerkte agentbenamingen
- **Codevoorbeelden**: Python-klassen en implementatievoorbeelden gebruiken nu CustomerAgent-naamgeving
- **Omgevingsvariabelen**: Alle deployment-scripts bijgewerkt om CUSTOMER_AGENT_NAME-conventies te gebruiken

#### Verbeterd
- **Ontwikkelaarservaring**: Duidelijkere agentrollen en verantwoordelijkheden in documentatie
- **Productieklaarheid**: Betere afstemming met enterprise-naamgevingsconventies
- **Leermateriaal**: Intuïtiever agentnaamgebruik voor educatieve doeleinden
- **Sjabloongebruik**: Vereenvoudigd begrip van agentfuncties en deploymentpatronen

#### Technische details
- Mermaid-architectuurdiagrammen bijgewerkt met CustomerAgent-verwijzingen
- CoraAgent-klasnamen vervangen door CustomerAgent in Python-voorbeelden
- ARM-sjabloon JSON-configuraties aangepast om het agenttype "customer" te gebruiken
- Omgevingsvariabelen bijgewerkt van CORA_AGENT_* naar CUSTOMER_AGENT_* patronen
- Alle deployment-commando's en containerconfiguraties vernieuwd

### [v3.0.0] - 2025-09-12

#### Grote wijzigingen - AI-developer focus en Microsoft Foundry-integratie
**Deze versie transformeert de repository in een uitgebreid, AI-gericht leerresource met Microsoft Foundry-integratie.**

#### Toegevoegd
- **🤖 AI-First Learning Path**: Volledige herstructurering met prioriteit voor AI-ontwikkelaars en -engineers
- **Microsoft Foundry Integration Guide**: Uitgebreide documentatie voor het verbinden van AZD met Microsoft Foundry-diensten
- **AI Model Deployment Patterns**: Gedetailleerde gids over modelselectie, configuratie en productie-deploymentsstrategieën
- **AI Workshop Lab**: 2-3 uur hands-on workshop voor het omzetten van AI-toepassingen naar oplossingen die met AZD kunnen worden uitgerold
- **Production AI Best Practices**: Enterprise-klare patronen voor het schalen, monitoren en beveiligen van AI-workloads
- **AI-Specific Troubleshooting Guide**: Uitgebreide probleemoplossing voor Microsoft Foundry Models, Cognitive Services en AI-implementatieproblemen
- **AI Template Gallery**: Uitgelichte verzameling Microsoft Foundry-sjablonen met complexiteitsbeoordelingen
- **Workshop Materials**: Volledige workshopstructuur met hands-on labs en referentiemateriaal

#### Verbeterd
- **README Structure**: Gericht op AI-ontwikkelaars met 45% community-interessegegevens van Microsoft Foundry Discord
- **Learning Paths**: Toegewijd AI-ontwikkelaarstraject naast traditionele paden voor studenten en DevOps-engineers
- **Template Recommendations**: Uitgelichte AI-sjablonen inclusief azure-search-openai-demo, contoso-chat, en openai-chat-app-quickstart
- **Community Integration**: Verbeterde Discord-communityondersteuning met AI-specifieke kanalen en discussies

#### Beveiliging & Productiefocus
- **Managed Identity Patterns**: Beheerde identiteitspatronen: AI-specifieke authenticatie- en beveiligingsconfiguraties
- **Cost Optimization**: Kostenoptimalisatie: Bijhouden van tokengebruik en budgetcontroles voor AI-workloads
- **Multi-Region Deployment**: Multi-regio implementatie: Strategieën voor wereldwijde inzet van AI-toepassingen
- **Performance Monitoring**: Prestatiemonitoring: AI-specifieke metrics en integratie met Application Insights

#### Documentatiekwaliteit
- **Linear Course Structure**: Lineaire cursusstructuur: Logische voortgang van beginner tot gevorderde AI-implementatiepatronen
- **Validated URLs**: Gevalideerde URL's: Alle externe repositorylinks geverifieerd en toegankelijk
- **Complete Reference**: Volledige referentie: Alle interne documentatielinks gevalideerd en functioneel
- **Production Ready**: Productieklaar: Enterprise-implementatiepatronen met praktijkvoorbeelden

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Deze versie vertegenwoordigt een ingrijpende herziening van de repositorystructuur en de presentatie van de inhoud.**

#### Toegevoegd
- **Structured Learning Framework**: Alle documentatiepagina's bevatten nu secties Introductie, Leerdoelen en Leerresultaten
- **Navigation System**: Toegevoegd Vorige/Volgende leslinks door de hele documentatie voor begeleide leerprogressie
- **Study Guide**: Uitgebreide study-guide.md met leerdoelen, oefenopgaven en beoordelingsmateriaal
- **Professional Presentation**: Alle emoji-pictogrammen verwijderd voor verbeterde toegankelijkheid en professionele uitstraling
- **Enhanced Content Structure**: Verbeterde organisatie en flow van leermateriaal

#### Gewijzigd
- **Documentation Format**: Documentatieformaat: Alle documentatie gestandaardiseerd met een consistente op leer gerichte structuur
- **Navigation Flow**: Navigatiestroom: Logische voortgang door al het leermateriaal geïmplementeerd
- **Content Presentation**: Inhoudspresentatie: Decoratieve elementen verwijderd ten gunste van duidelijke, professionele opmaak
- **Link Structure**: Linkstructuur: Alle interne links bijgewerkt om het nieuwe navigatiesysteem te ondersteunen

#### Verbeterd
- **Accessibility**: Toegankelijkheid: Emoji-afhankelijkheden verwijderd voor betere compatibiliteit met schermlezers
- **Professional Appearance**: Professionele uitstraling: Schone, academische stijl presentatie geschikt voor enterprise-onderwijs
- **Learning Experience**: Leerervaring: Gestructureerde aanpak met duidelijke doelstellingen en resultaten voor elke les
- **Content Organization**: Inhoudsorganisatie: Betere logische flow en verbinding tussen gerelateerde onderwerpen

### [v1.0.0] - 2025-09-09

#### Eerste release - Uitgebreide AZD-leerrepository

#### Toegevoegd
- **Core Documentation Structure**
  - Volledige handleidingserie voor aan de slag
  - Uitgebreide documentatie voor implementatie en provisioning
  - Gedetailleerde probleemoplossingsbronnen en debugginggidsen
  - Tools en procedures voor validatie voorafgaand aan implementatie

- **Getting Started Module**
  - AZD Basics: Kernconcepten en terminologie
  - Installation Guide: Platform-specifieke installatie-instructies
  - Configuration Guide: Omgevingsconfiguratie en authenticatie
  - First Project Tutorial: Stapsgewijze hands-on begeleiding

- **Deployment and Provisioning Module**
  - Deployment Guide: Volledige workflowdocumentatie
  - Provisioning Guide: Infrastructure as Code met Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Beschikbaarheid van Azure-resources valideren
  - SKU Selection: Uitgebreide richtlijnen voor servicetiers
  - Pre-flight Checks: Geautomatiseerde validatiescripts (PowerShell en Bash)
  - Kostenraming en hulpmiddelen voor budgetplanning

- **Troubleshooting Module**
  - Common Issues: Frequent voorkomende problemen en oplossingen
  - Debugging Guide: Systematische probleemoplossingsmethodologieën
  - Geavanceerde diagnostische technieken en tools
  - Prestatiemonitoring en optimalisatie

- **Resources and References**
  - Command Cheat Sheet: Snelle referentie voor essentiële commando's
  - Glossary: Uitgebreide definities van terminologie en acroniemen
  - FAQ: Gedetailleerde antwoorden op veelgestelde vragen
  - Links naar externe bronnen en communityverbindingen

- **Examples and Templates**
  - Eenvoudig voorbeeld van een webapplicatie
  - Sjabloon voor implementatie van statische website
  - Configuratie van containerapplicaties
  - Database-integratiepatronen
  - Voorbeelden van microservicesarchitectuur
  - Implementaties van serverless-functies

#### Kenmerken
- **Multi-Platform Support**: Multi-platformondersteuning: Installatie- en configuratiegidsen voor Windows, macOS en Linux
- **Multiple Skill Levels**: Meerdere vaardigheidsniveaus: Inhoud ontworpen voor studenten tot professionele ontwikkelaars
- **Practical Focus**: Praktische focus: Hands-on voorbeelden en scenario's uit de praktijk
- **Comprehensive Coverage**: Uitgebreide dekking: Van basisconcepten tot geavanceerde enterprisepatronen
- **Security-First Approach**: Beveiligingsgerichte aanpak: Beveiligingsbest practices geïntegreerd in alle onderdelen
- **Cost Optimization**: Kostenoptimalisatie: Richtlijnen voor kosten-efficiënte implementaties en resourcebeheer

#### Documentatiekwaliteit
- **Detailed Code Examples**: Gedetailleerde codevoorbeelden: Praktische, geteste codevoorbeelden
- **Step-by-Step Instructions**: Stap-voor-stap instructies: Duidelijke, bruikbare begeleiding
- **Comprehensive Error Handling**: Uitgebreide foutafhandeling: Probleemoplossing voor veelvoorkomende problemen
- **Best Practices Integration**: Integratie van best practices: Industriestandaarden en aanbevelingen
- **Version Compatibility**: Versiecompatibiliteit: Up-to-date met de nieuwste Azure-services en azd-functies

## Geplande toekomstige verbeteringen

### Versie 3.1.0 (Gepland)
#### Uitbreiding van het AI-platform
- **Multi-Model Support**: Ondersteuning voor meerdere modellen: Integratiepatronen voor Hugging Face, Azure Machine Learning en aangepaste modellen
- **AI Agent Frameworks**: AI-agentframeworks: Sjablonen voor LangChain-, Semantic Kernel- en AutoGen-implementaties
- **Advanced RAG Patterns**: Geavanceerde RAG-patronen: Vector-databaseopties buiten Azure AI Search (Pinecone, Weaviate, enz.)
- **AI Observability**: AI-observeerbaarheid: Verbeterde monitoring voor modelprestaties, tokengebruik en responskwaliteit

#### Ontwikkelaarservaring
- **VS Code Extension**: VS Code-extensie: Geïntegreerde AZD + Microsoft Foundry ontwikkelervaring
- **GitHub Copilot Integration**: GitHub Copilot-integratie: AI-ondersteunde generatie van AZD-sjablonen
- **Interactive Tutorials**: Interactieve tutorials: Hands-on codeeroefeningen met geautomatiseerde validatie voor AI-scenario's
- **Video Content**: Videocontent: Aanvullende videotutorials voor visuele leerlingen met focus op AI-implementaties

### Versie 4.0.0 (Gepland)
#### Enterprise AI-patronen
- **Governance Framework**: Governanceframework: AI-modelgovernance, compliance en auditlogs
- **Multi-Tenant AI**: Multi-tenant AI: Patronen voor het bedienen van meerdere klanten met geïsoleerde AI-diensten
- **Edge AI Deployment**: Edge AI-implementatie: Integratie met Azure IoT Edge en containerinstanties
- **Hybrid Cloud AI**: Hybride cloud AI: Multi-cloud en hybride implementatiepatronen voor AI-workloads

#### Geavanceerde functies
- **AI Pipeline Automation**: AI-pijplijnautomatisering: MLOps-integratie met Azure Machine Learning-pijplijnen
- **Advanced Security**: Geavanceerde beveiliging: Zero-trust-patronen, private endpoints en geavanceerde dreigingsbescherming
- **Performance Optimization**: Prestatieoptimalisatie: Geavanceerde afstemming en schaalstrategieën voor AI-toepassingen met hoge doorvoer
- **Global Distribution**: Wereldwijde distributie: Content delivery- en edge-cachingpatronen voor AI-toepassingen

### Versie 3.0.0 (Gepland) - Vervangen door huidige release
#### Voorgestelde toevoegingen - Nu geïmplementeerd in v3.0.0
- ✅ **AI-Focused Content**: AI-gerichte inhoud: Uitgebreide Microsoft Foundry-integratie (Voltooid)
- ✅ **Interactive Tutorials**: Interactieve tutorials: Hands-on AI-workshoplab (Voltooid)
- ✅ **Advanced Security Module**: Geavanceerde beveiligingsmodule: AI-specifieke beveiligingspatronen (Voltooid)
- ✅ **Performance Optimization**: Prestatieoptimalisatie: Afstemmingsstrategieën voor AI-workloads (Voltooid)

### Versie 2.1.0 (Gepland) - Gedeeltelijk geïmplementeerd in v3.0.0
#### Kleine verbeteringen - Sommige voltooid in de huidige release
- ✅ **Additional Examples**: Aanvullende voorbeelden: AI-gerichte implementatiescenario's (Voltooid)
- ✅ **Extended FAQ**: Uitgebreide FAQ: AI-specifieke vragen en probleemoplossing (Voltooid)
- **Tool Integration**: Toolintegratie: Verbeterde IDE- en editorintegratiegidsen
- ✅ **Monitoring Expansion**: Uitbreiding van monitoring: AI-specifieke monitoring- en waarschuwingspatronen (Voltooid)

#### Nog gepland voor toekomstige release
- **Mobile-Friendly Documentation**: Mobielvriendelijke documentatie: Responsief ontwerp voor mobiel leren
- **Offline Access**: Offline toegang: Downloadbare documentatiepakketten
- **Enhanced IDE Integration**: Verbeterde IDE-integratie: VS Code-extensie voor AZD + AI-workflows
- **Community Dashboard**: Communitydashboard: Realtime communitystatistieken en bijhoudingsmogelijkheden voor bijdragen

## Bijdragen aan de changelog

### Wijzigingen rapporteren
Wanneer u een bijdrage levert aan deze repository, zorg er dan voor dat changelog-items het volgende bevatten:

1. **Version Number**: Volgens semantische versiebeheer (major.minor.patch)
2. **Date**: Releasedatum of bijwerkingsdatum in YYYY-MM-DD-formaat
3. **Category**: Toegevoegd, Gewijzigd, Verouderd, Verwijderd, Opgelost, Beveiliging
4. **Clear Description**: Beknopte beschrijving van wat er is veranderd
5. **Impact Assessment**: Hoe wijzigingen bestaande gebruikers beïnvloeden

### Wijzigingscategorieën

#### Toegevoegd
- Nieuwe functies, documentatiesecties of mogelijkheden
- Nieuwe voorbeelden, sjablonen of leermaterialen
- Extra tools, scripts of hulpprogramma's

#### Gewijzigd
- Wijzigingen aan bestaande functionaliteit of documentatie
- Updates ter verbetering van duidelijkheid of nauwkeurigheid
- Herschikking van inhoud of organisatie

#### Verouderd
- Functies of benaderingen die worden uitgefaseerd
- Documentatiesecties gepland voor verwijdering
- Methoden die betere alternatieven hebben

#### Verwijderd
- Functies, documentatie of voorbeelden die niet langer relevant zijn
- Verouderde informatie of verouderde benaderingen
- Overbodige of samengevoegde inhoud

#### Opgelost
- Correcties van fouten in documentatie of code
- Oplossing van gerapporteerde problemen of problemen
- Verbeteringen in nauwkeurigheid of functionaliteit

#### Beveiliging
- Beveiligingsgerelateerde verbeteringen of oplossingen
- Updates van beveiligingsbest practices
- Oplossing van beveiligingskwetsbaarheden

### Richtlijnen voor semantische versievoering

#### Major-versie (X.0.0)
- Doorbrekende wijzigingen die gebruikersactie vereisen
- Significante herstructurering van inhoud of organisatie
- Wijzigingen die de fundamentele aanpak of methodologie veranderen

#### Minor-versie (X.Y.0)
- Nieuwe functies of inhoudstoevoegingen
- Verbeteringen die achterwaartse compatibiliteit behouden
- Aanvullende voorbeelden, tools of bronnen

#### Patch-versie (X.Y.Z)
- Bugfixes en correcties
- Kleine verbeteringen aan bestaande inhoud
- Verduidelijkingen en kleine verbeteringen

## Feedback en suggesties van de community

We moedigen actief communityfeedback aan om deze leermaterialen te verbeteren:

### Hoe feedback te geven
- **GitHub Issues**: Rapporteer problemen of stel verbeteringen voor (AI-specifieke issues zijn welkom)
- **Discord Discussions**: Deel ideeën en ga in gesprek met de Microsoft Foundry-community
- **Pull Requests**: Draag directe verbeteringen aan voor inhoud, vooral AI-sjablonen en gidsen
- **Microsoft Foundry Discord**: Neem deel aan het #Azure-kanaal voor AZD + AI-discussies
- **Community Forums**: Neem deel aan bredere discussies voor Azure-ontwikkelaars

### Feedbackcategorieën
- **AI Content Accuracy**: Nauwkeurigheid van AI-inhoud: Correcties voor AI-service-integratie en implementatie-informatie
- **Learning Experience**: Leerervaring: Suggesties voor verbeterde leerflow voor AI-ontwikkelaars
- **Missing AI Content**: Ontbrekende AI-inhoud: Verzoeken voor extra AI-sjablonen, patronen of voorbeelden
- **Accessibility**: Toegankelijkheid: Verbeteringen voor diverse leerbehoeften
- **AI Tool Integration**: AI-toolintegratie: Suggesties voor betere integratie van AI-ontwikkelworkflows
- **Production AI Patterns**: Productie AI-patronen: Verzoeken voor enterprise-implementatiepatronen voor AI

### Reactietijd
- **Issue Response**: Reactie op issues: Binnen 48 uur voor gerapporteerde problemen
- **Feature Requests**: Featureverzoeken: Evaluatie binnen één week
- **Community Contributions**: Communitybijdragen: Review binnen één week
- **Security Issues**: Beveiligingsissues: Directe prioriteit met versnelde reactie

## Onderhoudsschema

### Regelmatige updates
- **Monthly Reviews**: Maandelijkse reviews: Inhoudsnauwkeurigheid en linkvalidatie
- **Quarterly Updates**: Kwartaalupdates: Grote inhoudstoevoegingen en verbeteringen
- **Semi-Annual Reviews**: Halfjaarlijkse reviews: Uitgebreide herstructurering en verbeteringen
- **Annual Releases**: Jaarlijkse releases: Grote versie-updates met belangrijke verbeteringen

### Monitoring en kwaliteitsborging
- **Automated Testing**: Geautomatiseerde tests: Regelmatige validatie van codevoorbeelden en links
- **Community Feedback Integration**: Integratie van communityfeedback: Regelmatige opname van gebruikerssuggesties
- **Technology Updates**: Technologie-updates: Afstemming op de nieuwste Azure-services en azd-releases
- **Accessibility Audits**: Toegankelijkheidscontroles: Regelmatige beoordeling voor inclusieve ontwerpprincipes

## Versieondersteuningsbeleid

### Ondersteuning van huidige versie
- **Latest Major Version**: Laatste major-versie: Volledige ondersteuning met regelmatige updates
- **Previous Major Version**: Vorige major-versie: Beveiligingsupdates en kritieke fixes gedurende 12 maanden
- **Legacy Versions**: Legacyversies: Alleen communityondersteuning, geen officiële updates

### Migratierichtlijnen
Wanneer major-versies worden uitgebracht, bieden we:
- **Migration Guides**: Migratiehandleidingen: Stapsgewijze transitie-instructies
- **Compatibility Notes**: Compatibiliteitsnotities: Details over doorbrekende wijzigingen
- **Tool Support**: Toolondersteuning: Scripts of hulpprogramma's om bij migratie te helpen
- **Community Support**: Communityondersteuning: Toegewijde forums voor migratievragen

---

**Navigatie**
- **Previous Lesson**: [Studiegids](resources/study-guide.md)
- **Next Lesson**: Return to [Hoofd README](README.md)

**Blijf op de hoogte**: Volg deze repository voor meldingen over nieuwe releases en belangrijke updates van het leermateriaal.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->