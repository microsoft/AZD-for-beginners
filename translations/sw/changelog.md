# Mabadiliko - AZD Kwa Waanzilishi

## Utangulizi

Mabadiliko haya yarejelea mabadiliko yote muhimu, masasisho, na maboresho katika hazina ya AZD Kwa Waanzilishi. Tunafuata kanuni za toleo la semantiki na tunahifadhi kumbukumbu hii kusaidia watumiaji kuelewa kilichobadilika kati ya matoleo.

## Malengo ya Kujifunza

Kwa kupitia mabadiliko haya, utakuwa na uwezo wa:
- Kubaki na taarifa kuhusu vipengele vipya na nyongeza za maudhui
- Kuelewa maboresho yaliyotolewa kwenye nyaraka zilizopo
- Kufuatilia marekebisho ya hitilafu na makosa ili kuhakikisha usahihi
- Kufuatilia mabadiliko ya vifaa vya kujifunzia kwa muda

## Matokeo ya Kujifunza

Baada ya kupitia hati za mabadiliko, utaweza:
- Kutambua maudhui na rasilimali mpya zilizopo kwa ajili ya kujifunza
- Kuelewa ni sehemu zipi zimebadilika au kuboreshwa
- Kupanga njia yako ya kujifunza kulingana na vifaa vya sasa zaidi
- Kutoa maoni na mapendekezo kwa maboresho ya baadaye

## Historia ya Toleo

### [v3.23.0] - 2026-07-13

#### Upyaaji wa AZD 1.27.1: Sasisho la Toleo
**Toleo hili linathibitisha tena kozi dhidi ya `azd` `1.27.1` (Julai 2026, toleo thabiti la hivi karibuni) na uongezaji kipengele wa mawakala wa AI wa awali `azure.ai.agents` `1.0.0-beta.5`, likirekebisha bendera zote za "kuthibitishwa dhidi ya" baada ya kutolewa kwa matoleo 1.26.0, 1.27.0, na 1.27.1.**

#### Kubadilika
- **✅ Msingi wa uthibitisho umesasishwa** kutoka `azd 1.25.6` (Juni 2026) hadi `azd 1.27.1` (Julai 2026) kwenye README kuu, README zote za sura, somo la chumba cha maendeleo cha Sura 1 (ikiwa na mifano ya toleo la kuweka alama), somo la templeti maalum la Sura 4, somo la mawakala wengi la Sura 5, na nyaraka za warsha
- **🤖 Msingi wa Sura 2 umesafishwa** kutoka `azd 1.23.12` (Machi 2026) hadi `azd 1.27.1` katika `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, na `microsoft-foundry-integration.md`; tarehe za taarifa ya uthibitisho zimesasishwa hadi 2026-07-13
- **🧩 Uongezaji kipengele wa mawakala wa AI umeongezwa** kutoka `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` hadi toleo la sasa `1.0.0-beta.5` katika README ya Sura 2 na `agents.md`
- **🧪 Mfano wa uthibitisho wa warsha** (matokeo ya `azd version`) imesasishwa hadi `1.27.1`

#### Kumbuka kuhusu matoleo ya azd yanayohusiana (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Msaada wa Go kwa Azure Functions kwenye Flex Consumption, vichujio vya usajili kwa kila mteja kwa `azd config sub-filter`, vifurushi vya uongezaji vipengele huru (`azd x pack --bundle`), na `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Kuweka mfano wa miradi/mawakala wa Azure AI Foundry moja kwa moja katika `azure.yaml` (kuanzisha bila Bicep/Terraform), msaada wa kupeleka chombo kwa App Service (`host: appservice` + `language: docker`), `-s/--source` ya moja kwa moja kwa amri za `azd extension`, na `azd tool uninstall`
- **1.27.1 (2026-07-09):** Bendera ya `--no-dependencies` kwa `azd extension install`, modeli zilizokataliwa ziondolewe kutoka kwenye vidokezo vya orodha/kiasi kwa msingi, na marekebisho mengi ya hitilafu

#### Faili zilizosasishwa
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

#### Kujaza Mapengo kwa Waanzilishi #2: Uandishi wa Templeti, Vyombo vya Maendeleo, Pulumi, Azure DevOps, Wakuu wa Huduma, na Zaidi
**Toleo hili linafunga mapengo yaliyobaki ya kati yaliyobainishwa na uchambuzi wa azd-coverage: jinsi ya kuandika na kuchapisha templeti yako mwenyewe, mazingira yanayoweza kurudiwa ya vyombo vya maendeleo/Codespaces, muendelezo wa miundombinu wa Pulumi, mwongozo wa Azure DevOps CI/CD, uthibitishaji wa mkuu wa huduma, mwongozo wa kuchagua mwenyeji (AKS/Spring Apps), maelezo ya `azd restore`/`azd package`, usimamizi wa makosa ya hook, na mbinu za timu/mazingira yaliyoshirikiwa.**

#### Imeongezewa
- **🧱 Somo jipya la Sura 4** `docs/chapter-04-infrastructure/custom-templates.md` — kuandika templeti yako mwenyewe ya azd: muundo unaohitajika (`azure.yaml`, `infra/`, `src/`), uwanja wa `metadata.template`, kuweka vigezo kwa miundombinu na tokeni ya rasilimali `uniqueString()` na lebo ya `azd-env-name`, kujaribu kwa ndani kwa `azd init --template <local-path>`, kuchapisha kwenye GitHub, na kuwasilisha kwenye maktaba ya Awesome AZD
- **📦 Somo jipya la Sura 1** `docs/chapter-01-foundation/dev-containers.md` — mazingira yanayoweza kurudiwa ya azd na Vyombo vya Maendeleo na GitHub Codespaces: `.devcontainer/devcontainer.json` ndogo inayotumia kipengele rasmi cha `ghcr.io/azure/azure-dev/azd`, vipengele maalum vya lugha, `docker-in-docker` kwa wenyeji wa chombo, na `azd auth login --use-device-code` kwa kuingia umbali
- **🧩 Pulumi na azd** sehemu katika `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, mpangilio wa folda ya Pulumi, vikundi vinavyohusiana na mazingira ya azd, matokeo yanayohitajika/ulebaji, na mtiririko sawa wa `azd up` / `azd down`
- **🎯 Mwongozo wa kuchagua mwenyeji** katika `docs/chapter-04-infrastructure/provisioning.md` — kulinganisha rafiki kwa waanzilishi kwa `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, na `springapp`, pamoja na mwongozo wa lini kuchagua AKS au Azure Spring Apps
- **🛠️ Mwongozo wa Azure DevOps CI/CD** katika `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, muunganisho wa huduma na utambulisho wa kazi (OIDC), `azure-dev.yml` iliyotengenezwa, na usanidi wa kikundi cha vigezo
- **🔑 Wakuu wa Huduma (Mfano 4)** umeongezwa katika `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` isiyo ya mwingiliano na siri ya mteja dhidi ya vyeti vinavyodhibitiwa/OIDC, wakati wa kutumia, na usalama wa hifadhi ya vyeti
- **🪝 Kusimamia makosa ya hook** sehemu ndogo katika `docs/chapter-04-infrastructure/deployment-guide.md` — nambari za exit na `set -e`, `continueOnError`, kujaribu hooks pekee kwa `azd hooks run`, shell za OS kama zilivyo, na `--debug`
- **👥 Timu / mazingira yaliyoshirikiwa** sehemu katika `docs/chapter-03-configuration/configuration.md` — nini kiko ndani ya `.azure/`, nini cha kukiuka gitignore, mazingira kwa kila msanidi programu, `azd env list`/`select`, na kutoa maadili ya mazingira katika CI/CD
- **🧰 Maelezo ya `azd restore` na `azd package` yaliyopanuliwa** katika `resources/cheat-sheet.md` — kurejesha utegemezi na kujenga kifaa cha kusambaza bila kupeleka moja kwa moja

#### Kubadilika
- **🧭 Jedwali la masomo ya Sura 4** limesasishwa kujumuisha somo jipya "Kuandika Templeti Yako Mwenyewe" (Somo la 3)
- **🧭 Jedwali la masomo ya Sura 1** limesasishwa kujumuisha somo jipya "Vyombo vya Maendeleo & Codespaces" (Somo la 5); miguso ya usafiri imeunganishwa kati ya `bring-your-own-app.md` na `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Kujaza Mapengo kwa Waanzilishi: Somo la Vitendo la Multi-Agent, "Leta Programu Yako," Terraform, na Mwongozo wa CI/CD
**Toleo hili linafunga mapengo makubwa kwa mwongozo kamili wa waanzilishi kwa kuongeza masomo mawili mapya ya vitendo (mwongozo wa multi-agent unaoweza kupelekwa na kuongeza azd kwenye programu iliyopo), utangulizi rafiki wa hooks, sehemu ya Terraform na azd, mwongozo wa hatua kwa hatua wa pipeline ya GitHub Actions, maelezo ya uongezaji kipengele cha awali, na orodha ya ukaguzi wa uthibitisho wa usambazaji.**

#### Imeongezewa
- **🤝 Somo jipya la Sura 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — mwongozo wa vitendo kabisa, unaoweza kupelekwa, wa mawakala wawili (mtangazaji + wataalamu) ukitumia templeti halisi (`contoso-creative-writer`), ukielezea lini kutumia multi-agent, mtiririko wa `azd up`, kuelewa rasilimali zilizopelekwa, ufuatiliaji kati ya mawakala, kubinafsisha, na usafishaji
- **📦 Somo jipya la Sura 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jinsi ya kuongeza azd kwenye mradi uliopo kwa `azd init` ("tumia msimbo katika saraka ya sasa"), kuelewa `azure.yaml` na `infra/`, `azd infra generate`, kugundua mwenyeji, na kupeleka kwa `azd up`
- **🌐 Sehemu ya Terraform na azd** imeongezwa katika `docs/chapter-04-infrastructure/provisioning.md` — usanidi wa `infra.provider: terraform`, mpangilio wa folda `.tf`, matokeo ya lazima ya `AZURE_*` na uundaji wa lebo ya `azd-env-name`, na mtiririko sawa wa `azd up` / `azd down` (inafunga mapengo ambapo msaada wa Terraform ulikuwa umetajwa lakini Bicep tu ndiyo iliyoonyeshwa)
- **⚙️ Mwongozo wa hatua kwa hatua wa GitHub Actions** katika `docs/chapter-08-production/production-ai-practices.md` — kutoka kwenye repo ya GitHub hadi usambazaji wa kiotomatiki: `azd pipeline config`, vyeti vya OIDC vilivyotolewa (hakuna siri zilizo hifadhiwa), `azure-dev.yml` iliyotengenezwa, na mwongozo wa siri dhidi ya vigezo
- **🪝 Utangulizi wa "Mpya kwa hooks?" kwa waanzilishi** katika `docs/chapter-04-infrastructure/deployment-guide.md` — hook ni nini, jedwali la hatua za hook, hook ndogo kwanza, na kuendesha hooks kwa mkono kwa `azd hooks run`
- **✅ Orodha ya "Thibitisha Usambazaji Wako"** imeongezwa kwenye Hatua ya 5 ya `docs/chapter-01-foundation/first-project.md` — jaribio la moshi, ukaguzi wa kituo cha afya, na vigezo wazi vya mafanikio
- **🧩 Maelezo ya uongezaji kipengele cha awali** `azure.ai.skills` na `azure.ai.connections` (kitu gani na lini kutumia) katika `docs/chapter-08-production/production-ai-practices.md`

#### Kubadilika
- **🧭 Jedwali la masomo ya Sura 5** limerekebishwa: `multi-agent-basics.md` sasa ni Somo la 1 (somo pekee la vitendo kwa mikono), na lebo ya uaminifu kwamba Somo la 2 lipo Sura 6 na hali ya Retail ni ramani ya usanifu, si templeti moja kwa amri
- **🧭 Jedwali la masomo ya Sura 1** sasa linajumuisha somo jipya "Leta Programu Yako" (Somo la 4)
- **🔗 Miguso ya usafiri** imesasishwa: `first-project.md` sasa inaunganisha mbele hadi `bring-your-own-app.md`

#### Imerekebishwa
- **🧱 Mapengo ya Terraform yaliyodaiwa lakini hayakuwepo yamefungwa** — kozi awali ilirejelea msaada wa Terraform bila kuuita
- **🔀 Marekebisho ya misingi ya mabadiliko ya Sura 5 iliyotegemea** ambayo ilitahadharisha utekelezaji kamili wa multi-agent wakati ramani ya usanifu tu ilipo

#### Faili zilizosasishwa
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

#### Upyaaji wa AZD 1.25.6, Amri Kamili za Mzunguko wa Maisha wa Wakala & Ubadilishaji wa Aspire

