# Mabadiliko - AZD Kwa Waanzaji

## Utangulizi

Mabadiliko haya yanaandika mabadiliko yote muhimu, masasisho, na maboresho kwenye hazina ya AZD Kwa Waanzaji. Tunafuata kanuni za semantic versioning na tunahifadhi kumbukumbu hii kusaidia watumiaji kuelewa kilichobadilika kati ya toleo.

## Malengo ya Kujifunza

Kwa kupitia mabadiliko haya, utapokuwa:
- Umeendelea kujua kuhusu vipengele vipya na nyongeza za maudhui
- Kufahamu maboresho yaliyofanywa kwenye nyaraka zilizopo
- Kufuatilia marekebisho ya hitilafu na marekebisho kuhakikisha usahihi
- Kufuatilia mabadiliko ya vifaa vya kujifunzia kwa muda

## Matokeo ya Kujifunza

Baada ya kupitia kumbukumbu za mabadiliko, utaweza:
- Kutambua maudhui na rasilimali mpya zinazopatikana kwa kujifunza
- Kufahamu sehemu ambazo zimeboreshwa au kusasishwa
- Kupanga njia yako ya kujifunzia kwa kuzingatia nyenzo za kisasa zaidi
- Kuchangia maoni na mapendekezo kwa maboresho ya baadaye

## Historia ya Matoleo

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Toleo hili linatunga pengo za kati zilizobaki zilizoibuliwa na uchambuzi wa azd-coverage: jinsi ya kuunda na kuchapisha templeti yako mwenyewe, mazingira yanayoweza kuzalishwa tena ya dev-container/Codespaces, mtoaji wa miundombinu Pulumi, mwongozo wa Azure DevOps CI/CD, uthibitishaji wa service-principal, mwongozo wa uchaguaji wa mwenyeji (AKS/Spring Apps), maelezo ya `azd restore`/`azd package`, kushughulikia makosa ya hook, na mbinu za timu/mazingira ya pamoja.**

#### Imeongezwa
- **🧱 Somo Jipya Sura ya 4** `docs/chapter-04-infrastructure/custom-templates.md` — uandishi wa templeti yako ya azd: muundo unaohitajika (`azure.yaml`, `infra/`, `src/`), uwanja wa `metadata.template`, kuweka vigezo kwenye miundombinu kwa tokeni ya rasilimali `uniqueString()` na tagi `azd-env-name`, kujaribu ndani kwa kutumia `azd init --template <local-path>`, kuchapisha kwenye GitHub, na kuwasilisha kwenye gallery ya Awesome AZD
- **📦 Somo Jipya Sura ya 1** `docs/chapter-01-foundation/dev-containers.md` — mazingira ya azd yanayoweza kuzalishwa tena na Dev Containers na GitHub Codespaces: `.devcontainer/devcontainer.json` ndogo inayotumia feature rasmi `ghcr.io/azure/azure-dev/azd`, features maalum za lugha, `docker-in-docker` kwa mwenyeji wa container, na `azd auth login --use-device-code` kwa kuingia mbali
- **🧩 Pulumi na azd** sehemu katika `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, mpangilio wa folda za Pulumi, stacks zilizounganishwa na mazingira ya azd, outputs/tagging zinazohitajika, na mtiririko sawa wa `azd up` / `azd down`
- **🎯 Mwongozo wa uchaguzi wa mwenyeji** katika `docs/chapter-04-infrastructure/provisioning.md` — kulinganisha kirafiki kwa waanzaji kati ya `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, na `springapp`, na mwongozo wa lini kuchagua AKS au Azure Spring Apps
- **🛠️ Mwongozo wa Azure DevOps CI/CD** katika `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection na workload identity federation (OIDC), `azure-dev.yml` iliyoundwa, na upangaji wa variable-group
- **🔑 Service Principals (Pattern 4)** imeongezwa kwenye `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` isiyohitaji mwingiliano kwa client secret vs. cheti cha federated/OIDC, wakati wa kutumia, na uhifadhi salama wa nyaraka
- **🪝 Kushughulikia makosa ya Hook** chini ya sehemu katika `docs/chapter-04-infrastructure/deployment-guide.md` — codes za kutoka na `set -e`, `continueOnError`, kujaribu hooks kwa kujitegemea na `azd hooks run`, shells maalum za OS, na `--debug`
- **👥 Timu / mazingira ya pamoja** sehemu katika `docs/chapter-03-configuration/configuration.md` — nini kinaishi katika `.azure/`, nini cha kuweka kwenye gitignore, mazingira kwa msanidi mmoja mmoja, `azd env list`/`select`, na kutoa thamani za mazingira katika CI/CD
- **🧰 Maelezo ya `azd restore` na `azd package` iliyopanuliwa** katika `resources/cheat-sheet.md` — kurejesha utegemezi na kujenga kifaa kinachoweza kutumika bila kupeleka

#### Imebadilishwa
- **🧭 Jedwali la masomo Sura ya 4** limesasishwa kuongeza somo jipya "Authoring Your Own Template" (Somo la 3)
- **🧭 Jedwali la masomo Sura ya 1** limesasishwa kuongeza somo jipya "Dev Containers & Codespaces" (Somo la 5); miguso ya urambazaji imeunganishwa kati ya `bring-your-own-app.md` na `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Toleo hili linafunga mapengo makubwa kwa mwongozo kamili wa waanzaji kwa kuongeza masomo mawili ya vitendo (mwongozo wa multi-agent unaoweza kutumika na kuongeza azd kwenye programu iliyopo), utangulizi wa hooks kwa waanzaji, sehemu ya Terraform na azd, mwongozo wa hatua kwa hatua wa pipeline ya GitHub Actions, ufafanuzi wa extensions za preview mpya, na orodha ya ukaguzi ya uhakiki wa uenezaji.**

#### Imeongezwa
- **🤝 Somo Jipya Sura ya 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — mwongozo kamili wa vitendo unaoweza kutumika wa mawakala wawili (orchestrator + specialists) ukitumia templeti halisi (`contoso-creative-writer`), ukijumuisha wakati wa kutumia multi-agent, mtiririko wa `azd up`, kuelewa rasilimali zilizoenezwa, ufuatiliaji wa msalaba-agent, urekebishaji, na kusafisha
- **📦 Somo Jipya Sura ya 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jinsi ya kuongeza azd kwenye mradi uliopo kwa `azd init` ("use code in the current directory"), kuelewa `azure.yaml` na `infra/`, `azd infra generate`, utambuzi wa mwenyeji, na uenezaji kwa `azd up`
- **🌐 Terraform na azd** sehemu imeongezwa kwenye `docs/chapter-04-infrastructure/provisioning.md` — usanidi `infra.provider: terraform`, mpangilio wa folda `.tf`, outputs za lazima `AZURE_*` na tagging ya `azd-env-name`, na mtiririko sawa wa `azd up` / `azd down` (inafunga pengo ambapo msaada wa Terraform ulikuwa umetajwa lakini ulionyeshwa tu Bicep)
- **⚙️ Mwongozo wa hatua kwa hatua wa GitHub Actions** katika `docs/chapter-08-production/production-ai-practices.md` — kutoka repo ya GitHub hadi uenezaji wa kiotomatiki: `azd pipeline config`, cheti za federated za OIDC (hakuna siri zilizohifadhiwa), `azure-dev.yml` iliyoundwa, na mwongozo kuhusu siri vs. variables
- **🪝 Utangulizi kwa waanzaji "Je, Hujui kuhusu hooks?"** katika `docs/chapter-04-infrastructure/deployment-guide.md` — ni nini hook, jedwali la hatua za hook, hook ndogo ya kwanza, na kuendesha hooks kwa mkono na `azd hooks run`
- **✅ Orodha ya ukaguzi "Thibitisha Uenezaji Wako"** imeongezwa kwenye Hatua ya 5 ya `docs/chapter-01-foundation/first-project.md` — mtihani wa mkoa, ukaguzi wa endpoint ya afya, na vigezo wazi vya mafanikio
- **🧩 Ufafanuzi wa extensions za preview mpya** `azure.ai.skills` na `azure.ai.connections` (ni nini na lini kuzitumia) katika `docs/chapter-08-production/production-ai-practices.md`

#### Imebadilishwa
- **🧭 Jedwali la masomo Sura ya 5** limerekebishwa: `multi-agent-basics.md` sasa ni Somo la 1 (ndiyo somo pekee kabisa la vitendo), kwa lebo ya uaminifu kwamba Somo la 2 lipo Sura ya 6 na sehemu ya Retail ni mpango wa usanifu, sio templeti ya amri moja
- **🧭 Jedwali la masomo Sura ya 1** sasa linajumuisha somo jipya "Bring Your Own App" (Somo la 4)
- **🔗 Miguso ya urambazaji** imesasishwa: `first-project.md` sasa ina kiungo mbele kwenda `bring-your-own-app.md`

#### Imerekebishwa
- **🧱 Kufungwa kwa pengo la Terraform lililotajwa lakini lilikosekana** — kozi ilitaja msaada wa Terraform kabla bila kuonyesha
- **🔀 Marekebisho ya viungo vinavyodanganya Sura ya 5** vilivyopotosha kwamba utekelezaji kamili wa multi-agent ulikuwa umepo wakati kwa kweli ulikuwa tu mpango wa usanifu

#### Faili Zilizosasishwa
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(mpya)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(mpya)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Toleo hili linathibitisha tena kozi dhidi ya `azd` `1.25.6` (Juni 2026) na extension `azure.ai.agents` `0.1.40-preview`, linaongeza mwongozo wa AI kutoka "kuunda agent" hadi mzunguko kamili wa maisha ya agent (test → evaluate → optimize → inspect → delete), linaonyesha extensions mpya za preview `azure.ai.skills` na `azure.ai.connections`, na kutaja rebrand ya bidhaa ".NET Aspire" → "Aspire".**

#### Imeongezwa
- **🔁 Mwongozo kamili wa mzunguko wa maisha ya agent** kwa waanzaji na wahandisi wa AI kote nyaraka:
  - `docs/chapter-01-foundation/azd-basics.md` — Jedwali la Lifecycle (scaffold → test → measure → improve → inspect → clean up) limeongezwa kwenye sehemu ya Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Sehemu mpya "Managing the Agent Lifecycle" inashughulikia `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, na `delete --force`
  - `resources/cheat-sheet.md` — Amri za AI Agent zilizopanuliwa zikiwemo `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, na `delete --force`
- **🧩 Extensions mpya za preview** zilizodokumentwa: `azure.ai.skills` (ustadi wa agent unaoweza kutumika tena) na `azure.ai.connections` (Foundry connections) ziliongezwa kwenye jedwali la extensions na cheat sheet
- **⏱️ Mwongozo wa muda wa jibu** — mifano ya `azd ai agent invoke` sasa zinaonyesha kuwa inachapisha latency ya jumla na time-to-first-byte
- **📌 Bango la toleo** katika README ya mzizi likielekeza wanafunzi kwa `azd version` na `azd upgrade`

#### Imebadilishwa
- **✅ Msingi wa uthibitisho umesasishwa** kutoka `azd 1.23.12` (Machi 2026) hadi `azd 1.25.6` (Juni 2026) katika README zote za sura na nyaraka za warsha
- **🤖 Kumbusho la extension Sura ya 2** limesasishwa kutoka `azure.ai.agents` `0.1.18-preview` hadi `0.1.40-preview`
- **🧪 Mfano wa uthibitisho wa warsha** (`azd version` output) umesasishwa hadi `1.25.6`
- **🧭 README "What's New in azd Today"** imesafishwa ili kuangazia mzunguko wa maisha wa agent kutoka mwanzo mpaka mwisho, extensions mpya za AI, na marekebisho ya ubora wa maisha (`azd init` idempotency, `azd auth login` kusafisha tokeni zamani, `azd tool` onyo la mara ya kwanza)
- **📖 Sura ya 2 agents.md (Option 4)** sasa inaelekeza wanafunzi kwa amri za mzunguko wa maisha baada ya uenezaji badala ya kusitisha kwenye `azd up`

