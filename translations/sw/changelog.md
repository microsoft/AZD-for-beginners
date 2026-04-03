# Mabadiliko - AZD Kwa Waanzilishi

## Utangulizi

Mabadiliko haya yanaandika mabadiliko yote muhimu, masasisho, na maboresho kwenye hazina ya AZD Kwa Waanzilishi. Tunafuata kanuni za semantic versioning na tunahifadhi kumbukumbu hii kusaidia watumiaji kuelewa kile kilichobadilika kati ya matoleo.

## Malengo ya Kujifunza

Kwa kupitia mabadiliko haya, utakuwa:
- Ukibaki na habari kuhusu vipengele vipya na nyongeza za yaliyomo
- Ukielewa maboresho yaliyofanywa kwa nyaraka zilizopo
- Ukifuatilia marekebisho ya hitilafu na usahihisho ili kuhakikisha usahihi
- Ukifuata mabadiliko ya vifaa vya kujifunzia kwa wakati

## Matokeo ya Kujifunza

Baada ya kupitia shughuli za mabadiliko, utaweza:
- Kutambua yaliyomo vipya na rasilimali zinazopatikana kwa kujifunza
- Kuelewa ni sehemu gani zilizosasishwa au kuboreshwa
- Kupanga njia yako ya kujifunzia kwa msingi wa nyenzo za sasa zaidi
- Kuchangia maoni na mapendekezo kwa maboresho ya baadaye

## Historia ya Matoleo

### [v3.19.1] - 2026-03-27

#### Ufafanuzi wa Kuwasilishwa kwa Waanzilishi, Uthibitisho wa Usanidi & Usafishaji wa Amri za AZD za Mwisho
**Toleo hili linafuata ukaguzi wa uthibitisho wa AZD 1.23 kwa kupitia nyaraka kwa walengwa wanaoanza: linafafanua mwongozo wa uthibitishaji wa kwanza kwa kutumia AZD, linaongeza skripti za uthibitisho wa usanidi wa ndani, linathibitisha amri muhimu dhidi ya CLI ya AZD hai, na linaondoa marejeleo ya mwisho ya amri za chanzo la Kiingereza zinazotolewa nje ya mabadiliko.**

#### Imeongezwa
- **🧪 Skripti za uthibitisho wa usanidi kwa waanzilishi** pamoja na `validate-setup.ps1` na `validate-setup.sh` ili wanafunzi waweze kuthibitisha zana zinazohitajika kabla ya kuanza Sura ya 1
- **✅ Hatua za uthibitisho wa usanidi mwanzoni** kwenye README ya mzizi na README ya Sura 1 ili mahitaji ya awali yaliyokosekana yagundulike kabla ya `azd up`

#### Imebadilishwa
- **🔐 Mwongozo wa uthibitishaji kwa waanzilishi** sasa unashughulikia mara kwa mara `azd auth login` kama njia kuu kwa mtiririko wa kazi za AZD, huku `az login` ikionyeshwa kama hiari isipokuwa amri za Azure CLI zinapotumika moja kwa moja
- **📚 Mtiririko wa kujiunga wa Sura ya 1** sasa unaelekeza wanafunzi kuthibitisha usanidi wao wa ndani kabla ya hatua za usakinishaji, uthibitishaji, na utekelezaji wa kwanza
- **🛠️ Ujumbe wa kuangalia** sasa unatofautisha kwa uwazi mahitaji yanayosababisha kukwama na onyo la hiari la Azure CLI kwa njia ya waanzilishi inayotegemea AZD pekee
- **📖 Nyaraka za usanidi, utatuzi wa matatizo, na mifano** sasa zinatofautisha kati ya uthibitishaji unaohitajika wa AZD na kuingia kwa Azure CLI kama hiari ambapo zote zilikuwa zikitolewa bila muktadha awali