**Toleo hili linathibitisha tena kozi dhidi ya `azd` `1.25.6` (Juni 2026) na ugani wa `azure.ai.agents` `0.1.40-preview`, linaongeza mwongozo wa AI kutoka "kujenga wakala" hadi mzunguko mzima wa maisha wa wakala (jaribu → tathmini → boresha → angalia → futa), linaonyesha vitu vipya vya onyesho vya `azure.ai.skills` na `azure.ai.connections`, na linaonyesha marekebisho ya chapa ya bidhaa kutoka ".NET Aspire" → "Aspire".**

#### Imeongezwa
- **🔁 Ufunikaji wa mzunguko mzima wa maisha ya wakala** kwa wanaoanza na wahandisi wa AI katika nyaraka zote:
  - `docs/chapter-01-foundation/azd-basics.md` — Jedwali la mzunguko wa maisha (kujenga → jaribu → pima → boresha → angalia → safisha) limeongezwa kwenye sehemu ya Ugani na Amri za AI
  - `docs/chapter-08-production/production-ai-practices.md` — Sehemu mpya "Kusimamia Mzunguko wa Maisha wa Wakala" inayojumuisha `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, na `delete --force`
  - `resources/cheat-sheet.md` — Amri za Wakala wa AI zimepanuliwa na `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, na `delete --force`
- **🧩 Ugani mpya za onyesho** zilizoelezewa: `azure.ai.skills` (uwezo wa wakala unaoweza kutumiwa tena) na `azure.ai.connections` (muunganiko wa Foundry) zimeongezwa kwenye jedwali la ugani na daftari la hila
- **⏱️ Mwongozo wa muda wa majibu** — mifano ya `azd ai agent invoke` sasa inaonyesha kuwa inaonyesha jali la jumla na muda wa byte ya kwanza
- **📌 Bango la toleo** katika README ya mzizi likimwelekeza mwanafunzi kwa `azd version` na `azd upgrade`

#### Imebadilika
- **✅ Kiwango cha kuidhinishwa kimeboreshwa** kutoka `azd 1.23.12` (Machi 2026) hadi `azd 1.25.6` (Juni 2026) katika README zote za sura na nyaraka za warsha
- **🤖 Kumbuka ugani wa sura 2** imesasishwa kutoka `azure.ai.agents` `0.1.18-preview` hadi `0.1.40-preview`
- **🧪 Mfano wa uthibitisho wa warsha** (matokeo ya `azd version`) umeboreshwa hadi `1.25.6`
- **🧭 README "Nini Kipya katika azd Leo"** imesasishwa ili kuonyesha mzunguko mzima wa maisha wa wakala, ugani mpya za AI, na marekebisho ya ubora wa maisha (`azd init` upungufu wa kuendesha mara nyingi, `azd auth login` kuondoa tokeni iliyochakaa, `azd tool` onyo la mara ya kwanza)
- **📖 wakala wa sura 2.md (Chaguo 4)** sasa inaelekeza wanafunzi kwa amri za mzunguko wa maisha baada ya uenezaji badala ya kusimama kwenye `azd up`

#### Imeratibiwa
- **🏷️ Jina la bidhaa** — iliongeza kumbuka mabadiliko ya chapa ya Aspire (".NET Aspire" sasa ni "Aspire" tu); msaada wa Aspire katika azd haubadiliki
- **🔎 Uthibitisho wa toleo la moja kwa moja** umehakikiwa dhidi ya chanzo cha utoaji wa Azure Developer CLI: CLI thabiti `1.25.6` (2026-06-12) na `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Ufafanuzi wa Mwanaoanza, Uthibitisho wa Usanidi & Usafishaji wa Amri ya AZD Mwisho
**Toleo hili linafuata kipindi cha uthibitisho cha AZD 1.23 kwa kupitia kumbukumbu ya mwongozo wa mwanzo: linafafanua mwongozo wa uthibitishaji wa kwanza AZD, linaongeza skripti za uthibitisho za usanidi wa ndani, linathibitisha amri muhimu dhidi ya AZD CLI hai, na linaondoa marejeleo ya amri za lugha ya Kiingereza zisizotumika nje ya kumbukumbu ya mabadiliko.**

#### Imeongezwa
- **🧪 Skripti za uthibitisho za usanidi kwa wanaoanza** na `validate-setup.ps1` na `validate-setup.sh` ili wanafunzi waweze kuthibitisha zana zinazohitajika kabla ya kuanza Sura ya 1
- **✅ Hatua za uthibitisho za usanidi mwanzoni** katika README ya mzizi na README ya Sura ya 1 ili prerequisites isiyokosekana zizuiwe kabla ya `azd up`

#### Imebadilika
- **🔐 Mwongozo wa uthibitishaji kwa wanaoanza** sasa hutumia moja kwa moja `azd auth login` kama njia kuu ya kazi za AZD, na `az login` imetajwa kama hiari isipokuwa amri za Azure CLI zinapotumiwa moja kwa moja
- **📚 Mtiririko wa kuingia Sura ya 1** sasa unaelekeza wanafunzi kuthibitisha usanidi wao wa ndani kabla ya kufunga, uthibitishaji, na hatua za kwanza za uenezaji
- **🛠️ Ujumbe wa Utambuzi** sasa unatofautisha wazi mahitaji ya kuzuia na onyo la hiari la Azure CLI kwa njia ya mwanzo wa AZD pekee
- **📖 Nyaraka za usanidi, utatuzi matatizo, na mifano** sasa zinagawa tofauti kati ya uthibitishaji wa lazima wa AZD na kuingia hiari kwa Azure CLI ambapo zote zilionyeshwa bila muktadha hapo awali

#### Imeratibiwa
- **📋 Marejeleo yaliyobakia ya amri za chanzo la Kiingereza** yamesasishwa hadi fomu za sasa za AZD, pamoja na `azd config show` kwenye daftari la hila na `azd monitor --overview` pale mwongozo wa muhtasari wa Azure Portal ulikusudiwa
- **🧭 Dai la Mwanzo katika Sura 1** limepunguzwa kuepuka ahadi ya tabia isiyo na makosa au kurudisha marejeleo ya dhamana katika templeti zote na rasilimali za Azure
- **🔎 Uthibitisho hai wa CLI** umehakikiwa kwa msaada wa sasa wa `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, na `azd down --force --purge`

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

#### Uthibitisho wa AZD 1.23.12, Upanuzi wa Mazingira ya Warsha & Sasisho la Mfano wa AI
**Toleo hili hufanya mtihani wa uthibitisho wa nyaraka dhidi ya `azd` `1.23.12`, husasisha mifano ya amri za AZD zilizokolea, huboresha mwongozo wa mfano wa AI kwa chaguo-msingi za sasa, na kunyoosha maelekezo ya warsha zaidi ya GitHub Codespaces ili pia kusaidia kontena za dev na nakala za eneo.**

#### Imeongezwa
- **✅ Maelezo ya uthibitisho katika sura kuu zote na nyaraka za warsha** kufanya msingi uliojaribiwa wa AZD wazi kwa wanafunzi wanaotumia toleo jipya au la zamani la CLI
- **⏱️ Mwongozo wa muda wa uenezaji** kwa uenezaji wa muda mrefu wa programu za AI kwa kutumia `azd deploy --timeout 1800`
- **🔎 Hatua za ukaguzi wa ugani** na `azd extension show azure.ai.agents` katika nyaraka za mtiririko wa AI
- **🌐 Mwongozo mpana wa mazingira ya warsha** ukijumuisha GitHub Codespaces, kontena za dev, na nakala za eneo kwa MkDocs

#### Imebadilika
- **📚 README za utangulizi wa sura** sasa zinataja uthibitisho dhidi ya `azd 1.23.12` kwa sura za msingi, usanidi, miundombinu, wakala wengi, kabla ya uenezaji, utatuzi kasoro, na uzalishaji
- **🛠️ Marejeleo ya amri za AZD** yamesasishwa hadi fomu za sasa katika nyaraka:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` au `azd env get-value(s)` kulingana na muktadha
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` pale maelekezo ya mtazamo wa Application Insights yalipotakiwa
- **🧪 Mifano ya ugani wa majaribio** imeboreshwa kwa matumizi ya sasa yaliyothibitishwa kama `azd provision --preview` na `azd provision --preview -e production`
- **🧭 Mtiririko wa warsha** umeboreshwa ili wanafunzi waweze kukamilisha maabara katika Codespaces, kontena za dev, au nakala ya eneo badala ya kudhania utekelezaji wa Codespaces pekee
- **🔐 Mwongozo wa uthibitisho** sasa hupendelea `azd auth login` kwa mitiririko ya AZD, huku `az login` ikitiiwa kama hiari wakati amri za Azure CLI zinapotumiwa moja kwa moja

#### Imeratibiwa
- **🪟 Amri za usakinishaji za Windows** zimepokelewa rasmi kwa matumizi ya herufi kubwa ndogo za kifurushi `winget` katika mwongozo wa usakinishaji
- **🐧 Mwongozo wa usakinishaji wa Linux** umeboreshwa kuepuka maagizo ya meneja wa kifurushi ya `azd` yasiyounga mkono kwa usambazaji maalum na badala yake kuonyesha rasilimali za toleo pale inapofaa
- **📦 Mifano ya modeli ya AI** imerejeshwa kutoka kwa chaguo za zamani kama `gpt-35-turbo` na `text-embedding-ada-002` hadi mifano ya sasa kama `gpt-4.1-mini`, `gpt-4.1`, na `text-embedding-3-large`
- **📋 Vipande vya uenezaji na uchunguzi** vimeboreshwa kutumia amri za mazingira na hali za sasa katika magogo, skripti, na hatua za utatuzi kasoro
- **⚙️ Mwongozo wa GitHub Actions** umetengenezwa kutoka `Azure/setup-azd@v1.0.0` hadi `Azure/setup-azd@v2`
- **🤖 Mwongozo wa idhini ya MCP/Copilot** umebadilishwa kutoka `azd mcp consent` hadi `azd copilot consent list`

#### Imboreshwa
- **🧠 Mwongozo wa sura ya AI** sasa unaelezea vyema tabia ya onyesho la `azd ai`, kuingia kwa mwenyeji, matumizi ya ugani wa sasa, na mapendekezo ya usambazaji wa modeli zilizosasishwa
- **🧪 Maelekezo ya warsha** sasa yanatumia mifano ya matoleo halisi na lugha wazi ya usanidi wa mazingira kwa maabara ya vitendo
- **📈 Nyaraka za uzalishaji na utatuzi kasoro** sasa zinaendana vyema na mifano ya ufuatiliaji wa sasa, modeli za dharura, na ngazi za gharama

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
**Toleo hili linaongeza ufunikaji wa amri za `azd ai`, `azd extension`, na `azd mcp` katika sura zote zinazohusiana na AI, linarekebisha viungo vilivyovunjika na msimbo uliopitwa katika agents.md, husaidia daftari la hila, na kukamilisha sehemu ya Templeti za Mfano kwa maelezo yaliyothibitishwa na templeti mpya za Azure AI AZD.**

