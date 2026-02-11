# Mabadiliko - AZD For Beginners

## Utangulizi

Mabadiliko haya yanaandika mabadiliko yote muhimu, masasisho, na maboresho kwenye ghala la AZD For Beginners. Tunafuata kanuni za utekelezaji wa matoleo ya semantiki na tunasimamia kumbukumbu hii ili kuwasaidia watumiaji kuelewa kile kilichobadilika kati ya matoleo.

## Malengo ya Kujifunza

Kwa kupitia kumbukumbu ya mabadiliko haya, utaweza:
- Kubaki umefahamishwa kuhusu vipengele vipya na nyongeza za maudhui
- Kuelewa maboresho yaliyofanywa kwenye nyaraka zilizopo
- Kufuatilia utangazaji wa hitilafu na marekebisho ili kuhakikisha usahihi
- Kufuatilia maendeleo ya vifaa vya kujifunzia kwa muda

## Matokeo ya Kujifunza

Baada ya kupitia sehemu za kumbukumbu ya mabadiliko, utaweza:
- Kutambua maudhui na rasilimali mpya za kujifunzia
- Kuelewa ni sehemu zipi zilizosasishwa au kuboreshwa
- Kupanga njia yako ya kujifunzia kulingana na vifaa vya hivi karibuni
- Kutoa maoni na mapendekezo kwa maboresho ya baadaye

## Historia ya Matoleo

### [v3.17.0] - 2026-02-05

#### Kuboresha Urambazaji wa Kozi
**Toleo hili linaboreshwa urambazaji wa sura za README.md kwa muundo wa jedwali ulioboreshwa.**