#### Imerekebishwa
- **📋 Marejeleo ya amri zilizosalia za chanzo la Kiingereza** yamesasishwa kwa fomu za sasa za AZD, ikijumuisha `azd config show` kwenye karatasi ya mbinu na `azd monitor --overview` pale mwongozo wa muhtasari wa Azure Portal ulikuwa unakusudiwa
- **🧭 Dai za waanzilishi katika Sura ya 1** zimepunguzwa ili kuepuka kutoa ahadi za kupita kiasi za kutokosea kabisa au tabia ya rollback iliyodhaminiwa kwa template zote na rasilimali za Azure
- **🔎 Uthibitisho wa CLI hai** umethibitisha msaada wa sasa kwa `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, na `azd down --force --purge`

#### Faili Zilizosasishwa
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

#### Uthibitisho wa AZD 1.23.12, Upanuzi wa Mazingira ya Warsha & Uboreshaji wa Mfano wa AI
**Toleo hili linafanya ukaguzi wa uthibitisho wa nyaraka dhidi ya `azd` `1.23.12`, linasasisha mifano ya amri za AZD zilizokuwa zimepitwa na wakati, linafanya upya miongozo ya modeli za AI hadi chaguo-msingi za sasa, na linaeneza maelekezo ya warsha mbali na GitHub Codespaces ili pia kuunga mkono dev containers na clones za ndani.**

#### Imeongezwa
- **✅ Vidokezo vya uthibitisho katika sura kuu na nyaraka za warsha** ili kufanya wazi msingi wa AZD uliothibitishwa kwa wanafunzi wanaotumia majengo tofauti ya CLI
- **⏱️ Mwongozo wa muda wa utekelezaji** kwa utekelezaji wa programu za AI zinazochukua muda mrefu kwa kutumia `azd deploy --timeout 1800`
- **🔎 Hatua za kuchunguza extensions** na `azd extension show azure.ai.agents` katika nyaraka za mtiririko wa kazi za AI
- **🌐 Mwongozo mpana wa mazingira ya warsha** unaojumuisha GitHub Codespaces, dev containers, na clones za ndani kwa MkDocs

#### Imebadilishwa
- **📚 README za utangulizi wa sura** sasa zinataja kwa uwiano uthibitisho dhidi ya `azd 1.23.12` katika sura za msingi, usanidi, miundombinu, wakala-wengi, kabla ya utekelezaji, utatuzi wa matatizo, na sehemu za uzalishaji
- **🛠️ Marejeleo ya amri za AZD** yamesasishwa kwa fomu za sasa katika nyaraka:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` au `azd env get-value(s)` kulingana na muktadha
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` pale muhtasari wa Application Insights unakusudiwa
- **🧪 Mifano ya preview ya provisioning** imerahisishwa kwa matumizi yanayotegemewa sasa kama `azd provision --preview` na `azd provision --preview -e production`
- **🧭 Mtiririko wa warsha** umesasishwa ili wanafunzi waweze kukamilisha maabara katika Codespaces, dev container, au clone ya ndani badala ya kudhani utekelezaji ni kwa Codespaces tu
- **🔐 Mwongozo wa uthibitishaji** sasa unapendelea `azd auth login` kwa mtiririko wa kazi za AZD, huku `az login` ikiwa ya hiari wakati amri za Azure CLI zinapotumika moja kwa moja

#### Imerekebishwa
- **🪟 Amri za usakinishaji za Windows** zimefanywa kuwa za kawaida kwa kuchanganya kesi ya kifurushi `winget` kwenye mwongozo wa usakinishaji
- **🐧 Mwongozo wa usakinishaji wa Linux** umerekebishwa kuepuka maagizo ya meneja wa kifurushi ya distro isiyoungwa mkono kwa `azd` na badala yake kuishia kuelekeza kwa mali za kutolewa inapofaa
- **📦 Mifano ya modeli za AI** imefanyiwa uboreshaji kutoka chaguo za zamani kama `gpt-35-turbo` na `text-embedding-ada-002` hadi mifano ya sasa kama `gpt-4.1-mini`, `gpt-4.1`, na `text-embedding-3-large`
- **📋 Vipande vya utekelezaji na uchanganuzi** vimesahihishwa kutumia amri za mazingira na hali za sasa katika magwiji, skripti, na hatua za utatuzi
- **⚙️ Mwongozo wa GitHub Actions** umesasishwa kutoka `Azure/setup-azd@v1.0.0` hadi `Azure/setup-azd@v2`
- **🤖 Mwongozo wa kibali wa MCP/Copilot** umebadilishwa kutoka `azd mcp consent` hadi `azd copilot consent list`

#### Imeboreshwa
- **🧠 Mwongozo wa sura ya AI** sasa unaelezea vizuri mwenendo wa `azd ai` unaoathiriwa na preview, kuingia kulia kulingana na tenant, matumizi ya extension ya sasa, na mapendekezo ya utoaji wa modeli wa sasa
- **🧪 Maelekezo ya warsha** sasa yanatumia mifano ya toleo inayoweza kutumika zaidi na lugha safi za usanidi wa mazingira kwa maabara ya vitendo
- **📈 Nyaraka za uzalishaji na utatuzi wa matatizo** sasa zinaendana vyema na ufuatiliaji wa sasa, modeli za dharura, na mifano ya ngazi za gharama

#### Faili Zilizosasishwa
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

#### Amri za AZD AI CLI, Uthibitisho wa Yaliyomo & Upanuzi wa Templeti
**Toleo hili linaongeza ufunika wa amri za `azd ai`, `azd extension`, na `azd mcp` katika sura zote zinazoonyesha AI, linarekebisha viungo vilivyovunjika na msimbo uliopita kwenye agents.md, linasasisha karatasi ya mbinu, na linabadilisha Sehemu ya Templeti za Mfano kwa maelezo yaliyothibitishwa na templeti mpya za Azure AI AZD.**

#### Imeongezwa
- **🤖 Ufikaji wa amri za AZD AI CLI** katika faili 7 (hapo awali tu katika Sura ya 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Sehemu Mpya "Extensions and AI Commands" inayowasilisha `azd extension`, `azd ai agent init`, na `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Chaguo la 4: `azd ai agent init` pamoja na jedwali la kulinganisha (mbinu ya templeti dhidi ya njia ya manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Vifungu "AZD Extensions for Foundry" na "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Anza Haraka sasa inaonyesha njia za utekelezaji kwa msingi wa templeti na manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sehemu ya Kutekeleza sasa inajumuisha chaguo la `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Kifungu "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Sehemu Mpya "AI & Extensions Commands" yenye `azd extension`, `azd ai agent init`, `azd mcp`, na `azd infra generate`
- **📦 Templeti mpya za mfano za AZD AI** katika `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Mazungumzo ya RAG ya .NET na Blazor WebAssembly, Semantic Kernel, na msaada wa mazungumzo ya sauti
  - **azure-search-openai-demo-java** — Mazungumzo ya RAG ya Java kwa kutumia Langchain4J na chaguzi za uendeshaji ACA/AKS
  - **contoso-creative-writer** — Programu ya uandishi wa ubunifu yenye wakala-wengi ikitumia Azure AI Agent Service, Bing Grounding, na Prompty
  - **serverless-chat-langchainjs** — RAG isiyo na seva ikitumia Azure Functions + LangChain.js + Cosmos DB pamoja na msaada wa maendeleo ya ndani wa Ollama
  - **chat-with-your-data-solution-accelerator** — Kienzi cha RAG cha biashara chenye ghorofa ya usimamizi, ujumuishaji wa Teams, na chaguzi za PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Mfano wa rufaa wa mpangilio wa wakala-wengi wa MCP yenye seva katika .NET, Python, Java, na TypeScript
  - **azd-ai-starter** — Templeti ya kuanza ya Bicep ya miundombinu ya Azure AI
  - **🔗 Kiungo cha Jukwaa la Ajabu la AZD AI** — Marejeleo kwa [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (templeti 80+)

#### Imerekebishwa
- **🔗 Uendeshaji wa agents.md**: Viungo vya Nyuma/Iliyoifuata sasa vinaendana na mpangilio wa masomo wa README ya Sura ya 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Viungo vilivyovunjika katika agents.md**: `production-ai-practices.md` imesahihishwa kuwa `../chapter-08-production/production-ai-practices.md` (matukio 3)
- **📦 Msimbo uliopitwa wa agents.md**: Imebadilishwa `opencensus` na `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API isiyo sahihi katika agents.md**: Imehamisha `max_tokens` kutoka `create_agent()` kwenda `create_run()` kama `max_completion_tokens`
- **🔢 Kuhesabu token katika agents.md**: Imebadilisha makadirio ya karibu `len//4` kwa `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Imetangazwa huduma kutoka "Cognitive Search + App Service" hadi "Azure AI Search + Azure Container Apps" (mwenyeji wa chaguo-msingi uliobadilika Okt 2024)
- **contoso-chat**: Maelezo yamesasishwa kurejelea Azure AI Foundry + Prompty, yakilingana na kichwa cha hazina na stack ya teknolojia

#### Imeondolewa
- **ai-document-processing**: Iliondolewa rejeleo la templeti lisilofanya kazi (hazina haipitiki kwa umma kama templeti ya AZD)

#### Imeboreshwa
- **📝 agents.md exercises**: Zoezi 1 sasa linaonyesha matokeo yanayotarajiwa na hatua ya `azd monitor`; Zoezi 2 linajumuisha msimbo kamili wa usajili wa `FunctionTool`; Zoezi 3 limebadilisha mwongozo usioeleweka kwa amri halisi za `prepdocs.py`
- **📚 agents.md resources**: Imeboresha viungo vya nyaraka kwenda kwa nyaraka za sasa za Azure AI Agent Service na mwongozo wa haraka
- **📋 agents.md Next Steps table**: Imeongeza kiungo cha AI Workshop Lab kwa kufunika sura zote

#### Faili Zilizosasishwa
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Uboreshaji wa Urambazaji wa Kozi
**Toleo hili linaboresha urambazaji wa sura za README.md kwa muundo ulioboreshwa wa jedwali.**

#### Imebadilishwa
- **Course Map Table**: Imeboreshwa na viungo vya moja kwa moja vya masomo, makadirio ya muda, na viwango vya ugumu
- **Folder Cleanup**: Imeondoa folda za zamani zisizohitajika (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Viungo vyote vya ndani 21+ katika Jedwali la Ramani ya Kozi vimehakikiwa

### [v3.16.0] - 2026-02-05

#### Mabadiliko ya Majina ya Bidhaa
**Toleo hili linasasisha marejeo ya bidhaa kwa chapa ya sasa ya Microsoft.**

#### Imebadilishwa
- **Microsoft Foundry → Microsoft Foundry**: Marejeo yote yamesasishwa katika faili zisizo za tafsiri
- **Azure AI Agent Service → Foundry Agents**: Jina la huduma limesasishwa kuendana na chapa ya sasa

#### Faili Zilizosasishwa
- `README.md` - Ukurasa mkuu wa kozi
- `changelog.md` - Historia ya matoleo
- `course-outline.md` - Muundo wa kozi
- `docs/chapter-02-ai-development/agents.md` - Mwongozo wa maajenti wa AI
- `examples/README.md` - Nyaraka za mifano
- `workshop/README.md` - Ukurasa wa warsha
- `workshop/docs/index.md` - Fahirisi ya warsha
- `workshop/docs/instructions/*.md` - Faili zote za maelekezo ya warsha

---

### [v3.15.0] - 2026-02-05

#### Mabadiliko Makubwa ya Muundo wa Rejesta: Majina ya Folda kwa Kifungu
**Toleo hili linapanga upya nyaraka kuwa folda za sura zilizotengwa kwa urambazaji ulio wazi zaidi.**

#### Majina ya Folda Yaliyobadilishwa
Folda za zamani zimerudishwa na zile zilizo na nambari za sura:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Imezidisha: `docs/chapter-05-multi-agent/`

#### Uhamisho wa Faili
| Faili | Kutoka | Kwenda |
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

#### Imeongezwa
- **📚 Faili za README za Sura**: Imeunda README.md katika kila folda ya sura yenye:
  - Malengo ya kujifunza na muda wa kutokea
  - Jedwali la masomo lenye maelezo
  - Amri za kuanza haraka
  - Urambazaji kuelekea sura zingine

#### Imebadilishwa
- **🔗 Imeboreshwa viungo vya ndani vyote**: Njia 78+ zimesasishwa katika faili zote za nyaraka
- **🗺️ README Mkuu**: Ramani kuu ya Kozi imesasishwa kwa muundo mpya wa sura
- **📝 examples/README.md**: Imesasisha rejea za kuvuka kwa folda za sura

#### Imeondolewa
- Muundo wa folda za zamani (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Uboreshaji wa Muundo wa Rejesta: Urambazaji wa Sura
**Toleo hili liliweka faili za urambazaji wa sura za README (zilizosombwa na v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Mwongozo Mpya wa Maajenti wa AI
**Toleo hili linaongeza mwongozo kamili wa kupeleka maajenti wa AI kwa kutumia Azure Developer CLI.**

#### Imeongezwa
- **🤖 docs/microsoft-foundry/agents.md**: Mwongozo kamili unaofunika:
  - Maana ya maajenti wa AI na jinsi wanavyotofautiana na chatbots
  - Violezo vitatu vya kuanza haraka kwa maajenti (Foundry Agents, Prompty, RAG)
  - Miundo ya usanifu wa maajenti (maajenti wa pekee, RAG, multi-agent)
  - Usanidi wa zana na utengenezaji
  - Ufuatiliaji na ufuatiliaji wa vipimo
  - Mambo ya gharama na uboreshaji
  - Matatizo ya kawaida na utatuzi
  - Mazoezi matatu ya vitendo yenye vigezo vya mafanikio

#### Muundo wa Yaliyomo
- **Utangulizi**: Dhana za maajenti kwa wanaoanza
- **Kuanza Haraka**: Peleka maajenti na `azd init --template get-started-with-ai-agents`
- **Miundo ya Usanifu**: Michoro ya kuona ya mifumo ya maajenti
- **Usanidi**: Uwekaji wa zana na vigezo vya mazingira
- **Ufuatiliaji**: Uunganisho wa Application Insights
- **Mazoezi**: Kujifunza kwa vitendo hatua kwa hatua (dakika 20-45 kila moja)

---

### [v3.12.0] - 2026-02-05

#### Sasisho la Mazingira ya DevContainer
**Toleo hili linasasisha usanidi wa chombo cha maendeleo kwa zana za kisasa na vigezo bora kwa uzoefu wa kujifunza AZD.**

#### Imebadilishwa
- **🐳 Picha ya Msingi**: Imesasishwa kutoka `python:3.12-bullseye` hadi `python:3.12-bookworm` (Debian imara ya hivi karibuni)
- **📛 Jina la Kontena**: Jina limebadilishwa kutoka "Python 3" hadi "AZD for Beginners" kwa uwazi

#### Imeongezwa
- **🔧 Vipengele vipya vya Dev Container**:
  - `azure-cli` na msaada wa Bicep umewezeshwa
  - `node:20` (toleo la LTS kwa templates za AZD)
  - `github-cli` kwa usimamizi wa templates
  - `docker-in-docker` kwa utoaji wa container app

- **🔌 Upitishaji Bandari**: Bandari zimewekwa awali kwa maendeleo ya kawaida:
  - 8000 (Mwonekano wa MkDocs)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Upanuzi Mpya za VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense iliyoboreshwa ya Python
  - `ms-azuretools.vscode-azurefunctions` - Msaada wa Azure Functions
  - `ms-azuretools.vscode-docker` - Msaada wa Docker
  - `ms-azuretools.vscode-bicep` - Msaada wa lugha ya Bicep
  - `ms-azure-devtools.azure-resource-groups` - Usimamizi wa rasilimali za Azure
  - `yzhang.markdown-all-in-one` - Uhariri wa Markdown
  - `DavidAnson.vscode-markdownlint` - Uwekaji wa viwango vya Markdown
  - `bierner.markdown-mermaid` - Msaada wa michoro ya Mermaid
  - `redhat.vscode-yaml` - Msaada wa YAML (kwa azure.yaml)
  - `eamodio.gitlens` - Uonyeshaji wa Git
  - `mhutchie.git-graph` - Historia ya Git

- **⚙️ Mipangilio ya VS Code**: Imeongeza mipangilio ya chaguo-msingi kwa interpreter ya Python, kupanga kwenye kuhifadhi, na kuondoa nafasi zisizohitajika

- **📦 requirements-dev.txt Imeboreshwa**:
  - Imeongeza plugin ya MkDocs minify
  - Imeongeza pre-commit kwa ubora wa msimbo
  - Imeongeza vifurushi vya Azure SDK (azure-identity, azure-mgmt-resource)

#### Imetatuliwa
- **Amri ya Post-Create**: Sasa inathibitisha ufungaji wa AZD na Azure CLI wakati wa kuanzisha kontena

---

### [v3.11.0] - 2026-02-05

#### Marekebisho ya README kwa Waanza
**Toleo hili linaboresha README.md kwa urahisi kwa wanaoanza na linaongeza rasilimali muhimu kwa watengenezaji wa AI.**

#### Imeongezwa
- **🆚 Azure CLI vs AZD Ulinganisho**: Maelezo wazi ya wakati wa kutumia kila zana pamoja na mifano ya vitendo
- **🌟 Viungo Bora vya AZD**: Viungo vya moja kwa moja kwenye maktaba ya templates ya jamii na rasilimali za kuchangia:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - templates 200+ tayari-kwa-kupeleka
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Michango ya jamii
- **🎯 Mwongozo wa Kuanza Haraka**: Sehemu rahisi ya hatua 3 za kuanza (Sakinisha → Ingia → Peleka)
- **📊 Jedwali la Urambazaji la Kulingana na Uzoefu**: Mwongozo wa wazi juu ya wapi waanza kulingana na uzoefu wa msanidi

#### Imebadilishwa
- **Muundo wa README**: Umepangwa upya kwa kujifunza kwa hatua - taarifa muhimu kwanza
- **Sehemu ya Utangulizi**: Imeandikwa upya ili kuelezea "Sanaa ya `azd up`" kwa wanaoanza kabisa
- **Yameondolewa Yaliyorudishwa**: Imeondoa sehemu ya utatuzi ya rudufu
- **Amri za Utatuzi**: Imarekebisha rejea ya `azd logs` ili kutumia `azd monitor --logs` halali

#### Imetatuliwa
- **🔐 Amri za Uthibitisho**: Imeongeza `azd auth login` na `azd auth logout` kwenye cheat-sheet.md
- **Rejea za Amri Zisizo Sahihi**: Imeondoa marejeo yaliyobaki ya `azd logs` katika sehemu ya utatuzi ya README

#### Vidokezo
- **Wigo**: Mabadiliko yalitumiwa kwa README kuu na resources/cheat-sheet.md
- **Watazamaji Walengwa**: Maboresho yanalenga hasa waendelezaji wapya kwa AZD

---

### [v3.10.0] - 2026-02-05

#### Usahihi wa Amri za Azure Developer CLI
**Toleo hili linasahihisha amri za AZD ambazo hazipo katika nyaraka, kuhakikisha mifano yote ya msimbo inatumia sintaks sahihi ya Azure Developer CLI.**

#### Imetatuliwa
- **🔧 Amri za AZD Zisizokuwepo Zimeondolewa**: Ukaguzi kamili na marekebisho ya amri zisizokuwepo:
  - `azd logs` (haipo) → imerekebishwa kuwa `azd monitor --logs` au mbadala za Azure CLI
  - vitendaji vidogo vya `azd service` (havipo) → vimerudishwa kwa `azd show` na Azure CLI
  - `azd infra import/export/validate` (havipo) → imeondolewa au kubadilishwa kwa mbadala halali
  - bendera za `azd deploy --rollback/--incremental/--parallel/--detect-changes` (hazipo) → zimeondolewa
  - bendera za `azd provision --what-if/--rollback` (hazipo) → zimesasishwa kutumia `--preview`
  - `azd config validate` (haini) → imerejeshwa kwa `azd config list`
  - `azd info`, `azd history`, `azd metrics` (havipo) → zimeondolewa

- **📚 Faili Zilizobadilishwa kwa Marekebisho ya Amri**:
  - `resources/cheat-sheet.md`: Marekebisho makubwa ya rejea ya amri
  - `docs/deployment/deployment-guide.md`: Imeboresha mikakati ya rollback na utoaji
  - `docs/troubleshooting/debugging.md`: Imefanyiwa marekebisho sehemu za uchambuzi wa logi
  - `docs/troubleshooting/common-issues.md`: Imeboresha amri za utatuzi
  - `docs/troubleshooting/ai-troubleshooting.md`: Imefasiri sehemu ya utatuzi ya AZD
  - `docs/getting-started/azd-basics.md`: Imeboresha amri za ufuatiliaji
  - `docs/getting-started/first-project.md`: Imeboresha mifano ya ufuatiliaji na utatuzi
  - `docs/getting-started/installation.md`: Imeboresha mfano wa msaada na toleo
  - `docs/pre-deployment/application-insights.md`: Imeboresha amri za kuangalia logi
  - `docs/pre-deployment/coordination-patterns.md`: Imeboresha amri za utatuzi wa maajenti

- **📝 Rejea ya Toleo Imeboreshwa**: 
  - `docs/getting-started/installation.md`: Imekuwa ikitumia toleo la jumla `1.x.x` badala ya `1.5.0` lililowekwa na kiungo kwa releases

#### Imebadilishwa
- **Mikakati ya Rollback**: Nyaraka zimesasishwa kutumia rollback inayotegemea Git (AZD haina rollback asilia)
- **Kuangalia Logi**: Marejeo ya `azd logs` yamebadilishwa kwa `azd monitor --logs`, `azd monitor --live`, na amri za Azure CLI
- **Sehemu ya Utendaji**: Imeondoa bendera za utoaji sambamba/za hatua za ziada ambazo hazipo, na kutoa mbadala halali

#### Maelezo ya Kiufundi
- **Amri Halali za AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Bendera Halali za azd monitor**: `--live`, `--logs`, `--overview`
- **Vipengele Vilivyofutwa**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Maelezo
- **Uthibitisho**: Amri zilizothibitishwa dhidi ya Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ukomo wa Warsha na Sasisho la Ubora wa Nyaraka
**Toleo hili linakamilisha moduli za warsha za mwingiliano, linarekebisha viungo vyote vya nyaraka vilivyovunjika, na linaboresha ubora wa maudhui kwa watoaji wa maendeleo ya AI wanaotumia Microsoft AZD.**

#### Imeongezwa
- **📝 CONTRIBUTING.md**: Hati mpya ya miongozo ya michango yenye:
  - Maelekezo wazi ya kuripoti matatizo na kupendekeza mabadiliko
  - Viwango vya nyaraka kwa maudhui mapya
  - Miongozo ya mifano ya msimbo na kanuni za ujumbe wa commit
  - Taarifa za ushirikishaji wa jamii

#### Imekamilika
- **🎯 Module ya Warsha 7 (Hitimisho)**: Moduli ya hitimisho iliyokamilika kabisa yenye:
  - Muhtasari kamili wa mafanikio ya warsha
  - Sehemu ya dhana kuu zilizopatikana inayohusisha AZD, templates, na Microsoft Foundry
  - Mapendekezo ya kuendelea na safari ya kujifunza
  - Mazoezi ya changamoto za warsha pamoja na viwango vya ugumu
  - Viungo vya mrejesho wa jamii na msaada

- **📚 Module ya Warsha 3 (Uchanganishaji)**: Malengo ya kujifunza iliyoboreshwa yenye:
  - Mwongozo wa kuanzisha GitHub Copilot na seva za MCP
  - Uelewa wa muundo wa folda wa templates za AZD
  - Mifumo ya upangaji wa Infrastructure-as-code (Bicep)
  - Maelekezo ya maabara ya vitendo

- **🔧 Module ya Warsha 6 (Ufutaji)**: Imekamilika na:
  - Malengo ya usafishaji wa rasilimali na usimamizi wa gharama
  - Matumizi ya `azd down` kwa uondoaji salama wa miundombinu
  - Mwongozo wa urejeshaji wa huduma za cognitive zilizofutwa kwa mpole
  - Mawazo ya ziada ya uchunguzi kwa GitHub Copilot na Azure Portal

#### Imerekebishwa
- **🔗 Marekebisho ya Viungo Vilivyovunjika**: Ilitatua viungo zaidi ya 15 vya ndani vilivyovunjika:
  - `docs/ai-foundry/ai-model-deployment.md`: Ilirekebisha njia za microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ilirekebisha njia za ai-model-deployment.md na production-ai-practices.md
  - `docs/getting-started/first-project.md`: Imebadilisha cicd-integration.md isiyokuwepo na deployment-guide.md
  - `examples/retail-scenario.md`: Ilirekebisha njia za FAQ na mwongozo wa utatuzi wa matatizo
  - `examples/container-app/microservices/README.md`: Ilirekebisha njia za course home na mwongozo wa deployment
  - `resources/faq.md` na `resources/glossary.md`: Imesasisha marejeo ya sura za AI
  - `course-outline.md`: Ilirekebisha mwongozo wa mwalimu na marejeo ya maabara ya warsha ya AI

- **📅 Bango la Hali ya Warsha**: Imebadilishwa kutoka "Under Construction" hadi hali ya warsha hai pamoja na tarehe Februari 2026

- **🔗 Urambazaji wa Warsha**: Ilirekebisha viungo vya urambazaji vilivyovunjika kwenye README.md ya warsha vinavyoelekeza kwenye folda isiyokuwepo lab-1-azd-basics

#### Imebadilishwa
- **Uwasilishaji wa Warsha**: Iliondoa onyo la "under construction", warsha sasa imekamilika na iko tayari kutumika
- **Ulinganifu wa Urambazaji**: Imehakikisha moduli zote za warsha zina urambazaji sahihi kati ya moduli
- **Marejeo ya Njia ya Kujifunza**: Imeboresha marejeo ya sura ili kutumia njia sahihi za microsoft-foundry

#### Imethibitishwa
- ✅ Faili zote za Markdown za Kiingereza zina viungo vya ndani vyenye uhalali
- ✅ Moduli za warsha 0-7 zimekamilika na zina malengo ya kujifunza
- ✅ Urambazaji kati ya sura na moduli unafanya kazi kwa usahihi
- ✅ Maudhui ni yanayofaa kwa watoaji wa maendeleo ya AI wanaotumia Microsoft AZD
- ✅ Lugha rafiki kwa wanaoanza na muundo umehifadhiwa kote
- ✅ CONTRIBUTING.md inaleta mwongozo wazi kwa wachangiaji wa jamii

#### Utekelezaji wa Kifundi
- **Uthibitishaji wa Viungo**: Skripti ya PowerShell ya otomatiki ilithibitisha viungo vyote vya ndani vya .md
- **Ukaguzi wa Maudhui**: Mapitio ya mwongozo ya ukamilifu wa warsha na ufanisi kwa wanaoanza
- **Mfumo wa Urambazaji**: Matumizi ya mifumo thabiti ya urambazaji wa sura na moduli

#### Maelezo
- **Wigo**: Mabadiliko yalitekelezwa kwa nyaraka za Kiingereza pekee
- **Tafsiri**: Folda za tafsiri hazijasasishwa katika toleo hili (tafsiri za otomatiki zitasawazishwa baadaye)
- **Muda wa Warsha**: Warsha kamili sasa inatoa masaa 3-4 ya kujifunza kwa vitendo

---

### [v3.8.0] - 2025-11-19

#### Nyaraka za Juu: Ufuatiliaji, Usalama, na Mifumo ya Wakala Wengi
**Toleo hili linaongeza masomo ya kiwango A kuhusu ujumuishaji wa Application Insights, mifumo ya uthibitishaji, na uratibu wa wakala wengi kwa utoaji uzalishaji.**

#### Imeongezwa
- **📊 Somo la Ujumuishaji wa Application Insights**: katika `docs/pre-deployment/application-insights.md`:
  - Utekelezaji unaolenga AZD kwa utoaji na utoaji wa rasilimali otomatiki
  - Templates kamili za Bicep kwa Application Insights + Log Analytics
  - Programu za Python zinazofanya kazi na telemetry ya kawaida (mistari 1,200+)
  - Mifumo ya ufuatiliaji ya AI/LLM (ukurasa wa token/gastos za Microsoft Foundry Models)
  - Michoro 6 ya Mermaid (miundo, tracing iliyosambazwa, mtiririko wa telemetry)
  - Mazoezi 3 ya vitendo (alerts, dashboards, ufuatiliaji wa AI)
  - Mifano ya maswali ya Kusto na mikakati ya kupunguza gharama
  - Upelelezi wa metrics moja kwa moja na urekebishaji wa wakati halisi
  - Wakati wa kujifunza wa dakika 40-50 na mifumo tayari kwa uzalishaji

- **🔐 Somo la Uthibitishaji & Mifumo ya Usalama**: katika `docs/getting-started/authsecurity.md`:
  - Mifumo 3 ya uthibitishaji (connection strings, Key Vault, managed identity)
  - Templates kamili za miundombinu za Bicep kwa utoaji salama
  - Msimbo wa programu za Node.js unaounganisha Azure SDK
  - Mazoezi 3 kamili (wezeshaji managed identity, user-assigned identity, mzunguko wa Key Vault)
  - Mavazi bora ya usalama na usanidi wa RBAC
  - Mwongozo wa utatuzi wa matatizo na uchambuzi wa gharama
  - Mifumo ya uthibitishaji bila nywila inayofaa kwa uzalishaji

- **🤖 Somo la Mifumo ya Uratibu wa Wakala Wengi**: katika `docs/pre-deployment/coordination-patterns.md`:
  - Mifumo 5 ya uratibu (mfululizo, sambamba, kihierarkia, inayoendeshwa na matukio, makubaliano)
  - Utekelezaji kamili wa huduma za orkesta (Python/Flask, mistari 1,500+)
  - Utekelezaji maalum wa mawakala 3 (Research, Writer, Editor)
  - Ujumuishaji wa Service Bus kwa queue ya ujumbe
  - Usimamizi wa hali kwa Cosmos DB kwa mifumo iliyogawanyika
  - Michoro 6 ya Mermaid ikionyesha mwingiliano wa mawakala
  - Mazoezi 3 ya kiwango cha juu (kusimamia muda wa kusubiri, mantiki ya kurudia, circuit breaker)
  - Ugawaji wa gharama ($240-565/month) pamoja na mikakati ya ufanisi
  - Ujumuishaji wa Application Insights kwa ufuatiliaji

#### Imeboreshwa
- **Sura ya Kabla ya Utoaji**: Sasa inajumuisha ufuatiliaji kamili na mifumo ya uratibu
- **Sura ya Kuanzia**: Imeboreshwa kwa mifumo ya kitaalamu ya uthibitishaji
- **Utakaso wa Uzalishaji**: Ufuniko kamili kutoka usalama hadi uonekano
- **Muhtasari wa Kozi**: Imesasishwa ili kurejea masomo mapya katika Sura 3 na 6

#### Imebadilishwa
- **Mfululizo wa Kujifunza**: Uunganisho bora wa usalama na ufuatiliaji kote kwenye kozi
- **Ubora wa Nyaraka**: Viwango thabiti vya A-grade (95-97%) kwa masomo mapya
- **Mifumo ya Uzalishaji**: Ufuniko kamili end-to-end kwa utoaji wa shirika

#### Imeboreshwa
- **Uzoefu wa Mwanaendelezaji**: Njia wazi kutoka maendeleo hadi ufuatiliaji wa uzalishaji
- **Viwango vya Usalama**: Mifumo ya kitaalamu kwa uthibitishaji na usimamizi wa siri
- **Uonekano**: Ujumuishaji kamili wa Application Insights na AZD
- **Mzigo wa AI**: Ufuatiliaji maalum kwa Microsoft Foundry Models na mifumo ya wakala wengi

#### Imethibitishwa
- ✅ Masomo yote yanajumuisha msimbo kamili unaofanya kazi (sio vipande tu)
- ✅ Michoro ya Mermaid kwa kujifunzia kuona (jumla 19 katika masomo 3)
- ✅ Mazoezi ya vitendo yenye hatua za uthibitisho (jumla 9)
- ✅ Templates za Bicep tayari kwa uzalishaji zinazoweza kutumika kupitia `azd up`
- ✅ Uchambuzi wa gharama na mikakati ya ufanisi
- ✅ Miongozo ya utatuzi wa matatizo na vitendo bora
- ✅ Vidokezo vya maarifa na amri za uthibitisho

#### Matokeo ya Kuweka Alama kwa Nyaraka
- **docs/pre-deployment/application-insights.md**: - Mwongozo kamili wa ufuatiliaji
- **docs/getting-started/authsecurity.md**: - Mifumo ya usalama ya kitaalamu
- **docs/pre-deployment/coordination-patterns.md**: - Miundo ya juu ya wakala wengi
- **Maudhui Mpya kwa Ujumla**: - Viwango vya ubora thabiti

#### Utekelezaji wa Kifundi
- **Application Insights**: Log Analytics + telemetry ya kawaida + tracing iliyosambazwa
- **Uthibitishaji**: Managed Identity + Key Vault + mifumo ya RBAC
- **Wakala Wengi**: Service Bus + Cosmos DB + Container Apps + orkestri
- **Ufuatiliaji**: Metrics moja kwa moja + maswali ya Kusto + alerts + dashboards
- **Usimamizi wa Gharama**: Mikakati ya sampuli, sera za kuhifadhi, udhibiti wa bajeti

### [v3.7.0] - 2025-11-19

#### Maboresho ya Ubora wa Nyaraka na Mfano Mpya wa Microsoft Foundry Models
**Toleo hili linaongeza ubora wa nyaraka kote kwenye hazina na linaongeza mfano kamili wa utoaji wa Microsoft Foundry Models na kiolesura cha gumzo cha gpt-4.1.**

#### Imeongezwa
- **🤖 Mfano wa Gumzo wa Microsoft Foundry Models**: Utekelezaji kamili wa gpt-4.1 katika `examples/azure-openai-chat/`:
  - Miundombinu kamili ya Microsoft Foundry Models (utoaji wa model gpt-4.1)
  - Kiolesura cha gumzo cha kazi kwa Python chenye historia ya mazungumzo
  - Ujumuishaji wa Key Vault kwa kuhifadhi salama funguo za API
  - Ufuatiliaji wa matumizi ya token na makadirio ya gharama
  - Udhibiti wa kiwango na utambuzi wa makosa
  - README ya kina yenye mwongozo wa utoaji wa dakika 35-45
  - Faili 11 tayari kwa uzalishaji (templates za Bicep, programu ya Python, usanidi)
- **📚 Mazoezi ya Nyaraka**: Imeongezwa mazoezi ya vitendo kwenye mwongozo wa usanidi:
  - Zoefisho 1: Usanidi wa mazingira mengi (dakika 15)
  - Zoefisho 2: Mazoezi ya usimamizi wa siri (dakika 10)
  - Vigezo vya mafanikio vya wazi na hatua za uthibitisho
- **✅ Uthibitisho wa Utoaji**: Imeongezwa sehemu ya uthibitisho kwenye mwongozo wa utoaji:
  - Taratibu za ukagua afya
  - Orodha ya vigezo vya mafanikio
  - Matokeo yanayotarajiwa kwa amri zote za utoaji
  - Marejeo ya utatuzi wa matatizo

#### Imeboreshwa
- **examples/README.md**: Imesasishwa hadi ubora wa A-grade (93%):
  - Imeongeza azure-openai-chat kwa sehemu zote husika
  - Imeongeza idadi ya mifano ya ndani kutoka 3 hadi 4
  - Imeongezwa kwenye Jedwali la Mifano ya Maombi ya AI
  - Imejumuishwa katika Mwanga wa Kuanzia kwa Watumiaji wa Kati
  - Imeongezwa kwenye Sehemu za Templates za Microsoft Foundry
  - Imeboresha Jedwali la Ulinganisho na sehemu za ugunduzi wa teknolojia
- **Ubora wa Nyaraka**: Imeboreshwa kutoka B+ (87%) → A- (92%) kwenye folda ya docs:
  - Imeongeza matokeo yanayotarajiwa kwa amri muhimu za mfano
  - Imejumuisha hatua za uthibitisho kwa mabadiliko ya usanidi
  - Imeboresha kujifunza kwa vitendo na mazoezi ya vitendo

#### Imebadilishwa
- **Mfululizo wa Kujifunza**: Uunganisho bora wa mifano ya AI kwa wanaojifunza wa kiwango cha kati
- **Muundo wa Nyaraka**: Mazoezi ya hatua na matokeo wazi
- **Mchakato wa Uthibitisho**: Vigezo vya mafanikio wazi vimeongezwa kwa kazi muhimu

#### Imeboreshwa
- **Uzoefu wa Mwanaendelezaji**: Utoaji wa Microsoft Foundry Models sasa huchukua dakika 35-45 (ikilinganishwa na 60-90 kwa mbadala ngumu)
- **Uwazi wa Gharama**: Makadirio ya gharama wazi ($50-200/month) kwa mfano wa Microsoft Foundry Models
- **Njia ya Kujifunza**: Watoaji wa maendeleo ya AI wana njia wazi ya kuanza na azure-openai-chat
- **Viwango vya Nyaraka**: Matokeo yanayotarajiwa na hatua za uthibitisho zimehifadhiwa

#### Imethibitishwa
- ✅ Mfano wa Microsoft Foundry Models unafanya kazi kikamilifu na `azd up`
- ✅ Faili zote 11 za utekelezaji zina sintaksia sahihi
- ✅ Maelekezo ya README yanaendana na uzoefu halisi wa utoaji
- ✅ Viungo vya nyaraka vimesasishwa katika maeneo 8+
- ✅ Orodha ya mifano inaonyesha kwa usahihi mifano 4 ya ndani
- ✅ Hakuna viungo vya nje vinavyorudiwa katika meza
- ✅ Marejeo ya urambazaji yote ni sahihi

#### Utekelezaji wa Kifundi
- **Miundo ya Microsoft Foundry Models**: gpt-4.1 + Key Vault + muundo wa Container Apps
- **Usalama**: Managed Identity imetayarishwa, siri ziko Key Vault
- **Ufuatiliaji**: Ujumuishaji wa Application Insights
- **Usimamizi wa Gharama**: Ufuatiliaji wa token na mbinu za uboreshaji
- **Utoaji**: Amri moja `azd up` kwa usanidi kamili

### [v3.6.0] - 2025-11-19

#### Sasisho Kuu: Mifano ya Utoaji wa Container App
**Toleo hili linaanzisha mifano kamili, inayofaa kwa uzalishaji, ya utoaji wa maombi yaliyopakiwa kwa container kwa kutumia Azure Developer CLI (AZD), pamoja na nyaraka kamili na ujumuishaji katika njia ya kujifunza.**

#### Imeongezwa
- **🚀 Mifano ya Container App**: Mifano mpya ya ndani katika `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Muhtasari kamili wa utoaji wa containerized, kuanza haraka, uzalishaji, na mifumo ya juu
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API ya REST rafiki kwa wanaoanza yenye scale-to-zero, health probes, ufuatiliaji, na utatuzi wa matatizo
  - [Microservices Architecture](../../examples/container-app/microservices): Utoaji wa kiwango cha uzalishaji kwa huduma nyingi (API Gateway, Product, Order, User, Notification), ujumbe wa asynchronouS, Service Bus, Cosmos DB, Azure SQL, tracing iliyosambazwa, blue-green/canary deployment
- **Makorofi Bora**: Usalama, ufuatiliaji, uboreshaji wa gharama, na miongozo ya CI/CD kwa mizigo ya container
- **Mifano ya Msimbo**: `azure.yaml` kamili, templates za Bicep, na utekelezaji wa huduma kwa lugha mbalimbali (Python, Node.js, C#, Go)
- **Upimaji & Utatuzi wa Matatizo**: Matukio ya mtihani kutoka mwanzo hadi mwisho, amri za ufuatiliaji, mwongozo wa utatuzi wa matatizo

#### Imebadilishwa
- **README.md**: Imesasishwa ili kuonyesha na kuunganisha mifano mipya ya programu za kontena chini ya "Local Examples - Container Applications"
- **examples/README.md**: Imesasishwa ili kusisitiza mifano ya programu za kontena, kuongeza vifungu kwenye matriki ya kulinganisha, na kusasisha marejeleo ya teknolojia/miundo
- **Course Outline & Study Guide**: Imesasishwa ili kurejelea mifano mipya ya programu za kontena na mifumo ya uenezaji katika sura zinazohusiana

#### Imehakikiwa
- ✅ Mifano yote mipya inaweza kuendeshwa na `azd up` na inafuata mbinu bora
- ✅ Mambo ya nyaraka yaliounganishwa na urambazaji yamesasishwa
- ✅ Mifano inashughulikia hali za kuanzia hadi za juu, pamoja na microservices za uzalishaji

#### Vidokezo
- **Upana**: Nyaraka na mifano kwa Kiingereza pekee
- **Hatua Inayofuata**: Kuongeza mifumo ya juu zaidi ya kontena na otomatiki ya CI/CD katika toleo zijazo

### [v3.5.0] - 2025-11-19

#### Kubadilisha Jina la Bidhaa: Microsoft Foundry
**Toleo hili linafanya mabadiliko kamili ya jina la bidhaa kutoka "Microsoft Foundry" hadi "Microsoft Foundry" katika nyaraka zote za Kiingereza, ikitoa tafsiri ya rafiki ya urekebishaji rasmi wa Microsoft.**

#### Imebadilishwa
- **🔄 Sasisho la Jina la Bidhaa**: Urekebishaji kamili kutoka "Microsoft Foundry" hadi "Microsoft Foundry"
  - Marejeleo yote yamesasishwa katika nyaraka za Kiingereza kwenye folda `docs/`
  - Folda iliyobadilishwa jina: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Faili iliyobadilishwa jina: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumla: Marejeleo 23 ya maudhui yamesasishwa katika faili 7 za nyaraka

- **📁 Mabadiliko ya Muundo wa Folda**:
  - `docs/ai-foundry/` ilibadilishwa jina kuwa `docs/microsoft-foundry/`
  - Marejeleo yote ya kuvuka yamesasishwa ili kuonyesha muundo mpya wa folda
  - Viungo vya urambazaji vimehakikiwa katika nyaraka zote

- **📄 Mbadiliko ya Majina ya Faili**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Viungo vya ndani vyote vimesasishwa kurejelea jina jipya la faili

#### Faili Zilisaruhishwa
- **Nyaraka za Sura** (mafayela 7):
  - `docs/microsoft-foundry/ai-model-deployment.md` - mabadiliko 3 ya viungo vya urambazaji
  - `docs/microsoft-foundry/ai-workshop-lab.md` - marejeleo 4 ya jina la bidhaa yamesasishwa
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Tayari inatumia Microsoft Foundry (kutokana na masasisho yaliyopita)
  - `docs/microsoft-foundry/production-ai-practices.md` - marejeleo 3 yamesasishwa (muhtasari, maoni ya jamii, nyaraka)
  - `docs/getting-started/azd-basics.md` - viungo vya kuvuka 4 vimesasishwa
  - `docs/getting-started/first-project.md` - viungo 2 vya urambazaji wa sura vimesasishwa
  - `docs/getting-started/installation.md` - viungo 2 vya sura inayofuata vimesasishwa
  - `docs/troubleshooting/ai-troubleshooting.md` - marejeleo 3 yamesasishwa (urambazaji, jamii ya Discord)
  - `docs/troubleshooting/common-issues.md` - kiungo 1 cha urambazaji kimesasishwa
  - `docs/troubleshooting/debugging.md` - kiungo 1 cha urambazaji kimesasishwa

- **Faili za Muundo wa Kozi** (mafayela 2):
  - `README.md` - marejeleo 17 yamesasishwa (muhtasari wa kozi, vichwa vya sura, sehemu ya mifano, maarifa ya jamii)
  - `course-outline.md` - marejeleo 14 yamesasishwa (muhtasari, malengo ya kujifunza, rasilimali za sura)

#### Imehakikiwa
- ✅ Hakuna marejeleo ya folda "ai-foundry" yaliyobaki katika nyaraka za Kiingereza
- ✅ Hakuna marejeleo ya jina la bidhaa "Microsoft Foundry" yaliyobaki katika nyaraka za Kiingereza
- ✅ Viungo vyote vya urambazaji vinavyofanya kazi na muundo mpya wa folda
- ✅ Majina ya faili na folda yamebadilishwa kwa mafanikio
- ✅ Marejeo ya ndani kati ya sura yamehakikiwa

#### Vidokezo
- **Upana**: Mabadiliko yamewekwa tu kwa nyaraka za Kiingereza katika folda `docs/`
- **Tafsiri**: Folda za tafsiri (`translations/`) hazijasasishwa katika toleo hili
- **Warsha**: Vifaa vya warsha (`workshop/`) havijasasishwa katika toleo hili
- **Mifano**: Faili za mfano zinaweza bado kurejelea majina ya zamani (itatatuliwa katika sasisho lijalo)
- **Viungo vya Nje**: URL za nje na marejeleo ya GitHub yabaki bila kubadilishwa

#### Mwongozo wa Uhamishaji kwa Wachangiaji
Ikiwa una matawi ya ndani au nyaraka zinarejelea muundo wa zamani:
1. Sasisha marejeleo ya folda: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Sasisha marejeleo ya faili: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Badilisha jina la bidhaa: "Microsoft Foundry" → "Microsoft Foundry"
4. Thibitisha kwamba viungo vya ndani vya nyaraka vinaendelea kufanya kazi

---

### [v3.4.0] - 2025-10-24

#### Uboreshaji wa Muhtasari na Uthibitishaji wa Miundombinu
**Toleo hili linaanzisha msaada kamili kwa kipengele kipya cha awali cha Azure Developer CLI na kuboresha uzoefu wa mtumiaji wa warsha.**

#### Imeongezwa
- **🧪 Nyaraka za kipengele azd provision --preview**: Ufahamu wa kina wa uwezo mpya wa muhtasari wa miundombinu
  - Marejeleo ya amri na mifano ya matumizi katika karatasi ya wembe
  - Ushirikishaji wa kina katika mwongozo wa uenezaji na matumizi na faida zake
  - Ushirikiano wa ukaguzi wa kabla ya ndege kwa uthibitishaji salama wa uenezaji
  - Sasisho za mwongozo wa kuanza zikiweka mbinu za usalama kwanza kwa uenezaji
- **🚧 Bendera ya Hali ya Warsha**: Bendera ya HTML ya kitaalamu ikionyesha hali ya maendeleo ya warsha
  - Muundo wa gradiendi na viashirio vya ujenzi kwa mawasiliano wazi kwa watumiaji
  - Muhuri wa wakati wa sasisho la mwisho kwa uwazi
  - Muundo unaofaa kwa vifaa vya rununu

#### Imeboreshwa
- **Usalama wa Miundombinu**: Uwezo wa muhtasari umeingizwa kote katika nyaraka za uenezaji
- **Uthibitishaji Kabla ya Uenezaji**: Skripti za kiotomatiki sasa zinajumuisha upimaji wa muhtasari wa miundombinu
- **Mtiririko wa Kazi wa Mwandishi**: Mfuatano wa amri umesasishwa kujumuisha muhtasari kama mbinu bora
- **Uzoefu wa Warsha**: Matarajio ya wazi kwa watumiaji kuhusu hali ya maendeleo ya maudhui

#### Imebadilishwa
- **Mbinu Bora za Uenezaji**: Mtiririko unaotumika muhtasari kwanza sasa unashauriwa
- **Mtiririko wa Nyaraka**: Uthibitishaji wa miundombinu umehamishwa mapema katika mchakato wa kujifunza
- **Uwasilishaji wa Warsha**: Mawasilisho ya hali ya kitaalamu kwa ratiba ya maendeleo wazi

#### Imeboreshwa
- **Mbinu ya Usalama-Kwanza**: Mabadiliko ya miundombinu sasa yanaweza kuthibitishwa kabla ya uenezaji
- **Ushirikiano wa Timu**: Matokeo ya muhtasari yanaweza kushirikiwa kwa mapitio na idhini
- **Uelewa wa Gharama**: Uelewa bora wa gharama za rasilimali kabla ya kuweka
- **Kupunguza Hatari**: Kupungua kwa kushindwa kwa uenezaji kupitia uthibitishaji wa awali

#### Utekelezaji wa Kiufundi
- **Ushirikiano wa Nyaraka Nyingi**: Kipengele cha muhtasari kimeandikwa katika mafaili 4 muhimu
- **Mifumo ya Amri**: Sintaksia thabiti na mifano kote katika nyaraka
- **Uingizaji wa Mbinu Bora**: Muhtasari umejumuishwa katika mtiririko wa uthibitishaji na skripti
- **Vionyeshi vya Kuonekana**: Alama mpya za kipengele kwa urahisi wa kugundua

#### Miundombinu ya Warsha
- **Mawasilisho ya Hali**: Bendera ya kitaalamu ya HTML yenye mtindo wa gradiendi
- **Uzoefu wa Mtumiaji**: Hali ya maendeleo wazi inazuia mkanganyiko
- **Uwasilishaji wa Kitaalamu**: Hufanya repo ionekane ya kitaalamu huku ikianzisha matarajio
- **Uwajibikaji wa Ratiba**: Muhuri wa sasisho la mwisho Oktoba 2025 kwa uwajibikaji

### [v3.3.0] - 2025-09-24

#### Vifaa vya Warsha Vilivyoboreshwa na Uzoefu wa Kujifunza wa Kimihimili
**Toleo hili linaanzisha vifaa vya kina vya warsha wenye mwongozo mwingiliano kupitia kivinjari na njia za kujifunza zilizounganishwa.**

#### Imeongezwa
- **🎥 Mwongozo wa Warsha wa Mwingiliano**: Uzoefu wa warsha unaotumika kupitia kivinjari na uwezo wa onyesho wa MkDocs
- **📝 Maelekezo ya Warsha Yaliyopangwa**: Njia ya kujifunza yenye hatua 7 kutoka ugunduzi hadi urekebishaji
  - 0-Introduction: Muhtasari wa warsha na usanidi
  - 1-Select-AI-Template: Ugunduzi na mchakato wa kuchagua templeti
  - 2-Validate-AI-Template: Taratibu za uenezaji na uthibitishaji
  - 3-Deconstruct-AI-Template: Kuelewa usanifu wa templeti
  - 4-Configure-AI-Template: Usanidi na urekebishaji
  - 5-Customize-AI-Template: Marekebisho ya juu na mizunguko
  - 6-Teardown-Infrastructure: Usafishaji na usimamizi wa rasilimali
  - 7-Wrap-up: Muhtasari na hatua zinazofuata
- **🛠️ Vifaa vya Warsha**: Mwonekano wa MkDocs ulio na mada ya Material kwa uzoefu wa kujifunza ulioboreshwa
- **🎯 Njia ya Kujifunza kwa Mikono**: Mbinu ya hatua 3 (Ugunduzi → Uenezaji → Urekebishaji)
- **📱 Ushirikiano wa GitHub Codespaces**: Usaidizi wa mazingira ya maendeleo bila mshono

#### Imeboreshwa
- **Maabara ya Warsha ya AI**: Imeongezwa kwa uzoefu uliopangwa wa saa 2-3
- **Nyaraka za Warsha**: Uwasilishaji wa kitaalamu wenye urambazaji na msaada wa kuona
- **Mhimili wa Kujifunza**: Mwongozo wazi hatua kwa hatua kutoka uteuzi wa templeti hadi uenezaji wa uzalishaji
- **Uzoefu wa Mwandishi**: Vifaa vimeunganishwa kwa mtiririko wa kazi uliorahisishwa

#### Imeboreshwa
- **Ufikiaji**: Kiolesura cha kivinjari chenye utafutaji, kazi ya kunakili, na kubadili mandhari
- **Kujifunza kwa Kasi Yako**: Muundo wa warsha unaoringa viwango tofauti vya kujifunza
- **Matumizi ya Kivitendo**: Mifano halisi ya uenezaji wa templeti za AI
- **Ushirikiano wa Jamii**: Ushirikiano wa Discord kwa msaada wa warsha na ushirikiano

#### Vipengele vya Warsha
- **Utafutaji Umejengwa Ndani**: Ugunduzi wa haraka wa maneno muhimu na masomo
- **Nakili Vizuizi vya Msimbo**: Kazi ya hover-to-copy kwa mifano yote ya msimbo
- **Kubadili Mandhari**: Msaada wa hali nyeusi/mwenye mwanga kwa mapendeleo tofauti
- **Rasilimali za Maono**: Picha za skrini na michoro kwa uelewa ulioboreshwa
- **Uunganisho wa Msaada**: Ufikiaji wa moja kwa moja wa Discord kwa msaada wa jamii

### [v3.2.0] - 2025-09-17

#### Urekebishaji Mkubwa wa Urambazaji na Mfumo wa Kujifunza Kulingana na Surau
**Toleo hili linaanzisha muundo kamili wa kujifunza kwa sura zenye urambazaji ulioboreshwa kote kwenye repo.**

#### Imeongezwa
- **📚 Mfumo wa Kujifunza kwa Sura**: Nyeleo la kozi limepangwa tena kuwa sura 8 zenye maendeleo
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Mfumo Kamili wa Urambazaji**: Vichwa vya urambazaji na miguu vya kuendelea kimewekwa kwa nyaraka zote
- **🎯 Ufuatiliaji wa Maendeleo**: Orodha ya ukamilishaji wa kozi na mfumo wa uthibitishaji wa kujifunza
- **🗺️ Mwongozo wa Njia ya Kujifunza**: Viingo wazi kwa viwango tofauti vya uzoefu na malengo
- **🔗 Urambazaji wa Marejeleo**: Sura zinazohusiana na mahitaji wazi zimeunganishwa vizuri

#### Imeboreshwa
- **Muundo wa README**: Umebadilika kuwa jukwaa la kujifunza lenye muundo wa sura
- **Urambazaji wa Nyaraka**: Kila ukurasa sasa unajumuisha muktadha wa sura na mwongozo wa maendeleo
- **Mpangilio wa Templeti**: Mifano na templeti zimepangwa kwa sura zinazofaa za kujifunza
- **Ushirikishaji wa Rasilimali**: Karatasi za wembe, Maswali Yanayoulizwa Mara kwa Mara, na mwongozo wa masomo vimeunganishwa na sura zinazofaa
- **Ushirikiano wa Warsha**: Maabara ya vitendo zimepangwa kwa malengo ya kujifunza ya sura mbalimbali

#### Imebadilishwa
- **Msimamo wa Kujifunza**: Kutoka kwenye nyaraka za mstari hadi mfumo unaoruhusu sura mbalimbali za kujifunza
- **Mahali pa Usanidi**: Mwongozo wa usanidi umehamishwa kuwa Sura ya 3 kwa mtiririko bora wa kujifunza
- **Uingizaji wa Maudhui ya AI**: Maudhui maalumu ya AI yamejumuishwa vizuri katika safari ya kujifunza
- **Maudhui ya Uzalishaji**: Mifumo ya juu imejumuishwa katika Sura ya 8 kwa wanafunzi wa shirika

#### Imeboreshwa
- **Uzoefu wa Mtumiaji**: Viungo vidogo vya urambazaji na viashirio vya maendeleo vya sura
- **Ufikiaji**: Mifumo ya urambazaji iliyofanana kwa urahisi wa kusafiri kozi
- **Uwasilishaji wa Kitaalamu**: Muundo wa kozi unaofanana na chuo kikuu unaofaa kwa mafunzo ya kitaaluma na ya kampuni
- **Ufanisi wa Kujifunza**: Kupunguza muda wa kutafuta maudhui muhimu kupitia mpangilio ulioboreshwa

#### Utekelezaji wa Kiufundi
- **Vichwa vya Urambazaji**: Urambazaji wa sura umewekwa kwa mafaili 40+ ya nyaraka
- **Miguu ya Urambazaji**: Mwongozo wa maendeleo wa sura na viashirio vya kukamilisha
- **Ururumo wa Marejeleo**: Mfumo kamili wa viungo vya ndani unaounganisha dhana zinazohusiana
- **Ramani ya Sura**: Templeti na mifano imeambatanishwa kwa malengo ya kujifunza

#### Uboreshaji wa Mwongozo wa Masomo
- **📚 Malengo Kamili ya Kujifunza**: Mwongozo wa masomo umepangwa tena ili kuendana na mfumo wa sura 8
- **🎯 Tathmini Kulingana na Sura**: Kila sura inajumuisha malengo maalum ya kujifunza na mazoezi ya vitendo
- **📋 Ufuatiliaji wa Maendeleo**: Ratiba ya kujifunza ya wiki kwa wiki yenye matokeo yanayoweza kupimwa na orodha za kukamilisha
- **❓ Maswali ya Tathmini**: Maswali ya uthibitishaji wa maarifa kwa kila sura kwa matokeo ya kitaaluma
- **🛠️ Mazoezi ya Vitendo**: Shughuli za vitendo zenye hali halisi za uenezaji na utatuzi matatizo
- **📊 Ukuaji wa Ujuzi**: Hatua za wazi kutoka dhana za msingi hadi mifumo ya shirika yenye mwelekeo wa maendeleo ya kazi
- **🎓 Mfumo wa Cheti**: Matokeo ya maendeleo ya kitaaluma na utambuzi wa jamii
- **⏱️ Usimamizi wa Ratiba**: Mpango wa kujifunza wa wiki 10 uliopangwa na uthibitishaji wa milestone

### [v3.1.0] - 2025-09-17

#### Suluhisho za AI za Wakala Wengi Zilizoimarishwa
**Toleo hili linaboresha suluhisho la rejareja la mawakala wengi kwa utoaji bora wa majina ya mawakala na nyaraka zilizoimarishwa.**

#### Imebadilishwa
- **Tamko la Multi-Agent**: Iliwekwa badala ya "Cora agent" na "Customer agent" katika suluhisho la rejareja la mawakala wengi kwa uelewa wazi
- **Usanifu wa Wakala**: Nyaraka zote, templeti za ARM, na mifano ya msimbo zimesasishwa kutumia jina linalofanana "Customer agent"
- **Mifano ya Usanidi**: Mifumo ya usanidi ya mawakala imeboreshwa kwa mbinu za kieleweka zinazotumia majina mapya
- **Ulinganifu wa Nyaraka**: Imehakikisha marejeleo yote yanatumia majina ya mawakala yaliyoeleweka kitaalamu

#### Imeboreshwa
- **ARM Template Package**: Imesasishwa retail-multiagent-arm-template na marejeo ya wakala wa Customer
- **Architecture Diagrams**: Michoro ya Mermaid imesasishwa na majina ya wakala yaliyosasishwa
- **Code Examples**: Darasa za Python na mifano ya utekelezaji sasa zinatumia CustomerAgent naming
- **Environment Variables**: Imebadilishwa scripts zote za uenezaji kutumia CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Uzoefu wa Mtaalamu wa Maendeleo: majukumu na wajibu wa wakala yamefafanuliwa vizuri katika nyaraka
- **Production Readiness**: Utayari wa Uzalishaji: Muafaka bora na miongozo ya majina ya kampuni
- **Learning Materials**: Vifaa vya Kujifunza: Majina ya wakala yaliyorahisishwa kwa madhumuni ya elimu
- **Template Usability**: Urahisi wa Matumizi wa Violezo: Uelewa rahisi wa kazi za wakala na mifumo ya uenezaji

#### Technical Details
- Michoro za usanifu za Mermaid zimesasishwa na marejeo ya CustomerAgent
- Majina ya madarasa ya CoraAgent yamebadilishwa kuwa CustomerAgent katika mifano ya Python
- Mfumo wa ARM template JSON umebadilishwa kutumia "customer" agent type
- Mabadiliko ya environment variables kutoka CORA_AGENT_* hadi CUSTOMER_AGENT_* patterns
- Amri zote za uenezaji na mipangilio ya kontena zimesasishwa

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Muundo kamili ukiwa na kipaumbele kwa waendelezaji na wahandisi wa AI
- **Microsoft Foundry Integration Guide**: Nyaraka kamili za kuunganisha AZD na huduma za Microsoft Foundry
- **AI Model Deployment Patterns**: Mwongozo wa kina unaofunika uchaguzi wa modeli, usanidi, na mikakati ya uenezaji wa uzalishaji
- **AI Workshop Lab**: Warsha ya vitendo ya masaa 2-3 kwa kubadilisha programu za AI kuwa suluhisho zinazoweza kutumwa kwa AZD
- **Production AI Best Practices**: Mifumo ya kuandaa uzalishaji yenye utayari wa kampuni kwa ajili ya kupanua, kufuatilia, na kusafirisha kazi za AI kwa usalama
- **AI-Specific Troubleshooting Guide**: Mwongozo kamili wa kutatua matatizo kwa Microsoft Foundry Models, Cognitive Services, na masuala ya uenezaji wa AI
- **AI Template Gallery**: Mkusanyiko ulioratibiwa wa templates za Microsoft Foundry zenye viwango vya ugumu
- **Workshop Materials**: Muundo kamili wa warsha zenye maabara za vitendo na nyenzo za rejea

#### Enhanced
- **README Structure**: Iliyolengwa kwa waendelezaji wa AI na takwimu za maslahi ya jamii 45% kutoka Microsoft Foundry Discord
- **Learning Paths**: Safari maalumu ya mtaalamu wa AI kando na njia za jadi kwa wanafunzi na wahandisi wa DevOps
- **Template Recommendations**: Violezo vilivyochaguliwa vya AI vinavyojumuisha azure-search-openai-demo, contoso-chat, na openai-chat-app-quickstart
- **Community Integration**: Usaidizi ulioimarishwa wa jamii kwenye Discord ukiwa na chaneli na majadiliano maalumu kwa AI

#### Security & Production Focus
- **Managed Identity Patterns**: Usanidi wa uthibitishaji na usalama maalumu kwa AI
- **Cost Optimization**: Ufuatiliaji wa matumizi ya token na udhibiti wa bajeti kwa mizigo ya AI
- **Multi-Region Deployment**: Mikakati ya uenezaji wa programu za AI kimataifa
- **Performance Monitoring**: Metriki maalumu za AI na uunganisho wa Application Insights

#### Documentation Quality
- **Linear Course Structure**: Mpangilio wa mantiki kutoka kiwango cha mwanzo hadi mbinu za juu za uenezaji wa AI
- **Validated URLs**: Viungo vyote vya nje vimehakikiwa na vinapatikana
- **Complete Reference**: Viungo vyote vya ndani vya nyaraka vimehakikiwa na vinafanya kazi
- **Production Ready**: Mifumo ya uenezaji ya kampuni yenye mifano ya dunia halisi

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: Kurasa zote za nyaraka sasa zina sehemu za Utangulizi, Malengo ya Kujifunza, na Matokeo ya Kujifunza
- **Navigation System**: Imeongezwa viungo vya Previous/Next katika masomo yote kwa mwongozo wa maendeleo ya kujifunza
- **Study Guide**: study-guide.md kamili yenye malengo ya kujifunza, mazoezi ya vitendo, na vifaa vya tathmini
- **Professional Presentation**: Imeondolewa emojis zote kwa ajili ya kuboresha upatikanaji na muonekano wa kitaalamu
- **Enhanced Content Structure**: Muundo na mtiririko wa nyenzo za kujifunza umeboreshwa

#### Changed
- **Documentation Format**: Nyaraka zote zimepangwa kwa muundo unaolenga kujifunza kwa uthabiti
- **Navigation Flow**: Mtiririko wa kuvinjari umefanywa kuwa wa mantiki kwa nyenzo zote za kujifunza
- **Content Presentation**: Vitu vya mapambo vimeondolewa kwa ajili ya muundo wazi, wa kitaalamu
- **Link Structure**: Viungo vya ndani vimesasishwa kuunga mkono mfumo mpya wa urambazaji

#### Improved
- **Accessibility**: Urahisi wa upatikanaji umeboreshwa kwa kuondoa utegemezi wa emoji kwa ajili ya leseni za sauti
- **Professional Appearance**: Muonekano safi wa kitaaluma unaofaa kwa mafunzo ya kampuni
- **Learning Experience**: Njia iliyopangwa yenye malengo na matokeo wazi kwa kila somo
- **Content Organization**: Mtiririko bora wa mantiki na muunganiko kati ya mada zinazohusiana

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Mfululizo kamili wa mwongozo wa kuanza
  - Nyaraka kamili za uenezaji na upangaaji wa miundombinu
  - Rasilimali za kutatua matatizo na mwongozo wa uundaji hitilafu
  - Vifaa na taratibu za ukaguzi kabla ya uenezaji

- **Getting Started Module**
  - AZD Basics: Dhana za msingi na istilahi
  - Installation Guide: Maelekezo ya usanidi kwa majukwaa maalumu
  - Configuration Guide: Uundaji wa mazingira na uthibitishaji
  - First Project Tutorial: Mafunzo ya hatua kwa hatua ya vitendo

- **Deployment and Provisioning Module**
  - Deployment Guide: Nyaraka kamili za mtiririko wa kazi
  - Provisioning Guide: Miundombinu kama Kanuni kwa Bicep
  - Mazoezi bora kwa uenezaji wa uzalishaji
  - Mifano ya usanifu wa huduma nyingi

- **Pre-deployment Validation Module**
  - Capacity Planning: Uthibitishaji wa upatikanaji wa rasilimali za Azure
  - SKU Selection: Mwongozo kamili wa ngazi za huduma
  - Pre-flight Checks: Skripti za uhakiki wa moja kwa moja (PowerShell na Bash)
  - Zana za makadirio ya gharama na upangaji wa bajeti

- **Troubleshooting Module**
  - Common Issues: Masuala yanayokumbwa mara kwa mara na suluhisho
  - Debugging Guide: Mbinu za kimfumo za kutatua matatizo
  - Mbinu za uchunguzi wa hali ya juu na zana
  - Ufuatiliaji wa utendaji na uboreshaji

- **Resources and References**
  - Command Cheat Sheet: Marejeo ya haraka kwa amri muhimu
  - Glossary: Kamusi kamili ya istilahi na kifupi
  - FAQ: Majibu ya kina kwa maswali ya kawaida
  - Viungo vya rasilimali za nje na uunganisho wa jamii

- **Examples and Templates**
  - Mfano wa Simple Web Application
  - Kiolezo cha uenezaji wa Tovuti Isiyo na Mabadiliko (Static Website)
  - Usanidi wa Programu za Kontena
  - Mifumo ya kuunganishwa na hifadhidata
  - Mifano ya usanifu wa Microservices
  - Utekelezaji wa kazi za Serverless

#### Features
- **Multi-Platform Support**: Maelekezo ya usakinishaji na usanidi kwa Windows, macOS, na Linux
- **Multiple Skill Levels**: Yaliyoundwa kwa viwango mbalimbali kuanzia wanafunzi hadi waendelezaji wa kitaalamu
- **Practical Focus**: Mifano ya vitendo na matukio ya dunia halisi
- **Comprehensive Coverage**: Kuanzia dhana za msingi hadi mifumo ya juu ya kampuni
- **Security-First Approach**: Mazoezi bora ya usalama yamejumuishwa kila sehemu
- **Cost Optimization**: Mwongozo wa uenezaji wa gharama na usimamizi wa rasilimali

#### Documentation Quality
- **Detailed Code Examples**: Sampuli za msimbo za vitendo, zimetestiwa
- **Step-by-Step Instructions**: Mwongozo wazi na wa utekelezaji
- **Comprehensive Error Handling**: Utaalamu wa kutatua matatizo ya kawaida
- **Best Practices Integration**: Viwango vya tasnia na mapendekezo
- **Version Compatibility**: Imesasishwa kulingana na huduma za hivi karibuni za Azure na sifa za azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Mifumo ya kuunganisha kwa Hugging Face, Azure Machine Learning, na modeli maalumu
- **AI Agent Frameworks**: Violezo kwa uenezaji wa LangChain, Semantic Kernel, na AutoGen
- **Advanced RAG Patterns**: Chaguzi za hifadhidata za vector mbali na Azure AI Search (Pinecone, Weaviate, n.k.)
- **AI Observability**: Ufuatiliaji ulioboreshwa kwa utendaji wa modeli, matumizi ya token, na ubora wa majibu

#### Developer Experience
- **VS Code Extension**: Uzoefu wa maendeleo uliounganishwa wa AZD + Microsoft Foundry
- **GitHub Copilot Integration**: Uundaji wa templates za AZD unaosaidiwa na AI
- **Interactive Tutorials**: Mazoezi ya kuandika msimbo ya vitendo yenye uhakiki wa moja kwa moja kwa matukio ya AI
- **Video Content**: Mafunzo ya video kwa wanafunzi wa kuona yanayojikita kwenye uenezaji wa AI

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Udhibiti wa modeli za AI, ufuataaji wa uwajibikaji, na rekodi za ukaguzi
- **Multi-Tenant AI**: Mifumo ya kuwahudumia wateja wengi kwa huduma za AI zilizo na utengano
- **Edge AI Deployment**: Uunganisho na Azure IoT Edge na matoleo ya kontena
- **Hybrid Cloud AI**: Mifumo ya uenezaji wa AI kwa wingu mseto na mengi

#### Advanced Features
- **AI Pipeline Automation**: Uunganisho wa MLOps na pipelines za Azure Machine Learning
- **Advanced Security**: Mbinu za zero-trust, endpoints za kibinafsi, na ulinzi wa vitisho vya kiwango cha juu
- **Performance Optimization**: Urekebishaji wa juu na mikakati ya upanuaji kwa programu za AI zenye mtiririko mkubwa
- **Global Distribution**: Usambazaji wa yaliyomo na mifumo ya cache ya edge kwa programu za AI

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Uunganisho kamili wa Microsoft Foundry (Imekamilishwa)
- ✅ **Interactive Tutorials**: Maabara ya warsha ya vitendo kwa AI (Imekamilishwa)
- ✅ **Advanced Security Module**: Mifumo ya usalama maalumu kwa AI (Imekamilishwa)
- ✅ **Performance Optimization**: Mikakati ya kurekebisha mizigo ya AI (Imekamilishwa)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Mifano ya uenezaji yenye mwelekeo wa AI (Imekamilishwa)
- ✅ **Extended FAQ**: Maswali maalumu ya AI na kutatua matatizo (Imekamilishwa)
- **Tool Integration**: Mwongozo ulioboreshwa wa uunganishaji wa IDE na mhariri
- ✅ **Monitoring Expansion**: Uboreshaji wa ufuatiliaji na tahadhari maalumu kwa AI (Imekamilishwa)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Muundo unaofaa kwa selulaaru kwa ujifunzaji wa mtandao wa simu
- **Offline Access**: Vifurushi vya nyaraka vinavyoweza kupakuliwa kwa matumizi bila mtandao
- **Enhanced IDE Integration**: Upanuzi wa VS Code kwa AZD + nyimbo za AI
- **Community Dashboard**: Metriki za jamii kwa wakati halisi na ufuatiliaji wa michango

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for improved AI developer learning flow
- **Missing AI Content**: Requests for additional AI templates, patterns, or examples
- **Accessibility**: Improvements for diverse learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Toleo Kuu la Hivi Karibuni**: Msaada kamili na masasisho ya mara kwa mara
- **Toleo Kuu la Zamani**: Masasisho ya usalama na marekebisho muhimu kwa miezi 12
- **Matoleo ya Kale**: Msaada wa jamii tu, hakuna masasisho rasmi

### Mwongozo wa Uhamishaji
Wakati matoleo makuu yanapotolewa, tunatoa:
- **Mwongozo wa Uhamishaji**: Maelekezo ya kuhamia hatua kwa hatua
- **Vidokezo vya Ulinganifu**: Maelezo kuhusu mabadiliko yanayovunja
- **Msaada wa Zana**: Skripti au zana za kusaidia uhamishaji
- **Msaada wa Jamii**: Majukwaa maalum kwa maswali kuhusu uhamishaji

---

**Urambazaji**
- **Somo Lililopita**: [Mwongozo wa Masomo](resources/study-guide.md)
- **Somo Linalofuata**: Rudi kwenye [README Kuu](README.md)

**Endelea Kupata Habari**: Fuata hifadhi hii kupata taarifa kuhusu matoleo mapya na masasisho muhimu kwa nyenzo za kujifunza.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kukataa**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za moja kwa moja zinazofanywa na mashine zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya awali katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu iliyofanywa na binadamu inapendekezwa. Hatubebewi dhamana kwa uelewa mbaya au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->