#### Imerekebishwa
- **🏷️ Uainishaji wa bidhaa** — iliongezwa noti ya rebrand ya Aspire (".NET Aspire" sasa ni "Aspire"); msaada wa azd kwa Aspire haujabadilika
- **🔎 Uthibitisho wa uzinduzi wa moja kwa moja** umefanywa dhidi ya feed ya uzinduzi ya Azure Developer CLI: CLI thabiti `1.25.6` (2026-06-12) na `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Faili Zilizosasishwa
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
#### Ufafanuzi wa Kuanzisha kwa Waanza, Uthibitishaji wa Mipangilio & Usafishaji wa Amri za AZD Mwisho
**Toleo hili linafuata ukaguzi wa uthibitishaji wa AZD 1.23 na mpigo wa nyaraka unaolenga wanaoanza: linafafanua mwongozo wa uthibitishaji unaopendelea AZD, linaongeza skripti za uthibitishaji za mipangilio ya eneo, linathibitisha amri muhimu dhidi ya CLI ya AZD hai, na linaondoa marejeleo ya mwisho ya amri za chanzo la Kiingereza zilizo tokea nje ya taarifa za mabadiliko.**

#### Imeongezwa
- **🧪 Skripti za uthibitishaji za mipangilio za wanaoanza** na `validate-setup.ps1` na `validate-setup.sh` ili wanaojifunza waweze kuthibitisha zana zinazohitajika kabla ya kuanza Sura ya 1
- **✅ Hatua za uthibitishaji za mipangilio mwanzoni** katika README ya mizizi na README ya Sura 1 ili mahitaji yaliyoikosekana yashikwe kabla ya `azd up`

#### Imebadilishwa
- **🔐 Mwongozo wa uthibitishaji kwa wanaoanza** sasa unatibu `azd auth login` kama njia kuu kwa mtiririko wa AZD, huku `az login` ikielezwa kama hiari isipokuwa amri za Azure CLI zitumike moja kwa moja
- **📚 Mtiririko wa kuanza Sura 1** sasa unaelekeza wanaojifunza kuthibitisha mipangilio yao ya eneo kabla ya usakinishaji, uthibitishaji, na hatua za kwanza za uwekaji
- **🛠️ Ujumbe wa mtihani** sasa unatofautisha kwa uwazi mahitaji yanayozuia kutoka kwa onyo la Azure CLI yanayohitajika kwa njia ya wanaoanza wanaotumia AZD pekee
- **📖 Nyaraka za usanidi, utatuzi wa matatizo, na mifano** sasa zinatofautisha kati ya uthibitishaji wa lazima wa AZD na kuingia kwa Azure CLI kwa hiari ambapo zote zilikuwa zikitolewa bila muktadha hapo awali

#### Imerekebishwa
- **📋 Marejeleo ya amri za chanzo la Kiingereza yaliyobaki** yameboreshwa kwa aina za sasa za AZD, ikijumuisha `azd config show` kwenye karatasi ya hila na `azd monitor --overview` pale mwongozo wa muhtasari wa Azure Portal ulikusudiwa
- **🧭 Mada za wanaoanza katika Sura 1** zimetulizwa ili kuepuka kutoa ahadi za kupunguza makosa au tabia ya kurudisha nyuma bila makosa kwa templeti na rasilimali za Azure zote
- **🔎 Uthibitishaji wa CLI hai** umethibitisha msaada wa sasa kwa `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, na `azd down --force --purge`

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

#### Uthibitishaji wa AZD 1.23.12, Upanuzi wa Mazingira ya Warsha & Uboreshaji wa Mfano wa AI
**Toleo hili linafanya ukaguzi wa nyaraka dhidi ya `azd` `1.23.12`, linasasisha mifano ya amri za AZD zilizozeeza, linaboresha mwongozo wa modeli za AI kwa chaguo-msingi za sasa, na linapanua maelekezo ya warsha ili kuunga mkono dev containers na nakala za eneo pamoja na GitHub Codespaces.**

#### Imeongezwa
- **✅ Vidokezo vya uthibitishaji katika sura kuu na nyaraka za warsha** ili kufanya wazi msingi uliothibitishwa wa AZD kwa wanaojifunza wanaotumia matoleo mapya au yaliyotumika ya CLI
- **⏱️ Mwongozo wa muda wa utekelezaji** kwa uenezaji wa programu za AI zinazochukua muda mrefu kwa kutumia `azd deploy --timeout 1800`
- **🔎 Hatua za ukaguzi wa upanuzi** na `azd extension show azure.ai.agents` katika nyaraka za mtiririko wa AI
- **🌐 Mwongozo mpana wa mazingira ya warsha** unaoshughulikia GitHub Codespaces, dev containers, na nakala za eneo kwa MkDocs

#### Imebadilishwa
- **📚 README za utangulizi za sura** sasa zinataja kwa uwazi uthibitisho dhidi ya `azd 1.23.12` katika sura za msingi, usanidi, miundombinu, multi-agent, kabla ya utekelezaji, utatuzi wa matatizo, na uzalishaji
- **🛠️ Marejeleo ya amri za AZD** yamebadilishwa kwa aina za sasa katika nyaraka:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` au `azd env get-value(s)` kulingana na muktadha
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` pale muhtasari wa Application Insights unapokusudiwa
- **🧪 Mifano ya onyesho la utoaji rasilimali** imerahisishwa kwa matumizi yanayotambulika sasa kama `azd provision --preview` na `azd provision --preview -e production`
- **🧭 Mtiririko wa warsha** umeboreshwa ili wanaojifunza waweze kumaliza maabara katika Codespaces, dev container, au nakala ya eneo badala ya kudhani utekelezaji ni Codespaces tu
- **🔐 Mwongozo wa uthibitishaji** sasa unapendelea `azd auth login` kwa mitiririko ya AZD, huku `az login` ikipangwa kama hiari wakati amri za Azure CLI zinatumiwa moja kwa moja

#### Imerekebishwa
- **🪟 Amri za usakinishaji za Windows** zimepangwa kwa herufi za sasa za `winget` katika mwongozo wa usakinishaji
- **🐧 Mwongozo wa usakinishaji wa Linux** umerekebishwa kuepuka maagizo ya meneja wa kifurushi ya azd ya distrosi zisizohusishwa na badala yake kuashiria mali za kutolewa pale inapofaa
- **📦 Mifano ya modeli za AI** imesasishwa kutoka chaguo za zamani kama `gpt-35-turbo` na `text-embedding-ada-002` hadi mifano ya sasa kama `gpt-4.1-mini`, `gpt-4.1`, na `text-embedding-3-large`
- **📋 Vibonye vya utekelezaji na udhibiti** vimerudishwa kutumia amri za mazingira na hali za sasa katika logi, skripti, na hatua za utatuzi
- **⚙️ Mwongozo wa GitHub Actions** umeboreshwa kutoka `Azure/setup-azd@v1.0.0` hadi `Azure/setup-azd@v2`
- **🤖 Mwongozo wa idhini ya MCP/Copilot** umebadilishwa kutoka `azd mcp consent` hadi `azd copilot consent list`

#### Imeboreshwa
- **🧠 Mwongozo wa sura ya AI** sasa unaelezea vizuri tabia ya onyesho ya `azd ai`, kuingia kwa tenant maalum, matumizi ya upanuzi wa sasa, na mapendekezo ya kupeleka modeli
- **🧪 Maelekezo ya warsha** sasa yanatumia mifano ya matoleo inayoweza kutokea na lugha ya mipangilio ya mazingira wazi kwa maabara ya vitendo
- **📈 Nyaraka za uzalishaji na utatuzi wa matatizo** sasa zinaendana vyema na ufuatiliaji wa sasa, modeli za dharura, na mifano ya ngazi ya gharama

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

#### Amri za AZD AI CLI, Uthibitishaji wa Yaliyomo & Upanuzi wa Templeti
**Toleo hili linaongeza ufunikaji wa `azd ai`, `azd extension`, na `azd mcp` katika sura zote zinazohusiana na AI, linarekebisha viungo vilivyovunjika na msimbo uliotumika uliopitwa katika agents.md, linasasisha karatasi ya hila, na linafanyia upya Sehemu ya Templeti za Mfano na maelezo yaliyothibitishwa na templeti mpya za Azure AI AZD.**