#### Imebadilishwa
- **Jedwali la Ramani ya Kozi**: Limeboreshwa kwa viungo vya moja kwa moja vya somo, makadirio ya muda, na viwango vya ugumu
- **Usafishaji wa Folda**: Folda za zamani zisizohitajika ziliondolewa (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Uthibitishaji wa Viungo**: Viungo vya ndani 21+ kwenye jedwali la Ramani ya Kozi vimehakikiwa

### [v3.16.0] - 2026-02-05

#### Maboresho ya Majina ya Bidhaa
**Toleo hili linasasisha rejea za bidhaa kwa chapa ya hivi sasa ya Microsoft.**

#### Imebadilishwa
- **Azure AI Foundry → Microsoft Foundry**: Marejeo yote yamesasishwa katika mafaili yasiyo ya tafsiri
- **Azure AI Agent Service → Foundry Agents**: Jina la huduma limesasishwa kuakisi chapa ya sasa

#### Mafaili Yaliyosasishwa
- `README.md` - Sehemu kuu ya kuingia ya kozi
- `changelog.md` - Historia ya matoleo
- `course-outline.md` - Muundo wa kozi
- `docs/chapter-02-ai-development/agents.md` - Mwongozo wa maajenti wa AI
- `examples/README.md` - Nyaraka za mifano
- `workshop/README.md` - Sehemu ya warsha
- `workshop/docs/index.md` - Kielekezi cha warsha
- `workshop/docs/instructions/*.md` - Mafaili yote ya maelekezo ya warsha

---

### [v3.15.0] - 2026-02-05

#### Marekebisho Makubwa ya Hazina: Majina ya Folda Kulingana na Sura
**Toleo hili linasanifu upya nyaraka katika folda maalum za sura kwa urambazaji wazi zaidi.**

#### Majina ya Folda Yaliyobadilishwa
Folda za zamani zimebadilishwa na folda zilizo na nambari za sura:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Uhamisho wa Mafaili
| Faili | From | To |
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
  - Malengo ya kujifunza na muda
  - Jedwali la somo lenye maelezo
  - Amri za kuanza haraka
  - Urambazaji kwenda sura nyingine

#### Imebadilishwa
- **🔗 Imeupdate viungo vyote vya ndani**: Njia 78+ zimesasishwa katika nyaraka zote
- **🗺️ README.md Kuu**: Imesasisha Ramani ya Kozi kwa muundo wa sura mpya
- **📝 examples/README.md**: Imeboresha rejea za kuvuka kwenda folda za sura

#### Imetolewa
- Muundo wa folda wa zamani (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Marekebisho ya Hazina: Urambazaji wa Sura
**Toleo hili liliongeza faili za README za urambazaji wa sura (zilifutwa na v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Mwongozo Mpya wa Maajenti wa AI
**Toleo hili linaongeza mwongozo kamili wa kutekeleza maajenti wa AI kwa kutumia Azure Developer CLI.**

#### Imeongezwa
- **🤖 docs/microsoft-foundry/agents.md**: Mwongozo kamili unaoshughulikia:
  - Nini maajenti ya AI ni na jinsi yanavyotofautiana na chatbots
  - Violezo vitatu vya kuanza haraka vya maajenti (Foundry Agents, Prompty, RAG)
  - Mifumo ya usanifu wa maajenti (maajenti mmoja, RAG, maajenti wengi)
  - Usanidi wa zana na urekebishaji
  - Ufuatiliaji na ufuatiliaji wa metriksi
  - Mambo ya gharama na uboreshaji
  - Masingizio ya kawaida ya utatuzi matatizo
  - Mazoezi matatu ya vitendo pamoja na vigezo vya mafanikio

#### Muundo wa Yaliyomo
- **Utangulizi**: Dhana za maajenti kwa waanzilishi
- **Anza Haraka**: Tekeleza maajenti kwa `azd init --template get-started-with-ai-agents`
- **Mifumo ya Usanifu**: Michoro ya kuona ya mifumo ya maajenti
- **Usanidi**: Usanidi wa zana na vigezo vya mazingira
- **Ufuatiliaji**: Uunganisho wa Application Insights
- **Mazoezi**: Kujifunza kwa vitendo kwa hatua (20-45 dakika kila mojawapo)

---

### [v3.12.0] - 2026-02-05

#### Sasisho la Mazingira ya DevContainer
**Toleo hili linasasisha usanidi wa kontena la maendeleo kwa zana za kisasa na chaguo mbadala bora kwa uzoefu wa kujifunza AZD.**

#### Imebadilishwa
- **🐳 Picha ya Msingi**: Imesasishwa kutoka `python:3.12-bullseye` hadi `python:3.12-bookworm` (Debian thabiti ya hivi karibuni)
- **📛 Jina la Kontena**: Imebadilishwa kutoka "Python 3" hadi "AZD for Beginners" kwa uwazi

#### Imeongezwa
- **🔧 Vipengele Vipya vya Dev Container**:
  - `azure-cli` pamoja na msaada wa Bicep umewezeshwa
  - `node:20` (toleo la LTS kwa templet za AZD)
  - `github-cli` kwa usimamizi wa templet
  - `docker-in-docker` kwa utekelezaji wa container app

- **🔌 Upelekaji Bandari**: Bandari zilizowekwa tayari kwa maendeleo yanayotumika mara kwa mara:
  - 8000 (Mtazamo wa MkDocs)
  - 3000 (Tovuti za wavuti)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Extensions Mpya za VS Code**:
  - `ms-python.vscode-pylance` - Enhanced Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep language support
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown editing
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram support
  - `redhat.vscode-yaml` - YAML support (for azure.yaml)
  - `eamodio.gitlens` - Git visualization
  - `mhutchie.git-graph` - Git history

- **⚙️ Mipangilio ya VS Code**: Imeongeza mipangilio ya msingi kwa interpreter ya Python, kuunda umbizo wakati wa kuhifadhi, na kukata nafasi zisizohitajika

- **📦 requirements-dev.txt Imeboreshwa**:
  - Imeongeza kiendelezi cha MkDocs minify
  - Imeongeza pre-commit kwa ubora wa msimbo
  - Imeongeza vifurushi vya Azure SDK (azure-identity, azure-mgmt-resource)

#### Imerekebishwa
- **Amri ya Baada ya-Kuunda**: Sasa inathibitisha usakinishaji wa AZD na Azure CLI wakati wa kuanzisha kontena

---

### [v3.11.0] - 2026-02-05

#### Urekebishaji wa README Rafiki kwa Waanzilishi
**Toleo hili linaboresha sana README.md ili liwe rahisi kwa waanzilishi na linaongeza rasilimali muhimu kwa waendelezaji wa AI.**

#### Imeongezwa
- **🆚 Mlinganisho wa Azure CLI vs AZD**: Ufafanuzi wazi wa lini kutumia kila zana na mifano ya vitendo
- **🌟 Viungo Bora vya AZD**: Viungo vya moja kwa moja kwenye maktaba ya templet za jamii na rasilimali za michango:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Mwongozo wa Kuanzia Haraka**: Sehemu iliyo rahisishwa ya hatua 3 za kuanza (Sakinisha → Ingia → Tekeleza)
- **📊 Jedwali la Urambazaji la Kulingana na Uzoefu**: Mwongozo wazi wa wapi pa kuanza kulingana na uzoefu wa msanidi programu

#### Imebadilishwa
- **Muundo wa README**: Umepangwa upya kwa ufichaji wa hatua kwa hatua - taarifa muhimu kwanza
- **Sehemu ya Utangulizi**: Imaandikwa upya kuelezea "The Magic of `azd up`" kwa waanzilishi wa kabisa
- **Yaliyofanana Yaliyofutwa**: Imeondoa sehemu ya utatuzi ya picha zilizorudiwa
- **Amri za Utatuzi**: Imerekebisha rejea ya `azd logs` kutumia `azd monitor --logs` sahihi

#### Imerekebishwa
- **🔐 Amri za Uthibitisho**: Imeongeza `azd auth login` na `azd auth logout` kwenye cheat-sheet.md
- **Rejea za Amri Zisizo Halali**: Imeondoa `azd logs` iliyobaki kutoka kwenye sehemu ya utatuzi ya README

#### Vidokezo
- **Uwanja**: Mabadiliko yamewekwa kwenye README.md kuu na resources/cheat-sheet.md
- **Watazamaji Waliolengwa**: Maboresho yanalenga hasa waendelezaji wapya kwa AZD

---

### [v3.10.0] - 2026-02-05

#### Sasisho la Usahihi wa Amri za Azure Developer CLI
**Toleo hili linasahihisha amri za AZD zisizokuwepo katika nyaraka zote, kuhakikisha mifano yote ya msimbo inatumia sintaksia halali ya Azure Developer CLI.**

#### Imerekebishwa
- **🔧 Amri za AZD Zisizokuwepo Zilitolewa**: Ukaguzi kamili na marekebisho ya amri batili:
  - `azd logs` (haitokani) → imebadilishwa na `azd monitor --logs` au mbadala za Azure CLI
  - amri ndogo za `azd service` (hazipo) → zimebadilishwa na `azd show` na Azure CLI
  - `azd infra import/export/validate` (hazipo) → zimetolewa au kubadilishwa na mbadala halali
  - vigezo `azd deploy --rollback/--incremental/--parallel/--detect-changes` (hazipo) → zilitolewa
  - vigezo `azd provision --what-if/--rollback` (hazipo) → imesasishwa kutumia `--preview`
  - `azd config validate` (haitokani) → imebadilishwa na `azd config list`
  - `azd info`, `azd history`, `azd metrics` (hazipo) → zilitolewa

- **📚 Mafaili Yaliyosasishwa kwa Marekebisho ya Amri**:
  - `resources/cheat-sheet.md`: Marekebisho makubwa ya rejea ya amri
  - `docs/deployment/deployment-guide.md`: Imeweka sawa mikakati ya rollback na utekelezaji
  - `docs/troubleshooting/debugging.md`: Imeboresha sehemu za uchambuzi wa logi
  - `docs/troubleshooting/common-issues.md`: Imeendeleza amri za utatuzi
  - `docs/troubleshooting/ai-troubleshooting.md`: Imeweka sawa sehemu ya utambuzi wa AZD
  - `docs/getting-started/azd-basics.md`: Imeweka sawa amri za ufuatiliaji
  - `docs/getting-started/first-project.md`: Imeboresha mifano ya ufuatiliaji na utambuzi
  - `docs/getting-started/installation.md`: Imeweka sawa mfano wa msaada na toleo
  - `docs/pre-deployment/application-insights.md`: Imeweka sawa amri za kutazama logi
  - `docs/pre-deployment/coordination-patterns.md`: Imeweka sawa amri za utambuzi wa maajenti

- **📝 Marejeo ya Toleo Yamesasishwa**:
  - `docs/getting-started/installation.md`: Imekuwa ikielekeza toleo la jumla `1.x.x` badala ya `1.5.0` iliyowekwa kwa nguvu na kiungo kwa releases

#### Imebadilishwa
- **Mikakati ya Rollback**: Nyaraka zimesasishwa kutumia rollback zilizotegemea Git (AZD haina rollback ya asili)
- **Kutaazama Logi**: Rejea za `azd logs` zlibadilishwa na `azd monitor --logs`, `azd monitor --live`, na amri za Azure CLI
- **Sehemu ya Utendaji**: Imeondoa vigezo vya utekelezaji vya parallel/incremental ambavyo havipo, na kutoa mbadala halali

#### Maelezo ya Kiufundi
- **Amri Halali za AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Bendera Halali za azd monitor**: `--live`, `--logs`, `--overview`
- **Vipengele Vilivyotolewa**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Uthibitisho**: Amri zilithibitishwa dhidi ya Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ukamilishaji wa Warsha na Sasisho la Ubora wa Nyaraka
**Toleo hili linakamilisha moduli za warsha za mwingiliano, linarekebisha viungo vyote vilivyovunjika vya nyaraka, na linaboresha ubora wa maudhui kwa waendelezaji wa AI wanaotumia Microsoft AZD.**

#### Added
- **📝 CONTRIBUTING.md**: Nyaraka mpya za miongozo ya michango zenye:
  - Maelekezo wazi ya kuripoti matatizo na kupendekeza mabadiliko
  - Viwango vya nyaraka kwa maudhui mapya
  - Miongozo ya mifano ya msimbo na kanuni za ujumbe wa commit
  - Taarifa za ushiriki wa jamii

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Moduli ya hitimisho iliyokamilika kabisa ikiwa na:
  - Muhtasari kamili wa mafanikio ya warsha
  - Sehemu ya dhana kuu zilizokamilishwa ikijumuisha AZD, templates, na AI Foundry
  - Mapendekezo ya kuendelea na safari ya kujifunza
  - Mazoezi ya changamoto za warsha yenye viwango vya ugumu
  - Viungo vya maoni ya jamii na msaada

- **📚 Workshop Module 3 (Deconstruct)**: Malengo ya kujifunza yaliyosasishwa yamejumuisha:
  - Mwongozo wa kuamilisha GitHub Copilot na seva za MCP
  - Ufahamu wa muundo wa folda za template za AZD
  - Mifumo ya kupanga miundombinu-kama-msimbo (Bicep)
  - Maelekezo ya maabara ya vitendo

- **🔧 Workshop Module 6 (Teardown)**: Imekamilika na:
  - Malengo ya usafi wa rasilimali na usimamizi wa gharama
  - Matumizi ya `azd down` kwa uondoaji salama wa miundombinu
  - Mwongozo wa urejeshaji wa huduma za cognitive zilizofutwa kwa muda (soft-deleted)
  - Mafunzo ya ziada ya uchunguzi kwa GitHub Copilot na Azure Portal

#### Fixed
- **🔗 Marekebisho ya Viungo Vilivyovunjika**: Imetatua viungo 15+ ndani vya nyaraka vilivyovunjika:
  - `docs/ai-foundry/ai-model-deployment.md`: Imeweka sahihi njia za microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Imerekebisha njia za ai-model-deployment.md na production-ai-practices.md
  - `docs/getting-started/first-project.md`: Imebadili cicd-integration.md isiyokuwepo na deployment-guide.md
  - `examples/retail-scenario.md`: Imeweka sahihi njia za FAQ na troubleshooting guide
  - `examples/container-app/microservices/README.md`: Imerekebisha njia za ukurasa mkuu wa kozi na mwongozo wa deployment
  - `resources/faq.md` and `resources/glossary.md`: Imesasisha marejeo ya sura ya AI
  - `course-outline.md`: Imerekebisha marejeo ya mwongozo wa mwalimu na maabara za warsha za AI

- **📅 Workshop Status Banner**: Imesasishwa kutoka "Under Construction" hadi hali ya warsha hai na tarehe Februari 2026

- **🔗 Workshop Navigation**: Imerekebisha viungo vya urambazaji vilivyovunjika kwenye README.md ya warsha vilivyoelekeza kwenye folda isiyokuwepo lab-1-azd-basics

#### Changed
- **Workshop Presentation**: Imetoa onyo la "under construction", warsha sasa imekamilika na iko tayari kutumiwa
- **Navigation Consistency**: Imethibitisha kwamba moduli zote za warsha zina urambazaji sahihi kati ya moduli
- **Learning Path References**: Imesasisha marejeo ya sura ili kutumia njia sahihi za microsoft-foundry

#### Validated
- ✅ Faili zote za Markdown za Kiingereza zina viungo vya ndani vinavyofanya kazi
- ✅ Moduli za warsha 0-7 zimetimia na zina malengo ya kujifunza
- ✅ Urambazaji kati ya sura na moduli unafanya kazi vizuri
- ✅ Maudhui yanafaa kwa waendelezaji wa AI wanaotumia Microsoft AZD
- ✅ Lugha na muundo vinavyofaa wanaoanza vimehifadhiwa kote
- ✅ CONTRIBUTING.md inatoa mwongozo wazi kwa wachangiaji wa jamii

#### Technical Implementation
- **Link Validation**: Skripti ya PowerShell iliyojirudia ilithibitisha viungo vyote vya ndani vya .md
- **Content Audit**: Mapitio ya mkono ya ukamilifu wa warsha na ufaao kwa wanaoanza kujifunza
- **Navigation System**: Mifano thabiti ya urambazaji wa sura na moduli imetumika

#### Notes
- **Wigo**: Mabadiliko yamewekwa kwa nyaraka za Kiingereza pekee
- **Tafsiri**: Folda za tafsiri hazijasasishwa katika toleo hili (tafsiri za moja kwa moja zitasawazishwa baadaye)
- **Workshop Duration**: Warsha kamili sasa inatoa masaa 3-4 ya mafunzo ya vitendo

---

### [v3.8.0] - 2025-11-19

#### Nyaraka za Kina: Ufuatiliaji, Usalama, na Mifumo ya Mawakala Wengi
**Toleo hili linaongeza masomo ya daraja A ya kina juu ya ujumuishaji wa Application Insights, mifumo ya uthibitisho, na uratibu wa mawakala wengi kwa utoaji wa uzalishaji.**

#### Added
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - Uenezaji uliolengwa AZD pamoja na utoaji wa moja kwa moja
  - Templates za Bicep kamili kwa Application Insights + Log Analytics
  - Programu za Python zinazoendeshwa zenye telemetry maalum (mistari 1,200+)
  - Mifumo ya ufuatiliaji ya AI/LLM (ufuataji wa tokeni/gharama za Azure OpenAI)
  - Michoro 6 ya Mermaid (miundo, tracing iliyogawanywa, mtiririko wa telemetry)
  - Mazoezi 3 ya vitendo (arifu, dashibodi, ufuatiliaji wa AI)
  - Mifano ya maombi ya Kusto na mikakati ya kuboresha gharama
  - Utoaji wa metrics kwa wakati halisi na urekebishaji kwa wakati halisi
  - Muda wa kujifunza wa dakika 40-50 na mifumo tayari kwa uzalishaji

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - Mifumo 3 ya uthibitisho (connection strings, Key Vault, managed identity)
  - Templates za miundombinu za Bicep kamili kwa utoaji salama
  - Msimbo wa programu ya Node.js na ujumuishaji wa Azure SDK
  - Mazoezi 3 kamili (wezesha managed identity, user-assigned identity, mzunguko wa Key Vault)
  - Mbinu bora za usalama na usanidi wa RBAC
  - Mwongozo wa utatuzi wa matatizo na uchambuzi wa gharama
  - Mifumo ya uthibitisho bila nywila tayari kwa uzalishaji

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - Mifumo 5 ya uratibu (mfuatano, sambamba, mitawaliwa, inayoendeshwa na matukio, makubaliano)
  - Utekelezaji kamili wa huduma ya orchestrator (Python/Flask, mistari 1,500+)
  - Utekelezaji 3 maalum wa wakala (Research, Writer, Editor)
  - Ujumuishaji wa Service Bus kwa uorodhesaji wa ujumbe
  - Usimamizi wa hali wa Cosmos DB kwa mifumo iliyogawanywa
  - Michoro 6 ya Mermaid inayoonyesha mwingiliano wa wakala
  - Mazoezi 3 ya juu (menejimenti ya muda wa kumalizika, mantiki ya jaribu tena, circuit breaker)
  - Ugawaji wa gharama ($240-565/mwezi) pamoja na mikakati ya uboreshaji
  - Ujumuishaji wa Application Insights kwa ufuatiliaji

#### Enhanced
- **Pre-deployment Chapter**: Sasa inajumuisha mifumo ya kina ya ufuatiliaji na uratibu
- **Getting Started Chapter**: Imekuzwa na mifumo ya uthibitisho ya kitaalamu
- **Production Readiness**: Ufunikaji kamili kutoka usalama hadi ufuatiliaji
- **Course Outline**: Umesasishwa ili kurejea masomo mapya katika Sura 3 na 6

#### Changed
- **Learning Progression**: Ujumuishaji bora wa usalama na ufuatiliaji kote katika kozi
- **Documentation Quality**: Viwango vya daraja A vinavyofanana (95-97%) katika masomo mapya
- **Production Patterns**: Ufunikaji kamili kutoka mwanzo hadi mwisho kwa utoaji wa kampuni

#### Improved
- **Developer Experience**: Njia wazi kutoka maendeleo hadi ufuatiliaji wa uzalishaji
- **Security Standards**: Mifumo ya kitaalamu kwa uthibitisho na usimamizi wa siri
- **Observability**: Ujumuishaji kamili wa Application Insights na AZD
- **AI Workloads**: Ufuatiliaji maalum kwa Azure OpenAI na mifumo ya mawakala wengi

#### Validated
- ✅ Masomo yote yanajumuisha msimbo kamili unaofanya kazi (sio vipande vidogo)
- ✅ Michoro ya Mermaid kwa kujifunza kwa kuona (jumla 19 katika masomo 3)
- ✅ Mazoezi ya vitendo yenye hatua za uthibitisho (jumla 9)
- ✅ Templates za Bicep tayari kwa uzalishaji zinazoweza kutumika kwa `azd up`
- ✅ Uchambuzi wa gharama na mikakati ya uboreshaji
- ✅ Miongozo ya utatuzi wa matatizo na mbinu bora
- ✅ Vidhibiti vya maarifa vikiwa na amri za uthibitisho

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Mwongozo wa kina wa ufuatiliaji
- **docs/getting-started/authsecurity.md**: - Mifumo ya usalama ya kitaalamu
- **docs/pre-deployment/coordination-patterns.md**: - Miundo ya juu ya mawakala wengi
- **Yaliyomo Mapya kwa Jumla**: - Viwango vya ubora vinavyolingana

#### Technical Implementation
- **Application Insights**: Log Analytics + telemetry maalum + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### Maboresho ya Ubora wa Nyaraka na Mfano Mpya wa Azure OpenAI
**Toleo hili linaboresha ubora wa nyaraka kote kwenye hifadhidata na linaongeza mfano kamili wa uenezaji wa Azure OpenAI wenye kiolesura cha mazungumzo cha GPT-4.**

#### Added
- **🤖 Mfano wa Mazungumzo wa Azure OpenAI**: Uenezaji kamili wa GPT-4 na utekelezaji unaofanya kazi katika `examples/azure-openai-chat/`:
  - Miundombinu kamili ya Azure OpenAI (uenezaji wa modeli ya GPT-4)
  - Kiolesura cha mazungumzo cha mstari wa amri wa Python chenye historia ya mazungumzo
  - Ujumuishaji wa Key Vault kwa uhifadhi salama wa funguo za API
  - Ufuatiliaji wa matumizi ya tokeni na makisio ya gharama
  - Kudhibiti viwango na utunzaji wa makosa
  - README ya kina yenye mwongozo wa uenezaji wa dakika 35-45
  - Faili 11 tayari kwa uzalishaji (templates za Bicep, programu ya Python, usanidi)
- **📚 Mazoezi ya Nyaraka**: Yameongeza mazoezi ya vitendo kwa mwongozo wa usanidi:
  - Zoezi 1: Usanidi wa mazingira mengi (dakika 15)
  - Zoezi 2: Mazoezi ya usimamizi wa siri (dakika 10)
  - Vigezo vya mafanikio vilivyo wazi na hatua za uthibitisho
- **✅ Uthibitisho wa Uenezaji**: Imeongeza sehemu ya uthibitisho kwenye mwongozo wa uenezaji:
  - Taratibu za ukaguzi wa afya
  - Orodha ya vigezo vya mafanikio
  - Matokeo yanayotarajiwa kwa amri zote za uenezaji
  - Marejeo ya haraka ya utatuzi wa matatizo

#### Enhanced
- **examples/README.md**: Imesasishwa hadi ubora wa daraja A (93%):
  - Iliyongeza azure-openai-chat katika sehemu zote zinazofaa
  - Imesasisha idadi ya mifano za ndani kutoka 3 hadi 4
  - Imeongezwa kwenye jedwali la Mifano ya Maombi ya AI
  - Imejumuishwa kwenye Mwongozo wa Haraka kwa Watumiaji wa Kati
  - Imeongezwa kwenye sehemu ya Templates za Microsoft Foundry
  - Imesasisha Msimbo wa Kulinganisha na sehemu za ugunduzi wa teknolojia
- **Documentation Quality**: Uliboreshwa B+ (87%) → A- (92%) kote kwenye folda ya nyaraka:
  - Imeongeza matokeo yanayotarajiwa kwa mifano muhimu ya amri
  - Imejumuisha hatua za uthibitisho kwa mabadiliko ya usanidi
  - Imeongeza kujifunza kwa vitendo kwa mazoezi ya vitendo

#### Changed
- **Learning Progression**: Ujumuishaji bora wa mifano ya AI kwa wanaojifunza wa kati
- **Documentation Structure**: Mazoezi zaidi yanayoweza kutekelezeka na matokeo wazi
- **Verification Process**: Vigezo vya mafanikio vilivyoeleweka vimeongezwa kwa michakato muhimu

#### Improved
- **Developer Experience**: Uenezaji wa Azure OpenAI sasa unachukua dakika 35-45 (vs 60-90 kwa mbadala ngumu)
- **Cost Transparency**: Makisio wazi ya gharama ($50-200/mwezi) kwa mfano wa Azure OpenAI
- **Learning Path**: Waendelezaji wa AI wana nukta ya kuingia wazi na azure-openai-chat
- **Documentation Standards**: Matokeo yanayotarajiwa na hatua za uthibitisho vinavyolingana

#### Validated
- ✅ Mfano wa Azure OpenAI unafanya kazi kikamilifu na `azd up`
- ✅ Faili zote 11 za utekelezaji ziko sahihi kimaandishi
- ✅ Maelekezo ya README yanalingana na uzoefu halisi wa uenezaji
- ✅ Viungo vya nyaraka vimesasishwa katika maeneo 8+
- ✅ Kielezo cha mifano kinaonyesha kwa usahihi mifano 4 za ndani
- ✅ Hakuna viungo vya nje vilivyojirudia katika jedwali
- ✅ Marejeo yote ya urambazaji ni sahihi

#### Technical Implementation
- **Usanifu wa Azure OpenAI**: GPT-4 + Key Vault + muundo wa Container Apps
- **Usalama**: Managed Identity tayari, siri katika Key Vault
- **Ufuatiliaji**: Ujumuishaji wa Application Insights
- **Usimamizi wa Gharama**: Ufuatiliaji wa tokeni na uboreshaji wa matumizi
- **Uenezaji**: Amri moja ya `azd up` kwa usanidi kamili

### [v3.6.0] - 2025-11-19

#### Sasisho Kuu: Mifano ya Uenezaji wa Container App
**Toleo hili linaanzisha mifano kamili, tayari kwa uzalishaji ya uenezaji wa programu za container kwa kutumia Azure Developer CLI (AZD), ikiwa na nyaraka kamili na ujumuishaji katika njia ya kujifunza.**

#### Added
- **🚀 Mifano ya Container App**: Mifano mpya za ndani katika `examples/container-app/`:
  - [Mwongozo Mkuu](examples/container-app/README.md): Muhtasari kamili wa uenezaji wa container, kuanza kwa haraka, uzalishaji, na mifumo ya juu
  - [API Rahisi ya Flask](../../examples/container-app/simple-flask-api): API ya REST rafiki kwa wanaoanza yenye scale-to-zero, probes za afya, ufuatiliaji, na utatuzi wa matatizo
  - [Usanifu wa Microservices](../../examples/container-app/microservices): Uenezaji wa huduma nyingi tayari kwa uzalishaji (API Gateway, Product, Order, User, Notification), ujumbe wa asili asynchronous, Service Bus, Cosmos DB, Azure SQL, distributed tracing, uenezaji wa blue-green/canary
- **Miongozo Bora**: Usalama, ufuatiliaji, uboreshaji wa gharama, na miongozo ya CI/CD kwa kazi zilizo ndani ya container
- **Mifano ya Msimbo**: `azure.yaml` kamili, templates za Bicep, na utekelezaji wa huduma kwa lugha nyingi (Python, Node.js, C#, Go)
- **Upimaji & Utatuzi wa Matatizo**: Hali za majaribio kutoka mwanzo hadi mwisho, amri za ufuatiliaji, mwongozo wa utatuzi wa matatizo

#### Changed
- **README.md**: Imesasishwa ili kuonyesha na kuunganisha mifano mpya ya container app chini ya "Mifano za Ndani - Programu za Container"
- **examples/README.md**: Imesasishwa kuzingatia mifano ya container app, kuongeza vipengele vya matrix ya kulinganisha, na kusasisha marejeo ya teknolojia/usanifu
- **Mpangilio wa Kozi & Mwongozo wa Masomo**: Imesasishwa ili kurejelea mifano mpya ya container app na mifumo ya ueneaji katika sura husika

#### Imehakikishwa
- ✅ Mifano yote mipya inaweza kuanzishwa na `azd up` na inafuata mbinu bora
- ✅ Viungo vya ndani na urambazaji wa nyaraka vimesasishwa
- ✅ Mifano inashughulikia hali kutoka kwa waanzilishi hadi wataalamu, ikijumuisha microservices za uzalishaji

#### Vidokezo
- **Wigo**: Nyaraka na mifano kwa Kiingereza pekee
- **Hatua Inayofuata**: Panua kwa mifumo ya juu ya container na uendeshaji wa CI/CD katika toleo zijazo

### [v3.5.0] - 2025-11-19

#### Mabadiliko ya jina la Bidhaa: Microsoft Foundry
**Toleo hili linafanya mabadiliko kamili ya jina la bidhaa kutoka "Microsoft Foundry" hadi "Microsoft Foundry" katika nyaraka zote za Kiingereza, ikionyesha urejeshaji rasmi wa chapa ya Microsoft.**

#### Yaliyobadilishwa
- **🔄 Sasisho la Jina la Bidhaa**: Kurebranding kamili kutoka "Microsoft Foundry" hadi "Microsoft Foundry"
  - Marejeleo yote yamesasishwa katika nyaraka za Kiingereza kwenye folda `docs/`
  - Folda iliyopewa jina jipya: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Faili iliyopewa jina jipya: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumla: marejeleo 23 ya yaliyomo yamesasishwa katika faili 7 za nyaraka

- **📁 Mabadiliko ya Muundo wa Folda**:
  - `docs/ai-foundry/` ilipewa jina jipya kuwa `docs/microsoft-foundry/`
  - Viungo vyote vya ndani vimesasishwa kuonyesha muundo mpya wa folda
  - Viungo vya urambazaji vimehakikiwa katika nyaraka zote

- **📄 Majina ya Faili Yaliyobadilishwa**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Viungo vya ndani vyote vimesasishwa kurejelea jina jipya la faili

#### Faili Zilizosasishwa
- **Nyaraka za Sura** (faili 7):
  - `docs/microsoft-foundry/ai-model-deployment.md` - masasisho 3 ya viungo vya urambazaji
  - `docs/microsoft-foundry/ai-workshop-lab.md` - marejeleo 4 ya jina la bidhaa yamesasishwa
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Tayari inatumia Microsoft Foundry (kutokana na masasisho ya awali)
  - `docs/microsoft-foundry/production-ai-practices.md` - marejeleo 3 yamesasishwa (muhtasari, maoni ya jumuiya, nyaraka)
  - `docs/getting-started/azd-basics.md` - viungo 4 vya marejeleo ya ndani yamesasishwa
  - `docs/getting-started/first-project.md` - viungo 2 vya urambazaji wa sura vimesasishwa
  - `docs/getting-started/installation.md` - viungo 2 za sura inayofuata zimesasishwa
  - `docs/troubleshooting/ai-troubleshooting.md` - marejeleo 3 yamesasishwa (urambazaji, jumuiya ya Discord)
  - `docs/troubleshooting/common-issues.md` - kiungo 1 cha urambazaji kimesasishwa
  - `docs/troubleshooting/debugging.md` - kiungo 1 cha urambazaji kimesasishwa

- **Faili za Muundo wa Kozi** (faili 2):
  - `README.md` - marejeleo 17 yamesasishwa (muhtasari wa kozi, vichwa vya sura, sehemu ya templates, maarifa ya jumuiya)
  - `course-outline.md` - marejeleo 14 yamesasishwa (muhtasari, malengo ya kujifunza, rasilimali za sura)

#### Imehakikishwa
- ✅ Hakuna tena marejeleo ya njia ya folda "ai-foundry" katika nyaraka za Kiingereza
- ✅ Hakuna tena marejeleo ya jina la bidhaa "Microsoft Foundry" katika nyaraka za Kiingereza
- ✅ Viungo vyote vya urambazaji vinavyofanya kazi na muundo mpya wa folda
- ✅ Ubadilishaji wa majina ya faili na folda umekamilika kwa mafanikio
- ✅ Marejeleo ya ndani kati ya sura yamehakikiwa

#### Vidokezo
- **Wigo**: Mabadiliko yamewekwa kwenye nyaraka za Kiingereza katika folda `docs/` pekee
- **Tafsiri**: Folda za tafsiri (`translations/`) hazijasasishwa katika toleo hili
- **Warsha**: Vifaa vya warsha (`workshop/`) havijasasishwa katika toleo hili
- **Mifano**: Faili za mfano bado zinaweza kurejelea majina ya zamani (itatatuliwa katika sasisho lijalo)
- **Viungo vya Nje**: URL za nje na marejeleo ya repozitori ya GitHub hayajabadilika

#### Mwongozo wa Uhamishaji kwa Wachangiaji
If you have local branches or documentation referencing the old structure:
1. Sahihisha marejeleo ya folda: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Sahihisha marejeleo ya faili: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Badilisha jina la bidhaa: "Microsoft Foundry" → "Microsoft Foundry"
4. Thibitisha kwamba viungo vyote vya ndani vya nyaraka bado vinafanya kazi

---

### [v3.4.0] - 2025-10-24

#### Uboreshaji wa Mapitio ya Miundombinu na Uhakikisho
**Toleo hili linaanzisha msaada kamili kwa kipengele kipya cha mwoneko awali cha Azure Developer CLI na kuboresha uzoefu wa mtumiaji wa warsha.**

#### Imeongezwa
- **🧪 azd provision --preview Feature Documentation**: Ufunuo kamili wa uwezo mpya wa mwoneko awali wa miundombinu
  - Marejeleo ya amri na mifano ya matumizi katika cheat sheet
  - Uunganisho wa kina katika mwongozo wa provisioning ukiwa na matumizi na faida
  - Uunganisho wa ukaguzi wa kabla ya uenezaji kwa uhakikisho salama wa uenezaji
  - Masasisho ya mwongozo wa kuanza na mbinu za uenezaji zinazoweka usalama kwanza
- **🚧 Bango la Hali ya Warsha**: Bango la kitaalamu la HTML linaloonyesha hali ya maendeleo ya warsha
  - Muundo wenye gradient na viashiria vya ujenzi kwa mawasiliano wazi kwa watumiaji
  - Alama ya wakati ya sasisho la mwisho kwa uwazi
  - Muundo unaojibadilisha kwa simu za mkononi kwa aina zote za vifaa

#### Imeboreshwa
- **Usalama wa Miundombinu**: Uwezo wa mwoneko awali umeingizwa katika nyaraka zote za uenezaji
- **Uhakikisho Kabla ya Ueneaji**: Skripti zilizojitokeza sasa zinajumuisha upimaji wa mwoneko awali wa miundombinu
- **Mtiririko wa Mendelezaji**: Mfululizo wa amri umeboreshwa kujumuisha mwoneko awali kama mbinu bora
- **Uzoefu wa Warsha**: Matamanio wazi yamewekwa kwa watumiaji kuhusu hali ya maendeleo ya yaliyomo

#### Yaliyobadilika
- **Mbinu Bora za Uenezaji**: Mtiririko unaotangulia mwoneko awali sasa ni njia inayopendekezwa
- **Mtiririko wa Nyaraka**: Uhakikisho wa miundombinu umehamishiwa mapema katika mchakato wa kujifunza
- **Uwasilishaji wa Warsha**: Mawasiliano ya hali ya kitaalamu yenye ratiba wazi ya maendeleo

#### Imeboreshwa
- **Njia ya Usalama Kwanza**: Mabadiliko ya miundombinu sasa yanaweza kuhakikiwa kabla ya uenezaji
- **Ushirikiano wa Timu**: Matokeo ya mwoneko awali yanaweza kushirikiwa kwa mapitio na idhini
- **Uelewa wa Gharama**: Uelewa bora wa gharama za rasilimali kabla ya provisioning
- **Kupunguza Hatari**: Kufanikiwa kwa kupungua kwa makosa ya uenezaji kupitia uthibitisho wa mapema

#### Utekelezaji wa Kifundi
- **Uunganisho wa Nyaraka Nyingi**: Kipengele cha mwoneko awali kimeandikishwa katika faili 4 muhimu
- **Mifumo ya Amri**: Sarufi thabiti na mifano katika nyaraka zote
- **Uingizwa wa Mbinu Bora**: Mwoneko awali umejumuishwa katika mtiririko wa uthibitisho na skripti
- **Viashirio vya Mwonekano**: Uwekaji wazi wa vipengele VIPYA kwa kutambulika

#### Miundombinu ya Warsha
- **Mawasiliano ya Hali**: Bango la kitaalamu la HTML lenye mtindo wa gradient
- **Uzoefu wa Mtumiaji**: Hali wazi ya maendeleo inazuia mkanganyiko
- **Uwasilishaji wa Kitaalamu**: Hufanya uhakika wa uadilifu wa repozitori huku ikiweka matarajio
- **Uwajibikaji wa Ratiba**: Alama ya wakati ya sasisho la mwisho Oktoba 2025 kwa uwajibikaji

### [v3.3.0] - 2025-09-24

#### Vifaa vya Warsha Vilivyoboreshwa na Uzoefu wa Kujifunza wa Kuingiliana
**Toleo hili linaanzisha vifaa vya warsha vya kina pamoja na mwongozo mwingiliano unaotegemea kivinjari na njia zilizopangwa za kujifunza.**

#### Imeongezwa
- **🎥 Mwongozo wa Warsha Mwingiliano**: Uzoefu wa warsha unaotegemea kivinjari na uwezo wa mwoneko awali wa MkDocs
- **📝 Maelekezo ya Warsha Yaliyopangwa**: Njia ya kujifunza ya hatua 7 iliyobadilishwa kutoka ugunduzi hadi ubinafsishaji
  - 0-Utangulizi: Muhtasari wa warsha na usanidi
  - 1-Chagua-Kiolezo-AI: Uvumbuzi wa kiolezo na mchakato wa uteuzi
  - 2-Thibitisha-Kiolezo-AI: Taratibu za uenezaji na uhakikisho
  - 3-Gundua-AI-Kiolezo: Kuelewa usanifu wa kiolezo
  - 4-Panga-Kiolezo-AI: Usanidi na ubinafsishaji
  - 5-Binafsisha-Kiolezo-AI: Marekebisho ya juu na mzunguko
  - 6-Avua-Miundombinu: Usafishaji na usimamizi wa rasilimali
  - 7-Mwisho: Muhtasari na hatua zinazofuata
- **🛠️ Vifaa vya Warsha**: Usanidi wa MkDocs na mandhari ya Material kwa uzoefu wa kujifunza ulioboreshwa
- **🎯 Njia ya Kujifunza ya Vitendo**: Mbinu ya hatua 3 (Ugunduzi → Uenezaji → Ubinafsishaji)
- **📱 Uunganisho wa GitHub Codespaces**: Usanidi usio na mshono wa mazingira ya maendeleo

#### Imeboreshwa
- **Maabara ya Warsha ya AI**: Imekuzwa na uzoefu wa kujifunza uliopangwa wa masaa 2-3
- **Nyaraka za Warsha**: Uwasilishaji wa kitaalamu pamoja na urambazaji na nyenzo za kuona
- **Maendeleo ya Kujifunza**: Mwongozo wa hatua kwa hatua kutoka uteuzi wa kiolezo hadi uenezaji wa uzalishaji
- **Uzoefu wa Mendelezaji**: Vifaa vilivyowekwa kwa ajili ya mtiririko ulio rahisishwa wa maendeleo

#### Imeboreshwa
- **Ufikiaji**: Kiolesura kinachotegemea kivinjari chenye utaftaji, uwezo wa kunakili, na kubadilisha mandhari
- **Kujifunza kwa Mwendo Wako**: Muundo wa warsha unaobadilika unaokubali kasi tofauti za kujifunza
- **Matumizi ya Vitendo**: Hali halisi za uenezaji wa kiolezo za AI
- **Ushirikiano wa Jamii**: Uunganisho wa Discord kwa msaada wa warsha na ushirikiano

#### Sifa za Warsha
- **Utafutaji Uliomo**: Ugunduzi wa haraka wa maneno muhimu na somo
- **Uwezo wa kunakili kwa kuonyesha (hover-to-copy) kwa mifano yote ya msimbo**
- **Kubadilisha Mandhari**: Msaada wa hali ya giza/nyepesi kwa mapendeleo tofauti
- **Rasilimali za Mwonekano**: Picha za skrini na michoro kwa uelewa ulioboreshwa
- **Uingizwa wa Msaada**: Ufikiaji wa moja kwa moja wa Discord kwa msaada wa jamii

### [v3.2.0] - 2025-09-17

#### Urejeshaji Mkuu wa Urambazaji na Mfumo wa Kujifunza Uliotegemea Sura
**Toleo hili linaanzisha muundo kamili wa kujifunza uliotegemea sura pamoja na urambazaji ulioboreshwa katika repozitori nzima.**

#### Imeongezwa
- **📚 Mfumo wa Kujifunza Uliotegemea Sura**: Kozi nzima imepangwa upya kuwa sura 8 zenye maendeleo
  - Sura 1: Misingi & Anza Haraka (⭐ - 30-45 mins)
  - Sura 2: Maendeleo Yaliyoanza na AI (⭐⭐ - 1-2 hours)
  - Sura 3: Usanidi & Uthibitishaji (⭐⭐ - 45-60 mins)
  - Sura 4: Miundombinu kama Msimbo & Uenezaji (⭐⭐⭐ - 1-1.5 hours)
  - Sura 5: Suluhisho za AI za Mawakala Nyingi (⭐⭐⭐⭐ - 2-3 hours)
  - Sura 6: Uhakikisho & Mipango Kabla ya Uenezaji (⭐⭐ - 1 hour)
  - Sura 7: Utatuzi wa Matatizo & Urekebishaji (⭐⭐ - 1-1.5 hours)
  - Sura 8: Mifumo ya Uzalishaji & Kampuni (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Mfumo Kamili wa Urambazaji**: Vichwa na migongo ya urambazaji thabiti katika nyaraka zote
- **🎯 Ufuatiliaji wa Maendeleo**: Orodha ya ukamilishaji wa kozi na mfumo wa uhakikisho wa kujifunza
- **🗺️ Mwongozo wa Njia ya Kujifunza**: Vinguzo vya kuingia wazi kwa viwango tofauti vya uzoefu na malengo
- **🔗 Urambazaji wa Marejeleo ya Ndani**: Sura zinazohusiana na masharti ya awali zimeunganishwa kwa uwazi

#### Imeboreshwa
- **Muundo wa README**: Umegeuzwa kuwa jukwaa lililopangwa la kujifunza na mpangilio uliotegemea sura
- **Urambazaji wa Nyaraka**: Kila ukurasa sasa unajumuisha muktadha wa sura na mwongozo wa maendeleo
- **Umpangaji wa Templates**: Mifano na templates zimepangwa kwa sura zinazofaa za kujifunza
- **Uunganisho wa Rasilimali**: Cheat sheets, Maswali ya Mara kwa Mara, na miongozo ya masomo zimeunganishwa na sura husika
- **Uingizwa wa Warsha**: Maabara za vitendo zimepangwa kwa malengo ya kujifunza ya sura nyingi

#### Yaliyobadilika
- **Maendeleo ya Kujifunza**: Imepitishwa kutoka nyaraka zilizo mfululizo hadi kujifunza kwa sura zinazobadilika
- **Mahali pa Usanidi**: Mwongozo wa usanidi umewekwa upya kama Sura 3 kwa mtiririko bora wa kujifunza
- **Uingizwa wa Yaliyomo ya AI**: Uingizwa bora wa yaliyomo maalum ya AI kote katika safari ya kujifunza
- **Yaliyomo ya Uzalishaji**: Mifumo ya juu imeunganishwa katika Sura 8 kwa wanafunzi wa kampuni

#### Imeboreshwa
- **Uzoefu wa Mtumiaji**: Breadcrumbs za urambazaji wazi na viashiria vya maendeleo ya sura
- **Ufikiaji**: Mifumo thabiti ya urambazaji kwa urahisi wa kupita kozi
- **Uwasilishaji wa Kitaalamu**: Muundo wa kozi wa mtindo wa chuo unaofaa kwa mafunzo ya kitaaluma na ya kampuni
- **Ufanisi wa Kujifunza**: Kupungua kwa muda wa kupata yaliyomo yanayofaa kupitia mpangilio ulioboreshwa

#### Utekelezaji wa Kifundi
- **Vichwa vya Urambazaji**: Urambazaji wa sura uliosawazishwa katika faili zaidi ya 40 za nyaraka
- **Urambazaji wa Migongo**: Mwongozo thabiti wa maendeleo na viashiria vya kukamilika kwa sura
- **Uunganishaji wa Ndani**: Mfumo kamili wa viungo vya ndani unaounganisha dhana zinazohusiana
- **Ramani za Sura**: Templates na mifano zimeambatishwa kwa uwazi na malengo ya kujifunza

#### Uboreshaji wa Mwongozo wa Masomo
- **📚 Malengo Kamili ya Kujifunza**: Mwongozo wa masomo umepangwa upya ili kuendana na mfumo wa sura 8
- **🎯 Tathmini ya Kitaalamu kwa Sura**: Kila sura inajumuisha malengo maalum ya kujifunza na mazoezi ya vitendo
- **📋 Ufuatiliaji wa Maendeleo**: Ratiba ya kujifunza ya kila wiki yenye matokeo yanayopimika na orodha za kukamilisha
- **❓ Maswali ya Tathmini**: Maswali ya uthibitisho wa maarifa kwa kila sura yenye matokeo ya kitaalamu
- **🛠️ Mazoezi ya Vitendo**: Shughuli za vitendo zenye hali halisi za uenezaji na utatuzi wa matatizo
- **📊 Maendeleo ya Ujuzi**: Ukuaji wazi kutoka kwa dhana za msingi hadi mifumo ya kampuni kwa kuzingatia maendeleo ya kazi
- **🎓 Mfumo wa Cheti**: Matokeo ya maendeleo ya kitaalamu na mfumo wa utambuzi wa jamii
- **⏱️ Usimamizi wa Ratiba**: Mpango uliopangwa wa kujifunza wa wiki 10 wenye uthibitisho wa hatua muhimu

### [v3.1.0] - 2025-09-17

#### Suluhisho za AI za Mawakala Nyingi Zilizoboreshwa
**Toleo hili linaboresha suluhisho la rejareja la mawakala wengi kwa uandishi bora wa majina ya mawakala na nyaraka zilizoboreshwa.**

#### Yaliyobadilishwa
- **Kamusi ya Mawakala Nyingi**: 'Cora agent' imebadilishwa kuwa 'Customer agent' katika sehemu zote za suluhisho la rejareja la mawakala wengi kwa uelewa wazi zaidi
- **Usanifu wa Mwakala**: Nyaraka zote, ARM templates, na mifano ya msimbo zimesasishwa kutumia jina thabiti 'Customer agent'
- **Mifano ya Usanidi**: Mifumo ya usanidi ya wakala yamegawanywa kisasa kwa mabadiliko ya kanuni za uandishi
- **Ulinganifu wa Nyaraka**: Imehakikishwa kwamba marejeleo yote yanatumia majina ya mawakala ya kitaalamu na ya kuelezea

#### Imeboreshwa
- **Kifurushi cha Template za ARM**: retail-multiagent-arm-template imesasishwa na marejeleo ya 'Customer agent'
- **Michoro ya Usanifu**: Michoro ya Mermaid imesasishwa kwa majina mapya ya mawakala
- **Mifano ya Msimbo**: Madarasa ya Python na mifano ya utekelezaji sasa zinatumia uandishi wa CustomerAgent
- **Vigezo vya Mazingira**: Skripti zote za uenezaji zimesasishwa kutumia kanuni za CUSTOMER_AGENT_NAME

#### Imeboreshwa
- **Uzoefu wa Mwanaendelezaji**: Majukumu na wajibu wa mawakala yalio wazi zaidi katika nyaraka
- **Uko Tayari kwa Uzalishaji**: Ulinganifu bora na desturi za majina za kampuni
- **Vifaa vya Kujifunza**: Majina ya mawakala yanayoeleweka zaidi kwa madhumuni ya elimu
- **Urahisi wa Matumizi ya Violezo**: Uelewa uliorahisishwa wa kazi za mawakala na mifumo ya uenezaji

#### Maelezo ya Kiufundi
- Imesasishwa michoro ya usanifu ya Mermaid yenye marejeleo ya CustomerAgent
- Imebadilisha majina ya darasa CoraAgent na CustomerAgent katika mifano ya Python
- Imerekebisha ARM template JSON configurations ili kutumia aina ya wakala "customer"
- Imesasisha vigezo vya mazingira kutoka CORA_AGENT_* hadi CUSTOMER_AGENT_* patterns
- Imesasisha amri zote za uenezaji na usanidi wa kontena

### [v3.0.0] - 2025-09-12

#### Mabadiliko Makubwa - Mtazamo wa Mwanaendelezaji wa AI na Uunganishaji na Microsoft Foundry
**Toleo hili linageuza hazina ya mradi kuwa rasilimali kamili ya kujifunza inayojikita kwenye AI na uunganishaji na Microsoft Foundry.**

#### Imeongezwa
- **🤖 Njia ya Kujifunza Iliyowekwa AI Kwanza**: Marekebisho kamili yanayoweka kipaumbele kwa waendelezaji na wahandisi wa AI
- **Mwongozo wa Uunganishaji wa Microsoft Foundry**: Nyaraka kamili za kuunganisha AZD na huduma za Microsoft Foundry
- **Mifumo ya Uenezaji ya Modeli za AI**: Mwongozo wa kina unaofunika uchaguzo wa modeli, usanidi, na mikakati ya uenezaji wa uzalishaji
- **Warsha ya Maabara ya AI**: Warsha ya vitendo ya masaa 2-3 ya kubadilisha programu za AI kuwa suluhisho zinazoweza kuenezwa kwa AZD
- **Mbinu Bora za AI kwa Uzalishaji**: Mifano inayostahili kampuni kwa kupanua, kufuatilia, na kuhakikisha usalama wa mzigo wa kazi za AI
- **Mwongozo wa Utatuzi wa Matatizo kwa AI**: Utatuzi wa kina wa matatizo kwa Azure OpenAI, Cognitive Services, na masuala ya uenezaji wa AI
- **Mkusanyiko wa Violezo vya AI**: Mkusanyiko wa vipengele vya violezo vya Microsoft Foundry na viwango vya ugumu
- **Vifaa vya Warsha**: Muundo kamili wa warsha wenye maabara za vitendo na nyenzo za rejea

#### Imeboreshwa
- **Muundo wa README**: Ulengwa kwa waendelezaji wa AI pamoja na takwimu za asilimia 45 za maslahi ya jamii kutoka Discord ya Microsoft Foundry
- **Njia za Kujifunzia**: Safari maalum kwa waendelezaji wa AI pamoja na njia za jadi kwa wanafunzi na wahandisi wa DevOps
- **Mapendekezo ya Violezo**: Violezo vinavyopendekezwa vya AI vikiwemo azure-search-openai-demo, contoso-chat, na openai-chat-app-quickstart
- **Uunganisho wa Jamii**: Ustawi ulioboreshwa wa jumuiya ya Discord wenye channel maalumu za AI na mijadala

#### Msisitizo wa Usalama na Uzalishaji
- **Mifano ya Utambulisho Iliyosimamiwa**: Usanidi maalumu wa uthibitishaji na usalama kwa AI
- **Uboreshaji wa Gharama**: Ufuatiliaji wa matumizi ya tokeni na udhibiti wa bajeti kwa mzigo wa kazi za AI
- **Uenezaji wa Mikoa Nyingi**: Mikakati ya uenezaji ya programu za AI duniani kote
- **Ufuatiliaji wa Utendaji**: Vipimo maalumu vya AI na uunganishaji wa Application Insights

#### Ubora wa Nyaraka
- **Muundo wa Kozi wa Mstari**: Mfululizo wa kimantiki kutoka kwa mwanzo hadi mifumo ya juu ya uenezaji wa AI
- **URL Zilizothibitishwa**: Viungo vyote vya nje vya hazina vimehakikiwa na vinapatikana
- **Rejea Kamili**: Viungo vyote vya ndani vya nyaraka vimehakikiwa na vinafanya kazi
- **Tayari kwa Uzalishaji**: Mifumo ya uenezaji ya kampuni yenye mifano ya ulimwengu halisi

### [v2.0.0] - 2025-09-09

#### Mabadiliko Makubwa - Urekebishaji wa Hazina na Uboreshaji wa Kitaaluma
**Toleo hili linaashiria mabadiliko makubwa ya muundo wa hazina na uwasilishaji wa yaliyomo.**

#### Imeongezwa
- **Mfumo wa Kujifunza Uliofanywa kwa Muundo**: Kurasa zote za nyaraka sasa zinajumuisha Sehemu za Utangulizi, Malengo ya Kujifunza, na Matokeo ya Kujifunua
- **Mfumo wa Utambuzi wa Kusafiri (Navigation System)**: Imeongezwa viungo vya Somo la Awali/Lilofuata katika nyaraka zote kwa ajili ya mwendelezo wa kujifunza unaoongozwa
- **Mwongozo wa Masomo**: study-guide.md kamili yenye malengo ya kujifunza, mazoezi ya vitendo, na nyenzo za tathmini
- **Uwasilishaji wa Kitaalamu**: Ikiondolewa alama zote za emoji kwa ajili ya kuboresha upatikanaji na muonekano wa kitaalamu
- **Muundo wa Yaliyomo Umeboreshwa**: Uandaaji na mtiririko wa nyenzo za kujifunza umeboreshwa

#### Imebadilishwa
- **Muundo wa Nyaraka**: Kuratibiwa nyaraka zote kwa muundo unaolenga kujifunza kwa uthabiti
- **Mtiririko wa Utambuzi**: Imetekelezwa mfululizo wa kimantiki kupitia nyenzo zote za kujifunza
- **Uwasilishaji wa Yaliyomo**: Imeondolewa vipengele vya mapambo kwa faida ya ufomati wazi na wa kitaalamu
- **Muundo wa Viungo**: Viungo vyote vya ndani vimesasishwa kuunga mkono mfumo mpya wa urambazaji

#### Imeboreshwa
- **Upatikanaji**: Imetoa utegemezi wa emoji kwa ajili ya muendeshaji bora wa wasomaji wa skrini
- **Muonekano wa Kitaalamu**: Uwasilishaji safi wa mtindo wa kitaaluma unaofaa kwa kujifunza kwa kampuni
- **Uzoefu wa Kujifunza**: Mbinu ya muundo yenye malengo na matokeo wazi kwa kila somo
- **Uandaaji wa Yaliyomo**: Mtiririko bora wa kimantiki na uhusiano kati ya mada zinazohusiana

### [v1.0.0] - 2025-09-09

#### Utoaji wa Msingi - Hazina Kamili ya Kujifunza AZD

#### Imeongezwa
- **Muundo wa Msingi wa Nyaraka**
  - Mfululizo kamili wa mwongozo wa kuanza
  - Nyaraka kamili za uenezaji na upangaji wa rasilimali
  - Vyanzo vya kina vya utatuzi wa matatizo na mwongozo wa kusuluhisha makosa
  - Zana na taratibu za uthibitishaji kabla ya uenezaji

- **Moduli ya Kuanzia (Getting Started Module)**
  - Misingi ya AZD: Dhana za msingi na istilahi
  - Mwongozo wa Usakinishaji: Maelekezo ya usanidi maalum kwa jukwaa
  - Mwongozo wa Usanidi: Usanidi wa mazingira na uthibitishaji
  - Mafunzo ya Mradi wa Kwanza: Kujifunza kwa hatua kwa hatua kwa vitendo

- **Moduli ya Uenezaji na Upangaji**
  - Mwongozo wa Uenezaji: Nyaraka kamili za mtiririko wa kazi
  - Mwongozo wa Upangaji: Miundombinu kama Msimbo kwa kutumia Bicep
  - Mbinu bora kwa uenezaji wa uzalishaji
  - Mifano ya usanifu wa huduma nyingi

- **Moduli ya Uthibitishaji Kabla ya Uenezaji**
  - Mipango ya Uwezo: Uthibitishaji wa upatikanaji wa rasilimali za Azure
  - Uchaguzi wa SKU: Mwongozo kamili wa ngazi za huduma
  - Ukaguzi Kabla ya Kuendesha: Skripti za uthibitishaji za otomatiki (PowerShell na Bash)
  - Zana za makadirio ya gharama na mipango ya bajeti

- **Moduli ya Utatuzi wa Matatizo**
  - Masuala Yanayotokea Mara kwa Mara: Matatizo na suluhisho zao
  - Mwongozo wa Kusuluhisha Makosa: Mbinu za kimfumo za utatuzi
  - Mbinu za uchunguzi wa hali ya juu na zana
  - Ufuatiliaji wa utendaji na uboreshaji

- **Rasilimali na Marejeo**
  - Karatasi ya Muhtasari wa Amri: Rejea ya haraka kwa amri muhimu
  - Kamusi ya Maneno: Ufafanuzi kamili wa istilahi na mifupisho
  - Maswali Yanayoulizwa Mara kwa Mara (FAQ): Majibu ya kina kwa maswali ya kawaida
  - Viungo vya rasilimali za nje na uhusiano wa jamii

- **Mifano na Violezo**
  - Mfano wa Programu Rahisi ya Wavuti
  - Kiolezo cha uenezaji cha Tovuti Isiyobadilika
  - Usanidi wa Programu ya Kontena
  - Mifano ya uunganishaji wa hifadhidata
  - Mifano ya usanifu wa microservices
  - Utekelezaji wa kazi zisizo na seva (serverless)

#### Sifa
- **Msaada kwa Majukwaa Mengi**: Mwongozo wa usakinishaji na usanidi kwa Windows, macOS, na Linux
- **Ngazi Nyingi za Ujuzi**: Yaliyomo yaliyoundwa kwa wanafunzi hadi waendelezaji wa kitaalamu
- **Mazingira ya Vitendo**: Mifano ya vitendo na matukio ya ulimwengu halisi
- **Ufikivu Kamili**: Kuanzia dhana za msingi hadi mifumo ya juu ya kampuni
- **Mbinu Inayoipa Kipaumbele Usalama**: Mbinu bora za usalama zimejumuishwa kote
- **Uboreshaji wa Gharama**: Mwongozo kwa uenezaji wa gharama nafuu na usimamizi wa rasilimali

#### Ubora wa Nyaraka
- **Mifano ya Kina ya Msimbo**: Sampuli za msimbo za vitendo na zilizojaribiwa
- **Maelekezo Hatua kwa Hatua**: Mwongozo wazi, unaoweza kutekelezwa
- **Usimamizi Kamili wa Makosa**: Utatuzi wa matatizo kwa masuala ya kawaida
- **Ujumuishaji wa Mbinu Bora**: Viwango vya sekta na mapendekezo
- **Ulinganifu wa Toleo**: Imesasishwa kwa huduma za hivi karibuni za Azure na sifa za azd

## Maboresho Yanayopangwa kwa Baadaye

### Toleo 3.1.0 (Lilopangwa)
#### Upanuzi wa Jukwaa la AI
- **Msaada kwa Modeli Nyingi**: Mifano ya uunganishaji kwa Hugging Face, Azure Machine Learning, na modeli za kawaida
- **Mifumo ya Wakala wa AI**: Violezo kwa uenezaji wa LangChain, Semantic Kernel, na AutoGen
- **Mifano ya Jibu-Na-Kumbukumbu (RAG) ya Juu**: Chaguzi za hifadhidata za vector zaidi ya Azure AI Search (Pinecone, Weaviate, n.k.)
- **Ufuatiliaji wa AI**: Ufuatiliaji ulioboreshwa wa utendaji wa modeli, matumizi ya tokeni, na ubora wa majibu

#### Uzoefu wa Mwanaendelezaji
- **Kiongezi cha VS Code**: Uzoefu ulioingizwa wa maendeleo wa AZD + AI Foundry
- **Uunganisho wa GitHub Copilot**: Uundaji wa violezo vya AZD uliosaidiwa na AI
- **Mafunzo Yanayoshirikisha**: Mazoezi ya kuandika msimbo kwa vitendo yenye uthibitishaji wa otomatiki kwa nyadhifa za AI
- **Yaliyomo ya Video**: Mafunzo ya video ya ziada kwa wanaojifunza kwa kuona wakiangazia uenezaji wa AI

### Toleo 4.0.0 (Lilopangwa)
#### Mifano ya AI kwa Kampuni
- **Mfumo wa Utawala**: Utawala wa modeli za AI, uzingatiaji wa kanuni, na njia za ukaguzi
- **AI ya Wamiliki Wengi**: Mifano ya kuhudumia wateja wengi kwa huduma za AI zilizotengwa
- **Uenezaji wa AI kwa Edge**: Uunganishaji na Azure IoT Edge na vifurushi vya kontena
- **AI ya Wingu Mchanganyiko**: Mifano ya uenezaji wa multi-cloud na mchanganyiko kwa mzigo wa kazi za AI

#### Sifa za Juu
- **Uendeshaji Otomatiki wa Mifereji ya AI**: Uunganishaji wa MLOps na mifereji ya Azure Machine Learning
- **Usalama wa Juu**: Mifano ya zero-trust, endpoints binafsi, na ulinzi wa vitisho wa juu
- **Uboreshaji wa Utendaji**: Mikakati ya kurekebisha na kupanua ya kiwango cha juu kwa programu za AI zenye kupitisha sana
- **Ugawaji wa Kima dunia**: Mifano ya utoaji wa yaliyomo na caching kwa edge kwa programu za AI

### Toleo 3.0.0 (Lilopangwa) - Limezidiwa na Toleo la Sasa
#### Mambo Yaliopendekezwa - Sasa Yatekelezwa katika v3.0.0
- ✅ **Yaliyomo Yanayojikita kwa AI**: Uunganishaji kamili na Microsoft Foundry (Imekamilika)
- ✅ **Mafunzo Yanayoshirikisha**: Maabara ya warsha ya vitendo ya AI (Imekamilika)
- ✅ **Moduli ya Usalama wa Juu**: Mifano ya usalama maalumu kwa AI (Imekamilika)
- ✅ **Uboreshaji wa Utendaji**: Mikakati ya kurekebisha mzigo wa AI (Imekamilika)

### Toleo 2.1.0 (Lilopangwa) - Zilizotekelezwa Sehemu katika v3.0.0
#### Maboresho Madogo - Baadhi Yamekamilika katika Toleo la Sasa
- ✅ **Mifano Zaidi**: Matukio ya uenezaji yanayojikita katika AI (Imekamilika)
- ✅ **FAQ Iliyongezwa**: Maswali maalumu ya AI na utatuzi wa matatizo (Imekamilika)
- **Uunganisho wa Zana**: Mwongozo ulioboreshwa wa uunganisho wa IDE na mhariri
- ✅ **Upanuzi wa Ufuatiliaji**: Mifano ya ufuatiliaji na arifa maalumu kwa AI (Imekamilika)

#### Bado Yapangwa kwa Toleo la Baadaye
- **Nyaraka Zenye Urafiki kwa Simu**: Ubunifu unaojibadilisha kwa kujifunza kwa simu
- **Ufikiaji Bila Mtandao**: Vifurushi vya nyaraka vinavyopatikana kwa kupakuliwa
- **Uunganisho Bora wa IDE**: Kiongezi cha VS Code kwa mtiririko wa kazi wa AZD + AI
- **Dashibodi ya Jamii**: Vipimo vya jamii kwa wakati halisi na ufuatiliaji wa michango

## Kuchangia kwenye Taarifa ya Mabadiliko

### Kuripoti Mabadiliko
Unapochangia kwenye hazina hii, tafadhali hakikisha kumbukumbu za mabadiliko zinajumuisha:

1. **Nambari ya Toleo**: Kufuatana na utendaji wa matoleo wa semantic (major.minor.patch)
2. **Tarehe**: Tarehe ya utoaji au masasisho kwa muundo YYYY-MM-DD
3. **Kategoria**: Imeongezwa, Imebadilishwa, Imepitwa na wakati, Imeondolewa, Imerekebishwa, Usalama
4. **Maelezo Wazi**: Maelezo mafupi ya kile kilichobadilika
5. **Tathmini ya Athari**: Jinsi mabadiliko yanavyoathiri watumiaji waliopo

### Makundi ya Mabadiliko

#### Imeongezwa
- Sifa mpya, sehemu za nyaraka, au uwezo mpya
- Mifano mipya, violezo, au rasilimali za kujifunza
- Zana za ziada, skripti, au huduma ndogo

#### Imebadilishwa
- Marekebisho ya kazi au nyaraka zilizopo
- Sasisho za kuboresha uwazi au usahihi
- Urejeshaji wa muundo wa yaliyomo au shirika

#### Imepitwa na Wakati
- Sifa au mbinu zinazokuwa zinapitwa na wakati
- Sehemu za nyaraka zilizopangwa kuondolewa
- Mbinu zilizo na mbadala bora

#### Imeondolewa
- Sifa, nyaraka, au mifano ambayo hayana uhusiano tena
- Taarifa zisizofaa au mbinu zilizopitwa na wakati
- Yaliyomo ya ziada au yaliyochanganishwa

#### Imerekebishwa
- Marekebisho ya makosa katika nyaraka au msimbo
- Uamuzi wa masuala au matatizo yaliyoripotiwa
- Maboresho ya usahihi au utendaji

#### Usalama
- Maboresho au marekebisho yanayohusiana na usalama
- Sasisho kwa mbinu bora za usalama
- Uamuzi wa udhaifu wa usalama

### Miongozo ya Semantic Versioning

#### Toleo Kuu (X.0.0)
- Mabadiliko yanayovunja yaliyohitaji hatua kutoka kwa mtumiaji
- Urejeshaji mkubwa wa muundo wa yaliyomo au shirika
- Mabadiliko yanayobadilisha mbinu au njia ya msingi

#### Toleo Ndogo (X.Y.0)
- Sifa mpya au nyongeza za yaliyomo
- Maboresho yanayohifadhi ulinganifu wa nyuma
- Mifano, zana, au rasilimali za ziada

#### Toleo la Marekebisho (X.Y.Z)
- Marekebisho ya mdudu na marekebisho
- Maboresho madogo kwa yaliyomo yaliopo
- Ufafanuzi na maboresho madogo

## Maoni na Mapendekezo ya Jamii

Tunahamasisha kwa moyo wote maoni ya jamii ili kuboresha rasilimali hii ya kujifunza:

### Jinsi ya Kutoa Maoni
- **Masuala ya GitHub**: Ripoti matatizo au pendekeza maboresho (masuala maalumu ya AI yanakaribishwa)
- **Mjadala wa Discord**: Shiriki mawazo na ungana na jamii ya Microsoft Foundry
- **Pull Requests**: Changia maboresho ya moja kwa moja kwa yaliyomo, hasa violezo na mwongozo wa AI
- **Discord ya Microsoft Foundry**: Shiriki katika channel #Azure kwa mijadala ya AZD + AI
- **Mijadala ya Jamii**: Shiriki katika mijadala pana ya waendelezaji wa Azure

### Makundi ya Maoni
- **Usahihi wa Yaliyomo ya AI**: Marekebisho ya taarifa za uunganishaji wa huduma za AI na uenezaji
- **Uzoefu wa Kujifunza**: Mapendekezo ya kuboresha mtiririko wa kujifunza kwa waendelezaji wa AI
- **Yaliyomo ya AI Yanayokosekana**: Maombi ya violezo, mifano, au mifumo ya ziada ya AI
- **Upatikanaji**: Maboresho kwa mahitaji mbalimbali ya kujifunza
- **Uunganisho wa Zana za AI**: Mapendekezo ya uunganisho bora wa mtiririko wa maendeleo ya AI
- **Mifano ya AI za Uzalishaji**: Maombi ya mifano ya uenezaji ya AI kwa kampuni

### Ahadi ya Kujibu
- **Majibu kwa Masuala**: Ndani ya masaa 48 kwa matatizo yaliyoripotiwa
- **Maombi ya Sifa**: Tathmini ndani ya wiki moja
- **Michango ya Jamii**: Mapitio ndani ya wiki moja
- **Masuala ya Usalama**: Kipaumbele cha papo hapo na mwitikio wa haraka

## Ratiba ya Matengenezo

### Sasisho za Mara kwa Mara
- **Mapitio ya Kila Mwezi**: Usahihi wa yaliyomo na uhakiki wa viungo
- **Sasisho za Robo Mwaka**: Nyongeza kubwa za yaliyomo na maboresho
- **Mapitio ya Nusu Mwaka**: Urekebishaji mpana wa muundo na uboreshaji
- **Utoaji wa Kila Mwaka**: Sasisho za toleo kuu zenye maboresho makubwa

### Ufuatiliaji na Usalama wa Ubora
- **Upimaji wa Otomatiki**: Uthibitishaji wa mara kwa mara wa mifano ya msimbo na viungo
- **Ujumuishaji wa Maoni ya Jamii**: Uingizwa wa mara kwa mara wa mapendekezo ya watumiaji
- **Sasisho za Teknolojia**: Ulinganifu na huduma za hivi karibuni za Azure na utoaji wa azd
- **Ukaguzi wa Upatikanaji**: Mapitio ya mara kwa mara kwa kanuni za muundo jumuishi

## Sera ya Usaidizi wa Matoleo

### Ustawi wa Toleo la Sasa
- **Toleo Kuu la Hivi Karibuni**: Msaada kamili na sasisho za mara kwa mara
- **Toleo Kuu la Awali**: Sasisho za usalama na marekebisho muhimu kwa miezi 12
- **Matoleo ya Kale**: Msaada wa jamii pekee, hakuna sasisho rasmi

### Mwongozo wa Uhamishaji
Wakati matoleo makuu yanapotolewa, tunatoa:
- **Viongozo vya Uhamishaji**: Maelekezo ya hatua kwa hatua ya mchakato wa kuhamia
- **Maelezo ya Ulinganifu**: Maelezo kuhusu mabadiliko yanayovunja
- **Msaada wa Zana**: Skripti au zana za kusaidia uhamishaji
- **Msaada wa Jamii**: Majukwaa maalum kwa maswali kuhusu uhamishaji

---

**Urambazaji**
- **Somo Lililopita**: [Mwongozo wa Kujifunza](resources/study-guide.md)
- **Somo Linalofuata**: Rudi kwenye [README Kuu](README.md)

**Endelea Kusasishwa**: Fuatilia hifadhi hii kwa arifa kuhusu matoleo mapya na masasisho muhimu ya nyenzo za kujifunzia.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutolea dhamana:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator] (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Nakala asilia ya nyaraka katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya kitaalamu inayofanywa na mtafsiri wa binadamu. Hatubebei lawama kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->