#### Imeongezwa
- **🤖 Ufunikaji wa amri za AZD AI CLI** katika faili 7 (awali ilikuwa tu katika Sura ya 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Sehemu mpya "Uganisho na Amri za AI" inayowasilisha `azd extension`, `azd ai agent init`, na `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Chaguo 4: `azd ai agent init` na jedwali la kulinganisha (njia ya templeti dhidi ya njia ya tamko)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sehemu ndogo za "Ugani wa AZD kwa Foundry" na "Uenezaji wa Wakala-Kwanza"

  - `docs/chapter-05-multi-agent/README.md` — Anza Haraka sasa inaonyesha njia za usambazaji za kiolezo na msingi wa manifesti
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sehemu ya Usambazaji sasa ina chaguo la `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sehemu ndogo ya "Amri za Zuizo la AZD AI kwa Uchunguzi"
  - `resources/cheat-sheet.md` — Sehemu mpya ya "Amri za AI & Zuizo" na `azd extension`, `azd ai agent init`, `azd mcp`, na `azd infra generate`
- **📦 Kiolezo vipya vya mfano vya AZD AI** katika `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Gumzo la .NET RAG na Blazor WebAssembly, Semantic Kernel, na msaada wa gumzo la sauti
  - **azure-search-openai-demo-java** — Gumzo la Java RAG likitumia Langchain4J na chaguo za usambazaji za ACA/AKS
  - **contoso-creative-writer** — Programu ya kuandika ya hadithi kwa mawakala wengi ikitumia Azure AI Agent Service, Bing Grounding, na Prompty
  - **serverless-chat-langchainjs** — RAG isiyo na seva ikitumia Azure Functions + LangChain.js + Cosmos DB na msaada wa maendeleo ya ndani ya Ollama
  - **chat-with-your-data-solution-accelerator** — Kawaida ya kukuza RAG ya taasisi ikiwa na lango la msimamizi, ujumuishaji wa Teams, na chaguo za PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Mfano wa rufaa wa usimamizi wa MCP kwa mawakala wengi na seva katika .NET, Python, Java, na TypeScript
  - **azd-ai-starter** — Kiolezo cha mwanzo cha miundombinu ya Azure AI kwa kutumia Bicep
  - **🔗 Kiungo cha mfukoni cha Ajabu cha AZD AI** — Rukusa kwa [ajabu-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (kilelezi 80+)

#### Imerekebishwa
- **🔗 Utangamano wa agents.md**: Viungo vya Awali/Inayofuata sasa vinafuata mpangilio wa somo la sura ya 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Viungo vilivyovunjika vya agents.md**: `production-ai-practices.md` imebladilishwa kuwa `../chapter-08-production/production-ai-practices.md` (matukio 3)
- **📦 Msimbo uliopotoka wa agents.md**: Imebadilisha `opencensus` kwa `azure-monitor-opentelemetry` + SDK ya OpenTelemetry
- **🐛 API isiyo sahihi ya agents.md**: Imehamisha `max_tokens` kutoka `create_agent()` kwenda `create_run()` kama `max_completion_tokens`
- **🔢 Kuhesabu tokeni za agents.md**: Imebadilisha makadirio mkali ya `len//4` kwa `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Imebadilisha huduma kutoka "Cognitive Search + App Service" kuwa "Azure AI Search + Azure Container Apps" (mwenyeji wa kawaida alibadilika Oktoba 2024)
- **contoso-chat**: Imesasisha maelezo ili kurejelea Azure AI Foundry + Prompty, ikilingana na kichwa halisi cha repo na teknolojia

#### Imetatuliwa
- **ai-document-processing**: Imetoa rejea ya kiolezo isiyoendeshwa (repo haipatikani hadharani kama kiolezo cha AZD)

#### Imeboreka
- **📝 Mazoezi ya agents.md**: Zoefzi 1 sasa inaonyesha matokeo yanayotarajiwa na hatua ya `azd monitor`; Zoefzi 2 ina msimbo kamili wa usajili wa `FunctionTool`; Zoefzi 3 inabadilisha mwongozo wa dhahania kwa amri halisi za `prepdocs.py`
- **📚 Rasilimali za agents.md**: Imeboresha viungo vya nyaraka kwa nyaraka za sasa za Azure AI Agent Service na kuanza haraka
- **📋 Jedwali la Hatua Zinazofuata za agents.md**: Imongeza kiungo cha Maabara ya Warsha ya AI kwa mafunzo kamili ya sura

#### Faili zilizosasishwa
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Uboreshaji wa Uvinjari wa Kozi
**Toleo hili linaongeza muundo bora wa jedwali kwa urambazaji wa sura za README.md.**

#### Imebadilika
- **Jedwali la Ramani ya Kozi**: Limeboreshwa kwa viungo vya moja kwa moja vya somo, makadirio ya muda, na viwango vya ugumu
- **Usafishaji wa Folda**: Folda za zamani zisizohitajika zimeondolewa (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Uhakiki wa Viungo**: Viungo vyote 21+ vya ndani kwenye jedwali la Ramani ya Kozi vimehakikiwa

### [v3.16.0] - 2026-02-05

#### Sasisho la Majina ya Bidhaa
**Toleo hili linasasisha rejea za bidhaa kwa alama za sasa za Microsoft.**

#### Imebadilika
- **Microsoft Foundry → Microsoft Foundry**: Rejea zote zimesasishwa katika faili zisizo za tafsiri
- **Azure AI Agent Service → Foundry Agents**: Jina la huduma limesasishwa kuendana na alama za sasa

#### Faili Zilisasishwa
- `README.md` - Ukurasa mkuu wa kuingia kozi
- `changelog.md` - Historia ya toleo
- `course-outline.md` - Muundo wa kozi
- `docs/chapter-02-ai-development/agents.md` - Mwongozo wa mawakala wa AI
- `examples/README.md` - Nyaraka za mifano
- `workshop/README.md` - Ukurasa wa warsha
- `workshop/docs/index.md` - Kihifadhi cha warsha
- `workshop/docs/instructions/*.md` - Faili zote za maagizo ya warsha

---

### [v3.15.0] - 2026-02-05

#### Mpangilio Mkubwa wa Hifadhi: Majina ya Folda za Sura
**Toleo hili limepanga upya nyaraka katika folda za sura maalum kwa urambazaji bora.**

#### Majina ya Folda Yamebadilika
Folda za zamani zilibadilishwa na zile za sura zilizo na nambari:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Imongeza mpya: `docs/chapter-05-multi-agent/`

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
| Faili zote za awali kabla ya usambazaji | pre-deployment/ | chapter-06-pre-deployment/ |
| Faili zote za kutatua matatizo | troubleshooting/ | chapter-07-troubleshooting/ |

#### Imeongezwa
- **📚 Faili za README za sura**: Imeunda README.md katika kila folda ya sura zenye:
  - Malengo ya kujifunza na muda
  - Jedwali la somo lenye maelezo
  - Amri za Anza Haraka
  - Urambazaji kwa sura nyingine

#### Imebadilika
- **🔗 Viumbe vyote vya ndani vimesasishwa**: Njia 78+ zilisasishwa katika faili zote za nyaraka
- **🗺️ README.md Kuu**: Imeboresha Ramani ya Kozi na muundo mpya wa sura
- **📝 examples/README.md**: Imebadilisha rejea za msalaba kwa folda za sura

#### Imetatuliwa
- Muundo wa zamani wa folda (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Uboreshaji wa Hifadhi: Urambazaji wa Sura
**Toleo hili limeongeza faili za README za urambazaji wa sura (zilibadilishwa na v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Mwongozo Mpya wa Wakala wa AI
**Toleo hili linaongeza mwongozo kamili wa kusambaza mawakala wa AI kwa kutumia Azure Developer CLI.**

#### Imeongezwa
- **🤖 docs/microsoft-foundry/agents.md**: Mwongozo kamili unaojumuisha:
  - Wakala wa AI ni nini na wanatofautianaje na chatbots
  - Violezo vitatu vya mawakala wa anza haraka (Foundry Agents, Prompty, RAG)
  - Mifumo ya usanifu wa wakala (wakala mmoja, RAG, mawakala wengi)
  - Usanidi na usanifu wa zana
  - Ufuatiliaji na kipimo cha takwimu
  - Mambo ya gharama na uboreshaji
  - Hali za kawaida za kutatua matatizo
  - Mazoezi matatu ya vitendo yenye vigezo vya mafanikio

#### Muundo wa Maudhui
- **Utangulizi**: Dhana za wakala kwa wanaoanza
- **Anza Haraka**: Sambaza mawakala kwa `azd init --template get-started-with-ai-agents`
- **Mifumo ya Usanifu**: Michoro ya mifumo ya wakala
- **Usanidi**: Mipangilio ya zana na mabadiliko ya mazingira
- **Ufuatiliaji**: Mwingiliano na Application Insights
- **Mazoezi**: Mafunzo ya hatua kwa hatua (dakika 20-45 kila moja)

---

### [v3.12.0] - 2026-02-05

#### Sasisho la Mazingira ya DevContainer
**Toleo hili linasasisha usanidi wa kontej na zana za kisasa na chaguo bora kwa uzoefu wa kujifunza AZD.**

#### Imebadilika
- **🐳 Picha ya Msingi**: Imebadilishwa kutoka `python:3.12-bullseye` hadi `python:3.12-bookworm` (Debian imara ya hivi karibuni)
- **📛 Jina la Kontejina**: Limebadilishwa kutoka "Python 3" hadi "AZD kwa Wanaoanza" kwa uwazi

#### Imeongezwa
- **🔧 Sifa Mpya za Kontejina ya Maendeleo**:
  - `azure-cli` ikiwa na msaada wa Bicep umewezeshwa
  - `node:20` (toleo la LTS kwa violezo vya AZD)
  - `github-cli` kwa usimamizi wa violezo
  - `docker-in-docker` kwa usambazaji wa container apps

- **🔌 Upitishaji wa Bandari**: Bandari zilizowekwa awali kwa maendeleo ya kawaida:
  - 8000 (Onyesho la MkDocs)
  - 3000 (Programu za wavuti)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Zuizo mpya za VS Code**:
  - `ms-python.vscode-pylance` - Uboreshaji wa Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Msaada wa Azure Functions
  - `ms-azuretools.vscode-docker` - Msaada wa Docker
  - `ms-azuretools.vscode-bicep` - Msaada wa lugha ya Bicep
  - `ms-azure-devtools.azure-resource-groups` - Usimamizi wa rasilimali za Azure
  - `yzhang.markdown-all-in-one` - Uhariri wa Markdown
  - `DavidAnson.vscode-markdownlint` - Kurekebisha makosa ya Markdown
  - `bierner.markdown-mermaid` - Msaada wa michoro ya Mermaid
  - `redhat.vscode-yaml` - Msaada wa YAML (kwa azure.yaml)
  - `eamodio.gitlens` - Uonyesha wa Git
  - `mhutchie.git-graph` - Historia ya Git

- **⚙️ Mipangilio ya VS Code**: Imeongeza mipangilio ya msingi kwa tafsiri ya Python, muundo onyo uhifadhi, na kufuta nafasi za ziada

- **📦 requirements-dev.txt imeboreshwa**:
  - Imeongeza kiendelezi cha MkDocs minify
  - Imeongeza pre-commit kwa ubora wa msimbo
  - Imeongeza vifurushi vya Azure SDK (azure-identity, azure-mgmt-resource)

#### Imerudishwa
- **Amri ya Baada ya Kuunda**: Sasa inathibitisha usakinishaji wa AZD na Azure CLI wakati wa kuanzisha kontejina

---

### [v3.11.0] - 2026-02-05

#### Uboreshaji wa README wa Wanaoanza
**Toleo hili linaimarisha sana README.md ili iwe rahisi kwa wanaoanza na linaongeza rasilimali muhimu kwa watengenezaji wa AI.**

#### Imeongezwa
- **🆚 Mlinganisho wa Azure CLI na AZD**: Ufafanuzi wazi wa wakati wa kutumia kila zana na mifano halisi
- **🌟 Viungo vya Ajabu vya AZD**: Viungo vya moja kwa moja kwa mfukoni wa kiolezo cha jamii na rasilimali za michango:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Violezo 200+ tayari kusambazwa
  - [Wasilisha Kiolezo](https://github.com/Azure/awesome-azd/issues) - Michango ya jamii
- **🎯 Mwongozo wa Anza Haraka**: Sehemu rahisi ya hatua 3 (Sakinisha → Ingia → Sambaza)
- **📊 Jedwali la Urambazaji wa Kulingana na Uzoefu**: Mwongozo wazi wa wapi pa kuanza kulingana na uzoefu wa mtengenezaji

#### Imebadilika
- **Muundo wa README**: Umeandaliwa upya kwa kujifichua hatua kwa hatua - habari muhimu kwanza
- **Sehemu ya Utangulizi**: Imeandikwa upya kuelezea "Uroho wa `azd up`" kwa wanaoanza kabisa
- **Imetoa Maudhui Yanayojirudia**: Imeondoa sehemu ya kuratibu matatizo iliyojirudia
- **Amri za Kutatua Matatizo**: Imerejesha rejea ya `azd logs` kutumia `azd monitor --logs` sahihi

#### Imerekebishwa

- **🔐 Amri za Uthibitishaji**: Iliongeza `azd auth login` na `azd auth logout` kwenye cheat-sheet.md
- **Rejeleo Batili za Amri**: Imeondoa `azd logs` iliyosalia kutoka sehemu ya utatuzi ya README

#### Vidokezo
- **Upeo**: Mabadiliko yalitekelezwa kwenye README.md kuu na resources/cheat-sheet.md
- **Watazamaji Walengwa**: Maboresho yaliyolenga hasa waendelezaji wapya wa AZD

---

### [v3.10.0] - 2026-02-05

#### Sasisho la Usahihi wa Amri za Azure Developer CLI
**Toleo hili limerekebisha amri za AZD ambazo hazipo katika nyaraka zote, kuhakikisha mifano yote ya msimbo inatumia sintaksia halali ya Azure Developer CLI.**

#### Imerekebishwa
- **🔧 Amri za AZD Zisizozoeleka Zimeondolewa**: Ukaguzi wa kina na marekebisho ya amri batili:
  - `azd logs` (haipo) → kubadilishwa na `azd monitor --logs` au mbadala za Azure CLI
  - amri ndogo za `azd service` (hazipo) → kubadilishwa na `azd show` na Azure CLI
  - `azd infra import/export/validate` (hazipo) → kuondolewa au kubadilishwa na mbadala halali
  - vigezo vya `azd deploy --rollback/--incremental/--parallel/--detect-changes` (havipo) → kuondolewa
  - vigezo vya `azd provision --what-if/--rollback` (havipo) → kusasishwa kutumia `--preview`
  - `azd config validate` (haipo) → kubadilishwa na `azd config list`
  - `azd info`, `azd history`, `azd metrics` (hazipo) → kuondolewa

- **📚 Faili Zilizosasishwa na Marekebisho ya Amri**:
  - `resources/cheat-sheet.md`: Marekebisho makubwa ya rejeleo la amri
  - `docs/deployment/deployment-guide.md`: Imerekebisha mikakati ya kurudisha nyuma na uenezaji
  - `docs/troubleshooting/debugging.md`: Imeboresha sehemu za uchambuzi wa kumbukumbu
  - `docs/troubleshooting/common-issues.md`: Imeupdate amri za utatuzi
  - `docs/troubleshooting/ai-troubleshooting.md`: Imefanya marekebisho sehemu ya uanzishaji wa AZD
  - `docs/getting-started/azd-basics.md`: Imeboresha amri za ufuatiliaji
  - `docs/getting-started/first-project.md`: Imeupdate mifano ya ufuatiliaji na uanzishaji
  - `docs/getting-started/installation.md`: Imefanya marekebisho ya mfano wa msaada na toleo
  - `docs/pre-deployment/application-insights.md`: Imeboresha amri za kuangalia kumbukumbu
  - `docs/pre-deployment/coordination-patterns.md`: Imeboresha amri za uanzishaji wa mawakala

- **📝 Sasisho la Kumbukumbu ya Toleo**: 
  - `docs/getting-started/installation.md`: Ilibadilisha toleo la kiasili `1.5.0` kwa kuwa `1.x.x` kwa kiungo cha matoleo

#### Imebadilika
- **Mikakati ya Kurudisha Nyuma**: Nyaraka zimesasishwa kutumia kurudisha nyuma kwa msingi wa Git (AZD haina kurudisha nyuma ya asili)
- **Kuangalia Kumbukumbu**: Kubadilisha rejeleo za `azd logs` na `azd monitor --logs`, `azd monitor --live`, na amri za Azure CLI
- **Sehemu ya Utendaji**: Kuondoa vigezo vya kueneza kwa usawa/kuongeza ambavyo havipo, kutoa mbadala halali

#### Maelezo ya Kiufundi
- **Amri Halali za AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Vigezo Halali vya azd monitor**: `--live`, `--logs`, `--overview`
- **Vipengele Vilivyoondolewa**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Vidokezo
- **Uhakikisho**: Amri zimethibitishwa dhidi ya Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Kukamilika kwa Warsha na Maboresho ya Ubora wa Nyaraka
**Toleo hili linakamilisha moduli za warsha za maingiliano, linarekebisha viungo vyote vilivyovunjika vya nyaraka, na kuboresha ubora wa jumla wa maudhui kwa waendelezaji wa AI wanaotumia Microsoft AZD.**

#### Imeongezwa
- **📝 CONTRIBUTING.md**: Nyaraka mpya za miongozo ya michango na:
  - Maelekezo wazi ya kuripoti matatizo na kupendekeza mabadiliko
  - Viwango vya nyaraka kwa maudhui mapya
  - Miongozo ya mifano ya msimbo na misaada ya ujumbe wa maombi
  - Taarifa za ushirikiano wa jumuiya

#### Imekamilika
- **🎯 Moduli ya Warsha 7 (Hitimisho)**: Moduli ya hitimisho ilikamilika kikamilifu na:
  - Muhtasari wa kina wa mafanikio ya warsha
  - Sehemu ya dhana muhimu zilizojifunza kuhusu AZD, templeti, na Microsoft Foundry
  - Mapendekezo ya kuendelea na safari ya kujifunza
  - Mazoezi ya changamoto za warsha pamoja na viwango vya ugumu
  - Maoni ya jumuiya na viungo vya msaada

- **📚 Moduli ya Warsha 3 (Kutenganisha)**: Imeboresha malengo ya kujifunza na:
  - Uanzishaji wa GitHub Copilot na seva za MCP
  - Uelewa wa muundo wa folda ya templeti ya AZD
  - Mifumo ya muundo wa miundombinu kama msimbo (Bicep)
  - Maelekezo ya maabara ya vitendo

- **🔧 Moduli ya Warsha 6 (Kuvunja Kazi)**: Imekamilika na:
  - Malengo ya kusafisha rasilimali na usimamizi wa gharama
  - Matumizi ya `azd down` kwa usalama wa kuondoa miundombinu
  - Mwongozo wa kurejesha huduma za akili zilizoondolewa kwa upole
  - Mwito wa ziada wa kuchunguza GitHub Copilot na Azure Portal

#### Imerekebishwa
- **🔗 Marekebisho ya Viungo Vilivyovunjika**: Imeondoa viungo 15+ vilivyovunjika vya ndani vya nyaraka:
  - `docs/ai-foundry/ai-model-deployment.md`: Imeboresha njia za microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Imeboresha njia za ai-model-deployment.md na production-ai-practices.md
  - `docs/getting-started/first-project.md`: Kubadilisha cicd-integration.md isiyopo na deployment-guide.md
  - `examples/retail-scenario.md`: Imeboresha njia za maswali ya mara kwa mara na mwongozo wa utatuzi
  - `examples/container-app/microservices/README.md`: Imeboresha njia za nyumbani kwa kozi na mwongozo wa uenezaji
  - `resources/faq.md` na `resources/glossary.md`: Imeupdate rejeleo za sura ya AI
  - `course-outline.md`: Imeboresha mwongozo wa mwalimu na rejeleo za maabara ya warsha ya AI

- **📅 Bango la Hali ya Warsha**: Imesasishwa kutoka "Inaendelea Kujengwa" hadi hali ya warsha hai na tarehe Februari 2026

- **🔗 Ubinzani wa Warsha**: Imerekebisha viungo vya kuvinjari kwenye README.md ya warsha vilivyoelekeza folda isiyopo lab-1-azd-basics

#### Imebadilika
- **Uwasilishaji wa Warsha**: Imeondoa onyo la "inaendelea kujengwa", warsha sasa imekamilika na iko tayari kutumika
- **Ulinganifu wa Uvinjari**: Imedhamiria kuhakikisha moduli zote za warsha zina uvinjari sahihi kati ya moduli
- **Rejeleo za Mitaa ya Kujifunza**: Imeupdate rejeleo za sura kwa njia sahihi za microsoft-foundry

#### Imehakikiwa
- ✅ Faili zote za lugha ya Kiingereza za markdown zina viungo vya ndani halali
- ✅ Moduli za warsha 0-7 zimekamilika pamoja na malengo ya kujifunza
- ✅ Uvinjari kati ya sura na moduli unafanya kazi vizuri
- ✅ Maudhui yanayofaa kwa waendelezaji wa AI wanaotumia Microsoft AZD
- ✅ Lugha na muundo rafiki kwa wanaoanza zimehifadhiwa kwa jumla
- ✅ CONTRIBUTING.md hutoa miongozo wazi kwa wachangiaji wa jumuiya

#### Utekelezaji wa Kiufundi
- **Uthibitisho wa Viungo**: Script ya PowerShell iliyojipangia yenyewe ilihakiki viungo vyote vya ndani vya .md
- **Ukaguzi wa Maudhui**: Ukaguzi wa mkono wa ukamilifu wa warsha na ufaafu wa mwanafunzi
- **Mfumo wa Uvinjari**: Mifumo thabiti ya uvinjari kati ya sura na moduli imetekelezwa

#### Vidokezo
- **Upeo**: Mabadiliko yalitekelezwa kwa nyaraka za Kiingereza pekee
- **Tafsiri**: Folda za tafsiri hazijasasishwa katika toleo hili (tafsiri ya moja kwa moja italinganishwa baadaye)
- **Muda wa Warsha**: Warsha kamili sasa inatoa masaa 3-4 ya mafunzo ya vitendo

---

### [v3.8.0] - 2025-11-19

#### Nyaraka Zaidi: Ufuatiliaji, Usalama, na Mifumo ya Mawakala Wengi
**Toleo hili linaongeza masomo ya daraja la A kuhusu ushirikisho wa Application Insights, mifumo ya uthibitishaji, na usimamizi wa mawakala wengi kwa uenezaji wa viwanda.**

#### Imeongezwa
- **📊 Somo la Ushirikiano wa Application Insights**: katika `docs/pre-deployment/application-insights.md`:
  - Uenezaji unaolenga AZD na utayarishaji wa moja kwa moja
  - Templeti kamili za Bicep kwa Application Insights + Log Analytics
  - Programu za Python zenye utambuzi maalum (mistari 1,200+)
  - Mifumo ya ufuatiliaji wa AI/LLM (ufuatiliaji wa tokeni/gharama ya Microsoft Foundry Models)
  - Michoro 6 ya Mermaid (miundo, ufuatiliaji wa sehemu, mtiririko wa telemetry)
  - Mazoezi 3 ya vitendo (arifa, vidashibodi, ufuatiliaji wa AI)
  - Mifano ya maswali ya Kusto na mikakati ya kuboresha gharama
  - Uenezi wa vipimo vya moja kwa moja na uanzishaji wa muda halisi
  - Muda wa kujifunza wa dakika 40-50 na mifumo tayari kwa uzalishaji

- **🔐 Somo la Mifumo ya Uthibitishaji & Usalama**: katika `docs/getting-started/authsecurity.md`:
  - Mifumo 3 ya uthibitishaji (nyaya za muunganisho, Key Vault, kitambulisho kilichosimamiwa)
  - Templeti kamili za miundombinu ya Bicep kwa uenezaji salama
  - Msimbo wa programu wa Node.js kwa ushirikiano na Azure SDK
  - Mazoezi 3 kamili (uwezeshaji wa kitambulisho kilichosimamiwa, kitambulisho kilichoteuliwa, mzunguko wa Key Vault)
  - Mbinu bora za usalama na usanidi wa RBAC
  - Mwongozo wa utatuzi na uchambuzi wa gharama
  - Mifumo ya uthibitishaji isiyo na nywila kwa uzalishaji

- **🤖 Somo la Mifumo ya Uratibu wa Mawakala Wengi**: katika `docs/pre-deployment/coordination-patterns.md`:
  - Mifumo 5 ya uratibu (mfuatano, sambamba, mlalo, waendeshwa na tukio, makubaliano)
  - Utekelezaji kamili wa huduma ya mpangilio (Python/Flask, mistari 1,500+)
  - Utekelezaji wa mawakala maalum 3 (Utafiti, Mwandishi, Mhariri)
  - Ushirikiano wa Service Bus kwa queue ya ujumbe
  - Usimamizi wa hali ya Cosmos DB kwa mifumo iliyogawanyika
  - Michoro 6 ya Mermaid inayoonyesha mwingiliano wa mawakala
  - Mazoezi 3 ya hali ya juu (kusimamia muda wa kusubiri, mantiki ya jaribio upya, mzunguko wa mzunguko)
  - Mgawanyo wa gharama ($240-565/kwa mwezi) na mikakati ya uboreshaji
  - Ushirikiano wa Application Insights kwa ufuatiliaji

#### Imeboreshwa
- **Sura ya Kabla ya Uenezaji**: Sasa inajumuisha mifumo kamili ya ufuatiliaji na uratibu
- **Sura ya Kuanzia**: Imeboreshwa na mifumo ya kitaalamu ya uthibitishaji
- **Utoaji kwa Uzalishaji**: Makamilisho ya usalama hadi ufuatiliaji
- **Muhtasari wa Kozi**: Imeupdate rejeleo la masomo mapya katika Sura 3 na 6

#### Imebadilika
- **Maendeleo ya Kujifunza**: Ushirikiano bora wa usalama na ufuatiliaji kote katika kozi
- **Ubora wa Nyaraka**: Viwango thabiti vya daraja la A (95-97%) kwa masomo mapya
- **Mifumo ya Uzalishaji**: Mfumuko kamili kutoka mwanzo hadi mwisho kwa uenezaji wa viwanda

#### Imeboreshwa Zaidi
- **Uzoefu wa Mtengenezaji**: Njia wazi kutoka ukuzaji hadi ufuatiliaji wa uzalishaji
- **Viwango vya Usalama**: Mifumo ya kitaalamu ya uthibitishaji na usimamizi wa siri
- **Ufuatiliaji**: Ushirikiano kamili wa Application Insights na AZD
- **Mifumo ya Kazi za AI**: Ufuatiliaji maalum kwa Microsoft Foundry Models na mifumo ya mawakala wengi

#### Imehakikiwa
- ✅ Masomo yote yanajumuisha msimbo kamili unaofanya kazi (si vipande tu)
- ✅ Michoro ya Mermaid kwa kujifunza kwa kutumia picha (jumla 19 katika masomo 3)
- ✅ Mazoezi ya vitendo na hatua za uhakiki (jumla 9)
- ✅ Templeti za Bicep tayari kwa uzalishaji zinazoweza kuenezwa kwa `azd up`
- ✅ Uchambuzi wa gharama na mikakati ya kuboresha
- ✅ Miongozo ya utatuzi na mbinu bora
- ✅ Sehemu za uthibitisho wa maarifa na amri za uhakiki

#### Matokeo ya Ukadiriaji wa Nyaraka
- **docs/pre-deployment/application-insights.md**: - Mwongozo wa kina wa ufuatiliaji
- **docs/getting-started/authsecurity.md**: - Mifumo ya kitaalamu ya usalama
- **docs/pre-deployment/coordination-patterns.md**: - Miundo ya hali ya juu ya mawakala wengi
- **Maudhui Mapya kwa Jumla**: - Viwango thabiti vya ubora wa juu

#### Utekelezaji wa Kiufundi
- **Application Insights**: Log Analytics + telemetry maalum + ufuatiliaji wa sehemu
- **Uthibitishaji**: Kitambulisho kilichosimamiwa + Key Vault + mifumo ya RBAC
- **Mawakala Wengi**: Service Bus + Cosmos DB + Container Apps + mpangilio
- **Ufuatiliaji**: Vipimo vya moja kwa moja + maswali ya Kusto + arifa + vidashibodi
- **Usimamizi wa Gharama**: Mikakati ya sampuli, sera za uhifadhi, udhibiti wa bajeti

### [v3.7.0] - 2025-11-19

#### Maboresho ya Ubora wa Nyaraka na Mfano Mpya wa Microsoft Foundry Models
**Toleo hili linaongeza ubora wa nyaraka kote kwenye hazina na linaongeza mfano kamili wa uenezaji wa Microsoft Foundry Models na interface ya mazungumzo ya gpt-4.1.**

#### Imeongezwa
- **🤖 Mfano wa Mazungumzo ya Microsoft Foundry Models**: Uenezaji kamili wa gpt-4.1 na utekelezaji unaofanya kazi katika `examples/azure-openai-chat/`:
  - Miundombinu kamili ya Microsoft Foundry Models (uenezaji wa mfano wa gpt-4.1)
  - Kiolesura cha mazungumzo ya mstari wa amri wa Python na historia ya mazungumzo
  - Ushirikiano wa Key Vault kwa uhifadhi salama wa API key
  - Ufuatiliaji wa matumizi ya tokeni na makadirio ya gharama
  - Udhibiti wa kiwango na usimamizi wa makosa
  - README kamili na mwongozo wa uenezaji wa dakika 35-45
  - Faili 11 tayari kwa uzalishaji (templeti za Bicep, programu ya Python, usanidi)
- **📚 Mazoezi ya Nyaraka**: Yameongezwa mazoezi ya vitendo kwenye mwongozo wa usanidi:
  - Zoefzi 1: Usanidi wa mazingira mengi (dakika 15)
  - Zoefzi 2: Mazoezi ya usimamizi wa siri (dakika 10)
  - Vigezo vya mafanikio wazi na hatua za uhakiki
- **✅ Uhakikisho wa Uenezaji**: Sehemu ya uhakikisho imeongezwa kwenye mwongozo wa uenezaji:
  - Taratibu za ukarabati wa hali ya afya
  - Orodha ya vigezo vya mafanikio
  - Matokeo yanayotarajiwa kwa amri zote za uenezaji
  - Marejeleo ya haraka ya utatuzi

#### Imeboreshwa
- **examples/README.md**: Imesasishwa hadi ubora wa daraja la A (93%):
  - Imeongeza azure-openai-chat kwenye sehemu zote zinazohusika
  - Idadi ya mifano ya eneo imeongezeka kutoka 3 hadi 4
  - Imeongezwa kwenye jedwali la Mifano ya AI Application
  - Imejumuishwa kwenye Mwanzishaji wa Haraka kwa Watumiaji wa Kati
  - Imeongezwa kwenye Sehemu ya Microsoft Foundry Templates
  - Imeupdate Mlinganyo wa Kulinganisha na sehemu za kutafuta teknolojia
- **Ubora wa Nyaraka**: Kuboresha kutoka B+ (87%) hadi A- (92%) kwenye folda ya nyaraka:

  - Imeongezwa matokeo yanayotarajiwa kwa mifano muhimu ya amri
  - Hatua za uhakiki za mabadiliko ya usanidi zimejumuishwa
  - Mafunzo ya vitendo yameboreshwa kwa mazoezi ya vitendo

#### Imebadilishwa
- **Maendeleo ya Kujifunza**: Muunganiko bora wa mifano ya AI kwa wanafunzi wa kiwango cha wastani
- **Muundo wa Nyaraka**: Mazoezi zaidi yanayotekelezeka yenye matokeo wazi
- **Mchakato wa Uhifadhi**: Vigezo vya mafanikio vilivyo wazi vimeongezwa kwenye michakato muhimu

#### Imeboreshwa
- **Uzoefu wa Mwandishi**: Utekelezaji wa Microsoft Foundry Models sasa unachukua dakika 35-45 (ukilinganisha na dakika 60-90 kwa mbadala tata)
- **Uwazi wa Gharama**: Makadirio wazi ya gharama ($50-200/mwezi) kwa mfano wa Microsoft Foundry Models
- **Njia ya Kujifunza**: Waendelezaji wa AI wana sehemu wazi ya kuingia na azure-openai-chat
- **Viwango vya Nyaraka**: Matokeo yanayotarajiwa na hatua za uhakiki kwa usawa

#### Imethibitishwa
- ✅ Mfano wa Microsoft Foundry Models unafanya kazi kikamilifu kwa `azd up`
- ✅ Faili zote 11 za utekelezaji ziko sahihi kisintaksia
- ✅ Maelekezo ya README yanaendana na uzoefu halisi wa utekelezaji
- ✅ Viungo vya nyaraka vimeboreshwa katika maeneo zaidi ya 8
- ✅ Kielelezo cha mifano kinaonyesha mifano 4 ya ndani kwa usahihi
- ✅ Hakuna viungo vya nje vinavyorudiwa kwenye jedwali
- ✅ Marejeleo yote ya urambazaji ni sahihi

#### Utekelezaji wa Kiufundi
- **Muundo wa Microsoft Foundry Models**: gpt-4.1 + Key Vault + Mfano wa Container Apps
- **Usalama**: Utambulisho wa Kusimamiwa tayari, siri katika Key Vault
- **Ufuatiliaji**: Muunganisho wa Application Insights
- **Usimamizi wa Gharama**: Ufuatiliaji wa Token na uboreshaji wa matumizi
- **Utekelezaji**: Amri moja `azd up` kwa usanidi kamili

### [v3.6.0] - 2025-11-19

#### Sasisho Kuu: Mifano ya Utekelezaji wa Container App
**Toleo hili linaanzisha mifano kamili, inayotumika moja kwa moja ya utekelezaji wa programu za container kwa kutumia Azure Developer CLI (AZD), pamoja na nyaraka kamili na muingiliano katika njia ya kujifunza.**

#### Imeongezwa
- **🚀 Mifano ya Container App**: Mifano mipya ya ndani katika `examples/container-app/`:
  - [Mwongozo Mkuu](examples/container-app/README.md): Muhtasari kamili wa utekelezaji wa containerized, kuanza haraka, utengenezaji, na mifano ya juu zaidi
  - [API Rahisi ya Flask](../../examples/container-app/simple-flask-api): REST API rafiki kwa wanaoanza yenye scale-to-zero, vipimo vya afya, ufuatiliaji, na utatuzi wa matatizo
  - [Muundo wa Microservices](../../examples/container-app/microservices): Utekelezaji wa huduma nyingi kwa utengenezaji (API Gateway, Bidhaa, Oda, Mtumiaji, Arifa), ujumbe wa async, Service Bus, Cosmos DB, Azure SQL, ufuatiliaji wa usambazaji, utekelezaji wa blue-green/canary
- **Mazingira Bora**: Usalama, ufuatiliaji, kuboresha gharama, na mwongozo wa CI/CD kwa mizigo ya containerized
- **Mifano ya Msimbo**: Kamili `azure.yaml`, templates za Bicep, na utekelezaji wa huduma za lugha nyingi (Python, Node.js, C#, Go)
- **Upimaji & Utatuzi**: Hali za majaribio ya mwisho hadi mwisho, amri za ufuatiliaji, mwongozo wa utatuzi

#### Imebadilishwa
- **README.md**: Imesasishwa kuonyesha na kuunganisha mifano mipya ya container app chini ya "Local Examples - Container Applications"
- **examples/README.md**: Imesasishwa kusisitiza mifano ya container app, kuongeza vipengele vya jedwali la kulinganisha, na kusasisha marejeleo ya teknolojia/muundo
- **Muundo wa Kozi & Mwongozo wa Kujifunza**: Imesasishwa kurejelea mifano mipya ya container app na mifano ya utekelezaji katika sura husika

#### Imethibitishwa
- ✅ Mifano yote mipya inaweza kutekelezwa kwa `azd up` na inafuata mazoea bora
- ✅ Viungo vya nyaraka na urambazaji vimesasishwa
- ✅ Mifano inashughulikia matukio ya awali hadi ya juu, ikijumuisha microservices za uzalishaji

#### Vidokezo
- **Uwanja**: Nyaraka na mifano kwa Kiingereza pekee
- **Hatua Zinazofuata**: Kuongeza mifano ya juu zaidi ya container na mchakato wa atomatiki wa CI/CD katika toleo lijalo

### [v3.5.0] - 2025-11-19

#### Ubunifu Mpya wa Bidhaa: Microsoft Foundry
**Toleo hili linafanya mabadiliko makubwa ya jina la bidhaa kutoka "Microsoft Foundry" hadi "Microsoft Foundry" katika nyaraka zote za Kiingereza, kuakisi mabadiliko rasmi ya chapa ya Microsoft.**

#### Imebadilishwa
- **🔄 Sasisho la Jina la Bidhaa**: Ubadilishaji kamili kutoka "Microsoft Foundry" hadi "Microsoft Foundry"
  - Marejeleo yote yamebadilishwa katika nyaraka za Kiingereza katika folda `docs/`
  - Folda yamebadilishwa jina: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Faili yamebadilishwa jina: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumla: Marejeleo 23 ya maudhui yameboreshwa katika faili 7 za nyaraka

- **📁 Mabadiliko ya Muundo wa Folda**:
  - `docs/ai-foundry/` yamebadilishwa jina kuwa `docs/microsoft-foundry/`
  - Marejeleo yote yaliyovuka yameboreshwa kuakisi muundo mpya wa folda
  - Viungo vya urambazaji vimehakikiwa katika nyaraka zote

- **📄 Mabadiliko ya Majina ya Faili**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Viungo vyote vya ndani vimesasishwa kuonyesha jina jipya la faili

#### Faili Zilisasishwa
- **Nyaraka za Sura** (faili 7):
  - `docs/microsoft-foundry/ai-model-deployment.md` - masasisho 3 ya viungo vya urambazaji
  - `docs/microsoft-foundry/ai-workshop-lab.md` - marejeleo 4 ya jina la bidhaa yamebadilishwa
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - tayari ikitumia Microsoft Foundry (kutoka masasisho ya awali)
  - `docs/microsoft-foundry/production-ai-practices.md` - marejeleo 3 yamebadilishwa (muhtasari, maoni ya jamii, nyaraka)
  - `docs/getting-started/azd-basics.md` - masasisho 4 ya viungo vya mzunguko
  - `docs/getting-started/first-project.md` - masasisho 2 ya viungo vya sura
  - `docs/getting-started/installation.md` - masasisho 2 ya viungo vinavyofuata sura
  - `docs/troubleshooting/ai-troubleshooting.md` - marejeleo 3 yamebadilishwa (urambazaji, jamii ya Discord)
  - `docs/troubleshooting/common-issues.md` - sasisho 1 la kiungo cha urambazaji
  - `docs/troubleshooting/debugging.md` - sasisho 1 la kiungo cha urambazaji

- **Faili za Muundo wa Kozi** (faili 2):
  - `README.md` - marejeleo 17 yamebadilishwa (muhtasari wa kozi, vichwa vya sura, sehemu ya templates, maelezo ya jamii)
  - `course-outline.md` - marejeleo 14 yamebadilishwa (muhtasari, malengo ya kujifunza, rasilimali za sura)

#### Imethibitishwa
- ✅ Hakuna marejeleo yaliyobaki ya njia ya folda "ai-foundry" katika nyaraka za Kiingereza
- ✅ Hakuna marejeleo yaliyobaki ya jina la bidhaa "Microsoft Foundry" katika nyaraka za Kiingereza
- ✅ Viungo vyote vya urambazaji vinavyofanya kazi na muundo mpya wa folda
- ✅ Mabadiliko ya majina ya faili na folda yamekamilika kwa mafanikio
- ✅ Marejeleo ya msalaba kati ya sura yamehakikiwa

#### Vidokezo
- **Uwanja**: Mabadiliko yamefanywa tu kwa nyaraka za Kiingereza katika folda `docs/`
- **Tafsiri**: Foldingi za tafsiri (`translations/`) hazijasasishwa katika toleo hili
- **Warsha**: Vifaa vya warsha (`workshop/`) havijasasishwa katika toleo hili
- **Mifano**: Faili za mifano bado zinaweza kurejelea majina ya zamani (yatakayoshughulikiwa katika sasisho lijalo)
- **Viungo vya Nje**: URL za nje na marejeleo ya hifadhidata za GitHub hayajakabadilika

#### Mwongozo wa Uhamiaji kwa Wachangiaji
Ikiwa una matawi ya ndani au nyaraka zinazo-rejelea muundo wa zamani:
1. Sasisha marejeleo ya folda: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Sasisha marejeleo ya faili: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Badilisha jina la bidhaa: "Microsoft Foundry" → "Microsoft Foundry"
4. Hakikisha viungo vyote vya ndani vya nyaraka vinafanya kazi

---

### [v3.4.0] - 2025-10-24

#### Maboresho ya Maonyesho ya Miundombinu na Uhaguzi
**Toleo hili linaanzisha msaada mzuri kwa kipengele kipya cha Azure Developer CLI cha preview na linaongeza uzoefu wa mtumiaji wa warsha.**

#### Imeongezwa
- **🧪 Nyaraka za Kipengele cha azd provision --preview**: Uwasilishaji kamili wa uwezo mpya wa maonyesho ya miundombinu
  - Marejeleo ya amri na mifano ya matumizi kwenye karatasi ya maelezo
  - Muunganisho wa kina katika mwongozo wa ugawaji na matumizi na faida
  - Muunganiko wa ukaguzi kabla ya ndege kwa uthibitishaji salama wa utekelezaji
  - Sasisho za mwongozo wa kuanza na mbinu za usalama wa kwanza kwa utekelezaji
- **🚧 Bango la Hali ya Warsha**: Bango la kitaalamu la HTML linaloonyesha hali ya maendeleo ya warsha
  - Muundo wa mwelekeo wa kijani na dalili za ujenzi kwa mawasiliano ya wazi kwa mtumiaji
  - Tarehe ya sasisho la mwisho kwa uwazi
  - Muundo unaofaa kwa vifaa vyote vya simu

#### Imeboreshwa
- **Usalama wa Miundombinu**: Kipengele cha preview kimejumuishwa katika nyaraka zote za utekelezaji
- **Uhakiki kabla ya Utekelezaji**: Skripti za otomatiki sasa zinajumuisha upimaji wa preview ya miundombinu
- **Mtiririko wa Mwandishi**: Sehemu za amri zimesasishwa kujumuisha preview kama mbinu bora
- **Uzoefu wa Warsha**: Matumaini wazi kwa watumiaji kuhusu hali ya maendeleo ya maudhui

#### Imebadilishwa
- **Mazingira Bora ya Utekelezaji**: Mtiririko wa preview kwanza sasa unapendekezwa
- **Mtiririko wa Nyaraka**: Uhaguzi wa miundombinu umehamishiwa mapema katika mchakato wa kujifunza
- **Uwasilishaji wa Warsha**: Mawasilisho ya kitaalamu ya hali na ratiba ya maendeleo iliyowekwa wazi

#### Imeboreshwa
- **Mbinu ya Usalama-Kwanza**: Mabadiliko ya miundombinu sasa yanaweza kuhakikiwa kabla ya utekelezaji
- **Ushirikiano wa Timu**: Matokeo ya preview yanaweza kushirikiwa kwa ukaguzi na idhini
- **Uelewa wa Gharama**: Uelewa bora wa gharama za rasilimali kabla ya kugawa
- **Kuzuia Hatari**: Kupunguza makosa ya utekelezaji kupitia uhakiki wa awali

#### Utekelezaji wa Kiufundi
- **Muunganisho wa Nyaraka Nyingi**: Kipengele cha preview kimeandikwa katika faili 4 muhimu
- **Mifano ya Amri**: Sarufi na mifano sawia katika nyaraka zote
- **Muunganiko wa Mazoea Bora**: Preview imejumuishwa katika mifumo ya uhakiki na skripti
- **Dalili za Kitalu**: Alama wazi za kipengele CHA MPYA kwa ugunduzi rahisi

#### Miundombinu ya Warsha
- **Mawasilisho ya Hali**: Bango la kitaalamu la HTML lenye mtindo wa rangi mchanganyiko
- **Uzoefu wa Mtumiaji**: Kuweka wazi hali ya maendeleo kunazuia mkanganyiko
- **Uwasilishaji wa Kitaalamu**: Huweka hadhi ya hifadhidata huku ikipanga matarajio
- **Uwajibikaji wa Ratiba**: Tarehe ya mwisho ya sasisho Oktoba 2025 kwa uwajibikaji

### [v3.3.0] - 2025-09-24

#### Vifaa Vimeboreshwa vya Warsha na Uzoefu wa Kujifunza Usiohodofu
**Toleo hili linaanzisha vifaa vya kina vya warsha na mwongozo wa mwingiliano wa kivinjari na njia za kujifunza zilizoumbwa.**

#### Imeongezwa
- **🎥 Mwongozo wa Warsha unaowezesha Kuingiliana**: Uzoefu wa warsha unaotegemea kivinjari na kipengele cha preview cha MkDocs
- **📝 Maelekezo ya Warsha Yaliyopangwa**: Njia ya hatua 7 inayotengwa kuanzia kugundua hadi kubinafsisha
  - 0-Utangulizi: Muhtasari wa warsha na usanidi
  - 1-Chagua-Kiolezo-AI: Mchakato wa kugundua na kuchagua kiolezo
  - 2-Thibitisha-Kiolezo-AI: Taratibu za utekelezaji na uhakiki
  - 3-Avua-Kiolezo-AI: Kuelewa muundo wa kiolezo
  - 4-Panga-Kiolezo-AI: Usanidi na ubinafsishaji
  - 5-Binafsisha-Kiolezo-AI: Marekebisho ya hali ya juu na mizunguko
  - 6-Ċoka-Miundombinu: Usafishaji na usimamizi wa rasilimali
  - 7-Malizia: Muhtasari na hatua zinazofuata
- **🛠️ Vifaa vya Warsha**: Usanidi wa MkDocs na mandhari ya Material kwa uzoefu bora wa kujifunza
- **🎯 Njia ya Kujifunza Kwa Vitendo**: Mbinu ya hatua 3 (Ugundaji → Utekelezaji → Ubinafsishaji)
- **📱 Muunganisho wa GitHub Codespaces**: Usanidi wa mazingira ya maendeleo bila mshono

#### Imeboreshwa
- **Maabara ya Warsha ya AI**: Imeneleza uzoefu wa kujifunza uliopangwa wa masaa 2-3
- **Nyaraka za Warsha**: Uwasilishaji wa kitaalamu wenye urambazaji na msaada wa kuona
- **Maendeleo ya Kujifunza**: Mwongozo wazi wa hatua kwa hatua kuanzia uchaguzi wa kiolezo hadi utekelezaji wa uzalishaji
- **Uzoefu wa Mwandishi**: Vifaa vimejumuishwa kwa mtiririko ulio rahisi wa maendeleo

#### Imeboreshwa
- **Upatikanaji**: Uso wa kivinjari wenye utafutaji, nakili, na badilisha mandhari
- **Kujifunza kwa Mpakato**: Muundo wa warsha unaobadilika kwa kasi tofauti za kujifunza
- **Matumizi ya Vitendo**: Matukio halisi ya utekelezaji wa kiolezo cha AI
- **Muunganiko wa Jamii**: Muunganiko wa Discord kwa msaada wa warsha na ushirikiano

#### Sifa za Warsha
- **Utafutaji Jumuishi**: Ugunduzi wa haraka wa maneno na masomo
- **Nakili Vizuizi vya Msimbo**: Kazi ya kubofya-nakili kwa mifano yote ya msimbo
- **Mbadala wa Mandhari**: Msaada wa hali ya giza/nuru kwa upendeleo tofauti
- **Rasilimali za Kuona**: Picha za skrini na michoro kwa ufahamu bora
- **Muunganisho wa Msaada**: Ufikiaji wa moja kwa moja wa Discord kwa msaada wa jamii

### [v3.2.0] - 2025-09-17

#### Uboreshaji Mkubwa wa Urambazaji na Mfumo wa Kujifunza Kulingana na Sura
**Toleo hili linaanzisha mfumo kamili wa kujifunza kulingana na sura na urambazaji ulioimarishwa katika hifadhidata yote.**

#### Imeongezwa
- **📚 Mfumo wa Kujifunza Kulingana na Sura**: Mchakato wa kozi umepangwa upya katika sura 8 za maendeleo ya kujifunza
  - Sura 1: Msingi & Kuanzia Haraka (⭐ - dakika 30-45)
  - Sura 2: Maendeleo ya AI-Kwanza (⭐⭐ - saa 1-2)
  - Sura 3: Usanidi & Uthibitishaji (⭐⭐ - dakika 45-60)
  - Sura 4: Miundombinu Kama Msimbo & Utekelezaji (⭐⭐⭐ - saa 1-1.5)
  - Sura 5: Suluhisho la AI la Wakala Wengi (⭐⭐⭐⭐ - saa 2-3)
  - Sura 6: Uhaguzi & Mipango Kabla ya Utekelezaji (⭐⭐ - saa 1)
  - Sura 7: Utatizo & Ucheshi wa Mende (⭐⭐ - saa 1-1.5)
  - Sura 8: Mifano ya Uzalishaji & Biashara (⭐⭐⭐⭐ - saa 2-3)
- **📚 Mfumo Kamili wa Urambazaji**: Vichwa vya urambazaji na miguu ya ukurasa kwa mfululizo katika nyaraka zote
- **🎯 Ufuatiliaji wa Maendeleo**: Orodha ya ukamilishaji wa kozi na mfumo wa uhakiki wa kujifunza
- **🗺️ Mwongozo wa Njia ya Kujifunza**: Sehemu wazi za kuingia kwa viwango tofauti vya uzoefu na malengo
- **🔗 Urambazaji wa Marejeleo ya Msalaba**: Sura zinazohusiana na mahitaji imeunganishwa wazi

#### Imeboreshwa
- **Muundo wa README**: Umebadilishwa kuwa jukwaa lililopangwa la kujifunza kulingana na sura
- **Urambazaji wa Nyaraka**: Kila ukurasa sasa unajumuisha muktadha wa sura na mwongozo wa maendeleo
- **Mipangilio ya Kiolezo**: Mifano na templates vimepangwa kulingana na sura za kujifunza

- **Uchanganuzi wa Rasilimali**: Taratibu za hila, Maswali Yanayoulizwa Mara kwa Mara, na mwongozo wa kusoma unaounganishwa na sura husika
- **Uchanganuzi wa Warsha**: Maabara za vitendo zilizopangwa kwa malengo ya kujifunza ya sura nyingi

#### Kubadilishwa
- **Maendeleo ya Kujifunza**: Kuondoka kutoka kwenye nyaraka za mstari hadi kujifunza kwa sura zinazobadilika
- **Mahali pa Usanidi**: Kuhamishwa kwa mwongozo wa usanidi kama Sura ya 3 kwa mtiririko wa kujifunza bora
- **Uchanganuzi wa Maudhui ya AI**: Uunganishaji bora wa maudhui maalum ya AI katika mzunguko wa kujifunza
- **Maudhui ya Uzalishaji**: Mifumo ya hali ya juu iliyojumuishwa katika Sura ya 8 kwa wanafunzi wa kampuni

#### Kuboreshwa
- **Uzoefu wa Mtumiaji**: Viashiria vya urambazaji wazi na dalili za maendeleo ya sura
- **Ufikiaji**: Mifumo thabiti ya urambazaji kwa upitishaji wa kozi rahisi
- **Uwasilishaji wa Kitaalamu**: Muundo wa kozi wa mtindo wa chuo unaofaa kwa mafunzo ya kitaalamu na kampuni
- **Ufanisi wa Kujifunza**: Kupunguza muda wa kupata maudhui husika kupitia upangaji bora

#### Utekelezaji wa Kiufundi
- **Vichwa vya Urambazaji**: Kumaanisha urambazaji wa sura kwa viwango katika faili 40+ za nyaraka
- **Urambazaji wa Msingi**: Mwongozo unaolingana wa maendeleo na dalili za kukamilika kwa sura
- **Uunganishaji wa Msalaba**: Mfumo wa kina wa viungo vya ndani unaounganisha dhana zinazohusiana
- **Ramani ya Sura**: Violezo na mifano iliyo wazi kuhusishwa na malengo ya kujifunza

#### Uboreshaji wa Mwongozo wa Kusoma
- **📚 Malengo Kamili ya Kujifunza**: Mwongozo wa kusoma ulirekebishwa kulingana na mfumo wa sura 8
- **🎯 Tathmini za Kimsingi kwa Sura**: Kila sura ina malengo maalum ya kujifunza na mazoezi ya vitendo
- **📋 Ufuatiliaji wa Maendeleo**: Ratiba ya mkutano wa wiki mbili yenye matokeo yanayopimika na orodha za ukamilishaji
- **❓ Maswali ya Tathmini**: Maswali ya kuthibitisha maarifa kwa kila sura yenye matokeo ya kitaalamu
- **🛠️ Mazoezi ya Vitendo**: Shughuli za vitendo zenye matukio halisi ya usambazaji na utatuzi wa matatizo
- **📊 Maendeleo ya Ujuzi**: Kuenea kwa wazi kutoka dhana za msingi hadi mifumo ya kampuni na mkazo wa maendeleo ya kazi
- **🎓 Mfumo wa Cheti**: Matokeo ya maendeleo ya kitaalamu na mfumo wa kutambua jamii
- **⏱️ Usimamizi wa Ratiba**: Mpango wa kujifunza wa wiki 10 wenye muundo na uthibitisho wa hatua

### [v3.1.0] - 2025-09-17

#### Ufumbuzi Bora wa AI wa Wakala Wengi
**Toleo hili linaboresha suluhisho la wauzaji wa wakala wengi kwa kuitwa bora ya wakala na nyaraka zinazoboreshwa.**

#### Kubadilishwa
- **Mifumo ya Wakala Wengi**: Kubadilisha "Wakala wa Cora" na "Wakala wa Mteja" katika suluhisho la wauzaji wa wakala wengi kwa uelewa bora
- **Mimarishaji ya Wakala**: Kusasisha nyaraka zote, templeti za ARM, na mifano ya msimbo kwa kutumia jina thabiti la "Wakala wa Mteja"
- **Mifano ya Usanidi**: Kusasisha mifumo ya usanidi wa wakala kwa kutumia utamaduni wa majina uliobobea
- **Ulinganifu wa Nyaraka**: Kuhakikisha marejeleo yote yanatumia majina ya kitaalamu na ya kuelezea wakala

#### Kuboreshwa
- **Kifurushi cha Templeti za ARM**: Kusasisha retail-multiagent-arm-template na marejeleo ya Wakala wa Mteja
- **Michoro ya Mimarishaji**: Kusafisha michoro ya Mermaid na majina ya wakala yaliyosasishwa
- **Mifano ya Msimbo**: Madarasa ya Python na mifano ya utekelezaji sasa hutumia majina ya CustomerAgent
- **Variable za Mazingira**: Kusasisha script zote za usambazaji kwa kutumia mfumo wa majina ya CUSTOMER_AGENT_NAME

#### Kuboreshwa
- **Uzoefu wa Mwandishi**: Majukumu na wajibu wazi wa wakala katika nyaraka
- **Utakaso wa Uzalishaji**: Kulingana kwa majina bora kwa viwango vya kampuni
- **Vifaa vya Kujifunza**: Majina ya wakala yaliyo eleweka zaidi kwa madhumuni ya elimu
- **Urahisi wa Mtindo**: Uelewa rahisi wa kazi za wakala na mifumo ya usambazaji

#### Maelezo ya Kiufundi
- Kusasisha michoro ya miimarishaji ya Mermaid na marejeleo ya CustomerAgent
- Kubadilisha majina ya madarasa ya CoraAgent na CustomerAgent katika mifano ya Python
- Kubadilisha usanidi wa templeti za ARM kwa kutumia aina ya wakala "customer"
- Kusasisha variable za mazingira kutoka CORA_AGENT_* hadi mifumo ya CUSTOMER_AGENT_*
- Kusafisha maagizo yote ya usambazaji na usanidi wa kontena

### [v3.0.0] - 2025-09-12

#### Mabadiliko Makubwa - Msisitizo wa Mwandishi wa AI na Uchanganuzi wa Microsoft Foundry
**Toleo hili linageuza hifadhidata kuwa rasilimali kamilifu ya kujifunza iliyoangaziwa na AI na uunganishaji wa Microsoft Foundry.**

#### Kuongezwa
- **🤖 Njia ya Kujifunza Kwanza ya AI**: Muundo kamili unaoweka wakala wa AI na wahandisi watangulizi
- **Mwongozo wa Uunganishaji wa Microsoft Foundry**: Nyaraka kamili za kuunganisha AZD na huduma za Microsoft Foundry
- **Mifumo ya Usambazaji wa Mfano wa AI**: Mwongozo wa kina unaochukua uchaguzi wa mfano, usanidi, na mikakati ya usambazaji wa uzalishaji
- **Warsha ya AI**: Warsha ya vitendo yenye muda wa saa 2-3 kwa kubadilisha programu za AI kuwa suluhisho za usambazaji za AZD
- **Mifumo Bora ya AI kwa Uzalishaji**: Mifumo ya biashara inayoweza kushughulikia kuongeza wigo, ufuatiliaji, na usalama wa mzigo wa AI
- **Mwongozo wa Utatuzi wa AI**: Utatuzi wa kina kwa Models za Microsoft Foundry, Cognitive Services, na matatizo ya usambazaji wa AI
- **Makusanyo ya Templeti za AI**: Mkusanyiko mzuri wa templeti za Microsoft Foundry zenye viwango vya ugumu
- **Vifaa vya Warsha**: Muundo kamili wa warsha zenye maabara za mikono na nyaraka za rejea

#### Kuboreshwa
- **Muundo wa README**: Ukusanyaji wa wakala wa AI na data ya maslahi ya jamii 45% kutoka Discord ya Microsoft Foundry
- **Njia za Kujifunza**: Njia za mwandishi wa AI pamoja na njia za jadi za wanafunzi na wahandisi wa DevOps
- **Mapendekezo ya Templeti**: Templeti za AI za kuangaziwa zikiwemo azure-search-openai-demo, contoso-chat, na openai-chat-app-quickstart
- **Ushirikiano wa Jamii**: Msaada mkamilifu wa jamii wa Discord ulioongezwa na njia za kujadili za AI

#### Usalama & Mkazo wa Uzalishaji
- **Mifumo ya Utambulisho Iliyosimamiwa**: Usanidi wa usalama na uthibitisho maalum wa AI
- **Uboreshaji wa Gharama**: Ufuatiliaji wa matumizi ya tokeni na udhibiti wa bajeti kwa mzigo wa AI
- **Usambazaji wa Mikoa Mingi**: Mikakati ya usambazaji wa programu za AI duniani kote
- **Ufuatiliaji wa Utendaji**: Vipimo vya AI na uunganisho wa Application Insights

#### Ubora wa Nyaraka
- **Muundo wa Kozi wa Mstari**: Maendeleo ya mantiki kutoka mwanzo hadi mifumo ya hali ya juu ya usambazaji wa AI
- **URLs Zilizo Thibitishwa**: Viungo vyote vya hifadhidata ya nje vimehakikiwa na vinaweza kufikiwa
- **Rejea Kamili**: Viungo vyote vya ndani vimehakikiwa na vinafanya kazi ipasavyo
- **Tayari kwa Uzalishaji**: Mifumo ya usambazaji wa biashara yenye mifano halisi ya dunia

### [v2.0.0] - 2025-09-09

#### Mabadiliko Makubwa - Urekebishaji wa Hifadhidata na Uboreshaji wa Kitaalamu
**Toleo hili linawakilisha marekebisho makubwa ya muundo wa hifadhidata na uwasilishaji wa maudhui.**

#### Kuongezwa
- **Mfumo wa Kujifunza ulio Pangiliwa**: Kurasa zote za nyaraka sasa zina Sehemu za Utangulizi, Malengo ya Kujifunza, na Matokeo ya Kujifunza
- **Mfumo wa Urambazaji**: Viungo vya somo la awali/lijalo vimeongezwa kwenye nyaraka zote kwa maendeleo ya kujifunza kwa miongozo
- **Mwongozo wa Kusoma**: Mwongozo wa kusoma wa kina with malengo ya kujifunza, mazoezi ya vitendo, na nyaraka za tathmini
- **Uwasilishaji wa Kitaalamu**: Kuondoa alama za emoji zote kwa upatikanaji bora na muonekano wa kitaalamu
- **Muundo wa Maudhui ulioboreshwa**: Upangaji na mtiririko bora wa vifaa vya kujifunza

#### Kubadilishwa
- **Muundo wa Nyaraka**: Kupangilia nyaraka zote na muundo wa kitaalamu unaolenga kujifunza
- **Mtiririko wa Urambazaji**: Kutekeleza mwelekeo wa mantiki kupitia vifaa vyote vya kujifunza
- **Uwasilishaji wa Maudhui**: Kuondoa vipengele vya mapambo badala ya uwasilishaji wazi, wa kitaalamu
- **Muundo wa Viungo**: Kusasisha viungo vyote vya ndani kusaidia mfumo mpya wa urambazaji

#### Kuboresha
- **Upatikanaji**: Kuondoa utegemezi wa emoji kwa usawazishaji bora wa wasomaji wa skrini
- **Muonekano wa Kitaalamu**: Uwasilishaji safi wa mtindo wa kitaaluma unaofaa kwa kujifunza kwa kampuni
- **Uzoefu wa Kujifunza**: Mbinu iliyopangiliwa na malengo wazi na matokeo kwa kila somo
- **Upangaji wa Maudhui**: Mtiririko mzuri wa mantiki na uhusiano kati ya mada zinazohusiana

### [v1.0.0] - 2025-09-09

#### Toleo la Awali - Hifadhidata Kamili ya Kujifunza AZD

#### Kuongezwa
- **Muundo wa Nyaraka wa Msingi**
  - Mfululizo kamili wa mwongozo wa kuanza
  - Nyaraka kamili za usambazaji na upangaji
  - Rasilimali za kina za utatuzi na mwongozo wa kuondoa hitilafu
  - Zana na taratibu za ukaguzi kabla ya usambazaji

- **Sehemu ya Kuanzisha**
  - Misingi ya AZD: Dhana na istilahi za msingi
  - Mwongozo wa Ufungaji: Maelekezo maalum ya jukwaa
  - Mwongozo wa Usanidi: Mipangilio ya mazingira na uthibitisho
  - Mafunzo ya Mradi wa Kwanza: Kujifunza kwa mikono hatua kwa hatua

- **Sehemu ya Usambazaji na Upangaji**
  - Mwongozo wa Usambazaji: Nyaraka kamili za mtiririko wa kazi
  - Mwongozo wa Upangaji: Miundombinu kama Msimbo kwa kutumia Bicep
  - Mazoezi bora kwa usambazaji wa uzalishaji
  - Mifumo ya usanifu wa huduma nyingi

- **Sehemu ya Ukaguzi Kabla ya Usambazaji**
  - Upangaji wa Uwezo: Ukaguzi wa upatikanaji wa rasilimali za Azure
  - Uchaguzi wa SKU: Mwongozo wa viwango vya huduma kwa kina
  - Ukaguzi wa Mapema: Script za ukaguzi wa kiotomatiki (PowerShell na Bash)
  - Zana za makadirio ya gharama na upangaji bajeti

- **Sehemu ya Utatuzi**
  - Masuala ya Kawaida: Matatizo yanayokumbwa mara kwa mara na suluhisho
  - Mwongozo wa Utatuzi: Mbinu za utatuzi wa mfumo kwa mpangilio
  - Mbinu na zana za uchunguzi wa hali ya juu
  - Ufuatiliaji wa utendaji na uboreshaji

- **Rasilimali na Marejeleo**
  - Karatasi ya Amri za Hila: Marejeo ya haraka kwa amri muhimu
  - Kamusi: Maelezo kamili ya istilahi na vifupisho
  - Maswali Yanayoulizwa Mara kwa Mara (FAQ): Majibu ya kina kwa maswali ya kawaida
  - Viungo vya rasilimali za nje na uhusiano wa jamii

- **Mifano na Templeti**
  - Mfano rahisi wa Programu ya Mtandao
  - Templeti ya upangaji wa Tovuti Takatifu
  - Usanidi wa Programu ya Kontena
  - Mifumo ya ushirikiano wa hifadhidata
  - Mifano ya usanifu wa huduma ndogo (microservices)
  - Utekelezaji wa kazi zisizo na seva (serverless)

#### Sifa
- **Msaada wa Majukwaa Mengi**: Mwongozo wa usanikishaji na usanidi kwa Windows, macOS, na Linux
- **Viwango Mbalimbali vya Ujuzi**: Maudhui yaliyoandaliwa kwa wanafunzi hadi kwa waendelezaji wa kitaalamu
- **Mkazo wa Vitendo**: Mifano ya mikono na matukio halisi ya dunia
- **Ufunikaji Kamili**: Kutoka dhana za msingi hadi mifumo ya hali ya juu ya biashara
- **Mbinu za Usalama Kwanza**: Mazoezi bora ya usalama yamejumuishwa kila mahali
- **Uboreshaji wa Gharama**: Mwongozo wa upangaji wa gharama nafuu na usimamizi wa rasilimali

#### Ubora wa Nyaraka
- **Mifano ya Msimbo wa Kina**: Mifano ya msimbo ya vitendo, iliyojaribiwa
- **Maelekezo Hatua kwa Hatua**: Mwongozo wazi na unaotekelezeka
- **Usimamizi Kamili wa Makosa**: Utatuzi wa matatizo ya kawaida
- **Ujumuishaji wa Mazoezi Bora**: Viwango na mapendekezo ya sekta
- **Ulinganifu wa Toleo**: Inasalama na huduma za Azure za mwisho pamoja na vipengele vya azd

## Maboresho Yaliyopangwa kwa Baadaye

### Toleo 3.1.0 (Linalopangwa)
#### Upanuzi wa Jukwaa la AI
- **Msaada wa Mifano Mingi**: Mifumo ya uunganishaji kwa Hugging Face, Azure Machine Learning, na mifano ya kawaida
- **Mifumo ya Wakala wa AI**: Templeti za LangChain, Semantic Kernel, na usambazaji wa AutoGen
- **Mifumo ya Juu ya RAG**: Chaguzi za hifadhidata za vector zaidi ya Azure AI Search (Pinecone, Weaviate, n.k.)
- **Uangalizi wa AI**: Ufuatiliaji ulioboreshwa kwa utendaji wa mfano, matumizi ya tokeni, na ubora wa majibu

#### Uzoefu wa Mwandishi
- **Kiendelezi cha VS Code**: Uzoefu wa maendeleo wa AZD + Microsoft Foundry uliounganishwa
- **Uunganishaji wa GitHub Copilot**: Uzalishaji wa templeti za AZD ulioendeshwa na AI
- **Mafunzo ya Kuestari**: Mazoezi ya mikono ya uandishi wa msimbo yenye uthibitisho wa kiotomatiki kwa hali za AI
- **Maudhui ya Video**: Mafunzo ya video ya ziada kwa wanaojifunza kwa kuona wakiwa makini na usambazaji wa AI

### Toleo 4.0.0 (Linalopangwa)
#### Mifumo ya AI ya Biashara
- **Mfumo wa Udhibiti**: Udhibiti wa modeli za AI, uzingatiaji, na nyaraka za ukaguzi
- **AI ya Wakazi Wengi**: Mifumo ya kuhudumia wateja wengi kwa huduma tofauti za AI
- **Usambazaji wa AI wa Edge**: Uunganishaji na Azure IoT Edge na kontena za kibiashara
- **AI ya Wingu Mchanganyiko**: Mifumo ya usambazaji wa wingu nyingi na mchanganyiko kwa mzigo wa AI

#### Sifa za Juu
- **Uendeshaji wa AI**: Uunganishaji wa MLOps na mabomba ya Azure Machine Learning
- **Usalama Bora**: Mifumo ya kuaminika bila mtandao, vituo vya binafsi, na ulinzi wa vitisho vya hali ya juu
- **Uboreshaji wa Utendaji**: Mbinu za hali ya juu za kuandaa na kuboresha ukubwa wa programu za AI zenye magari mengi
- **Usambazaji wa Kimataifa**: Mifumo ya usambazaji maudhui na kuhifadhi kumbukumbu karibu kwa programu za AI

### Toleo 3.0.0 (Linalopangwa) - Limezidiwa na Toleo la Sasa
#### Matoleo yaliyopendekezwa - Sasa Yametekelezwa katika v3.0.0
- ✅ **Maudhui ya AI**: Uunganishaji kamili wa Microsoft Foundry (Umefanyika)
- ✅ **Mafunzo ya Kiestari**: Warsha ya vitendo ya AI (Umefanyika)
- ✅ **Sehemu ya Usalama ya Juu**: Mifumo ya usalama maalum ya AI (Umefanyika)
- ✅ **Uboreshaji wa Utendaji**: Mikakati ya kupunguza mzigo wa AI (Umefanyika)

### Toleo 2.1.0 (Linalopangwa) - Sehemu Imetekelezwa katika v3.0.0
#### Maboresho Madogo - Baadhi yamekamilika katika Toleo la Sasa
- ✅ **Mifano Zaidi**: Matukio ya usambazaji yaliyolenga AI (Yamefanyika)
- ✅ **FAQ Iliyo Panuliwa**: Maswali na utatuzi maalum wa AI (Yamefanyika)
- **Uunganishaji wa Zana**: Mwongozo wa uunganishaji wa IDE na mhariri
- ✅ **Upanuzi wa Ufuatiliaji**: Mifumo ya ufuatiliaji na onyo maalum wa AI (Yamefanyika)

#### Bado Yanaendelea Kutekelezwa kwa Toleo lijalo
- **Nyaraka Zinazofaa Simu Mkononi**: Ubunifu unaoendana na simu za mkononi kwa kujifunza
- **Upatikanaji wa Nyaraka Isiyo mtandaoni**: Pakiti za nyaraka zinazopakuliwa
- **Uunganishaji wa IDE ulioboreshwa**: Kiongezi cha VS Code kwa AZD + mitiririko ya AI
- **Dashibodi ya Jamii**: Vipimo vya wakati halisi vya jamii na ufuatiliaji wa michango

## Kuchangia katika Mabadiliko ya Rekodi

### Kuripoti Mabadiliko
Unapo changia kwenye hifadhidata hii, tafadhali hakikisha mambo ya mabadiliko yanajumuisha:

1. **Nambari ya Toleo**: Kufuatana na toleo la semantiki (kubwa.ndogo.tobo)
2. **Tarehe**: Tarehe ya kutolewa au sasisho kwa muundo wa YYYY-MM-DD
3. **Aina**: Imeongezwa, Imebadilishwa, Imetupwa, Imeondolewa, Imerekebishwa, Usalama
4. **Maelezo ya Wazi**: Maelezo mafupi ya kilichobadilika
5. **Tathmini ya Athari**: Jinsi mabadiliko yanavyoathiri watumiaji waliopo

### Aina za Mabadiliko

#### Imeongezwa
- Sifa mpya, sehemu za nyaraka, au uwezo mpya
- Mifano mpya, templeti, au rasilimali za kujifunza
- Zana, script, au vifaa vingine

#### Imebadilishwa
- Marekebisho ya uwezo uliopo au nyaraka
- Sasisho za kuboresha uwazi au usahihi
- Upangaji upya wa maudhui au shirika

#### Imetupwa
- Sifa au mbinu zinazozamizwa au kuondolewa taratibu
- Sehemu za nyaraka zilizopangwa kuondolewa
- Mbinu zilizo na mbadala bora

#### Imeondolewa
- Sifa, nyaraka, au mifano isiyo na umuhimu tena
- Taarifa za zamani au mbinu zilizotupwa
- Maudhui yaliyohifadhiwa au kuunganishwa

#### Imerekebishwa
- Marekebisho ya makosa katika nyaraka au msimbo
- Utatuzi wa matatizo yaliyoripotiwa
- Maboresho ya usahihi au utendakazi


#### Usalama
- Maboresho au marekebisho yanayohusiana na usalama
- Sasisho za mbinu bora za usalama
- Ufumbuzi wa udhaifu wa usalama

### Mwongozo wa Toleo la Semantic

#### Toleo Kuu (X.0.0)
- Mabadiliko yanayovunja yanayohitaji hatua kutoka kwa mtumiaji
- Mipangilio mikubwa ya maudhui au muundo
- Mabadiliko yanayobadilisha mbinu au njia msingi

#### Toleo Dogo (X.Y.0)
- Vipengele vipya au nyongeza za maudhui
- Maboresho yanayohifadhi usawa wa nyuma
- Mifano, zana, au rasilimali za ziada

#### Toleo La Marekebisho (X.Y.Z)
- Marekebisho ya mbugs na makosa
- Maboresho madogo kwa maudhui yaliyopo
- Ufafanuzi na maboresho madogo

## Maoni na Mapendekezo ya Jamii

Tunahamasisha kwa nguvu maoni ya jamii kuboresha rasilimali hii ya kujifunza:

### Jinsi ya Kutoa Maoni
- **Masuala ya GitHub**: Ripoti matatizo au mapendekezo ya maboresho (masuala maalum ya AI yanakaribishwa)
- **Majadiliano ya Discord**: Shiriki mawazo na waingie katika jamii ya Microsoft Foundry
- **Maombi ya Kuchangia**: Changia maboresho ya moja kwa moja kwa maudhui, hasa kwa templeti na mwongozo wa AI
- **Microsoft Foundry Discord**: Shiriki katika kituo cha #Azure kwa majadiliano ya AZD + AI
- **Mikutano ya Jamii**: Shiriki katika majadiliano makubwa ya waendelezaji wa Azure

### Aina za Maoni
- **Usahihi wa Maudhui ya AI**: Marekebisho ya ushirikishaji na uanzishaji wa huduma za AI
- **Uzoefu wa Kujifunza**: Mapendekezo ya mtiririko bora wa kujifunza kwa waendelezaji wa AI
- **Maudhui ya AI Yanayokosekana**: Maombi ya templeti, mifumo, au mifano ya ziada ya AI
- **Ufikiaji**: Maboresho kwa mahitaji mbalimbali ya kujifunza
- **Ushirikiano wa Zana za AI**: Mapendekezo ya mchakato bora wa maendeleo ya AI
- **Mifano ya AI kwa Uzalishaji**: Maombi ya mifumo ya uanzishaji wa AI kwa mashirika

### Ahadi ya Kujibu
- **Majibu ya Masuala**: Ndani ya saa 48 kwa matatizo yaliyoripotiwa
- **Maombi ya Vipengele**: Tathmini ndani ya wiki moja
- **Mchango wa Jamii**: Mapitio ndani ya wiki moja
- **Masuala ya Usalama**: Kipaumbele cha haraka na majibu ya haraka

## Ratiba ya Matengenezo

### Sasisho za Kawaida
- **Mapitio ya Kila Mwezi**: Usahihi wa maudhui na uthibitishaji wa viungo
- **Sasisho za Robo ya Mwaka**: Nyongeza kubwa za maudhui na maboresho
- **Mapitio ya Nusu Mwaka**: Uboreshaji na upangaji upya wa kina
- **Matangazo ya Mwaka**: Sasisho za toleo kuu zenye maboresho makubwa

### Ufuatiliaji na Udhibiti wa Ubora
- **Upimaji wa Kiotomatiki**: Uhakiki wa kawaida wa mifano ya msimbo na viungo
- **Ushirikiano wa Maoni ya Jamii**: Uingizwa wa mapendekezo ya watumiaji mara kwa mara
- **Sasisho za Teknolojia**: Ulinganifu na huduma za Azure za hivi karibuni na toleo la azd
- **Ukaguzi wa Ufikiaji**: Mapitio ya mara kwa mara kwa kanuni za muundo jumuishi

## Sera ya Msaada wa Matoleo

### Msaada wa Toleo la Sasa
- **Toleo Kuu la Hivi Punde**: Msaada kamili na sasisho za kawaida
- **Toleo Kuu la Zamani**: Sasisho za usalama na marekebisho makuu kwa miezi 12
- **Matoleo ya Kale**: Msaada wa jamii tu, hakuna sasisho rasmi

### Mwongozo wa Uhamiaji
Wakati matoleo makuu yanapotolewa, tunatoa:
- **Miongozo ya Uhamiaji**: Maelekezo hatua kwa hatua ya mabadiliko
- **Maelezo ya Ulinganifu**: Maelezo kuhusu mabadiliko yanayovunja
- **Msaada wa Zana**: Mifumo au zana kusaidia uhamiaji
- **Msaada wa Jamii**: Mikutano maalum kwa maswali ya uhamiaji

---

**Mnyororo wa Kuendesha**
- **Somo la Awali**: [Mwongozo wa Kujifunza](resources/study-guide.md)
- **Somo Linalofuata**: Rudi kwenye [README Kuu](README.md)

**Endelea Kusasishwa**: Tazama hazina hii kupata taarifa kuhusu matoleo mapya na sasisho muhimu kwa nyenzo za kujifunza.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->