#### Imeongezwa
- **🤖 Ufunikaji wa AZD AI CLI** katika faili 7 (awali ilikuwa tu katika Sura 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Sehemu mpya "Extensions and AI Commands" inayotambulisha `azd extension`, `azd ai agent init`, na `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Chaguo la 4: `azd ai agent init` na meza ya kulinganisha (kitalu vs njia ya manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Viendelezi "AZD Extensions for Foundry" na vifungu vidogo "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Anza Haraka sasa inaonyesha njia za utekelezaji za template na manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sehemu ya Kuweka sasa inajumuisha chaguo la `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Kipengele "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Sehemu mpya "AI & Extensions Commands" ikiwa na `azd extension`, `azd ai agent init`, `azd mcp`, na `azd infra generate`
- **📦 Templeti mpya za mfano za AZD AI** katika `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Mazungumzo ya RAG ya .NET na Blazor WebAssembly, Semantic Kernel, na msaada wa mazungumzo ya sauti
  - **azure-search-openai-demo-java** — Mazungumzo ya RAG ya Java kutumia Langchain4J na chaguzi za uwekaji ACA/AKS
  - **contoso-creative-writer** — Programu ya uandishi wa ubunifu yenye wakala wengi ikitumia Azure AI Agent Service, Bing Grounding, na Prompty
  - **serverless-chat-langchainjs** — RAG isiyokuwa na seva ikitumia Azure Functions + LangChain.js + Cosmos DB na msaada wa maendeleo ya eneo la Ollama
  - **chat-with-your-data-solution-accelerator** — Kiendelezi cha RAG cha biashara yenye dashibodi ya msimamizi, ujumuishaji na Teams, na chaguo za PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Kiendelezi cha marejeleo cha urejeshaji wa MCP kwa wakala wengi na seva katika .NET, Python, Java, na TypeScript
  - **azd-ai-starter** — Templeti ya kuanzia ya miundombinu ya Azure AI Bicep
  - **🔗 Kiungo cha Galeri ya awesome-azd AI** — Marejeleo kwa [galeri ya awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (templeti 80+)

#### Imerekebishwa
- **🔗 Urambazaji wa agents.md**: Viungo vya Kati/Ifuatayo sasa vinaendana na mpangilio wa masomo wa README ya Sura 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Viungo vilivyovunjika vya agents.md**: `production-ai-practices.md` imerekebishwa kuwa `../chapter-08-production/production-ai-practices.md` (mara 3)
- **📦 Msimbo uliopitwa wa agents.md**: Imebadilishwa `opencensus` na `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API isiyoridhisha katika agents.md**: Imehamisha `max_tokens` kutoka `create_agent()` kwenda `create_run()` kama `max_completion_tokens`
- **🔢 Kuhesabu tokeni katika agents.md**: Imebadilisha makadirio ya `len//4` na `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Imeboreshwa huduma kutoka "Cognitive Search + App Service" hadi "Azure AI Search + Azure Container Apps" (mgeni chaguo-msingi ulibadilika Oktoba 2024)
- **contoso-chat**: Maelezo yameboreshwa kurejelea Azure AI Foundry + Prompty, ikilingana na kichwa na stack ya teknolojia ya repo

#### Imetatuliwa
- **ai-document-processing**: Imetolewa marejeleo ya templeti isiyoendeshwa (repo haipatikani hadharani kama templeti ya AZD)

#### Imeboreshwa
- **📝 Mazoezi ya agents.md**: Zoezi 1 sasa linaonyesha pato linalotarajiwa na hatua ya `azd monitor`; Zoezi 2 linajumuisha usajili kamili wa `FunctionTool`; Zoezi 3 limebadilisha mwongozo wa ukiritimba na maagizo ya `prepdocs.py` yenye uwazi
- **📚 Rasilimali za agents.md**: Viungo vya nyaraka vimeboreshwa kwa nyaraka za sasa za Azure AI Agent Service na mwongozo wa haraka
- **📋 Jedwali la Hatua zinazofuata za agents.md**: Limeongeza kiungo cha AI Workshop Lab kwa mwavuli wa sura kamili

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
**Toleo hili linaimarisha urambazaji wa sura kwenye README.md kwa muundo ulioboreshwa wa jedwali.**

#### Mabadiliko
- **Jedwali la Ramani ya Kozi**: Limeboreshwa na viungo vya moja kwa moja vya masomo, makadirio ya muda, na viwango vya ugumu
- **Usafishaji wa Saraka**: Folda za zamani zisizo za lazima zimetolewa (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Uthibitishaji wa Viungo**: Viungo vyote vya ndani 21+ kwenye jedwali la Ramani ya Kozi vimehakikiwa

### [v3.16.0] - 2026-02-05

#### Sasisho la Majina ya Bidhaa
**Toleo hili linasasisha marejeleo ya bidhaa kuendana na alama (branding) ya sasa ya Microsoft.**

#### Mabadiliko
- **Microsoft Foundry → Microsoft Foundry**: Marejeleo yote yamesasishwa katika faili zisizo za tafsiri
- **Azure AI Agent Service → Foundry Agents**: Jina la huduma limesasishwa kuakisi chapa ya sasa

#### Faili Zilisasishwa
- `README.md` - Ukurasa kuu la kuingia la kozi
- `changelog.md` - Historia ya matoleo
- `course-outline.md` - Muundo wa kozi
- `docs/chapter-02-ai-development/agents.md` - Mwongozo wa maajenti wa AI
- `examples/README.md` - Nyaraka za mifano
- `workshop/README.md` - Ukurasa wa kuingia wa warsha
- `workshop/docs/index.md` - Faharasa ya warsha
- `workshop/docs/instructions/*.md` - Faili zote za maelekezo za warsha

---

### [v3.15.0] - 2026-02-05

#### Ujenzi Upya Mkubwa wa Hazina: Majina ya Saraka Kulingana na Sura
**Toleo hili linapanga nyaraka upya katika saraka zilizotengwa kwa sura ili urambazaji uwe wazi zaidi.**

#### Majina ya Saraka Yaliyobadilishwa
Saraka za zamani zimebadilishwa na saraka zilizo na nambari za sura:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Uhamishaji wa Faili
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
- **📚 Faili za README za Sura**: Iliundwa README.md katika kila saraka ya sura zenye:
  - Malengo ya kujifunza na muda
  - Jedwali la masomo lenye maelezo
  - Amri za kuanza kwa haraka
  - Urambazaji kwa sura zingine

#### Mabadiliko
- **🔗 Viungo vyote vya ndani vimesasishwa**: Njia 78+ zimesasishwa katika faili zote za nyaraka
- **🗺️ Main README.md**: Ramani ya Kozi imesasishwa na muundo mpya wa sura
- **📝 examples/README.md**: Marejeleo ya kuvuka yamesasishwa kwa saraka za sura

#### Imetolewa
- Muundo wa zamani wa saraka (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Ujenzi Upya wa Hazina: Urambazaji wa Sura
**Toleo hili liliongeza faili za README za urambazaji wa sura (zilibadilishwa na v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Mwongozo Mpya wa Maajenti wa AI
**Toleo hili limeongeza mwongozo kamili wa kupeleka maajenti wa AI kwa kutumia Azure Developer CLI.**

#### Imeongezwa
- **🤖 docs/microsoft-foundry/agents.md**: Mwongozo kamili unaojumuisha:
  - Maajenti ya AI ni nini na wanavyotofautiana na chatbots
  - Violezo vitatu vya kuanza haraka vya maajenti (Foundry Agents, Prompty, RAG)
  - Mifumo ya usanifu wa maajenti (maajenti mmoja, RAG, maajenti wengi)
  - Usanidi wa zana na urekebishaji
  - Ufuatiliaji na ufuatiliaji wa vipimo
  - Mambo ya gharama na uboreshaji
  - Hali za kawaida za utatuzi wa matatizo
  - Mazoezi matatu ya vitendo yenye vigezo vya mafanikio

#### Muundo wa Yaliyomo
- **Utangulizi**: Dhana za maajenti kwa wanaoanza
- **Anza Haraka**: Peleka maajenti kwa `azd init --template get-started-with-ai-agents`
- **Mifumo ya Usanifu**: Michoro ya kuona ya mifumo ya maajenti
- **Usanidi**: Uwekaji wa zana na vigezo vya mazingira
- **Ufuatiliaji**: Muunganisho na Application Insights
- **Mazoezi**: Mafunzo ya vitendo yanayoongezeka (dakika 20-45 kila moja)

---

### [v3.12.0] - 2026-02-05

#### Sasisho la Mazingira ya DevContainer
**Toleo hili linasasisha usanidi wa kontena ya maendeleo kwa zana za kisasa na chaguo-msingi zilizo bora kwa uzoefu wa kujifunza AZD.**

#### Mabadiliko
- **🐳 Picha ya Msingi**: Imeboreshwa kutoka `python:3.12-bullseye` hadi `python:3.12-bookworm` (Debian thabiti ya hivi karibuni)
- **📛 Jina la Kontena**: Ilibadilishwa kutoka "Python 3" kwenda "AZD for Beginners" kwa uwazi

#### Imeongezwa
- **🔧 Vipengele Vipya vya Dev Container**:
  - `azure-cli` ikiwa na msaada wa Bicep uliwezeshwa
  - `node:20` (toleo la LTS kwa templeti za AZD)
  - `github-cli` kwa usimamizi wa templeti
  - `docker-in-docker` kwa uenezaji wa programu za kontena

- **🔌 Uhamishaji wa Bandari**: Bandari zilizopangwa awali kwa maendeleo ya kawaida:
  - 8000 (mapitio ya MkDocs)
  - 3000 (Programu za wavuti)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Viongezeo Vipya vya VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense ya Python iliyoimarishwa
  - `ms-azuretools.vscode-azurefunctions` - Msaada wa Azure Functions
  - `ms-azuretools.vscode-docker` - Msaada wa Docker
  - `ms-azuretools.vscode-bicep` - Msaada wa lugha ya Bicep
  - `ms-azure-devtools.azure-resource-groups` - Usimamizi wa rasilimali za Azure
  - `yzhang.markdown-all-in-one` - Uhariri wa Markdown
  - `DavidAnson.vscode-markdownlint` - Uangaliaji wa Markdown (linting)
  - `bierner.markdown-mermaid` - Msaada wa michoro ya Mermaid
  - `redhat.vscode-yaml` - Msaada wa YAML (kwa azure.yaml)
  - `eamodio.gitlens` - Uonyesho wa Git
  - `mhutchie.git-graph` - Historia ya Git

- **⚙️ Mipangilio ya VS Code**: Imeongeza mipangilio ya chaguo-msingi kwa tafsiri ya Python, umbizo wakati wa kuhifadhi, na kukata nafasi zisizohitajika

- **📦 requirements-dev.txt iliyosasishwa**:
  - Imeongeza kiendelezi cha MkDocs cha kupunguza ukubwa (minify)
  - Imeongeza pre-commit kwa ubora wa msimbo
  - Imeongeza vifurushi vya Azure SDK (azure-identity, azure-mgmt-resource)

#### Imerekebishwa
- **Amri ya Baada ya Kuunda**: Sasa inathibitisha usakinishaji wa AZD na Azure CLI wakati wa kuanzisha kontena

---

### [v3.11.0] - 2026-02-05

#### Marekebisho Makubwa ya README kwa Wanaoanza
**Toleo hili linaboresha kwa kiasi kikubwa README.md ili iwe rahisi kwa wanaoanza na linaongeza rasilimali muhimu kwa watengenezaji wa AI.**

#### Imeongezwa
- **🆚 Ulinganifu Azure CLI vs AZD**: Ufafanuzi wazi wa lini kutumia kila chombo pamoja na mifano ya vitendo
- **🌟 Viungo Bora vya AZD**: Viungo vya moja kwa moja kwa jumba la templeti la jamii na rasilimali za michango:
  - [Makusanyo Bora ya AZD](https://azure.github.io/awesome-azd/) - templeti 200+ tayari-kupeleka
  - [Wasilisha Templeti](https://github.com/Azure/awesome-azd/issues) - Michango ya jamii
- **🎯 Mwongozo wa Kuanzia Haraka**: Sehemu iliyorahishwa ya hatua 3 za kuanza (Sakinisha → Ingia → Peleka)
- **📊 Jedwali la Urambazaji Kulingana na Uzoefu**: Mwongozo wazi juu ya wapi kuanza kulingana na uzoefu wa msanidi

#### Mabadiliko
- **Muundo wa README**: Umeandaliwa upya kwa kufichua hatua kwa hatua - taarifa muhimu kwanza
- **Sehemu ya Utangulizi**: Imeandikwa upya kuelezea 'Uchawi wa `azd up`' kwa wanaoanza kabisa
- **Kuondolewa kwa Yaliyofanana Mara Mbili**: Imeondoa sehemu ya utatuzi wa matatizo iliyorudiwa
- **Amri za Utatuzi wa Matatizo**: Imerekebisha rejeleo la `azd logs` kutumia `azd monitor --logs`

#### Imerekebishwa
- **🔐 Amri za Uthibitishaji**: Imeongeza `azd auth login` na `azd auth logout` kwenye cheat-sheet.md
- **Rejeleo la Amri zisizo Halali**: Imeondoa `azd logs` iliyobaki kutoka sehemu ya utatuzi wa README

#### Vidokezo
- **Wigo**: Mabadiliko yamewekwa kwenye README.md kuu na resources/cheat-sheet.md
- **Walengwa**: Maboresho yanayolenga hasa watengenezaji wapya wa AZD

---

### [v3.10.0] - 2026-02-05

#### Sasisho la Usahihi wa Amri za Azure Developer CLI
**Toleo hili linarekebisha amri za AZD zisizokuwepo katika nyaraka zote, likihakikisha mifano yote ya msimbo inatumia sintaksia halali ya Azure Developer CLI.**

#### Imerekebishwa
- **🔧 Amri za AZD Zisizopo Zimeondolewa**: Ukaguzi wa kina na marekebisho ya amri zisizo halali:
  - `azd logs` (haipo) → zilibadilishwa na `azd monitor --logs` au mbadala za Azure CLI
  - `azd service` subcommands (hazipo) → zilibadilishwa kwa `azd show` na Azure CLI
  - `azd infra import/export/validate` (hazipo) → zimeondolewa au zilibadilishwa kwa mbadala sahihi
  - Mabendera ya `azd deploy --rollback/--incremental/--parallel/--detect-changes` (hayapo) → yameondolewa
  - Mabendera ya `azd provision --what-if/--rollback` (hayapo) → yamebadilishwa kutumia `--preview`
  - `azd config validate` (haipo) → zilibadilishwa kwa `azd config list`
  - `azd info`, `azd history`, `azd metrics` (hayapo) → yameondolewa

- **📚 Faili Zilisasishwa kwa Marekebisho ya Amri**:
  - `resources/cheat-sheet.md`: Mageuzi makubwa ya rejeleo la amri
  - `docs/deployment/deployment-guide.md`: Imerekebisha mikakati ya rollback na uenezaji
  - `docs/troubleshooting/debugging.md`: Imeboresha sehemu za uchambuzi wa kumbukumbu
  - `docs/troubleshooting/common-issues.md`: Amri za utatuzi wa matatizo zimesasishwa
  - `docs/troubleshooting/ai-troubleshooting.md`: Sehemu ya utambuzi ya AZD imerekebishwa
  - `docs/getting-started/azd-basics.md`: Amri za ufuatiliaji zimerekebishwa
  - `docs/getting-started/first-project.md`: Mifano ya ufuatiliaji na utambuzi yamesasishwa
  - `docs/getting-started/installation.md`: Mifano ya msaada na toleo imerekebishwa
  - `docs/pre-deployment/application-insights.md`: Amri za kuangalia magogo zimekamilishwa
  - `docs/pre-deployment/coordination-patterns.md`: Amri za kutambua maajenti imerekebishwa

#### Mabadiliko
- **Mikakati ya Rollback**: Nyaraka zimesasishwa kutumia rollback inayotegemea Git (AZD haina rollback ya asili)
- **Kuangalia Magogo**: Rejeleo la `azd logs` limebadilishwa kwa `azd monitor --logs`, `azd monitor --live`, na amri za Azure CLI
- **Sehemu ya Utendaji**: Imeondoa mabendera yasiyo ya kweli ya deployment parallel/incremental, na kuleta mbadala sahihi

#### Maelezo ya Kiufundi
- **Amri Halali za AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Mbendera halali za azd monitor**: `--live`, `--logs`, `--overview`
- **Vipengele Vilivyondolewa**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Vidokezo
- **Uthibitisho**: Amri zimehakikiwa dhidi ya Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Kukamilika kwa Warsha na Sasisho la Ubora wa Nyaraka
**Toleo hili linakamilisha moduli za warsha zinazoingiliana, linarekebisha viungo vyote vya nyaraka vilivyovunjika, na linaboresha ubora wa ujumbe kwa watengenezaji wa AI wanaotumia Microsoft AZD.**

#### Imeongezwa
- **📝 CONTRIBUTING.md**: Hati mpya ya miongozo ya michango ikiwa na:
  - Maelekezo wazi ya kuripoti matatizo na kupendekeza mabadiliko
  - Viwango vya nyaraka kwa maudhui mapya
  - Mwongozo wa mifano ya msimbo na tamaduni za ujumbe wa commit
  - Taarifa za ushirikiano wa jamii

#### Imekamilika
- **🎯 Moduli ya Warsha 7 (Hitimisho)**: Moduli ya hitimisho imekamilika kikamilifu na:
  - Muhtasari kamili wa mafanikio ya warsha
  - Sehemu ya dhana kuu zilizofanikiwa ikijumuisha AZD, templeti, na Microsoft Foundry
  - Mapendekezo ya kuendelea kwa safari ya kujifunza
  - Mazoezi ya changamoto za warsha yenye viwango vya ugumu
  - Maoni ya jamii na viungo vya msaada

- **📚 Moduli ya Warsha 3 (Kuvunja Kazi)**: Malengo ya kujifunza yamesasishwa na:
  - Mwongozo wa uanzishaji wa GitHub Copilot na seva za MCP
  - Ufahamu wa muundo wa folda za templeti za AZD
  - Mifumo ya uandaji ya Infrastructure-as-code (Bicep)
  - Maelekezo ya maabara ya vitendo

- **🔧 Moduli ya Warsha 6 (Uondoshaji)**: Imekamilika na:
  - Malengo ya kusafisha rasilimali na usimamizi wa gharama
  - Matumizi ya `azd down` kwa uondoaji salama wa miundombinu
  - Mwongozo wa urejeshaji wa huduma za cognitive zilizofutwa kwa upole
  - Mawazo ya ziada ya uchunguzi kwa GitHub Copilot na Azure Portal

#### Imerekebishwa
- **🔗 Urekebishaji wa Viungo Vilivyovunjika**: Imeleta suluhisho kwa viungo 15+ vilivyovunjika ndani ya nyaraka:
  - `docs/ai-foundry/ai-model-deployment.md`: Ilirekebisha njia za microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ilirekebisha njia za ai-model-deployment.md na production-ai-practices.md
  - `docs/getting-started/first-project.md`: Ilibadilisha cicd-integration.md isiyopo na deployment-guide.md
  - `examples/retail-scenario.md`: Ilirekebisha njia za maswali yanayoulizwa mara kwa mara na mwongozo wa utatuzi
  - `examples/container-app/microservices/README.md`: Ilirekebisha njia za ukurasa wa kozi na mwongozo wa utekelezaji
  - `resources/faq.md` na `resources/glossary.md`: Imesasisha rejea za sura za AI
  - `course-outline.md`: Ilirekebisha mwongozo wa mwalimu na rejea za maabara ya warsha ya AI

- **📅 Bango la Hali ya Warsha**: Imesasishwa kutoka "Under Construction" hadi hali ya warsha iliyopo na tarehe Februari 2026

- **🔗 Urambazaji wa Warsha**: Imerekebisha viungo vya urambazaji vilivyovunjika katika README.md ya warsha vilivyoelekeza kwenye folda isiyokuwepo lab-1-azd-basics

#### Imabadilishwa
- **Uwasilishaji wa Warsha**: Imeondoa onyo la "under construction", warsha sasa imekamilika na iko tayari kutumika
- **Ulinganifu wa Urambazaji**: Imehakikisha moduli zote za warsha zina urambazaji sahihi kati ya moduli
- **Marejeo ya Njia ya Kujifunza**: Imesasisha rejea za sura kati ya sura ili kutumia njia sahihi za microsoft-foundry

#### Imethibitishwa
- ✅ Faili zote za markdown za Kiingereza zina viungo vya ndani vilivyo halali
- ✅ Moduli za warsha 0-7 zimekamilika na malengo ya kujifunza
- ✅ Urambazaji kati ya sura na moduli unafanya kazi ipasavyo
- ✅ Yaliyomo yanafaa kwa watengenezaji wa AI wanaotumia Microsoft AZD
- ✅ Lugha na muundo rafiki kwa wanaoanza vimehifadhiwa kote
- ✅ CONTRIBUTING.md inatoa mwongozo wazi kwa wachangiaji wa jamii

#### Utekelezaji wa Kiufundi
- **Uthibitishaji wa Viungo**: Script ya PowerShell iliyojumuishwa iliothomati ilithibitisha viungo vyote vya .md vya ndani
- **Ukaguzi wa Maudhui**: Mapitio ya mikono ya ukamilifu wa warsha na ufanisi kwa wanaoanza
- **Mfumo wa Urambazaji**: Mifumo thabiti ya urambazaji wa sura na moduli zimetumika

#### Vidokezo
- **Eneo la utekelezaji**: Mabadiliko yamewekwa kwa nyaraka za Kiingereza pekee
- **Tafsiri**: Folda za tafsiri hazijasasishwa katika toleo hili (tafsiri ya moja kwa moja italingana baadaye)
- **Muda wa Warsha**: Warsha kamili sasa inatoa masaa 3-4 ya mafunzo ya vitendo

---

### [v3.8.0] - 2025-11-19

#### Nyaraka za Juu: Ufuatiliaji, Usalama, na Mifumo ya Wakala Wengi
**Toleo hili linaongezea masomo kamili ya A-grade juu ya muunganisho wa Application Insights, mifumo ya uthibitishaji, na uratibu wa wakala wengi kwa utoaji wa uzalishaji.**

#### Imeongezwa
- **📊 Somo la Muunganisho wa Application Insights**: katika `docs/pre-deployment/application-insights.md`:
  - Utekelezaji uliolenga AZD na utoaji wa rasilimali wa moja kwa moja
  - Templeti kamili za Bicep kwa Application Insights + Log Analytics
  - Programu za Python zinazofanya kazi zenye telemetry maalum (mistari 1,200+)
  - Mifumo ya ufuatiliaji ya AI/LLM (uisimamizi wa tokeni/gharama za Microsoft Foundry Models)
  - Michoro 6 ya Mermaid (usanifu, ufuatiliaji wa mgawiko, mtiririko wa telemetry)
  - Mazoezi 3 ya vitendo (arifa, dashibodi, ufuatiliaji wa AI)
  - Mifano ya maswali ya Kusto na mikakati ya uboreshaji wa gharama
  - Utangazaji wa vipimo vya moja kwa moja na utatuzi wa hitilafu kwa wakati halisi
  - Muda wa kujifunza wa dakika 40-50 na mifumo inayostahili uzalishaji

- **🔐 Somo la Mifumo ya Uthibitishaji & Usalama**: katika `docs/getting-started/authsecurity.md`:
  - Mifumo 3 ya uthibitishaji (connection strings, Key Vault, managed identity)
  - Templeti kamili za miundombinu za Bicep kwa utoaji salama
  - Msimbo wa programu ya Node.js yenye muingiliano wa Azure SDK
  - Mazoezi 3 kamili (wezeshaji managed identity, user-assigned identity, mzunguko wa Key Vault)
  - Mbinu bora za usalama na usanidi wa RBAC
  - Mwongozo wa utatuzi wa matatizo na uchambuzi wa gharama
  - Mifumo ya uthibitishaji bila nywila inayostahili uzalishaji

- **🤖 Somo la Mifumo ya Uratibu wa Wakala Wengi**: katika `docs/pre-deployment/coordination-patterns.md`:
  - Mifumo 5 ya uratibu (mfululizo, sambamba, ya tabaka, inayotokana na matukio, makubaliano)
  - Utekelezaji kamili wa huduma ya orkestrator (Python/Flask, mistari 1,500+)
  - Utekelezaji wa mawakala 3 maalum (Mtafiti, Mwandishi, Mhariri)
  - Uunganisho wa Service Bus kwa foleni ya ujumbe
  - Usimamizi wa hali wa Cosmos DB kwa mifumo iliyogawanywa
  - Michoro 6 ya Mermaid inayoonyesha mwingiliano wa mawakala
  - Mazoezi 3 ya juu (ushughulikiaji wa timeout, mantiki ya jaribio tena, circuit breaker)
  - Ugawaji wa gharama ($240-565/mwezi) pamoja na mikakati ya uboreshaji
  - Muunganisho wa Application Insights kwa ufuatiliaji

#### Imboreshwa
- **Sura ya Kabla ya Utekelezaji**: Sasa inajumuisha ufuatiliaji kamili na mifumo ya uratibu
- **Sura ya Kuanzia**: Imeboreshwa na mifumo ya kitaalamu ya uthibitishaji
- **Ustahili wa Uzalishaji**: Ufuniko kamili kutoka usalama hadi uboreshaji wa uonekano
- **Mpango wa Kozi**: Imesasishwa ili kurejea masomo mapya katika Sura 3 na 6

#### Imabadilishwa
- **Mchakato wa Kujifunza**: Uunganisho bora wa usalama na ufuatiliaji ndani ya kozi
- **Ubora wa Nyaraka**: Viwango vya A-grade (95-97%) vimetumika kwa masomo mapya
- **Mifumo ya Uzalishaji**: Ufuniko kamili kwenda mwisho kwa utoaji wa kampuni

#### Imeboreshwa
- **Uzoefu wa Mwanaendelezaji**: Njia wazi kutoka maendeleo hadi ufuatiliaji wa uzalishaji
- **Viwango vya Usalama**: Mifumo ya kitaalamu kwa uthibitishaji na usimamizi wa siri
- **Uonekano**: Muunganisho kamili wa Application Insights na AZD
- **Mzigo wa AI**: Ufuatiliaji maalum kwa Microsoft Foundry Models na mifumo ya wakala wengi

#### Imethibitishwa
- ✅ Masomo yote yana msimbo wa kazi kamili (si snippets)
- ✅ Michoro ya Mermaid kwa kujifunza kwa kuona (jumla 19 katika masomo 3)
- ✅ Mazoezi ya vitendo na hatua za uthibitisho (jumla 9)
- ✅ Templeti za Bicep ziko tayari kwa uzalishaji zinazoweza kutumika kupitia `azd up`
- ✅ Uchambuzi wa gharama na mikakati ya uboreshaji
- ✅ Mwongozo wa utatuzi wa matatizo na mbinu bora
- ✅ Vidokezo vya maarifa na amri za uthibitisho

#### Matokeo ya Upimaji wa Nyaraka
- **docs/pre-deployment/application-insights.md**: - Mwongozo wa ufuatiliaji kamili
- **docs/getting-started/authsecurity.md**: - Mifumo ya usalama ya kitaalamu
- **docs/pre-deployment/coordination-patterns.md**: - Mifumo ya juu ya usanifu wa wakala wengi
- **Yaliyomo Mapya kwa Jumla**: - Viwango vya ubora vinavyolingana

#### Utekelezaji wa Kiufundi
- **Application Insights**: Log Analytics + telemetry maalum + ufuatiliaji wa mgawiko
- **Uthibitishaji**: Managed Identity + Key Vault + mifumo ya RBAC
- **Wakala Wengi**: Service Bus + Cosmos DB + Container Apps + orkestrasyon
- **Ufuatiliaji**: Vipimo vya moja kwa moja + maswali ya Kusto + arifa + dashibodi
- **Usimamizi wa Gharama**: Mikakati ya sampuli, sera za uhifadhi, udhibiti wa bajeti

### [v3.7.0] - 2025-11-19

#### Maboresho ya Ubora wa Nyaraka na Mfano Mpya wa Microsoft Foundry Models
**Toleo hili linaboreshwa ubora wa nyaraka katika hazina yote na linaongeza mfano kamili wa utekelezaji wa Microsoft Foundry Models kwa gpt-4.1 chat interface.**

#### Imeongezwa
- **🤖 Mfano wa Mazungumzo wa Microsoft Foundry Models**: Utekelezaji kamili wa gpt-4.1 katika `examples/azure-openai-chat/`:
  - Miundombinu kamili ya Microsoft Foundry Models (utekelezaji wa modeli gpt-4.1)
  - Kiolesura cha mazungumzo cha Python kwa njia ya mistari ya amri na historia ya mazungumzo
  - Muunganisho wa Key Vault kwa uhifadhi salama wa funguo za API
  - Ufuatiliaji wa matumizi ya tokeni na makadirio ya gharama
  - Kuzuia mwendo wa ombi na utunzaji wa makosa
  - README kamili yenye mwongozo wa utekelezaji wa dakika 35-45
  - Faili 11 ziko tayari kwa uzalishaji (templeti za Bicep, programu ya Python, usanidi)
- **📚 Mazoezi ya Nyaraka**: Imeongezwa mazoezi ya vitendo kwenye mwongozo wa usanidi:
  - Zoef 1: Usanidi wa mazingira mengi (dakika 15)
  - Zoef 2: Mazoezi ya usimamizi wa siri (dakika 10)
  - Vigezo vya mafanikio na hatua za uthibitisho
- **✅ Uthibitisho wa Utekelezaji**: Imeongezwa sehemu ya uthibitisho kwenye mwongozo wa utekelezaji:
  - Taratibu za ukaguzi wa afya
  - Orodha ya vigezo vya mafanikio
  - Matokeo yanayotarajiwa kwa amri zote za utekelezaji
  - Marejeo ya haraka ya utatuzi wa matatizo

#### Imeboreshwa
- **examples/README.md**: Imesasishwa hadi ubora wa A (93%):
  - Imeongeza azure-openai-chat katika sehemu zote muhimu
  - Imeongeza idadi ya mifano ya ndani kutoka 3 hadi 4
  - Imeongezwa kwenye Jedwali la Mifano ya Maombi ya AI
  - Imeingizwa katika Mwongozo wa Kuanzisha kwa Watumiaji wa Kati
  - Imeongezwa katika Sehemu ya Templeti za Microsoft Foundry
  - Imesasishwa Matini ya Ulinganishaji na sehemu za uvumbuzi wa teknolojia
- **Ubora wa Nyaraka**: Uliboreshwa kutoka B+ (87%) → A- (92%) katika folda ya docs:
  - Imeongeza matokeo yanayotarajiwa kwa mifano ya amri muhimu
  - Imejumuisha hatua za uthibitisho kwa mabadiliko ya usanidi
  - Imesanifu mafunzo ya vitendo kwa mazoezi ya vitendo

#### Imabadilishwa
- **Mchakato wa Kujifunza**: Uunganisho bora wa mifano ya AI kwa wanaojifunza wa kati
- **Muundo wa Nyaraka**: Mazoezi yenye matokeo ya vitendo zaidi
- **Mchakato wa Uthibitisho**: Vigezo vya mafanikio viliongezwa kwa mifumo muhimu

#### Imeboreshwa
- **Uzoefu wa Mwanaendelezaji**: Utekelezaji wa Microsoft Foundry Models sasa unachukua dakika 35-45 (vs 60-90 kwa mbadala tata)
- **Uwaziaji wa Gharama**: Makadirio wazi ya gharama ($50-200/mwezi) kwa mfano wa Microsoft Foundry Models
- **Njia ya Kujifunza**: Watengenezaji wa AI wana sehemu wazi ya kuingia na azure-openai-chat
- **Viwango vya Nyaraka**: Matokeo yanayotarajiwa na hatua za uthibitisho zimewekwa kwa ustadi

#### Imethibitishwa
- ✅ Mfano wa Microsoft Foundry Models unafanya kazi kikamilifu na `azd up`
- ✅ Faili zote 11 za utekelezaji zina sarufi sahihi
- ✅ Maelekezo ya README yanalingana na uzoefu halisi wa utekelezaji
- ✅ Viungo vya nyaraka vimesasishwa katika maeneo 8+
- ✅ Faharisi ya mifano inaonyesha mfano 4 wa ndani
- ✅ Hakuna viungo vya nje vinavyorudiwa katika meza
- ✅ Rejea za urambazaji zote ni sahihi

#### Utekelezaji wa Kiufundi
- **Miundo ya Microsoft Foundry Models**: gpt-4.1 + Key Vault + mfano wa Container Apps
- **Usalama**: Managed Identity tayari, siri katika Key Vault
- **Ufuatiliaji**: Muunganisho wa Application Insights
- **Usimamizi wa Gharama**: Ufuatiliaji wa tokeni na uboreshaji wa matumizi
- **Utekelezaji**: Amri moja `azd up` kwa usanidi kamili

### [v3.6.0] - 2025-11-19

#### Sasisho Kuu: Mifano ya Utekelezaji wa Programu za Kontena
**Toleo hili linaweka mifano kamili, tayari kwa uzalishaji ya utekelezaji wa programu za kontena kwa kutumia Azure Developer CLI (AZD), pamoja na nyaraka kamili na ujumuishaji katika njia ya kujifunza.**

#### Imeongezwa
- **🚀 Mifano ya Programu za Kontena**: Mifano mpya ya ndani katika `examples/container-app/`:
  - [Mwongozo Mkuu](examples/container-app/README.md): Muhtasari kamili wa utekelezaji wa kontena, anza haraka, uzalishaji, na mifumo ya juu
  - [API Rahisi ya Flask](../../examples/container-app/simple-flask-api): API ya REST rafiki kwa wanaoanza yenye scale-to-zero, vipimo vya afya, ufuatiliaji, na utatuzi wa matatizo
  - [Usanifu wa Microservices](../../examples/container-app/microservices): Utekelezaji wa huduma nyingi tayari kwa uzalishaji (API Gateway, Product, Order, User, Notification), ujumbe usio wa moja kwa moja, Service Bus, Cosmos DB, Azure SQL, ufuatiliaji wa mgawiko, utoaji wa blue-green/canary
- **Mbinu Bora**: Usalama, ufuatiliaji, uboreshaji wa gharama, na mwongozo wa CI/CD kwa mzigo wa kazi wenye kontena
- **Mifano ya Msimbo**: `azure.yaml` kamili, templeti za Bicep, na utekelezaji wa huduma kwa lugha nyingi (Python, Node.js, C#, Go)
- **Upimaji & Utatuzi wa Matatizo**: Senario za mtihani kutoka mwisho hadi mwisho, amri za ufuatiliaji, mwongozo wa utatuzi wa matatizo

#### Imabadilishwa
- **README.md**: Imesasishwa ili kuonyesha na kuunganisha mifano mpya ya programu za kontena chini ya "Local Examples - Container Applications"
- **examples/README.md**: Imesasishwa kuangazia mifano ya programu za kontena, kuongeza vitu kwa jedwali la kulinganisha, na kusasisha rejea za teknolojia/usanifu
- **Mpango wa Kozi & Mwongozo wa Masomo**: Imesasishwa ili kurejea mifano mpya ya programu za kontena na mifumo ya utekelezaji katika sura zinazofaa

#### Imethibitishwa
- ✅ Mifano yote mipya inaweza kutekelezwa kwa `azd up` na inafuata mbinu bora
- ✅ Viungo vya nyaraka na urambazaji vimesasishwa
- ✅ Mifano inashughulikia hali za mwanzo hadi juu, ikiwa ni pamoja na microservices kwa uzalishaji

#### Vidokezo
- **Eneo la utekelezaji**: Nyaraka za Kiingereza na mifano pekee
- **Hatua zinazofuata**: Kuongeza mifumo ya juu ya kontena na automatisering ya CI/CD katika toleo zijazo

### [v3.5.0] - 2025-11-19

#### Ubadilishaji wa Jina la Bidhaa: Microsoft Foundry
**Toleo hili linautekeleza mabadiliko kamili ya jina la bidhaa kutoka "Microsoft Foundry" hadi "Microsoft Foundry" katika nyaraka zote za Kiingereza, kuakisi ubadilishaji rasmi wa chapa ya Microsoft.**

#### Imabadilishwa
- **🔄 Sasisho la Jina la Bidhaa**: Ubadilishaji kamili kutoka "Microsoft Foundry" hadi "Microsoft Foundry"
  - Imesasisha rejea zote katika nyaraka za Kiingereza katika folda `docs/`
  - Imeunda upya folda: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Jina la faili lilibadilishwa: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumla: marejeleo 23 ya yaliyomo yamesasishwa katika faili 7 za nyaraka

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` ilibadilishwa kuwa `docs/microsoft-foundry/`
  - Marejeleo yote ya msalaba yamesasishwa ili kuakisi muundo mpya wa folda
  - Viungo vya urambazaji vimehakikishiwa katika nyaraka zote

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Viungo vyote vya ndani vimesasishwa kurejea jina jipya la faili

#### Faili Zilisasishwa
- **Nyaraka za Sura** (faili 7):
  - `docs/microsoft-foundry/ai-model-deployment.md` - masasisho 3 ya viungo vya urambazaji
  - `docs/microsoft-foundry/ai-workshop-lab.md` - marejeleo 4 ya jina la bidhaa yamesasishwa
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Tayari inatumia Microsoft Foundry (kutokana na masasisho ya awali)
  - `docs/microsoft-foundry/production-ai-practices.md` - marejeleo 3 yamesasishwa (muhtasari, maoni ya jumuiya, nyaraka)
  - `docs/getting-started/azd-basics.md` - viungo 4 vya msalaba vimesasishwa
  - `docs/getting-started/first-project.md` - viungo 2 vya urambazaji wa sura vimesasishwa
  - `docs/getting-started/installation.md` - viungo 2 vya sura inayofuata vimesasishwa
  - `docs/troubleshooting/ai-troubleshooting.md` - marejeleo 3 yamesasishwa (urambazaji, jumuiya ya Discord)
  - `docs/troubleshooting/common-issues.md` - kiungo 1 cha urambazaji kimesasishwa
  - `docs/troubleshooting/debugging.md` - kiungo 1 cha urambazaji kimesasishwa

- **Faili za Muundo wa Kozi** (faili 2):
  - `README.md` - marejeleo 17 yamesasishwa (muhtasari wa kozi, vichwa vya sura, sehemu ya templates, maarifa ya jumuiya)
  - `course-outline.md` - marejeleo 14 yamesasishwa (muhtasari, malengo ya kujifunza, rasilimali za sura)

#### Imethibitishwa
- ✅ Hakuna marejeleo ya njia ya folda "ai-foundry" yaliyobaki katika nyaraka za Kiingereza
- ✅ Hakuna marejeleo ya jina la bidhaa "Microsoft Foundry" yaliyobaki katika nyaraka za Kiingereza
- ✅ Viungo vyote vya urambazaji vinafanya kazi na muundo mpya wa folda
- ✅ Marejesho ya faili na folda yametekelezwa kwa mafanikio
- ✅ Marejeleo ya msalaba kati ya sura yamehakikishwa

#### Vidokezo
- **Eneo**: Mabadiliko yalitekelezwa kwa nyaraka za Kiingereza pekee ndani ya folda `docs/`
- **Tafsiri**: Folda za tafsiri (`translations/`) hazijasasishwa katika toleo hili
- **Warsha**: Vifaa vya warsha (`workshop/`) havijasasishwa katika toleo hili
- **Mifano**: Faili za mfano zinaweza bado kutaja majina ya zamani (zitatatizwa katika sasisho lijalo)
- **Viungo vya Nje**: URL za nje na marejeleo ya ghala la GitHub zimesalia bila mabadiliko

#### Mwongozo wa Uhamishaji kwa Wachangiaji
Ikiwa una matawi ya eneo (local branches) au nyaraka zinazorejea muundo wa zamani:
1. Sasisha marejeleo ya folda: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Sasisha marejeleo ya faili: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Badilisha jina la bidhaa: "Microsoft Foundry" → "Microsoft Foundry"
4. Thibitisha kuwa viungo vyote vya ndani vya nyaraka bado vinafanya kazi

---

### [v3.4.0] - 2025-10-24

#### Maboresho ya Awali ya Miundombinu na Uthibitishaji
**Toleo hili linaanzisha msaada kamili kwa kipengele kipya cha awali (preview) cha Azure Developer CLI na kuboresha uzoefu wa mtumiaji wa warsha.**

#### Imeongezwa
- **🧪 azd provision --preview Feature Documentation**: Ufunuo kamili wa uwezo mpya wa awali wa miundombinu
  - Marejeleo ya amri na mifano ya matumizi kwenye karatasi ya mwongozo
  - Uunganisho wa kina katika mwongozo wa upangaji na matumizi na faida zake
  - Uunganisho wa ukaguzi wa kabla ya ndege (pre-flight) kwa uthibitishaji salama wa utoaji
  - Sasisho za mwongozo wa kuanza zenye mbinu za kuweka usalama kwanza katika utoaji
- **🚧 Workshop Status Banner**: Bango la HTML lenye muonekano wa kitaalamu linaonyesha hali ya maendeleo ya warsha
  - Muundo wa gradianti na viashiria vya ujenzi kwa mawasiliano wazi kwa mtumiaji
  - Kipindi cha tarehe ya masasisho kwa uwazi
  - Muundo unaojibu kwa simu na vifaa vingine vyote

#### Imeboreshwa
- **Usalama wa Miundombinu**: Uwezo wa awali umeingizwa kote katika nyaraka za utoaji
- **Uthibitishaji Kabla ya Utoaji**: Skripti za kuendesha sasa zinajumuisha upimaji wa awali wa miundombinu
- **Mtiririko wa Kazi wa Mjenzi**: Mfuatano wa amri umesasishwa kujumuisha awali kama desturi nzuri
- **Uzoefu wa Warsha**: Maelekezo wazi juu ya matarajio ya watumiaji kuhusu hali ya maendeleo ya maudhui

#### Imebadilishwa
- **Mbinu Bora za Utoaji**: Mchakato unaotegemea awali sasa unapendekezwa kama njia bora
- **Mtiririko wa Nyaraka**: Uthibitishaji wa miundombinu umehamishwa mapema katika mchakato wa kujifunza
- **Uwasilishaji wa Warsha**: Mawasiliano ya hali ya kitaalamu na ratiba ya maendeleo wazi

#### Imesafishwa
- **Mbinu ya Kuweka Usalama Kwanza**: Mabadiliko ya miundombinu sasa yanaweza kuthibitishwa kabla ya utoaji
- **Ushirikiano wa Timu**: Matokeo ya awali yanaweza kushirikishwa kwa ukaguzi na idhini
- **Ufahamu wa Gharama**: Uelewa bora wa gharama za rasilimali kabla ya upangaji
- **Kupunguza Hatari**: Kupungua kwa kushindwa kwa utoaji kupitia uthibitishaji wa awali

#### Utekelezaji wa Kiufundi
- **Uunganisho wa Nyaraka Nyingi**: Kipengele cha awali kimeelezewa katika faili 4 muhimu
- **Mifumo ya Amri**: Sarufi na mifano thabiti kote katika nyaraka
- **Ujumuishaji wa Mbinu Bora**: Awali imeingizwa katika mtiririko wa uthibitishaji na skripti
- **Viashiria vya Visual**: Alama mpya za kipengele zilizo wazi kwa urahisi wa kugundua

#### Miundombinu ya Warsha
- **Mawasiliano ya Hali**: Bango la kitaalamu la HTML lenye mtindo wa gradianti
- **Uzoefu wa Mtumiaji**: Hali ya maendeleo iliyo wazi inazuia mkanganyiko
- **Uwasilishaji wa Kitaalamu**: Inahifadhi uaminifu wa ghala huku ikiweka matarajio wazi
- **Uwajibikaji wa Ratiba**: Tarehe ya mwisho ya masasisho Oktoba 2025 kwa uwajibikaji

### [v3.3.0] - 2025-09-24

#### Vifaa vya Warsha Vilivyoboreshwa na Uzoefu wa Kujifunza wa Kiingiliani
**Toleo hili linaanzisha vifaa vya warsha vya kina kwa mwongozo unaofanya kazi kupitia kivinjari pamoja na njia za kujifunza zilizo na muundo.**

#### Imeongezwa
- **🎥 Mwongozo wa Warsha unaoingiliana**: Uzoefu wa warsha unaotumika kwenye kivinjari na uwezo wa mtazamo wa MkDocs
- **📝 Maelekezo ya Warsha Yenye Muundo**: Njia ya kujifunza yenye hatua 7 kutoka kugundua hadi kubinafsisha
  - 0-Introduction: Muhtasari wa warsha na usanidi
  - 1-Select-AI-Template: Ugunduzi na mchakato wa uteuzi wa template
  - 2-Validate-AI-Template: Taratibu za utoaji na uthibitishaji
  - 3-Deconstruct-AI-Template: Kuelewa usanifu wa template
  - 4-Configure-AI-Template: Usanidi na ubinafsishaji
  - 5-Customize-AI-Template: Marekebisho ya hali ya juu na mchakato wa marekebisho
  - 6-Teardown-Infrastructure: Usafishaji na usimamizi wa rasilimali
  - 7-Wrap-up: Muhtasari na hatua zinazofuata
- **🛠️ Vifaa vya Warsha**: Uendeshaji wa MkDocs pamoja na mandhari ya Material kwa uzoefu wa kujifunza ulioboreshwa
- **🎯 Njia ya Kujifunza ya Vitendo**: Mbinu ya hatua 3 (Ugunduzi → Utoaji → Ubinafsishaji)
- **📱 Uunganisho wa GitHub Codespaces**: Usanidi wa mazingira ya maendeleo bila mshono

#### Imeboreshwa
- **Maabara ya Warsha ya AI**: Imekuzwa kuwa uzoefu uliopangwa wa masaa 2-3
- **Nyaraka za Warsha**: Uwasilishaji wa kitaalamu wenye urambazaji na msaada wa kuona
- **Mtiririko wa Kujifunza**: Mwongozo wa hatua kwa hatua kutoka uteuzi wa template hadi utoaji kwa uzalishaji
- **Uzoefu wa Mjenzi**: Vifaa vilivyojumuishwa kwa mtiririko wa kazi rahisi

#### Imesafishwa
- **Upatikanaji**: Kiolesura kinachotumika kupitia kivinjari chenye utafutaji, nakili, na chaguo la mada
- **Kujifunza kwa Kasi Yako**: Muundo wa warsha unaoruhusu kasi tofauti za kujifunza
- **Matumizi ya Kivitendo**: Mifano halisi ya utoaji wa template za AI
- **Ujumuishaji wa Jumuiya**: Uunganisho wa Discord kwa msaada wa warsha na ushirikiano

#### Sifa za Warsha
- **Utafutaji Umejumuishwa**: Ugunduzi wa haraka wa maneno muhimu na masomo
- **Nakili Vyombo vya Msimbo**: Utendakazi wa kunakili kwa kuungua kwa panya kwa mifano yote ya msimbo
- **Chaguo la Mada**: Msaada wa hali ya giza/mwangaza kwa mapendeleo tofauti
- **Rasilimali za Visual**: Picha za skrini na michoro kwa uelewa ulioboreshwa
- **Uunganisho wa Msaada**: Upatikanaji wa moja kwa moja wa Discord kwa msaada wa jumuiya

### [v3.2.0] - 2025-09-17

#### Urekebishaji Mkuu wa Urambazaji na Mfumo wa Kujifunza Kulingana na Sura
**Toleo hili linaanzisha muundo kamili wa kujifunza kwa sura na urambazaji ulioboreshwa katika ghala lote.**

#### Imeongezwa
- **📚 Mfumo wa Kujifunza Kulingana na Sura**: Kurudishwa kwa kozi nzima katika sura 8 zinazoongezeka kwa mtiririko
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Mfumo Kamili wa Urambazaji**: Vichwa vya urambazaji na miguu imewekwa kwa muundo wa kawaida katika nyaraka zote
- **🎯 Ufuatiliaji wa Maendeleo**: Orodha ya kukamilisha kozi na mfumo wa uthibitisho wa kujifunza
- **🗺️ Mwongozo wa Njia ya Kujifunza**: Pointi za kuingia wazi kwa ngazi tofauti za uzoefu na malengo
- **🔗 Urambazaji wa Marejeleo ya Msalaba**: Sura zinazohusiana na vigezo vya awali zimeunganishwa kwa uwazi

#### Imeboreshwa
- **Muundo wa README**: Umebadilishwa kuwa jukwaa la kujifunza lenye mpangilio wa sura
- **Urambazaji wa Nyaraka**: Kila ukurasa sasa unajumuisha muktadha wa sura na mwongozo wa maendeleo
- **Mpangilio wa Templates**: Mifano na templates zimegawanywa kwa sura zinazofaa za kujifunza
- **Uunganisho wa Rasilimali**: Karatasi za mbinu, maswali yanayoulizwa mara kwa mara, na mwongozo wa masomo yameunganishwa kwa sura zinazofaa
- **Ujumuishaji wa Warsha**: Maabara za vitendo zimeonganishwa na malengo ya sura mbalimbali

#### Imebadilishwa
- **Mtiririko wa Kujifunza**: Umehamishwa kutoka nyaraka za mstari mmoja hadi mfumo unaoruhusu njia mbadala za kujifunza
- **Mahali pa Usanidi**: Mwongozo wa usanidi umewekwa kama Chapter 3 kwa mtiririko bora wa kujifunza
- **Uunganisho wa Yaliyomo ya AI**: Yaliyomo maalumu ya AI yamejumuishwa vizuri katika safari ya kujifunza
- **Yaliyomo kwa Uzalishaji**: Mifumo ya hali ya juu iliyokusanywa katika Chapter 8 kwa wale wa kiwango cha taasisi

#### Imesafishwa
- **Uzoefu wa Mtumiaji**: Viashiria vya urambazaji na maendeleo ya sura vimekuwa wazi zaidi
- **Upatikanaji**: Mifumo ya urambazaji ya urahisi wa kutumia
- **Uwasilishaji wa Kitaalamu**: Muundo wa kozi unaofaa kwa mafunzo ya vyuo na mashirika
- **Ufanisi wa Kujifunza**: Kupunguza muda wa kutafuta maudhui husika kupitia muundo ulioboreshwa

#### Utekelezaji wa Kiufundi
- **Vichwa vya Urambazaji**: Urambazaji wa sura umeboreshwa katika faili zaidi ya 40 za nyaraka
- **Miguo ya Miguu**: Mwongozo wa maendeleo wa hatua ulio na mwelekeo wa kukamilika wa sura
- **Uunganisho wa Ndani**: Mfumo kamili wa viungo ndani unaounganisha dhana zinazohusiana
- **Ramani za Sura**: Templates na mifano imeunganishwa wazi na malengo ya kujifunza

#### Uboreshaji wa Mwongozo wa Masomo
- **📚 Malengo Kamili ya Kujifunza**: Mwongozo wa masomo umerejewa ili kuendana na mfumo wa sura 8
- **🎯 Tathmini Kulingana na Sura**: Kila sura inajumuisha malengo maalum ya kujifunza na mazoezi ya vitendo
- **📋 Ufuatiliaji wa Maendeleo**: Ratiba ya kujifunza ya wiki na matokeo yanayoweza kupimika na orodha ya ukaguzi za kukamilika
- **❓ Maswali ya Tathmini**: Maswali ya uthibitisho wa maarifa kwa kila sura yenye matokeo ya kitaaluma
- **🛠️ Mazoezi ya Vitendo**: Shughuli za vitendo na matukio ya utoaji halisi na utatuzi wa matatizo
- **📊 Maendeleo ya Ujuzi**: Hatua za wazi kutoka dhana za msingi hadi mifumo ya taasisi na maendeleo ya kazi
- **🎓 Mfumo wa Cheti**: Matokeo ya maendeleo ya kitaaluma na mfumo wa utambuzi wa jumuiya
- **⏱️ Usimamizi wa Ratiba**: Mpango wa wiki 10 wenye alama za tathmini

### [v3.1.0] - 2025-09-17

#### Uboreshaji wa Suluhisho za AI zenye Wakala Wengi
**Toleo hili linaboresha suluhisho la wakala wengi la rejareja kwa uainishaji bora wa majina ya wakala na nyaraka zilizoimarishwa.**

#### Imebadilishwa
- **Terminolojia ya Wakala Wengi**: Neno "Cora agent" limebadilishwa na "Customer agent" kote kwenye suluhisho la rejareja la wakala wengi ili kueleweka vyema
- **Usanifu wa Wakala**: Nyaraka zote, templates za ARM, na mifano ya msimbo zimebadilishwa kutumia jina thabiti la "Customer agent"
- **Mifano ya Usanidi**: Mifumo ya usanidi wa wakala imesasishwa na kanuni mpya za majina
- **Ulinganifu wa Nyaraka**: Imedhamiriwa kuwa marejeleo yote yanatumia majina ya wakala maalum na ya kitaalamu

#### Imeboreshwa
- **Kifurushi cha Template za ARM**: `retail-multiagent-arm-template` imesasishwa na marejeleo ya Customer agent
- **Michoro ya Usanifu**: Michoro ya Mermaid imesasishwa na majina mapya ya wakala
- **Mifano ya Msimbo**: Madarasa ya Python na mifano ya utekelezaji sasa yanatumia jina la CustomerAgent
- **Mazingira ya Vigezo**: Skripti zote za utoaji zimesasishwa kutumia vigezo vya mazingira vya CUSTOMER_AGENT_NAME

#### Imesafishwa
- **Uzoefu wa Mjenzi**: Majukumu na wajibu wa wakala yamekuwa wazi zaidi katika nyaraka
- **Ukweli wa Uzalishaji**: Ulinganifu bora na kanuni za majina za taasisi
- **Vifaa vya Kujifunza**: Majina ya wakala yaliyo rahisi kueleweka kwa madhumuni ya elimu
- **Uwezo wa Template**: Uelewa uliorahisishwa wa kazi za wakala na mifumo ya utoaji

#### Maelezo ya Kiufundi
- Michoro ya usanifu ya Mermaid imesasishwa na marejeleo ya CustomerAgent
- Madarasa ya CoraAgent yalibadilishwa kuwa CustomerAgent katika mifano ya Python
- Usanidi wa template za ARM JSON umebadilishwa kutumia aina ya wakala "customer"
- Vigezo vya mazingira vilibadilishwa kutoka CORA_AGENT_* hadi vigezo vya CUSTOMER_AGENT_*
- Amri zote za utoaji na usanidi wa kontena zimesasishwa

### [v3.0.0] - 2025-09-12

#### Mabadiliko Makuu - Mhimili kwa Waendelezaji wa AI na Uunganisho wa Microsoft Foundry
**Toleo hili linageuza ghala kuwa rasilimali kamili inayolenga kujifunza kwa upande wa AI yenye mwongozo wa uunganisho na Microsoft Foundry.**

#### Imeongezwa
- **🤖 Njia ya Kujifunza Inayoweka AI Kwanza**: Upangaji kamili unaoweka vipaumbele kwa waendelezaji na wahandisi wa AI
- **Microsoft Foundry Integration Guide**: Nyaraka kamili za kuunganisha AZD na huduma za Microsoft Foundry
- **AI Model Deployment Patterns**: Mwongozo wa kina unaofunika uchaguzi wa modeli, usanidi, na mikakati ya utoaji kwa uzalishaji
- **Maabara ya Warsha ya AI**: warsha ya vitendo ya masaa 2-3 kwa kubadilisha programu za AI kuwa suluhisho zinazoweza kutumika kwa AZD
- **Mbinu Bora za AI kwa Uzalishaji**: mifumo iliyotayarishwa kwa taasisi kwa ajili ya upanuzi, ufuatiliaji, na ulinzi wa mzigo wa kazi wa AI
- **Mwongozo wa Utatuzi wa Matatizo Maalum kwa AI**: utatuzi wa kina kwa Microsoft Foundry Models, Cognitive Services, na masuala ya uenezaji wa AI
- **Maktaba ya Violezo vya AI**: mkusanyiko uliowekwa wa templeti za Microsoft Foundry pamoja na viwango vya ugumu
- **Vifaa vya Warsha**: muundo kamili wa warsha pamoja na maabara za vitendo na nyenzo za rejeleo

#### Imeboreshwa
- **Muundo wa README**: umeelekezwa kwa waendelezaji wa AI na data ya 45% ya riba ya jamii kutoka Microsoft Foundry Discord
- **Njia za Kujifunza**: safari maalum ya waendelezaji wa AI pamoja na njia za kawaida kwa wanafunzi na wahandisi wa DevOps
- **Mapendekezo ya Templeti**: templeti za AI zilizochaguliwa ikijumuisha azure-search-openai-demo, contoso-chat, na openai-chat-app-quickstart
- **Uunganisho wa Jamii**: msaada ulioimarishwa wa jamii kwenye Discord na chaneli maalum za AI na mijadala

#### Usalama & Mwelekeo wa Uzalishaji
- **Mifumo ya Utambulisho Iyosimamwayo**: usanidi maalum wa uthibitisho na usalama kwa AI
- **Uboreshaji wa Gharama**: ufuatiliaji wa matumizi ya tokeni na udhibiti wa bajeti kwa mzigo wa kazi wa AI
- **Uenezaji wa Mikoa Nyingi**: mikakati ya uenezaji wa programu za AI kimataifa
- **Ufuatiliaji wa Utendaji**: metrik za AI maalum na ujumuishaji wa Application Insights

#### Ubora wa Nyaraka
- **Muundo wa Kozi wa Mstari**: maendeleo ya mantiki kutoka kwa mletaanza hadi mifumo ya juu ya uenezaji wa AI
- **URL Zilizothibitishwa**: viungo vyote vya hifadhidata za nje vimehakikiwa na vinaweza kufikiwa
- **Rejeleo Kamili**: viungo vyote vya nyaraka za ndani vimehakikiwa na vinafanya kazi
- **Tayari kwa Uzalishaji**: mifumo ya uenezaji kwa taasisi pamoja na mifano ya ulimwengu halisi

### [v2.0.0] - 2025-09-09

#### Mabadiliko Makuu - Urejeshaji wa Muundo wa Hifadhidata na Uboreshaji wa Kitaalamu
**Toleo hili linawakilisha mabadiliko makubwa ya muundo wa hifadhidata na uwasilishaji wa maudhui.**

#### Imeongezwa
- **Mfumo wa Kujifunza Uliopangwa**: kurasa zote za nyaraka sasa zina sehemu za Utangulizi, Malengo ya Kujifunza, na Matokeo ya Kujifunza
- **Mfumo wa Urambazaji**: Imeongezwa viungo vya somo la awali/lijalo kwenye nyaraka zote kwa mwendo wa kujifunza ulioratibiwa
- **Mwongozo wa Masomo**: study-guide.md kamili yenye malengo ya kujifunza, mazoezi ya vitendo, na nyenzo za tathmini
- **Uwasilishaji wa Kitaalamu**: Kuondolewa kwa alama zote za emoji kwa ajili ya kuboresha upatikanaji na mwonekano wa kitaalamu
- **Muundo Umeboreshwa wa Maudhui**: mpangilio na mtiririko ulioboreshwa wa nyenzo za kujifunza

#### Mabadiliko
- **Muundo wa Nyaraka**: kuokoa muundo wa nyaraka kwa kiwango kimoja kinacholenga kujifunza
- **Mtiririko wa Urambazaji**: utekelezaji wa mpangilio wa mantiki kupitia nyenzo zote za kujifunza
- **Uwasilishaji wa Maudhui**: kuondolewa kwa vipengele vya mapambo kwa ajili ya uwasilishaji wazi, wa kitaalamu
- **Muundo wa Viungo**: sasishi viungo vyote vya ndani ili kuunga mkono mfumo mpya wa urambazaji

#### Imboreshwa
- **Upatikanaji**: kuondolewa kwa utegemezi wa emoji kwa ajili ya urafiki bora kwa wasomaji wa skrini
- **Mwonekano wa Kitaalamu**: uwasilishaji safi, wa mtindo wa kitaaluma unaofaa kujifunza kwa taasisi
- **Uzoefu wa Kujifunza**: mbinu iliyopangwa yenye malengo na matokeo wazi kwa kila somo
- **Mpangilio wa Maudhui**: mtiririko bora wa mantiki na uhusiano kati ya mada zinazohusiana

### [v1.0.0] - 2025-09-09

#### Toleo la Awali - Hifadhidata Kamili ya Kujifunza AZD

#### Imeongezwa
- **Muundo wa Nyaraka Kuu**
  - Mfululizo kamili wa mwongozo wa kuanza
  - Nyaraka kamili za uenezaji na upangwa
  - Vyanzo vya utatuzi wa kina na mwongozo wa urekebishaji mende
  - Zana na taratibu za uthibitisho kabla ya uenezaji

- **Moduli ya Kuanzia**
  - Misingi ya AZD: dhana kuu na istilahi
  - Mwongozo wa Usanidi: maagizo ya usanidi kwa majukwaa tofauti
  - Mwongozo wa Usanidi wa Mazingira: usanidi wa mazingira na uthibitisho
  - Mafunzo ya Mradi wa Kwanza: hatua kwa hatua ya kujifunza kwa vitendo

- **Moduli ya Uenezaji na Upangwa**
  - Mwongozo wa Uenezaji: nyaraka kamili za mtiririko wa kazi
  - Mwongozo wa Upangwa: Miundombinu kama Msimbo kwa Bicep
  - Mbinu bora za uenezaji kwa uzalishaji
  - Mifumo ya usanifu wa huduma nyingi

- **Moduli ya Uthibitisho Kabla ya Uenezaji**
  - Mipango ya Uwezo: uthibitisho wa upatikanaji wa rasilimali za Azure
  - Uchaguaji wa SKU: mwongozo kamili wa ngazi za huduma
  - Ukaguzi wa Kabla ya Kutua: skripti za uthibitisho za kiotomatiki (PowerShell na Bash)
  - Zana za makisio ya gharama na upangaji wa bajeti

- **Moduli ya Utatuzi wa Matatizo**
  - Masuala ya Kawaida: matatizo yanayotokea mara kwa mara na suluhisho
  - Mwongozo wa Urekebishaji Mende: mbinu za kimfumo za utatuzi wa matatizo
  - Mbinu za uchunguzi za juu na zana
  - Ufuatiliaji wa utendaji na uboreshaji

- **Rasilimali na Marejeo**
  - Karatasi ya Amri: rejeleo la haraka kwa amri muhimu
  - Kamusi: istilahi na ufafanuzi wa vifupi vya maneno
  - Maswali ya Mara kwa Mara: majibu ya kina kwa maswali ya kawaida
  - Viungo vya rasilimali za nje na uunganisho wa jamii

- **Mifano na Violezo**
  - Mfano wa Programu Rahisi ya Wavuti
  - Template ya uenezaji wa Tovuti Isiyobadilika
  - Usanidi wa Programu ya Kontena
  - Mifumo ya uunganishaji wa hifadhidata
  - Mifano ya usanifu wa microservices
  - Utekelezaji wa kazi za serverless

#### Sifa
- **Msaada kwa Majukwaa Mengine-mengine**: maagizo ya usanikishaji na usanidi kwa Windows, macOS, na Linux
- **Ngazi Nyingi za Ujuzi**: maudhui yaliyobuniwa kwa wanafunzi hadi waendelezaji wa kitaalam
- **Mwelekeo wa Vitendo**: mifano ya vitendo na hali halisi za matumizi
- **Ufunuo Kamili**: kutoka kwa dhana za msingi hadi mifumo ya juu ya taasisi
- **Mbinu za Usalama Kwanza**: mbinu bora za usalama zimetumika kote
- **Uboreshaji wa Gharama**: mwongozo wa uenezaji kwa gharama nafuu na usimamizi wa rasilimali

#### Ubora wa Nyaraka
- **Mifano ya Maandishi ya Kina**: mifano ya vitendo, iliyojaribiwa
- **Maelekezo Hatua kwa Hatua**: mwongozo wazi, unaoweza kutekelezeka
- **Utunzaji wa Makosa kwa Ufasaha**: utatuzi wa matatizo ya kawaida
- **Mwingiliano wa Mbinu Bora**: viwango vya sekta na mapendekezo
- **Ulinganifu wa Toleo**: inafanana na huduma za hivi punde za Azure na vipengele vya azd

## Uboreshaji Unaopangwa kwa Baadaye

### Toleo la 3.1.0 (Linalopangwa)
#### Uongezaji wa Jukwaa la AI
- **Msaada wa Mifano Nyingi**: mifumo ya ujumuishaji kwa Hugging Face, Azure Machine Learning, na mifano maalum
- **Mifumo ya Wakala wa AI**: templeti za LangChain, Semantic Kernel, na uenezaji wa AutoGen
- **Mifumo ya RAG Ya Juu**: chaguzi za hifadhidata za vekta zaidi ya Azure AI Search (Pinecone, Weaviate, nk.)
- **Ufuatiliaji wa AI**: ufuatiliaji ulioboreshwa wa utendaji wa modeli, matumizi ya tokeni, na ubora wa majibu

#### Uzoefu wa Mendelezaji
- **Kiendelezi cha VS Code**: uzoefu wa maendeleo uliounganishwa wa AZD + Microsoft Foundry
- **Uunganisho wa GitHub Copilot**: uzalishaji wa templeti za AZD unaoongozwa na AI
- **Mafunzo ya Interakti**: mazoezi ya kuchukua hatua za uandishi wa msimbo na uthibitisho wa kiotomatiki kwa matukio ya AI
- **Maudhui ya Video**: mafunzo ya ziada ya video kwa watu wanaojifunza kwa kuona wakizingatia uenezaji wa AI

### Toleo la 4.0.0 (Linalopangwa)
#### Mifumo ya AI kwa Taasisi
- **Mfumo wa Udhibiti**: udhibiti wa modeli za AI, uzingatiaji, na rekodi za ukaguzi
- **AI Multi-Tenant**: mifumo ya kuhudumia wateja wengi kwa huduma za AI zilizo zaseparat
- **Uenezaji wa AI kwa Edge**: ujumuishaji na Azure IoT Edge na matukio ya kontena
- **AI ya Wingu Mchanganyiko**: mifumo ya uenezaji ya multi-cloud na hybrid kwa mzigo wa kazi wa AI

#### Sifa za Juu
- **Uendeshaji wa Pipe ya AI**: ujumuishaji wa MLOps na pipeline za Azure Machine Learning
- **Usalama wa Juu**: mifumo ya zero-trust, endpoints za kibinafsi, na ulinzi wa tishio wa hali ya juu
- **Uboreshaji wa Utendaji**: tuning ya juu na mikakati ya upanuzi kwa programu za AI zenye throughput kubwa
- **Usambazaji wa Ulimwengu**: utoaji wa maudhui na mifumo ya caching ya edge kwa programu za AI

### Toleo la 3.0.0 (Linalopangwa) - Limepinduliwa na Toleo la Sasa
#### Nyongeza Iliopendekezwa - Sasa Imetekelezwa katika v3.0.0
- ✅ **Maudhui Yalioelekezwa kwa AI**: ujumuishaji kamili wa Microsoft Foundry (Imekamilika)
- ✅ **Mafunzo ya Kiingiliano**: maabara ya vitendo ya AI (Imekamilika)
- ✅ **Moduli ya Usalama ya Juu**: mifumo ya usalama maalum kwa AI (Imekamilika)
- ✅ **Uboreshaji wa Utendaji**: mikakati ya tuning ya mzigo wa kazi wa AI (Imekamilika)

### Toleo la 2.1.0 (Linalopangwa) - Sehemu Imetekelezwa katika v3.0.0
#### Maboresho Madogo - Baadhi Imetekelezwa katika Toleo la Sasa
- ✅ **Mifano Zaidi**: matukio ya uenezaji yaliyoelekezwa kwa AI (Imekamilika)
- ✅ **Maswali Yaliyopanuliwa**: maswali na utatuzi maalum wa AI (Imekamilika)
- **Uunganisho wa Zana**: mwongozo ulioboreshwa wa ujumuishaji wa IDE na mhariri
- ✅ **Uongezaji wa Ufuatiliaji**: mifumo ya ufuatiliaji na onyo maalum kwa AI (Imekamilika)

#### Bado Yamepangwa kwa Toleo la Baadaye
- **Nyaraka Zinazofaa kwa Simu za Mkononi**: muundo unaojibu kwa kujifunza kwa simu
- **Upatikanaji Bila Mtandao**: vifurushi vya nyaraka vinavyoweza kupakuliwa
- **Uunganisho Ulioboreshwa wa IDE**: kiendelezi cha VS Code kwa AZD + mtiririko wa kazi za AI
- **Dashibodi ya Jamii**: metrik za jamii kwa wakati halisi na ufuatiliaji wa michango

## Kuchangia kwenye Changelog

### Kuripoti Mabadiliko
Unapochangia kwenye hifadhidata hii, tafadhali hakikisha vipengele vya changelog vinajumuisha:

1. **Nambari ya Toleo**: Kufuatana na semantic versioning (major.minor.patch)
2. **Tarehe**: Tarehe ya kutolewa au sasisho kwa muundo wa YYYY-MM-DD
3. **Jamii**: Imeongezwa, Imebadilishwa, Imetupwa, Imeondolewa, Imetatuliwa, Usalama
4. **Maelezo Yaliyo Wazi**: maelezo mafupi ya kilichobadilika
5. **Tathmini ya Athari**: Jinsi mabadiliko yanavyoathiri watumiaji waliopo

### Makundi ya Mabadiliko

#### Imeongezwa
- Vipengele vipya, sehemu za nyaraka, au uwezo mpya
- Mifano mipya, templeti, au rasilimali za kujifunza
- Zana za ziada, skripti, au huduma ndogo

#### Imebadilishwa
- Marekebisho ya utendaji uliopo au nyaraka
- Sasisho za kuboresha uwazi au usahihi
- Urapanifu wa maudhui au mpangilio

#### Imetupwa
- Vipengele au mbinu zinazozungushiwa nje
- Sehemu za nyaraka zilizopangwa kuondolewa
- Mbinu zilizo na mbadala bora zaidi

#### Imeondolewa
- Vipengele, nyaraka, au mifano isiyoainika tena
- Taarifa za zamani au mbinu zilizokataliwa
- Yaliyorudiwa au yaliyokusanywa

#### Imetatuliwa
- Marekebisho ya makosa katika nyaraka au msimbo
- Utatuzi wa matatizo yaliyoripotiwa
- Maboresho ya usahihi au utendaji

#### Usalama
- Maboresho au marekebisho yanayohusiana na usalama
- Sasisho za mbinu bora za usalama
- Utatuzi wa udhaifu wa usalama

### Miongozo ya Semantic Versioning

#### Toleo Kuu (X.0.0)
- Mabadiliko yanayovunja nyuma yanayohitaji hatua za mtumiaji
- Urejeshaji mkubwa wa muundo wa maudhui au mpangilio
- Mabadiliko yanayobadilisha mbinu msingi au metodologia

#### Toleo Duni (X.Y.0)
- Vipengele vipya au nyongeza za maudhui
- Maboresho yanayodumisha ulinganifu wa nyuma
- Mifano zaidi, zana, au rasilimali

#### Toleo la Patch (X.Y.Z)
- Marekebisho ya mende na marekebisho
- Maboresho madogo kwa maudhui yaliyopo
- Ufafanuzi na maboresho madogo

## Maoni ya Jamii na Mapendekezo

Tunahamasisha kwa bidii maoni ya jamii ili kuboresha rasilimali hii ya kujifunza:

### Jinsi ya Kutoa Maoni
- **GitHub Issues**: Ripoti matatizo au pendekeza maboresho (masuala maalum ya AI yanakaribishwa)
- **Mijadala ya Discord**: Shiriki mawazo na ujihusishe na jamii ya Microsoft Foundry
- **Pull Requests**: Changia maboresho ya moja kwa moja kwa maudhui, hasa templeti na mwongozo wa AI
- **Microsoft Foundry Discord**: Shiriki kwenye #Azure channel kwa mijadala ya AZD + AI
- **Fora za Jamii**: Shiriki katika mijadala pana ya waendelezaji wa Azure

### Makundi ya Maoni
- **Usahihi wa Maudhui ya AI**: Marekebisho ya ujumuishaji wa huduma za AI na taarifa za uenezaji
- **Uzoefu wa Kujifunza**: Mapendekezo ya kuboresha mtiririko wa kujifunza kwa waendelezaji wa AI
- **Maudhui ya AI Yanayokosekana**: Maombi ya templeti, mifumo, au mifano ya ziada ya AI
- **Upatikanaji**: Maboresho kwa mahitaji tofauti ya kujifunza
- **Uunganisho wa Zana za AI**: Mapendekezo kwa ujumuishaji bora wa mtiririko wa kazi wa maendeleo ya AI
- **Mifumo ya Uzalishaji ya AI**: Maombi ya mifumo ya uenezaji wa AI kwa taasisi

### Ahadi ya Kujibu
- **Majibu ya Masuala**: Ndani ya masaa 48 kwa matatizo yaliyoripotiwa
- **Maombi ya Vipengele**: Tathmini ndani ya wiki moja
- **Michango ya Jamii**: Mapitio ndani ya wiki moja
- **Masuala ya Usalama**: Kipaumbele cha haraka kwa mwitikio wa haraka

## Ratiba ya Matengenezo

### Sasisho za Kawaida
- **Mapitio ya Kila Mwezi**: usahihi wa maudhui na uthibitishaji wa viungo
- **Sasisho za Robo Mwaka**: nyongeza na maboresho makubwa ya maudhui
- **Mapitio ya Nusu Mwaka**: urejeshaji na uboreshaji wa kina
- **Matoleo ya Mwaka**: sasisho za toleo kuu zenye maboresho makubwa

### Ufuatiliaji na Udhibiti wa Ubora
- **Ujaribu wa Kiotomatiki**: uthibitisho wa mara kwa mara wa mifano ya msimbo na viungo
- **Ujumuishaji wa Maoni ya Jamii**: ujumuishaji wa kuchangia kwa watumiaji mara kwa mara
- **Sasisho za Teknolojia**: mlingano na huduma za hivi punde za Azure na toleo la azd
- **Ukaguzi wa Upatikanaji**: mapitio ya mara kwa mara kwa kanuni za muundo jumuishi

## Sera ya Msaada kwa Toleo

### Msaada wa Toleo la Sasa
- **Toleo Kuu la Hivi Punde**: msaada kamili na sasisho za mara kwa mara
- **Toleo la Kuu lililopita**: sasisho za usalama na marekebisho muhimu kwa miezi 12
- **Matoleo ya Urithi**: msaada wa jamii pekee, hakina sasisho rasmi

### Mwongozo wa Kuhamia
Wakati toleo kuu linapotolewa, tunatoa:
- **Mwongozo wa Kuhamia**: maelekezo hatua kwa hatua ya mabadiliko
- **Vidokezo vya Ulinganifu**: maelezo kuhusu mabadiliko yanayovunja nyuma
- **Msaada wa Zana**: skripti au zana kusaidia kuhamia
- **Msaada wa Jamii**: forum maalum kwa maswali ya uhamaji

---

**Urambazaji**
- **Somo lililopita**: [Study Guide](resources/study-guide.md)
- **Somo lijalo**: Rudi kwenye [Main README](README.md)

**Endelea Kupata Habari**: Tazama hifadhidata hii kwa taarifa kuhusu matoleo mapya na sasisho muhimu kwa nyenzo za kujifunza.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->