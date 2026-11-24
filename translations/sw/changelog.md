# Mabadiliko - AZD Kwa Waanzilishi

## Utangulizi

Kumbukumbu hii ya mabadiliko inaonyesha mabadiliko yote muhimu, masasisho, na maboresho kwenye hazina ya AZD Kwa Waanzilishi. Tunafuata kanuni za toleo la maana na tunahifadhi kumbukumbu hii kusaidia watumiaji kuelewa yaliyobadilika kati ya matoleo.

## Malengo ya Kujifunza

Kwa kupitia kumbukumbu hii ya mabadiliko, utakuwa na uwezo wa:
- Kuwa na taarifa kuhusu vipengele vipya na nyongeza za maudhui
- Kuelewa maboresho yaliyofanywa kwenye nyaraka zilizopo
- Kufuatilia marekebisho ya kasoro na marekebisho ili kuhakikisha usahihi
- Kufuatilia mabadiliko ya vifaa vya kujifunzia kwa muda

## Matokeo ya Kujifunza

Baada ya kupitia kumbukumbu za mabadiliko, utaweza:
- Kutambua maudhui na rasilimali mpya zinazopatikana kwa ajili ya kujifunza
- Kuelewa sehemu gani zimeboreshwa au kusasishwa
- Kupanga njia yako ya kujifunza kulingana na vifaa vya kisasa zaidi
- Kuchangia maoni na mapendekezo kwa maboresho ya baadaye

## Historia ya Toleo

### [v3.25.0] - 2026-11-09

#### Nyongeza ya Microsoft Foundry 1.0 sasa inapatikana kwa ujumla

Kifurushi cha `microsoft.foundry` 1.0 ni **hai na inapatikana kwa ujumla**, kama ilivyotangazwa [Novemba 5, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kozi sasa inafundisha mtiririko wa kazi ulioachiliwa GA, sio toleo lijalo. Anza na AZD **1.37.0 au zaidi** na `azd ext install microsoft.foundry`.

#### Vinapatikana kwenye sasisho hii ya kozi
- Mwongozo wa Kiingereza unatumia kifurushi cha GA kama njia ya usakinishaji chaguo-msingi na kueleza nyongeza zake saba zinazoendeshwa kiutawala kwa toleo tofauti.
- [Maelekezo ya wakala mwenyeji](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) yanahusu mfano wa API za Majibu ya Mipango ya Wakala wa Python wa asili, uv wa sasa, Python 3.13+, uteuzi wa miradi mipya/iliyopo, matumizi ya tena ya modeli, na uhakiki wa `azure.yaml`.
- Mtiririko wa kazi wa kutoka kwa karibu kuelekea wingu unahusisha majaribio ya Msimamizi wa Wakala, gharama za simu za modeli zilizo na msaada wa Azure, ujenzi wa msimbo wa mbali, utekelezaji uliowekwa, ufuatiliaji wa wingu, mtazamo wa usambazaji, kumbukumbu, na uchunguzi.
- Mwongozo tofauti wa tathmini unahusu utengenezaji na uhakiki wa seti za data/mwongozo, usanidi wa tathmini yenye jina, usajili wa mali, na ukaguzi wa matokeo. Maagizo ya zamani ya tathmini/ubora bado ni kumbukumbu za uhamisho, sio msingi wa toleo la sasa.
- Mwongozo wa Foundry CI/CD unajumuisha usakinishaji wa nyongeza za mchezaji, usambazaji ulio na uthibitisho, mali za tathmini/ufikiaji, na lango la ubora wazi.
- Mwongozo wa usafishaji unatafsiri miradi ya Foundry iliyoundwa hivi karibuni na iliyotumiwa tena. Warsha ina viungo vya zoezi la GA tofauti bila kubadilisha majaribio maalum ya mfano wake.
- Uelekezaji wa kozi, malengo ya kujifunza, masharti ya usakinishaji, karatasi ya hila, Maswali Yanayoulizwa Mara kwa Mara, na mwongozo wa masomo vinaakisi mtiririko wa GA. Tafsiri zilizozalishwa hazihaririwi kwa mkono.

#### Upana wa uhakiki
- Kulingana na tangazo la GA, mwongozo wa Microsoft Learn uliounganishwa, na usanidi wa mfano wa asili. Hakukuwa na utoaji wa Azure wa moja kwa moja, usambazaji, simu ya modeli, au tathmini iliyofanyika.
- Kifurushi cha GA hakiashiri GA kwa kila kipengele cha hiari, nyongeza huru, au SDK, wala haidhinishwi mifano kwa uzalishaji.

### [v3.24.0]- 2026-11-04

#### Imerejeshwa
- Irudishe urambazaji wa kozi wa Kiingereza, njia za kurasa zilizohamishwa, mihimili iliyokosekana, na marejeleo ya nje ya zamani, ikiwa ni pamoja na kiungo cha Sura ya 2 kwa mwongozo wa AI wa uzalishaji.
- Ilipitia mwongozo wa sasa dhidi ya AZD 1.37.2 iliyochapishwa, mawakala 1.0.0-beta.23, na tathmini 1.0.0-beta.2. Ilichezea mtiririko wa kazi tofauti wa `azd ai eval` na uahamishaji wa usanidi wa uboreshaji.
- Ilirekebisha bendera za CLI zisizotegemezwa, mipaka ya uthibitisho, mwongozo wa mazingira/macho usiofichwa, masasisho ya miundombinu, usanidi wa modeli, na mifano ya ukarabati wa uharibifu.
- Iliboresha warsha dhidi ya mfano wa sasa wa AI Agents, ikiwa ni pamoja na vitisho halisi, pembejeo za usanidi, majaribio ya tathmini, maeneo ya kuingia ya red-teaming, na uangalizi.
- Ilirekebisha madai ya utekelezaji wa mfano na kurekebisha masuala yanayohusiana na programu/miundombinu/usanidi. Nyenzo za usanifu wa rejareja zinaonyesha wazi tofauti na programu kamili inayoendeshwa.
- Irudisha matrix ya lugha ya CodeQL, ilichagua Node.js 24 inayoungwa mkono kwa chombo cha maendeleo, na ilifanya vitu vya kuangalia usakinishaji kuripoti amri za toleo zilizoshindwa.

#### Imekuzwa
- Kikagua viungo/vihimili vya nje vya Kiingereza tu bila mtandao, majaribio ya kuendelea, na mtiririko wa nyaraka unaojenga warsha katika hali kali. Tafsiri zilizozalishwa na picha zilizotafsiriwa hazijatambuliwa.

#### Upana wa uhakiki
- Chanzo, muundo, usanidi, tabia za ndani, na ukaguzi wa viungo vya mtandao haviundii uwezekano wa usambazaji wa moja kwa moja wa Azure, alama za huduma, RBAC, upatikanaji wa modeli wa kikanda, upangaji malipo, ulinzi wa usalama, au utayari wa uzalishaji.
- Kumbukumbu za zamani zilizo chini ni rekodi za kihistoria, si maagizo ya amri au toleo la sasa.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Kusasisha: Sasisho la Toleo
**Toleo hili linathibitisha tena kozi dhidi ya `azd` `1.27.1` (Julai 2026, toleo imara la hivi karibuni) na nyongeza ya wakala wa AI ya onyesho la sasa `azure.ai.agents` `1.0.0-beta.5`, likileta bendera zote za "zilikaguliwa dhidi ya" hadi sasa baada ya matoleo 1.26.0, 1.27.0, na 1.27.1.**

#### Imebadilika
- **✅ Msingi wa uthibitisho umesasishwa** kutoka `azd 1.25.6` (Juni 2026) hadi `azd 1.27.1` (Julai 2026) kwenye README kuu, yote ya sura zote, somo la beseni la Sura ya 1 (ikiwa ni pamoja na mifano ya toleo lililowekwa), somo la templeti maalum la Sura ya 4, somo la wakala wengi la Sura ya 5, na nyaraka za warsha
- **🤖 Msingi wa Sura ya 2 umesasishwa** kutoka `azd 1.23.12` (Machi 2026) hadi `azd 1.27.1` kwenye `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, na `microsoft-foundry-integration.md`; tarehe za noti za uthibitisho zimebadilishwa hadi 2026-07-13
- **🧩 Nyongeza ya wakala wa AI imeongezwa** kutoka `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` hadi toleo la sasa `1.0.0-beta.5` kwenye README ya Sura ya 2 na `agents.md`
- **🧪 Mfano wa uthibitisho wa warsha** (`azd version` matokeo) imesasishwa hadi `1.27.1`

#### Vidokezo kuhusu matoleo yanayohusiana na azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Msaada wa Go kwa Azure Functions kwenye Flex Consumption, `azd config sub-filter` vichujio vya usajili wa kila mpangaji, vifurushi vya nyongeza wenyewe (`azd x pack --bundle`), na `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Miradi/mawakala ya Model Azure AI Foundry moja kwa moja kwenye `azure.yaml` (kuanzishwa bila Bicep/Terraform), msaada wa usambazaji wa chombo cha App Service (`host: appservice` + `language: docker`), amri za moja kwa moja za `-s/--source` kwa `azd extension`, na `azd tool uninstall`
- **1.27.1 (2026-07-09):** Bendera ya `--no-dependencies` kwa `azd extension install`, mifano iliyopotoka isijumlishwe kwenye orodha/mipangilio ya alama kwa default, na maboresho kadhaa ya kasoro

#### Faili Zilisasishwa
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

#### Jaza Pengo la Mwanzo #2: Uandishi wa Templeti, Mifuko ya Maendeleo, Pulumi, Azure DevOps, Wakuu wa Huduma, na Zaidi
**Toleo hili linamaliza mapengo ya kati yaliyobainika na uchambuzi wa azd-coverage: jinsi ya kuandika na kuchapisha templeti yako mwenyewe, mazingira yanayoweza kurudiwa ya mifuko ya maendeleo/Codespaces, mtoa huduma wa miundombinu Pulumi, maelekezo ya Azure DevOps CI/CD, uthibitisho wa wakuu wa huduma, mwongozo wa uchaguzi wa mwenyeji (AKS/Spring Apps), maelezo ya `azd restore`/`azd package`, utatuzi wa makosa wa hook, na mazoea ya mazingira ya timu/shirika.**

#### Imeongezwa
- **🧱 Somo jipya la Sura ya 4** `docs/chapter-04-infrastructure/custom-templates.md` — kuandika templeti yako mwenyewe ya azd: muundo unaohitajika (`azure.yaml`, `infra/`, `src/`), sehemu ya `metadata.template`, kuanzisha miundombinu kwa tokeni ya rasilimali ya `uniqueString()` na lebo ya `azd-env-name`, kujaribu kwa ndani na `azd init --template <local-path>`, kuchapisha kwenye GitHub, na kuwasilisha kwenye maktaba ya Awesome AZD
- **📦 Somo jipya la Sura ya 1** `docs/chapter-01-foundation/dev-containers.md` — mazingira yanayoweza kurudiwa ya azd na Mifuko ya Maendeleo na GitHub Codespaces: mfano wa chini wa `.devcontainer/devcontainer.json` ukitumia kipengele rasmi cha `ghcr.io/azure/azure-dev/azd`, vipengele vya lugha maalum, `docker-in-docker` kwa wenyeji wa mipako, na `azd auth login --use-device-code` kwa kuingia kwa mbali
- **🧩 Sehemu ya Pulumi na azd** kwenye `docs/chapter-04-infrastructure/provisioning.md` — usanidi wa `infra.provider: pulumi`, mpangilio wa folda ya Pulumi, mafaili ya staki yanayohusiana na mazingira ya azd, matokeo yanayohitajika/lebo, na mtiririko huo sawa wa `azd up` / `azd down`
- **🎯 Mwongozo wa uchaguzi wa mwenyeji** kwenye `docs/chapter-04-infrastructure/provisioning.md` — kulinganisha kirafiki kwa waanzilishi wa `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, na `springapp`, na mwongozo wa lini kuchagua AKS au Azure Spring Apps
- **🛠️ Maelekezo ya Azure DevOps CI/CD** kwenye `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, muunganisho wa huduma na ushirikiano wa utambulisho wa mzigo (OIDC), `azure-dev.yml` iliyozalishwa, na usanidi wa kundi la vigezo
- **🔑 Wakuu wa Huduma (Mfano 4)** umeongezwa kwenye `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` isiyo na mwingiliano na siri ya mteja dhidi ya vyeti vya ushirikiano/OIDC, wakati wa kutumia, na uhifadhi salama wa vyeti
- **🪝 Sehemu ya utatuzi wa makosa ya hook** kwenye `docs/chapter-04-infrastructure/deployment-guide.md` — msimbo wa kutoka na `set -e`, `continueOnError`, kujaribu hooks pekee na `azd hooks run`, shell maalum za OS, na `--debug`
- **👥 Sehemu ya timu/mazingira yaliyoshirikiwa** kwenye `docs/chapter-03-configuration/configuration.md` — nini kinaishi kwenye `.azure/`, nini cha kubaguliwa kwa gitignore, mazingira ya mtengenezaji mmoja mmoja, `azd env list`/`select`, na kutoa maadili ya mazingira katika CI/CD
- **🧰 Maelezo ya `azd restore` na usanidi wa kina wa `azd package`** kwenye `resources/cheat-sheet.md` — kurejesha utegemezi na kujenga kifaa kinachoweza kusambazwa bila kusambaza

#### Imebadilika
- **🧭 Jedwali la masomo ya Sura ya 4** limesasishwa kujumuisha somo jipya la "Kuandika Templeti Yako Mwenyewe" (Somo la 3)
- **🧭 Jedwali la masomo ya Sura ya 1** limesasishwa kujumuisha somo jipya la "Mifuko ya Maendeleo & Codespaces" (Somo la 5); miguu ya urambazaji imeunganishwa kati ya `bring-your-own-app.md` na `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Jaza Pengo la Mwanzo: Somo la Vitendo la Wakala Wengi, "Leta Programu Yako," Terraform, na Maelekezo ya CI/CD
**Toleo hili linamaliza mapengo makubwa ya mwongozo kamili kwa waanzilishi kwa kuongeza masomo mawili mapya ya vitendo (maelekezo ya wakala wengi yanayotumika na kuongeza azd kwenye programu iliyopo), utangulizi rafiki wa hooks, sehemu ya Terraform pamoja na azd, maelekezo ya hatua kwa hatua ya mtoaji wa GitHub Actions, ufafanuzi wa nyongeza mpya ya onyesho, na orodha ya ukaguzi wa usambazaji wazi.**

#### Imeongezwa
- **🤝 Somo jipya la Sura ya 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — maelekezo kamili ya vitendo kwa wakala wawili wanaoweza kusambazwa (mratibu + wataalamu) kwa kutumia templeti halisi (`contoso-creative-writer`), kujumuisha lini kutumia wakala wengi, mtiririko wa `azd up`, kuelewa rasilimali zilizosambazwa, ufuatiliaji wa wakala wa mseto, ubinafsishaji, na usafishaji
- **📦 Somo jipya la Sura ya 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jinsi ya kuongeza azd kwenye mradi uliopo kwa kutumia `azd init` ("tumia msimbo kwenye saraka ya sasa"), kuelewa `azure.yaml` na `infra/`, `azd infra generate`, kugundua mwenyeji, na kusambaza kwa kutumia `azd up`
- **🌐 Sehemu ya Terraform pamoja na azd** imeongezwa kwenye `docs/chapter-04-infrastructure/provisioning.md` — usanidi wa `infra.provider: terraform`, mpangilio wa folda ya `.tf`, matokeo yanayohitajika ya `AZURE_*` na lebo ya `azd-env-name`, na mtiririko huo huo wa `azd up` / `azd down` (inaleta msaada wa Terraform kwa njia tosha kinyume na ilivyoonyeshwa awali Bicep pekee)
- **⚙️ Mwongozo wa hatua kwa hatua wa GitHub Actions** katika `docs/chapter-08-production/production-ai-practices.md` — kutoka kwa repo ya GitHub hadi kupeleka otomatiki: `azd pipeline config`, vyeti vya OIDC vilivyounganishwa (hakuna siri zilizohifadhiwa), `azure-dev.yml` iliyoundwa, na mwongozo wa siri dhidi ya mabadiliko
- **🪝 Utangulizi kwa Waanza "Mpya kwa hooks?"** katika `docs/chapter-04-infrastructure/deployment-guide.md` — hook ni nini, jedwali la hatua za hook, hook ya kwanza ya chini kabisa, na kuendesha hooks kwa mkono kwa kutumia `azd hooks run`
- **✅ Orodha ya "Thibitisha Utekelezaji Wako"** iliyoOngezwa katika Hatua ya 5 ya `docs/chapter-01-foundation/first-project.md` — jaribio la moshi, ukaguzi wa mwisho wa afya, na vigezo vya mafanikio wazi
- **🧩 Ufafanuzi wa ugani mpya za awali** `azure.ai.skills` na `azure.ai.connections` (nini wanavyokuwa na lini kuzitumia) katika `docs/chapter-08-production/production-ai-practices.md`

#### Imebadilishwa
- **🧭 Jedwali la masomo ya Sura ya 5** limerekebishwa: `multi-agent-basics.md` sasa ni Somo la 1 (somo pekee la vitendo kikamilifu), kwa lebo ya uaminifu kwamba Somo la 2 linaishi katika Sura ya 6 na hali ya Retail ni mchoro wa usanifu, sio kiolezo cha amri moja
- **🧭 Jedwali la masomo ya Sura ya 1** sasa linajumuisha somo jipya la "Lete Programu Yako" (Somo la 4)
- **🔗 Misingi ya urambazaji** imesasishwa: `first-project.md` sasa inaunganisha mbele kwa `bring-your-own-app.md`

#### Imerekebishwa
- **🧱 Kufunga pengo la Terraform lililodaiwa lakini halikuwepo** — kozi hapo awali ilirejelea msaada wa Terraform bila kuonyesha
- **🔀 Mifano ya kuunganisha isiyo sahihi ya Sura ya 5** ambayo ilionyesha utekelezaji kamili wa mawakala wengi wakati kwa hakika ilikuwa ni mchoro wa usanifu tu

#### Faili Zilisasishwa
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

#### Azimio la AZD 1.25.6, Amri Kamili za Mzunguko wa Maisha wa Wakala & Kubadilika kwa Aspire
**Toleo hili linathibitisha tena kozi dhidi ya `azd` `1.25.6` (Juni 2026) na ugani wa `azure.ai.agents` `0.1.40-preview`, linaongeza mwongozo wa AI kutoka "kujenga wakala" hadi mzunguko kamili wa maisha ya wakala (jaribu → tathmini → boresha → angalia → futa), linaonesha ugani mpya wa `azure.ai.skills` na `azure.ai.connections`, na linaonyesha kubadilika kwa bidhaa kutoka ".NET Aspire" kwenda "Aspire".**

#### Imeongezwa
- **🔁 Ufunikaji kamili wa mzunguko wa maisha wa wakala** kwa waanza na wahandisi wa AI katika nyaraka:
  - `docs/chapter-01-foundation/azd-basics.md` — Jedwali la Mzunguko wa Maisha (kujenga → jaribu → pima → boresha → angalia → safisha) limeongezwa katika sehemu za Ugani na Amri za AI
  - `docs/chapter-08-production/production-ai-practices.md` — Sehemu mpya ya "Kusimamia Mzunguko wa Maisha wa Wakala" ikijumuisha `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, na `delete --force`
  - `resources/cheat-sheet.md` — Amri za AI za Wakala zilizoenea zikiwa na `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, na `delete --force`
- **🧩 Ugani mpya za awali** zimeandikwa: `azure.ai.skills` (ujuzi wa wakala unaoweza kutumika tena) na `azure.ai.connections` (unganisho za Foundry) zimeongezwa kwenye jedwali la ugani na karatasi ya hila
- **⏱️ Mwongozo wa muda wa majibu** — mifano ya `azd ai agent invoke` sasa inaonyesha kwamba inachapisha msongamano wa jumla na muda wa kuanza kupokea byte ya kwanza
- **📌 Bango la toleo** katika README mkuu likielekeza wanafunzi kwa `azd version` na `azd upgrade`

#### Imebadilishwa
- **✅ Msingi wa uthibitishaji umebadilishwa** kutoka `azd 1.23.12` (Machi 2026) hadi `azd 1.25.6` (Juni 2026) katika zote README za sura na nyaraka za warsha
- **🤖 Kumbukumbu za ugani wa Sura ya 2** zimebadilishwa kutoka `azure.ai.agents` `0.1.18-preview` hadi `0.1.40-preview`
- **🧪 Mfano wa uthibitishaji wa warsha** (matokeo ya `azd version`) umebadilishwa kuwa `1.25.6`
- **🧭 README "Nini Kipya katika azd Leo"** imesasishwa kufafanua mzunguko wa maisha wa wakala, ugani mpya wa AI, na marekebisho ya ubora wa maisha (`azd init` kuzuia mara mbili, `azd auth login` kusafisha tokeni iliyochakaa, `azd tool` onyesho la mara ya kwanza)
- **📖 Sura ya 2 agents.md (Chaguo la 4)** sasa inaelekeza wanafunzi kwa amri za mzunguko wa maisha baada ya utekelezaji badala ya kuacha kwa `azd up`

#### Imerekebishwa
- **🏷️ Uteuzi wa jina la bidhaa** — kuongeza taarifa ya kubadilika jina la Aspire (".NET Aspire" sasa ni "Aspire" tu); msaada wa aspired wa azd haujabadilika
- **🔎 Uthibitishaji wa toleo la moja kwa moja** umethibitishwa dhidi ya usambazaji wa Azure Developer CLI: azd thabiti `1.25.6` (2026-06-12) na `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Faili Zilisasishwa
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

#### Ufafanuzi wa Uanzishaji kwa Waanza, Uthibitishaji wa Usanidi & Usafishaji wa Amri ya Mwisho ya AZD
**Toleo hili linafuata msafishaji wa uthibitisho wa AZD 1.23 kwa njia ya maandishi yenye lengo la waanza: linafafanua mwongozo wa uthibitishaji wa kwanza wa AZD, linaongeza skripti za uthibitishaji wa usanidi wa ndani, linathibitisha amri muhimu dhidi ya AZD CLI ya moja kwa moja, na linaondoa marejeleo ya amri za kiingereza zisizotumika nje ya orodha ya mabadiliko.**

#### Imeongezwa
- **🧪 Skripti za uthibitishaji wa usanidi kwa waanza** zikiwa na `validate-setup.ps1` na `validate-setup.sh` ili wanafunzi waweze kuthibitisha zana zinazohitajika kabla ya kuanza Sura 1
- **✅ Hatua za mwanzo za uthibitishaji wa usanidi** katika README kuu na README ya Sura 1 ili kuhakikisha mahitaji hayakosekani kabla ya `azd up`

#### Imebadilishwa
- **🔐 Mwongozo wa uthibitishaji kwa waanza** sasa hutumia mara zote `azd auth login` kama njia kuu kwa mizunguko ya kazi ya AZD, huku `az login` ikitajwa kama hiari isipokuwa amri za Azure CLI zitakapotumika moja kwa moja
- **📚 Mtiririko wa uanzishaji wa Sura ya 1** sasa unaelekeza wanafunzi kuthibitisha usanidi wao wa ndani kabla ya hatua za usakinishaji, uthibitishaji, na utekelezaji wa kwanza
- **🛠️ Ujumbe wa kidhibiti** sasa unatofautisha wazi mahitaji ya kuzuia kutoka kwa onyo za hiari za Azure CLI kwa njia ya waanza wa AZD pekee
- **📖 Nyaraka za usanidi, utatuzi matatizo, na mifano** sasa zinatofautisha kati ya uthibitishaji wa lazima wa AZD na kuingia kwa hiari kwa Azure CLI ambapo zote zilikuwa zimewasilishwa bila muktadha hapo awali

#### Imerekebishwa
- **📋 Marejeleo yaliyobaki ya amri za kiingereza** yamebadilishwa kuwa aina za sasa za AZD, ikijumuisha `azd config show` kwenye karatasi ya hila na `azd monitor --overview` ambapo mwongozo wa muhtasari wa Azure Portal ulikusudiwa
- **🧭 Madai ya waanza katika Sura ya 1** yamepunguzwa kuepuka ahadi ya tabia ya hakika isiyo na makosa au kurejesha mabadiliko katika mihimili yote na rasilimali za Azure
- **🔎 Uthibitisho wa CLI wa moja kwa moja** umethibitisha msaada wa sasa kwa `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, na `azd down --force --purge`

#### Faili Zilisasishwa
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
**Toleo hili hufanya msafishaji wa uthibitisho wa maandishi dhidi ya `azd` `1.23.12`, husasisha mifano ya amri za AZD ambazo zilikuwa za zamani, huboresha mwongozo wa mfano wa AI hadi mipangilio ya sasa, na kupanua maagizo ya warsha zaidi ya GitHub Codespaces kusaidia pia kontena za maendeleo na mizazi ya ndani.**

#### Imeongezwa
- **✅ Maelezo ya uthibitishaji katika sura kuu na nyaraka za warsha** kufanya msingi wa AZD uliojaribiwa wazi kwa wanafunzi wanaotumia toleo jipya au la zamani la CLI
- **⏱️ Mwongozo wa muda wa utekelezaji** kwa maombi ya AI yanayotumia `azd deploy --timeout 1800`
- **🔎 Hatua za ukaguzi wa ugani** kwa kutumia `azd extension show azure.ai.agents` katika nyaraka za mzunguko wa AI
- **🌐 Mwongozo mpana wa mazingira ya warsha** unaoshughulikia GitHub Codespaces, kontena za maendeleo, na mizazi ya ndani kwa MkDocs

#### Imebadilishwa
- **📚 README za utangulizi wa sura** sasa zinataja mara zote uthibitisho dhidi ya `azd 1.23.12` katika sehemu za msingi, usanidi, miundombinu, mawakala wengi, kabla ya utekelezaji, utatuzi, na uzalishaji
- **🛠️ Marejeleo ya amri za AZD** yamebadilishwa kuwa aina za sasa katika nyaraka:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` au `azd env get-value(s)` kulingana na muktadha
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` ambapo muhtasari wa Application Insights unapangwa
- **🧪 Mifano ya utayarishaji wa awali** imerahisishwa kwa matumizi yaliyo thibitishwa sasa kama `azd provision --preview` na `azd provision --preview -e production`
- **🧭 Mtiririko wa warsha** umebadilishwa ili wanafunzi waweze kumaliza maabara katika Codespaces, kontena ya maendeleo, au nakala ya ndani badala ya kudhani utekelezaji wa Codespaces pekee
- **🔐 Mwongozo wa uthibitishaji** sasa unapendelea `azd auth login` kwa mizunguko ya kazi ya AZD, na `az login` kubainishwa kama hiari pale amri za Azure CLI zitapigwa moja kwa moja

#### Imerekebishwa
- **🪟 Amri za usakinishaji za Windows** zimesawazishwa na uhifadhishaji wa kifurushi cha sasa cha `winget` katika mwongozo wa usakinishaji
- **🐧 Mwongozo wa usakinishaji wa Linux** umebadilishwa kuepuka maagizo yasiyounga mkono ya meneja wa kifurushi wa distro maalum kama `azd` na badala yake kuonyesha rasilimali za toleo pale panapofaa
- **📦 Mifano ya modeli za AI** imesasishwa kutoka mipangilio ya zamani kama `gpt-35-turbo` na `text-embedding-ada-002` hadi mifano ya sasa kama `gpt-4.1-mini`, `gpt-4.1`, na `text-embedding-3-large`
- **📋 Vipande vya utekelezaji na uchunguzi** vimerekebishwa kutumia mazingira na amri za sasa katika rekodi, skripti, na hatua za utatuzi
- **⚙️ Mwongozo wa GitHub Actions** umebadilishwa kutoka `Azure/setup-azd@v1.0.0` hadi `Azure/setup-azd@v2`
- **🤖 Mwongozo wa ridhaa ya MCP/Copilot** umebadilishwa kutoka `azd mcp consent` hadi `azd copilot consent list`

#### Imeboreshwa
- **🧠 Mwongozo wa sura za AI** sasa unaelezea vyema tabia nyeti za awali za `azd ai`, kuingia kwa wakopaji wa kipekee, matumizi ya ugani wa sasa, na mapendekezo ya utoaji wa modeli yaliyosasishwa
- **🧪 Maagizo ya warsha** sasa yanatumia mifano halisi zaidi ya toleo na lugha wazi ya usanidi wa mazingira kwa maabara ya vitendo
- **📈 Nyaraka za uzalishaji na utatuzi** sasa zinaendana vyema na mifano ya ufuatiliaji wa sasa, modeli ya akiba, na viwango vya gharama

#### Faili Zilisasishwa
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

#### Amri za AI za AZD CLI, Uthibitishaji wa Maudhui & Upanuzi wa Kiolezo
**Toleo hili linaongezea ugani wa amri za `azd ai`, `azd extension`, na `azd mcp` katika sura zote zinazohusiana na AI, linarekebisha viungo vilivyovunjika na msimbo uliotolewa katika agents.md, linasasisha jopo la wepesi, na kuboresha sehemu ya Violezo vya Mifano kwa maelezo yaliyothibitishwa na violezo vipya vya Azure AI AZD.**

#### Imekuwa
- **🤖 Ugani wa AZD AI CLI** katika faili 7 (awali ilikuwa tu katika Sura ya 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Sehemu mpya ya "Nyongeza na Amri za AI" inayoanzisha `azd extension`, `azd ai agent init`, na `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Chaguo la 4: `azd ai agent init` pamoja na jedwali la kulinganisha (mbinu ya kiolezo dhidi ya mwakilishi)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sehemu ndogo za "Nyongeza za AZD kwa Foundry" na "Utoaji wa Maajenti Kwanza"
  - `docs/chapter-05-multi-agent/README.md` — Anza Haraka sasa inaonyesha njia za utoaji za kiolezo na msingi wa mwakilishi
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sehemu ya Utoaji sasa ni pamoja na chaguo la `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sehemu ndogo ya "Amri za Nyongeza za AZD AI kwa Uchunguzi"
  - `resources/cheat-sheet.md` — Sehemu mpya ya "Amri za AI na Nyongeza" zenye `azd extension`, `azd ai agent init`, `azd mcp`, na `azd infra generate`
- **📦 Violezo vipya vya mfano vya AZD AI** katika `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Mazungumzo ya RAG ya .NET na msaada wa Blazor WebAssembly, Semantic Kernel, na mazungumzo ya sauti
  - **azure-search-openai-demo-java** — Mazungumzo ya RAG ya Java kwa kutumia Langchain4J na chaguzi za utoaji za ACA/AKS
  - **contoso-creative-writer** — Programu ya kuandika ubunifu ya multi-agent ikitumia Azure AI Agent Service, Bing Grounding, na Prompty
  - **serverless-chat-langchainjs** — RAG isiyohitaji seva ikitumia Azure Functions + LangChain.js + Cosmos DB na msaada wa maendeleo ya ndani wa Ollama
  - **chat-with-your-data-solution-accelerator** — Kiendeshi cha RAG cha biashara na mlango wa wasimamizi, muunganisho wa Teams, na chaguzi za PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Programu ya rejeleo ya usimamizi wa multi-agent MCP yenye seva katika .NET, Python, Java, na TypeScript
  - **azd-ai-starter** — Kiolezo cha kuanzia cha miundombinu ya Azure AI Bicep
  - **🔗 Kiungo cha Maonyesho ya Ajabu ya AZD AI** — Marejeleo kwa [galeri ya maonyesho ya ajabu ya azd AI](https://azure.github.io/awesome-azd/?tags=ai) (violezo 80+)

#### Imerudishwa
- **🔗 Urambazaji wa agents.md**: Viungo vya awali/vifuatavyo sasa vinafuata mpangilio wa somo la README ya Sura ya 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Viungo vilivyovunjika vya agents.md**: `production-ai-practices.md` imebadilishwa kuwa `../chapter-08-production/production-ai-practices.md` (matukio 3)
- **📦 Msimbo uliotolewa wa agents.md**: `opencensus` imebadilishwa na `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API si sahihi ya agents.md**: `max_tokens` imesogezwa kutoka `create_agent()` kwenda `create_run()` kama `max_completion_tokens`
- **🔢 Kuhesabu tokeni za agents.md**: Makadirio ya kawaida ya `len//4` yamebadilishwa na `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Huduma zilizorekebishwa kutoka "Cognitive Search + App Service" kuwa "Azure AI Search + Azure Container Apps" (mwenyeji wa default umebadilishwa Oktoba 2024)
- **contoso-chat**: Maelezo yamesasishwa kurejelea Azure AI Foundry + Prompty, likifanana na kichwa cha kweli cha repo na mkusanyiko wa teknolojia

#### Imeondolewa
- **ai-document-processing**: Marejeleo ya kiolezo lisilo na utendaji yameondolewa (repo haipatikani hadharani kama kiolezo cha AZD)

#### Imeboreshwa
- **📝 Mazoezi ya agents.md**: Zoeezi la 1 sasa linaonyesha matokeo yanayotarajiwa na hatua ya `azd monitor`; Zoeezi 2 linajumuisha msimbo kamili wa usajili wa `FunctionTool`; Zoeezi 3 limebadilisha maelekezo ya ujumuishi na amri za wazi za `prepdocs.py`
- **📚 Rasilimali za agents.md**: Viungo vya nyaraka vimesasishwa kwenda nyaraka za sasa za Azure AI Agent Service na kuanzisha haraka
- **📋 Jedwali la Hatua Zifuatazo agents.md**: Limeongezwa kiungo cha maabara ya warsha ya AI kwa ufunuo kamili wa sura

#### Faili Zimesasishwa
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
**Toleo hili linaongeza urambazaji wa README.md na muundo ulioboreshwa wa jedwali.**

#### Imebadilika
- **Jedwali la Ramani ya Kozi**: Limeboreshwa kwa viungo vya somo vya moja kwa moja, makadirio ya muda, na viwango vya ugumu
- **Usafishaji wa Folda**: Folda za zamani zilizojirudia zimeondolewa (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Uthibitishaji wa Viungo**: Viungo vyote 21+ vya ndani katika jedwali la Ramani ya Kozi vimehakikiwa

### [v3.16.0] - 2026-02-05

#### Sasisho la Majina ya Bidhaa
**Toleo hili linasasisha marejeleo ya bidhaa kwa jinsi Microsoft inavyojitambulisha sasa.**

#### Imebadilika
- **Microsoft Foundry → Microsoft Foundry**: Marejeleo yote yamesasishwa katika faili zisizo za tafsiri
- **Azure AI Agent Service → Foundry Agents**: Jina la huduma limesasishwa kuendana na chapa ya sasa

#### Faili Zimesasishwa
- `README.md` - Ukurasa mkuu wa kiingilio cha kozi
- `changelog.md` - Historia ya toleo
- `course-outline.md` - Muundo wa kozi
- `docs/chapter-02-ai-development/agents.md` - Mwongozo wa maajenti wa AI
- `examples/README.md` - Nyaraka za mifano
- `workshop/README.md` - Ukurasa mkuu wa warsha
- `workshop/docs/index.md` - Faharasa ya warsha
- `workshop/docs/instructions/*.md` - Faili zote za maagizo ya warsha

---

### [v3.15.0] - 2026-02-05

#### Muundo Mpya wa Hazina: Majina ya Folda Kulingana na Sura
**Toleo hili linaandaa upya nyaraka kuwa folda maalum za sura kwa urambazaji uliorahisishwa.**

#### Kurejesha Majina ya Folda
Folda za zamani zimebadilishwa na folda zilizo na namba za sura:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Imekuwa mpya: `docs/chapter-05-multi-agent/`

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
| Faili zote za kabla ya utoaji | pre-deployment/ | chapter-06-pre-deployment/ |
| Faili zote za utatuzi wa matatizo | troubleshooting/ | chapter-07-troubleshooting/ |

#### Imekuwa
- **📚 Faili za README za sura**: README.md zimetengenezwa katika kila folda ya sura zenye:
  - Malengo ya kujifunza na muda
  - Jedwali la masomo lenye maelezo
  - Amri za anza haraka
  - Urambazaji kwa sura zingine

#### Imebadilika
- **🔗 Viungo vyote vya ndani vimesasishwa**: Njia 78+ zimesasishwa katika faili zote za nyaraka
- **🗺️ README.md kuu**: Ramani ya Kozi imesasishwa na muundo mpya wa sura
- **📝 examples/README.md**: Marejeleo ya msalaba ya folda za sura yamesasishwa

#### Imeondolewa
- Muundo wa folda za zamani (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Muundo Mpya wa Hazina: Urambazaji wa Sura
**Toleo hili linaongeza faili za README za urambazaji wa sura (zilizoondolewa na v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Mwongozo Mpya wa Maajenti wa AI
**Toleo hili lina Mwongozo kamili wa kupeleka maajenti wa AI kwa kutumia Azure Developer CLI.**

#### Imekuwa
- **🤖 docs/microsoft-foundry/agents.md**: Mwongozo kamili unaojumuisha:
  - Maajenti wa AI ni nini na wanatofautianaje na chatbots
  - Violezo vitatu vya kuanza haraka vya maajenti (Foundry Agents, Prompty, RAG)
  - Mifumo ya usanifu wa maajenti (maajenti mmoja, RAG, maajenti wengi)
  - Usanidi wa zana na ubinafsishaji
  - Ufuatiliaji na upimaji wa vipimo
  - Mambo ya gharama na kuboresha
  - Matatizo ya kawaida ya kutatua matatizo
  - Mazoezi matatu ya vitendo yenye vigezo vya mafanikio

#### Muundo wa Maudhui
- **Utangulizi**: Dhana za maajenti kwa wanaoanza
- **Anza Haraka**: Toa maajenti kwa kutumia `azd init --template get-started-with-ai-agents`
- **Mifumo ya Usanifu**: Michoro ya mifumo ya maajenti
- **Usanidi**: Usanidi wa zana na mazingira
- **Ufuatiliaji**: Muunganisho wa Application Insights
- **Mazoezi**: Kujifunza kwa hatua kwa vitendo (dakika 20-45 kila moja)

---

### [v3.12.0] - 2026-02-05

#### Sasisho la Mazingira ya DevContainer
**Toleo hili linasasisha usanidi wa kontena wa maendeleo na zana za kisasa na chaguzi bora kwa uzoefu wa kujifunza AZD.**

#### Imebadilika
- **🐳 Picha ya Msingi**: Imesasishwa kutoka `python:3.12-bullseye` hadi `python:3.12-bookworm` (Debian thabiti ya hivi karibuni)
- **📛 Jina la Kontena**: Limebadilishwa kutoka "Python 3" kwenda "AZD kwa Waanzilishi" kwa uwazi

#### Imekuwa
- **🔧 Vipengele Vipya vya Dev Container**:
  - `azure-cli` na msaada wa Bicep umewezeshwa
  - `node:20` (toleo la LTS kwa violezo vya AZD)
  - `github-cli` kwa usimamizi wa violezo
  - `docker-in-docker` kwa utoaji wa programu za kontena

- **🔌 Uhamishaji wa Porti**: Porti zilizotangazwa kwa maendeleo ya kawaida:
  - 8000 (Mtazamo wa MkDocs)
  - 3000 (Programu za wavuti)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nyongeza mpya za VS Code**:
  - `ms-python.vscode-pylance` - Kuelimisha Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Msaada wa Azure Functions
  - `ms-azuretools.vscode-docker` - Msaada wa Docker
  - `ms-azuretools.vscode-bicep` - Msaada wa lugha ya Bicep
  - `ms-azure-devtools.azure-resource-groups` - Usimamizi wa rasilimali za Azure
  - `yzhang.markdown-all-in-one` - Uhariri wa Markdown
  - `DavidAnson.vscode-markdownlint` - Linting ya Markdown
  - `bierner.markdown-mermaid` - Msaada wa michoro ya Mermaid
  - `redhat.vscode-yaml` - Msaada wa YAML (kwa azure.yaml)
  - `eamodio.gitlens` - Uonyesho wa Git
  - `mhutchie.git-graph` - Historia ya Git

- **⚙️ Mipangilio ya VS Code**: Imeongeza mipangilio ya msingi kwa mfasiri wa Python, umbizo linapohifadhiwa, na kuondoa nafasi zisizotakikana

- **📦 requirements-dev.txt imeboreshwa**:
  - Imeongeza kiendelezi cha MkDocs cha kupunguza ukubwa
  - Imeongeza pre-commit kwa ubora wa msimbo
  - Imeongeza vifurushi vya Azure SDK (azure-identity, azure-mgmt-resource)

#### Imerudishwa
- **Amri ya Baada ya Kuunda**: Sasa inathibitisha usakinishaji wa AZD na Azure CLI wakati kontena inaanza

---

### [v3.11.0] - 2026-02-05

#### Marekebisho ya README Rafiki kwa Waanzilishi
**Toleo hili linaboresha sana README.md ili iwe rahisi kwa waanzilishi na linaongeza rasilimali muhimu kwa watengenezaji wa AI.**

#### Imekuwa
- **🆚 Ulinganisho kati ya Azure CLI na AZD**: Maelezo wazi ya wakati wa kutumia zana yoyote kwa mifano ya vitendo
- **🌟 Violezo Vizuri vya AZD**: Viungo vya moja kwa moja kwa matunzio ya kiolezo cha jamii na rasilimali za michango:
  - [Gallery ya Ajabu ya AZD](https://azure.github.io/awesome-azd/) - Violezo 200+ tayari kwa utoaji
  - [Wasilisha Kiolezo](https://github.com/Azure/awesome-azd/issues) - Michango ya jamii
- **🎯 Mwongozo wa Anza Haraka**: Sehemu rahisi ya hatua 3 (Sakinisha → Ingia → Toa)
- **📊 Jedwali la Urambazaji la Uzoefu**: Maelekezo wazi ya wapi pa kuanza kulingana na uzoefu wa mjenzi programu

#### Imebadilika
- **Muundo wa README**: Umegawanywa upya kwa ufichaji wa hatua - taarifa muhimu kwanza
- **Sehemu ya Utangulizi**: Imeandikwa upya kuelezea "Uchawi wa `azd up`" kwa waanzilishi kamili
- **Imeondoa Maudhui Yenye Kurudia**: Sehemu ya matatizo ya marudio imeondolewa
- **Amri za Kusuluhisha Matatizo**: Marekebisho ya rejea ya `azd logs` ili kutumia `azd monitor --logs` halali

#### Marekebisho
- **🔐 Amri za Uthibitishaji**: Imekuza `azd auth login` na `azd auth logout` kwenye cheat-sheet.md
- **Rejea za Amri Isizokubalika**: Imetoa mabaki yote ya `azd logs` kutoka sehemu ya kusuluhisha matatizo ya README

#### Maelezo
- **Eneo la Matumizi**: Mabadiliko yaliofanywa kwenye README.md kuu na resources/cheat-sheet.md
- **Washiriki Walengwa**: Maboresho mahsusi kwa wasanidi programu wapya wa AZD

---

### [v3.10.0] - 2026-02-05

#### Sasisho la Usahihi wa Amri za Azure Developer CLI
**Toleo hili linarekebisha amri za AZD ambazo hazipo katika nyaraka zote, kuhakikisha mifano yote ya msimbo inatumia sintaksia halali ya Azure Developer CLI.**

#### Marekebisho
- **🔧 Amri zisizokuwepo za AZD Zimetolewa**: Ukaguzi kamili na marekebisho ya amri zisizo halali:
  - `azd logs` (haipo) → imerejeshwa na `azd monitor --logs` au mbadala wa Azure CLI
  - Amri ndogo za `azd service` (hazipo) → zimerudishwa kwa `azd show` na Azure CLI
  - `azd infra import/export/validate` (hazipo) → zimetolewa au kubadilishwa kwa mbadala halali
  - Bendera za `azd deploy --rollback/--incremental/--parallel/--detect-changes` (hazipo) → zimetolewa
  - Bendera za `azd provision --what-if/--rollback` (hazipo) → zimesasishwa kutumia `--preview`
  - `azd config validate` (haipo) → imerejeshwa na `azd config list`
  - `azd info`, `azd history`, `azd metrics` (hazipo) → zimetolewa

- **📚 Faili Zilizosasishwa kwa Marekebisho ya Amri**:
  - `resources/cheat-sheet.md`: Marekebisho makubwa ya rejea za amri
  - `docs/deployment/deployment-guide.md`: Mipango iliyorekebishwa ya kurudisha na usambazaji
  - `docs/troubleshooting/debugging.md`: Maboresho kwenye sehemu za uchambuzi wa kumbukumbu
  - `docs/troubleshooting/common-issues.md`: Amri za kusuluhisha matatizo zimesasishwa
  - `docs/troubleshooting/ai-troubleshooting.md`: Sehemu ya AZD debugging imerekebishwa
  - `docs/getting-started/azd-basics.md`: Amri za ufuatiliaji zimerudishwa
  - `docs/getting-started/first-project.md`: Mifano ya ufuatiliaji na debugging imesasishwa
  - `docs/getting-started/installation.md`: Mifano ya msaada na toleo imerekebishwa
  - `docs/pre-deployment/application-insights.md`: Amri za kutazama kumbukumbu zimerudishwa
  - `docs/pre-deployment/coordination-patterns.md`: Amri za debugging agent zimerudishwa

- **📝 Marejeo ya Toleo yamesasishwa**: 
  - `docs/getting-started/installation.md`: Imebadilisha toleo lililoandikwa ngumu la `1.5.0` kuwa `1.x.x` inayoeleweka na kiungo cha matoleo

#### Mabadiliko
- **Mikakati ya Kurudisha**: Nyaraka zimesasishwa kutumia Git kwa kurudisha (AZD haina kurudisha asilia)
- **Kutazama Kumbukumbu**: Rejea za `azd logs` zimerudishwa kwa amri za `azd monitor --logs`, `azd monitor --live` na Azure CLI
- **Sehemu ya Uonyesho wa Ufanisi**: Bendera zisizo kwenye matumizi kwa usambazaji sambamba/za awamu zimetolewa, mbadala halali zimetolewa

#### Maelezo ya Kiufundi
- **Amri halali za AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Bendera halali za azd monitor**: `--live`, `--logs`, `--overview`
- **Vipengele vilivyotolewa**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Maelezo
- **Uthibitishaji**: Amri zimehakikiwa dhidi ya Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Sasisho la Kukamilika kwa Warsha na Ubora wa Nyaraka
**Toleo hili linakamilisha moduli za warsha ya maingiliano, linarekebisha viungo vyote vilivyovunjika vya nyaraka, na linaboresha ubora wa maudhui kwa wasanidi programu wa AI wanaotumia Microsoft AZD.**

#### Imeongezwa
- **📝 CONTRIBUTING.md**: Nyaraka mpya za miongozo ya michango zilio na:
  - Maelekezo wazi ya kuripoti matatizo na kupendekeza mabadiliko
  - Viwango vya nyaraka kwa maudhui mapya
  - Miongozo ya mifano ya msimbo na kanuni za ujumbe wa commit
  - Habari za ushirikiano wa jamii

#### Imekamilika
- **🎯 Warsha ya Moduli 7 (Hitimisho)**: Moduli ya kumalizia kamili na:
  - Muhtasari kamili wa mafanikio ya warsha
  - Sehemu ya dhana kuu iliyojifunza ikijumuisha AZD, templates, na Microsoft Foundry
  - Mapendekezo ya kuendelea na safari ya kujifunza
  - Mazoezi ya changamoto za warsha na kiwango cha ugumu
  - Maoni ya jamii na viungo vya msaada

- **📚 Warsha ya Moduli 3 (Kuvunjika)**: Malengo ya kujifunza yamesasishwa na:
  - Mwongozo wa kuanzisha GitHub Copilot na seva za MCP
  - Uelewa wa muundo wa folda la template la AZD
  - Mifumo ya shirika ya miundombinu kama msimbo (Bicep)
  - Maelekezo ya maabara ya vitendo

- **🔧 Warsha ya Moduli 6 (Kufunga)**: Imekamilika na:
  - Malengo ya usafi wa rasilimali na usimamizi wa gharama
  - Matumizi ya `azd down` kwa kuondoa miundombinu salama
  - Mwongozo wa kuhuisha huduma za cognitive zilizofutwa polepole
  - Miongozo ya ziada ya utafiti kwa GitHub Copilot na Azure Portal

#### Marekebisho
- **🔗 Marekebisho ya Viungo vilivyovunjika**: Ilitatua viungo 15+ vya nyaraka za ndani vilivyovunjika:
  - `docs/ai-foundry/ai-model-deployment.md`: Imerekebisha njia za microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Imerekebisha njia za ai-model-deployment.md na production-ai-practices.md
  - `docs/getting-started/first-project.md`: Imebadilisha cicd-integration.md isiyopo na deployment-guide.md
  - `examples/retail-scenario.md`: Imerekebisha njia za FAQ na mwongozo wa kusuluhisha matatizo
  - `examples/container-app/microservices/README.md`: Imerekebisha njia za ukurasa wa kozi na mwongozo wa usambazaji
  - `resources/faq.md` na `resources/glossary.md`: Imesasisha rejea za sura za AI
  - `course-outline.md`: Imerekebisha mwongozo wa mwalimu na rejea za maabara ya warsha ya AI

- **📅 Bendera ya Hali ya Warsha**: Imebadilishwa kutoka "Katika Ujenzi" kuwa hali ya warsha inayofanya kazi kwa tarehe ya Februari 2026

- **🔗 Urambazaji wa Warsha**: Imerekebisha viungo vya urambazaji vilivyovunjika kwenye README.md ya warsha vinavyoelekeza kwenye folda isiyo na lab-1-azd-basics

#### Mabadiliko
- **Uwasilishaji wa Warsha**: Iliondoa onyo la "chini ya ujenzi", warsha sasa imekamilika na iko tayari kwa matumizi
- **Mwenendo Thabiti wa Urambazaji**: Imhakikisha moduli zote za warsha zina urambazaji mzuri kati ya moduli
- **Rejea za Njia ya Kujifunza**: Imesasisha rejea za sura kutumia kupitia njia sahihi za microsoft-foundry

#### Ithibitisho
- ✅ Faili zote za markdown za Kiingereza zina viungo halali vya ndani
- ✅ Moduli za warsha 0-7 zimetimia na zina malengo ya kujifunza
- ✅ Urambazaji kati ya sura na moduli unafanya kazi vizuri
- ✅ Maudhui ni mazuri kwa wasanidi programu wa AI wanaotumia Microsoft AZD
- ✅ Lugha na muundo rafiki kwa wanaoanza yamehifadhiwa
- ✅ CONTRIBUTING.md hutoa miongozo wazi kwa wachangiaji wa jamii

#### Utekelezaji wa Kiufundi
- **Uthibitishaji wa Viungo**: Skripti ya PowerShell iliyotumia otomatiki ilihakiki viungo vyote ndani ya .md
- **Ukaguzi wa Maudhui**: Mapitio ya mkono ya ukamilifu wa warsha na ufaa kwa wanaoanza
- **Mfumo wa Urambazaji**: Mitindo ya urambazaji wa sura na moduli imetekelezwa kwa umoja

#### Maelezo
- **Eneo la Matumizi**: Mabadiliko yamefanyika kwa nyaraka za Kiingereza pekee
- **Tafsiri**: Folda za tafsiri hazijasasishwa katika toleo hili (tafsiri ya kiotomatiki itafuatilia baadaye)
- **Muda wa Warsha**: Warsha kamili sasa hutoa saa 3-4 za kujifunza kwa vitendo

---

### [v3.8.0] - 2025-11-19

#### Nyaraka za Juu Zaidi: Ufuatiliaji, Usalama, na Mifumo ya Wakala Wengi
**Toleo hili linaongeza masomo ya daraja A kamili juu ya muunganiko wa Application Insights, mifumo ya uthibitishaji, na uratibu wa wakala wengi kwa usambazaji wa uzalishaji.**

#### Imeongezwa
- **📊 Somo la Muunganiko wa Application Insights**: katika `docs/pre-deployment/application-insights.md`:
  - Usambazaji unaolenga AZD pamoja na utoaji wa moja kwa moja
  - Templates kamili za Bicep kwa Application Insights + Log Analytics
  - Programu za Python zinazofanya kazi na telemetry maalum (mistari 1,200+)
  - Mifumo ya ufuatiliaji wa AI/LLM (Microsoft Foundry Models token/gastos follow-up)
  - Michoro 6 ya Mermaid (usanifu, ufuatiliaji uliosambazwa, mtiririko wa telemetry)
  - Mazoezi 3 ya vitendo (arifu, dashibodi, ufuatiliaji wa AI)
  - Mifano ya maswali ya Kusto na mikakati ya ufanisi wa gharama
  - Usambazaji wa takwimu za moja kwa moja na debugging ya wakati halisi
  - Muda wa kujifunza 40-50 dakika na mifumo tayari kwa uzalishaji

- **🔐 Somo la Mifumo ya Uthibitishaji & Usalama**: katika `docs/getting-started/authsecurity.md`:
  - Mifumo 3 ya uthibitishaji (miunganisho ya mstringi, Key Vault, utambulisho ulioendeshwa)
  - Templates kamili za miundombinu ya Bicep kwa usambazaji salama
  - Msimbo wa programu wa Node.js yenye muunganiko wa Azure SDK
  - Mazoezi 3 kamili (uwezesha utambulisho ulioendeshwa, utambulisho uliotengwa kwa mtumiaji, mzunguko wa Key Vault)
  - Mbinu bora za usalama na usanidi wa RBAC
  - Mwongozo wa kusuluhisha matatizo na uchambuzi wa gharama
  - Mifumo ya uthibitishaji bila nenosiri tayari kwa uzalishaji

- **🤖 Somo la Mifumo ya Uratibu wa Wakala Wengi**: katika `docs/pre-deployment/coordination-patterns.md`:
  - Mifumo 5 ya uratibu (mfuatano, sambamba, kihierarkia, kuendeshwa na matukio, makubaliano)
  - Utekelezaji kamili wa huduma ya mratibu (Python/Flask, mistari 1,500+)
  - Utekelezaji maalum wa wakala 3 (Utafiti, Mwandishi, Mhariri)
  - Muunganiko na Service Bus kwa foleni ya ujumbe
  - Usimamizi wa hali ya Cosmos DB kwa mifumo iliyosambazwa
  - Michoro 6 ya Mermaid ikionesha mwingiliano wa wakala
  - Mazoezi 3 ya hali ya juu (ushughulikiaji wa muda, mantiki ya jaribio tena, breaker ya mzunguko)
  - Mgawanyo wa gharama ($240-565/mwezi) na mikakati ya ufanisi
  - Muunganiko wa Application Insights kwa ufuatiliaji

#### Imeboreshwa
- **Sura ya Kabla ya Usambazaji**: Sasa inajumuisha mifumo kamili ya ufuatiliaji na uratibu
- **Sura ya Kuanzisha**: Imeboreshwa na mifumo ya kitaalamu ya uthibitishaji
- **Utokaji Uzalishaji**: Kifuniko kamili kutoka usalama hadi ufuatiliaji
- **Muhtasari wa Kozi**: Imesasisha rejea za masomo mapya sura 3 na 6

#### Mabadiliko
- **Mafunzo ya Kujifunza**: Muungano bora wa usalama na ufuatiliaji katika kozi nzima
- **Ubora wa Nyaraka**: Viwango thabiti vya daraja A (95-97%) katika masomo mapya
- **Mifumo ya Uzalishaji**: Kifuniko kamili kuanzia mwanzo hadi mwisho kwa usambazaji wa biashara

#### Imeboresha
- **Uzoefu wa Msanidi Programu**: Njia wazi kutoka maendeleo hadi ufuatiliaji wa uzalishaji
- **Viwango vya Usalama**: Mifumo ya kitaalamu kwa uthibitishaji na usimamizi wa siri
- **Ufuatiliaji**: Muunganiko kamili wa Application Insights na AZD
- **Mizigo ya AI**: Ufuatiliaji maalum kwa Microsoft Foundry Models na mifumo ya wakala wengi

#### Imehakikiwa
- ✅ Masomo yote yana msimbo kamili unaofanya kazi (sio vipande tu)
- ✅ Michoro ya Mermaid kwa kujifunza kwa kuona (jumla 19 katika masomo 3)
- ✅ Mazoezi ya vitendo na hatua za uthibitishaji (jumla 9)
- ✅ Templates kamili za Bicep zinazoweza kusambazwa kupitia `azd up`
- ✅ Uchambuzi wa gharama na mikakati ya uboreshaji
- ✅ Miongozo ya kusuluhisha matatizo na mbinu bora
- ✅ Sehemu za ukaguzi wa maarifa na amri za uthibitishaji

#### Matokeo ya Upimaji wa Nyaraka
- **docs/pre-deployment/application-insights.md**: - Mwongozo wa ufuatiliaji kamili
- **docs/getting-started/authsecurity.md**: - Mifumo ya usalama ya kitaalamu
- **docs/pre-deployment/coordination-patterns.md**: - Miundo ya juu ya wakala wengi
- **Maudhui Mpya kwa Jumla**: - Viwango vya juu vya ubora thabiti

#### Utekelezaji wa Kiufundi
- **Application Insights**: Log Analytics + telemetry maalum + ufuatiliaji uliosambazwa
- **Uthibitishaji**: Utambulisho Ulioendeshwa + Key Vault + mifumo ya RBAC
- **Wakala Wengi**: Service Bus + Cosmos DB + Container Apps + uratibu
- **Ufuatiliaji**: Takwimu za moja kwa moja + maswali ya Kusto + arifu + dashibodi
- **Usimamizi wa Gharama**: Mikakati ya sampuli, sera za uhifadhi, udhibiti wa bajeti

### [v3.7.0] - 2025-11-19

#### Maboresho ya Ubora wa Nyaraka na Mfano Mpya wa Microsoft Foundry Models
**Toleo hili linaboresha ubora wa nyaraka kote kwenye hifadhidata na kuleta mfano kamili wa usambazaji wa Microsoft Foundry Models kwa kiolesura cha mazungumzo cha gpt-4.1.**

#### Imeongezwa
- **🤖 Mfano wa Mazungumzo wa Microsoft Foundry Models**: Usambazaji kamili wa gpt-4.1 na utekelezaji katika `examples/azure-openai-chat/`:
  - Miundombinu kamili ya Microsoft Foundry Models (usambazaji wa mfano wa gpt-4.1)
  - Kiolesura cha mazungumzo cha mstari wa amri cha Python pamoja na historia ya mazungumzo
  - Muunganiko wa Key Vault kwa uhifadhi salama wa funguo za API
  - Ufuatiliaji wa matumizi ya token na makadirio ya gharama
  - Udhibiti wa kiwango na usimamizi wa makosa
  - README kamili na mwongozo wa usambazaji wa dakika 35-45
  - Faili 11 tayari kwa uzalishaji (templates za Bicep, app ya Python, usanidi)
- **📚 Mazoezi ya Nyaraka**: Ina mazoezi ya vitendo kwenye mwongozo wa usanidi:
  - Zoeezi 1: Usanidi wa mazingira mengi (dakika 15)
  - Zoeezi 2: Mazoezi ya usimamizi wa siri (dakika 10)
  - Vigezo vya mafanikio na hatua za uthibitishaji zilizo wazi
- **✅ Uthibitishaji wa Usambazaji**: Imeongezwa sehemu ya uthibitishaji kwenye mwongozo wa usambazaji:
  - Taratibu za ukaguzi wa afya
  - Kiolezo cha vigezo vya mafanikio
  - Matokeo yanayotarajiwa kwa amri zote za usambazaji
  - Mwongozo wa haraka wa kusuluhisha matatizo

#### Imeboreshwa
- **examples/README.md**: Imesahihishwa hadi ubora wa daraja A (93%):
  - Iliongeza azure-openai-chat kwa sehemu zote husika
  - Imesasisha idadi ya mifano ya ndani kutoka 3 hadi 4
  - Imeongezwa kwenye jedwali la Mifano ya AI Application
  - Imejumuishwa kwenye Mwanzilishi wa Haraka kwa Watumiaji wa Kiwiliwili
  - Imeongezwa kwenye sehemu ya Templates za Microsoft Foundry
  - Imesasisha Meza ya Mlinganisho na sehemu za uvumbuzi wa teknolojia
- **Ubora wa Nyaraka**: Uboreshaji B+ (87%) → A- (92%) katika folda ya nyaraka:
  - Imesababisha matokeo yanayotarajiwa katika mifano muhimu ya amri
  - Jumuisha hatua za uthibitisho kwa mabadiliko ya usanidi
  - Uboreshaji wa kujifunza kwa vitendo kwa mazoezi ya vitendo

#### Imebadilishwa
- **Maendeleo ya Kujifunza**: Ushirikiano bora wa mifano ya AI kwa wanafunzi wa kiwango cha kati
- **Muundo wa Nyaraka**: Mazoezi zaidi yenye matokeo wazi
- **Mchakato wa Uthibitisho**: Vigezo vya mafanikio vilivyo wazi vimeongezwa kwa taratibu muhimu

#### Imeboreshwa
- **Uzoefu wa Mendelezaji**: Utekelezaji wa Microsoft Foundry Models sasa unachukua dakika 35-45 (ikilinganishwa na dakika 60-90 kwa mbadala ngumu)
- **Uwajibikaji wa Gharama**: Makadirio ya gharama wazi ($50-200/mwezi) kwa mfano wa Microsoft Foundry Models
- **Njia ya Kujifunza**: Waendelezaji wa AI wana njia ya kuingia wazi na azure-openai-chat
- **Viwango vya Nyaraka**: Matokeo yanayotarajiwa na hatua za uthibitisho vinavyoendana

#### Imethibitishwa
- ✅ Mfano wa Microsoft Foundry Models unafanya kazi kikamilifu na `azd up`
- ✅ Faili zote 11 za utekelezaji zina sarufi sahihi
- ✅ Maelekezo ya README yanalingana na uzoefu halisi wa utekelezaji
- ✅ Viungo vya nyaraka vimefanyiwa sasisho katika maeneo 8+
- ✅ Kielelezo cha mifano kinaonyesha kwa usahihi mifano 4 ya ndani
- ✅ Hakuna viungo vya nje vinavyojirudia katika jedwali
- ✅ Marejeleo yote ya urambazaji ni sahihi

#### Utekelezaji wa Kiufundi
- **Miundo ya Microsoft Foundry Models**: gpt-4.1 + Key Vault + mfano wa Container Apps
- **Usalama**: Utambulisho Ulioendeshwa tayari, siri katika Key Vault
- **Ufuatiliaji**: Muunganisho wa Application Insights
- **Usimamizi wa Gharama**: Ufuatiliaji wa tokeni na uboreshaji wa matumizi
- **Utekelezaji**: Amri moja ya `azd up` kwa usanidi kamili

### [v3.6.0] - 2025-11-19

#### Sasisho Kuu: Mifano ya Utekelezaji wa Container App
**Toleo hili linaleta mifano kamili ya utekelezaji wa programu zilizo ndani ya vyombo tayari kwa uzalishaji kwa kutumia Azure Developer CLI (AZD), kwa nyaraka kamili na kuingizwa katika njia ya kujifunza.**

#### Imeongezwa
- **🚀 Mifano ya Container App**: Mifano mipya ya ndani katika `examples/container-app/`:
  - [Mwongozo Mkuu](examples/container-app/README.md): Muhtasari kamilifu wa utekelezaji wa containerized, mwanzo wa haraka, uzalishaji, na mifumo ya hali ya juu
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API ya REST rafiki kwa wanaoanza yenye scale-to-zero, vipimo vya afya, ufuatiliaji, na utambuzi wa matatizo
  - [Microservices Architecture](../../examples/container-app/microservices): Utekelezaji wa huduma nyingi tayari kwa uzalishaji (API Gateway, Product, Order, User, Notification), ujumbe usio sambazwa, Service Bus, Cosmos DB, Azure SQL, uchambuzi wa usambazaji, blue-green/canary deployment
- **Mazingira Bora Zaidi**: Usalama, ufuatiliaji, uboreshaji wa gharama, na mwongozo wa CI/CD kwa mizigo ya containerized
- **Mifano ya Msimbo**: Kamili `azure.yaml`, templeti za Bicep, na utekelezaji wa huduma nyingi kwa lugha mbalimbali (Python, Node.js, C#, Go)
- **Upimaji & Utambuzi wa Matatizo**: Hali za majaribio kutoka mwanzo hadi mwisho, amri za ufuatiliaji, mwongozo wa utambuzi wa matatizo

#### Imebadilishwa
- **README.md**: Imesasishwa kuonyesha na kuunganisha mifano mipya ya container app chini ya "Mifano ya Ndani - Programu za Container"
- **examples/README.md**: Imesasishwa kuangazia mifano ya container app, kuongeza vipengele vya kulinganisha, na kuimarisha marejeleo ya teknolojia/miundo
- **Muhtasari wa Kozi & Mwongozo wa Masomo**: Imesasishwa kurejelea mifano mipya ya container app na mifumo ya utekelezaji katika sura husika

#### Imethibitishwa
- ✅ Mifano yote mipya inaweza kutekelezwa kwa kutumia `azd up` na kufuata mbinu bora
- ✅ Viungo vya nyaraka na urambazaji vimesasishwa
- ✅ Mifano inashughulikia hali kutoka kwa wanaoanza hadi wanavuaji, ikijumuisha huduma za uzalishaji

#### Vidokezo
- **Eneo**: Nyaraka na mifano kwa Kiingereza pekee
- **Hatua Zifuatazo**: Kupanua na mifumo ya container ya hali ya juu na otomatiki ya CI/CD katika matoleo yajayo

### [v3.5.0] - 2025-11-19

#### Ubadilishaji wa Jina la Bidhaa: Microsoft Foundry
**Toleo hili linafanya mabadiliko kamili ya jina la bidhaa kutoka "Microsoft Foundry" kwenda "Microsoft Foundry" katika nyaraka zote za Kiingereza, kuakisi kubadilishwa rasmi kwa Microsoft.**

#### Imebadilishwa
- **🔄 Sasisho la Jina la Bidhaa**: Kubadilishwa kamili kutoka "Microsoft Foundry" kwenda "Microsoft Foundry"
  - Imebadilishwa marejeleo yote katika nyaraka za Kiingereza katika folda ya `docs/`
  - Jina la folda lilibadilishwa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Jina la faili lilibadilishwa: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumla: Marejeleo 23 ya maudhui yamebadilishwa katika faili 7 za nyaraka

- **📁 Mabadiliko ya Muundo wa Folda**:
  - `docs/ai-foundry/` ilibadilishwa kuwa `docs/microsoft-foundry/`
  - Marejeleo yote ya mabadiliko yamesasishwa kuendana na muundo mpya wa folda
  - Viungo vya urambazaji vimehakikiwa katika nyaraka zote

- **📄 Majina ya Faili Yaliyobadilishwa**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Viungo vyote vya ndani vimesasishwa kurejelea majina mapya ya faili

#### Faili Zilizosasishwa
- **Nyaraka za Sura** (faili 7):
  - `docs/microsoft-foundry/ai-model-deployment.md` - Marejeleo 3 ya urambazaji yamesasishwa
  - `docs/microsoft-foundry/ai-workshop-lab.md` - Marejeleo 4 ya jina la bidhaa yamesasishwa
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Tayari inatumia Microsoft Foundry (kutoka masasisho ya awali)
  - `docs/microsoft-foundry/production-ai-practices.md` - Marejeleo 3 yamesasishwa (muhtasari, maoni ya jamii, nyaraka)
  - `docs/getting-started/azd-basics.md` - Marejeleo 4 ya msalaba ya viungo yamesasishwa
  - `docs/getting-started/first-project.md` - Marejeleo 2 ya urambazaji wa sura yamesasishwa
  - `docs/getting-started/installation.md` - Marejeleo 2 ya sura inayofuata yamesasishwa
  - `docs/troubleshooting/ai-troubleshooting.md` - Marejeleo 3 yamesasishwa (urambazaji, jamii ya Discord)
  - `docs/troubleshooting/common-issues.md` - Marejeleo 1 ya urambazaji yamesasishwa
  - `docs/troubleshooting/debugging.md` - Marejeleo 1 ya urambazaji yamesasishwa

- **Faili za Muundo wa Kozi** (faili 2):
  - `README.md` - Marejeleo 17 yamesasishwa (muhtasari wa kozi, vichwa vya sura, sehemu ya templeti, mawazo ya jamii)
  - `course-outline.md` - Marejeleo 14 yamesasishwa (muhtasari, malengo ya kujifunza, rasilimali za sura)

#### Imethibitishwa
- ✅ Hakuna marejeleo ya njia ya folda "ai-foundry" yaliyobaki katika nyaraka za Kiingereza
- ✅ Hakuna marejeleo ya jina la bidhaa "Microsoft Foundry" yaliyobaki katika nyaraka za Kiingereza
- ✅ Viungo vyote vya urambazaji vinafanya kazi na muundo mpya wa folda
- ✅ Mabadiliko ya majina ya faili na folda yametekelezwa kwa mafanikio
- ✅ Marejeleo ya msalaba kati ya sura yamehakikiwa

#### Vidokezo
- **Eneo**: Mabadiliko yamefanyika tu katika nyaraka za Kiingereza katika folda ya `docs/`
- **Tafsiri**: Folda za tafsiri (`translations/`) hazijasasishwa katika toleo hili
- **Warsha**: Vifaa vya warsha (`workshop/`) havijasasishwa katika toleo hili
- **Mifano**: Faili za mfano bado zinaweza kurejelea majina ya zamani (yatajadiliwa katika sasisho lijalo)
- **Viungo vya Nje**: URL za nje na marejeleo ya hazina za GitHub hazijabadilika

#### Mwongozo wa Uhamisho kwa Wachangiaji
Ikiwa una matawi ya ndani au nyaraka zinazorejelea muundo wa zamani:
1. Sasisha marejeleo ya folda: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Sasisha marejeleo ya faili: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Badilisha jina la bidhaa: "Microsoft Foundry" → "Microsoft Foundry"
4. Thibitisha viungo vyote vya ndani vya nyaraka bado vinafanya kazi

---

### [v3.4.0] - 2025-10-24

#### Uboreshaji wa Mapitio ya Miundombinu na Uthibitishaji
**Toleo hili linaanzisha msaada mpana kwa kipengele kipya cha mapitio ya Azure Developer CLI na kuboresha uzoefu wa mtumiaji wa warsha.**

#### Imeongezwa
- **🧪 Nyaraka za kipengele azd provision --preview**: Ufunuo wa kina wa uwezo mpya wa mapitio ya miundombinu
  - Marejeleo ya amri na mifano ya matumizi katika karatasi ya hila
  - Muunganisho wa kina katika mwongozo wa utoaji na hali za matumizi na faida
  - Muunganisho wa ukaguzi wa awali kwa uthibitisho salama wa utekelezaji
  - Sasisho za mwongozo wa kuanza na mbinu za usalama wa kwanza katika utekelezaji
- **🚧 Bango la Hali ya Warsha**: Bango la kitaalamu la HTML linaloonyesha hali ya maendeleo ya warsha
  - Ubunifu wa mwinuko na viashiria vya ujenzi kwa mawasiliano wazi kwa mtumiaji
  - Muda wa sasisho la mwisho kwa uwazi
  - Ubunifu unaoendana na simu za mkononi na aina zote za vifaa

#### Umeboreshwa
- **Usalama wa Miundombinu**: Kipengele cha mapitio kimeunganishwa katika nyaraka zote za utekelezaji
- **Uthibitishaji Kabla ya Utekelezaji**: Skripti za moja kwa moja sasa zinajumuisha majaribio ya mapitio ya miundombinu
- **Mtiririko wa Kazi wa Mendelezaji**: Mfululizo wa amri umesasishwa kujumuisha mapitio kama mbinu bora
- **Uzoefu wa Warsha**: Matumaini wazi kwa watumiaji kuhusu hali ya maendeleo ya maudhui

#### Imebadilishwa
- **Mbinu Bora za Utekelezaji**: Mtiririko wa kazi wa mapitio kwanza sasa ni njia inayopendekezwa
- **Mtiririko wa Nyaraka**: Uthibitishaji wa miundombinu umewekwa mapema katika mchakato wa kujifunza
- **Uwasilishaji wa Warsha**: Mawasilisho ya hali ya kitaalamu na ratiba wazi ya maendeleo

#### Imeboreshwa
- **Mbinu ya Usalama Kwanza**: Mabadiliko ya miundombinu sasa yanaweza kuthibitishwa kabla ya utekelezaji
- **Ushirikiano wa Timu**: Matokeo ya mapitio yanaweza kushirikiwa kwa ajili ya ukaguzi na idhini
- **Uelewa wa Gharama**: Uelewa bora wa gharama za rasilimali kabla ya utoaji
- **Kupunguza Hatari**: Kushuka kwa makosa ya utekelezaji kupitia uthibitisho wa awali

#### Utekelezaji wa Kiufundi
- **Muunganisho wa Nyaraka Nyingi**: Kipengele cha mapitio kilichonyakuliwa katika faili 4 muhimu
- **Mifano ya Amri**: Sarufi na mifano thabiti katika nyaraka zote
- **Ujumuishaji wa Mbinu Bora**: Mapitio yamejumuishwa katika mchakato wa uthibitisho na skripti
- **Viashiria vya Kiasa**: Alama wazi za kipengele CHA MPYA kwa urahisi wa kugundua

#### Miundombinu ya Warsha
- **Mawasilisho ya Hali**: Bango la kitaalamu la HTML lenye mtindo wa mwinuko
- **Uzoefu wa Mtumiaji**: Hali ya maendeleo iliyo wazi huzuia mkanganyiko
- **Uwasilishaji wa Kitaalamu**: Inahakikisha uaminifu wa hazina huku ikiweka matarajio
- **Uwajibikaji wa Ratiba**: Muda wa sasisho la mwisho Oktoba 2025 kwa uwajibikaji

### [v3.3.0] - 2025-09-24

#### Vifaa vya Warsha Vilivyoboreshwa na Uzoefu wa Kujifunza wa Kiingiliano
**Toleo hili linaanzisha vifaa kamili vya warsha wenye mwongozo wa kiingiliano wa kivinjari na njia za kujifunza zilizoandaliwa.**

#### Imeongezwa
- **🎥 Mwongozo wa Warsha wa Kiingiliano**: Uzoefu wa warsha kupitia kivinjari na uwezo wa awali wa MkDocs
- **📝 Maelekezo ya Warsha Yaliyoandaliwa**: Njia ya hatua 7 ya kujifunza kuanzia kugundua hadi kubinafsisha
  - 0-Mwanzoni: Muhtasari wa warsha na usanidi
  - 1-Chagua-Kiolezo-AI: Mchakato wa ugunduzi na uteuzi wa kiolezo
  - 2-Thibitisha-Kiolezo-AI: Taratibu za utekelezaji na uthibitisho
  - 3-Gawanya-Kiolezo-AI: Uelewa wa muundo wa kiolezo
  - 4-Sanidi-Kiolezo-AI: Usanidi na utengenezaji
  - 5-Binafsisha-Kiolezo-AI: Marekebisho ya hali ya juu na mizunguko
  - 6-Safisha-Miundombinu: Usafishaji na usimamizi wa rasilimali
  - 7-Halisi: Muhtasari na hatua zinazofuata
- **🛠️ Vifaa vya Warsha**: Usanidi wa MkDocs na mandhari ya Material kwa uzoefu wa kujifunza ulioimarishwa
- **🎯 Njia ya Kujifunza kwa Vitendo**: Mbinu ya hatua 3 (Uchunguzi → Utekelezaji → Ubinafsishaji)
- **📱 Muunganisho wa GitHub Codespaces**: Usanidi laini wa mazingira ya maendeleo

#### Umeboreshwa
- **Maabara ya Warsha ya AI**: Kuongezwa na uzoefu wa kujifunza wa muda 2-3 wa vipengele vilivyopangwa
- **Nyaraka za Warsha**: Uwasilishaji wa kitaalamu na urambazaji na msaada wa picha
- **Maendeleo ya Kujifunza**: Mwongozo wa hatua kwa hatua kutoka uteuzi wa kiolezo hadi utekelezaji wa uzalishaji
- **Uzoefu wa Mendelezaji**: Vifaa vilivyounganishwa kwa mtiririko mzuri wa kazi za maendeleo

#### Umeboreshwa
- **Upatikanaji**: Kiolesura cha kivinjari chenye utafutaji, utendaji wa kunakili, na mabadiliko ya mandhari
- **Kujifunza kwa Kasi Yako**: Muundo wa warsha unaobadilika kwa viwango tofauti vya kujifunza
- **Matumizi ya Vitendo**: Hali halisi za utekelezaji wa kiolezo cha AI
- **Ushirikiano wa Jamii**: Muunganisho wa Discord kwa msaada wa warsha na ushirikiano

#### Sifa za Warsha
- **Utafutaji Uliojengwa**: Kugundua maneno muhimu na somo kwa haraka
- **Kopi za Vipande Msimbo**: Utendaji wa kunakili kwa kubonyeza juu kwa mifano yote ya msimbo
- **Kubadilisha Mandhari**: Usaidizi wa hali ya giza/angavu kwa mapendeleo tofauti
- **Mali za Picha**: Picha na michoro kwa uelewa wa hali ya juu
- **Muunganisho wa Msaada**: Upatikanaji wa moja kwa moja wa Discord kwa msaada wa jamii

### [v3.2.0] - 2025-09-17

#### Mabadiliko Makubwa ya Muundo wa Urambazaji na Mfumo wa Kujifunza Kwa Sura
**Toleo hili linaanzisha muundo kamili wa kujifunza kulingana na sura pamoja na urambazaji ulioboreshwa katika hazina yote.**

#### Imeongezwa
- **📚 Mfumo wa Kujifunza Kwa Sura**: Kozi nzima imeundwa upya kuwa sura 8 za kujifunza kwa hatua
  - Sura 1: Msingi & Mwanzo wa Haraka (⭐ - dakika 30-45)
  - Sura 2: Uendelezaji wa AI Kwanza (⭐⭐ - saa 1-2)
  - Sura 3: Usanidi & Uthibitisho (⭐⭐ - dakika 45-60)
  - Sura 4: Miundombinu kama Msimbo & Utekelezaji (⭐⭐⭐ - saa 1-1.5)
  - Sura 5: Suluhisho za AI za Wakala Wengi (⭐⭐⭐⭐ - saa 2-3)
  - Sura 6: Uthibitisho na Mipango Kabla ya Utekelezaji (⭐⭐ - saa 1)
  - Sura 7: Utambuzi wa Matatizo & Urekebishaji (⭐⭐ - saa 1-1.5)
  - Sura 8: Mifumo ya Uzalishaji & Biashara (⭐⭐⭐⭐ - saa 2-3)
- **📚 Mfumo Kamili wa Urambazaji**: Vichwa vya urambazaji na miguu ya ukurasa vinavyolingana katika nyaraka zote
- **🎯 Ufuatiliaji wa Maendeleo**: Orodha ya ukamilishaji wa kozi na mfumo wa uthibitisho wa kujifunza
- **🗺️ Mwongozo wa Njia ya Kujifunza**: Sehemu za kuingia zilizo wazi kwa viwango tofauti vya uzoefu na malengo
- **🔗 Urambazaji wa Marejeleo ya Msalaba**: Sura zinazohusiana na masharti ya awali yameunganishwa kwa uwazi

#### Umeboreshwa
- **Muundo wa README**: Imekuwa jukwaa la kujifunza lililoandaliwa kwa muundo wa sura
- **Urambazaji wa Nyaraka**: Kila ukurasa sasa una muktadha wa sura na mwongozo wa maendeleo
- **Uandaji wa Templeti**: Mifano na templeti zimeratibiwa kulingana na sura za kujifunza zinazofaa
- **Muunganisho wa Rasilimali**: Karatasi za hila, maswali yanayoulizwa mara kwa mara, na mwongozo wa masomo vimeunganishwa na sura husika
- **Muunganisho wa Warsha**: Maabara za vitendo zimeoanishwa na malengo mengi ya sura

#### Imebadilishwa
- **Maendeleo ya Kujifunza**: Imesogezwa kutoka kwenye nyaraka za mstari hadi kujifunza kwa kunyamaza sura za sura
- **Mahali pa Usanidi**: Mwongozo wa usanidi umewekwa kama Sura ya 3 kwa mtiririko bora wa kujifunza
- **Uingizaji wa Maudhui ya AI**: Uingizaji bora wa maudhui maalum ya AI katika safari ya kujifunza
- **Maudhui ya Uzalishaji**: Mifumo ya juu imakusanywa kwenye Sura ya 8 kwa wanaojifunza wa biashara

#### Imeboreshwa
- **Uzoefu wa Mtumiaji**: Viashiria vya usafiri vya wazi na viashiria vya maendeleo ya sura
- **Upatikanaji**: Mifumo thabiti ya usafiri kwa urahisi wa kupita kozi
- **Uwasilishaji wa Kitaalamu**: Muundo wa kozi wa mtindo wa chuo kikuu unaofaa kwa mafunzo ya kitaaluma na kampuni
- **Ufanisi wa Kujifunza**: Kupunguza muda wa kupata maudhui muhimu kupitia mpangilio ulioboreshwa

#### Utekelezaji wa Kiufundi
- **Vichwa vya Usafiri**: Kuweka viwango vya usafiri wa sura katika nyaraka zaidi ya 40
- **Usafiri wa Kidokezo cha Msingi**: Mwongozo thabiti wa maendeleo na viashiria vya kukamilika kwa sura
- **Kuunganisha Mambo Ndani**: Mfumo kamili wa kuunganisha mambo ndani kuunganisha dhana zinazohusiana
- **Ramani ya Sura**: Violezo na mifano vinavyohusishwa wazi na malengo ya kujifunza

#### Uboreshaji wa Mwongozo wa Masomo
- **📚 Malengo Kamili ya Kujifunza**: Mwongozo wa masomo umetengenezwa upya kuendana na mfumo wa sura 8
- **🎯 Tathmini Kulingana na Sura**: Kila sura ina malengo mahususi ya kujifunza na mazoezi ya vitendo
- **📋 Ufuatiliaji wa Maendeleo**: Ratiba ya kujifunza ya kila wiki yenye matokeo yanayopimika na orodha za ukamilishaji
- **❓ Maswali ya Tathmini**: Maswali ya kuthibitisha maarifa kwa kila sura na matokeo ya kitaaluma
- **🛠️ Mazoezi ya Vitendo**: Shughuli za kufanya mikononi na hali halisi za utekelezaji na utatuzi wa matatizo
- **📊 Maendeleo ya Ujuzi**: Maendeleo wazi kutoka dhana za msingi hadi mifumo ya biashara kwa lengo la maendeleo ya kazi
- **🎓 Mfumo wa Cheti**: Matokeo ya maendeleo ya kitaaluma na mfumo wa kutambuliwa na jamii
- **⏱️ Usimamizi wa Muda**: Mpango wa kujifunza wa wiki 10 wenye uthibitishaji wa hatua muhimu

### [v3.1.0] - 2025-09-17

#### Suluhisho Bora za AI za Wakala Wengi
**Toleo hili linaboreshwa suluhisho la rejareja la wakala wengi kwa majina bora ya wakala na nyaraka zilizoimarishwa.**

#### Zimebadilishwa
- **Neno la Wakala Wengi**: Iliundwa tena "wakala wa Cora" kuwa "wakala wa Mteja" katika suluhisho la rejareja la wakala wengi kwa uelewa bora
- **Miundo ya Wakala**: Nyaraka zote, templeti za ARM, na mifano ya msimbo zimebadilishwa kutumia jina lenye mshikamano la "wakala wa Mteja"
- **Mifano ya Usanidi**: Mifumo ya usanidi wa wakala imeboreshwa yenye lugha mpya ya majina
- **Thabiti ya Nyaraka**: Kuhakikisha marejeleo yote yanatumia majina ya wakala yanayuelezea kitaalamu

#### Imeboreshwa
- **Kifurushi cha Templeti za ARM**: Kifurushi cha rejareja-multiagent-arm-template kimeboreshwa na marejeleo ya wakala wa Mteja
- **Michoro ya Miundo**: Michoro ya Mermaid imesasishwa na majina mapya ya wakala
- **Mifano ya Msimbo**: Madarasa ya Python na mifano ya utekelezaji sasa hutumia jina la CustomerAgent
- **Mazingira ya Mabadiliko**: Skripti zote za utekelezaji zimebadilishwa kutumia mifumo ya majina ya CUSTOMER_AGENT_NAME

#### Imeboreshwa
- **Uzoefu wa Mwaendelezaji**: Majukumu na majukumu ya wakala yametangazwa wazi zaidi kwenye nyaraka
- **Uwezo wa Uzalishaji**: Ulinganifu bora na kanuni za majina za biashara
- **Vifaa vya Kujifunza**: Majina ya wakala yaliyo rahisi kueleweka kwa madhumuni ya elimu
- **Urahisi wa Kuakisi Templeti**: Kuelewa rahisi ya kazi za wakala na mifumo ya utekelezaji

#### Maelezo ya Kiufundi
- Michoro ya miundo ya Mermaid imesasishwa na marejeleo ya CustomerAgent
- Madarasa ya CoraAgent yamebadilishwa kuwa CustomerAgent katika mifano ya Python
- Mipangilio ya templeti za ARM JSON imebadilishwa kutumia aina ya wakala "customer"
- Mabadiliko ya mazingira kutoka CORA_AGENT_* hadi mfumo wa mfano wa CUSTOMER_AGENT_*
- Amri zote za utekelezaji na mipangilio ya container zimesasishwa

### [v3.0.0] - 2025-09-12

#### Mabadiliko Makubwa - Mwelekeo wa Developer wa AI na Uingizaji wa Microsoft Foundry
**Toleo hili linageuza hifadhidata kuwa rasilimali kamili ya kujifunza ya AI pamoja na uingizaji wa Microsoft Foundry.**

#### Imeongezwa
- **🤖 Njia ya Kujifunza AI-Kwanza**: Muundo kamili ukizingatia waendelezaji na wahandisi wa AI
- **Mwongozo wa Uingizaji wa Microsoft Foundry**: Nyaraka kamili za kuunganisha AZD na huduma za Microsoft Foundry
- **Mifumo ya Utekelezaji wa Mfano wa AI**: Mwongozo wa kina unaojumuisha uchaguzi wa mfano, usanidi, na mikakati ya uzalishaji
- **Kiwako cha Warsha ya AI**: Warsha ya moja kwa moja ya saa 2-3 kwa kubadilisha programu za AI kuwa suluhisho linaloweza kutekelezwa na AZD
- **Mifumo Bora ya AI kwa Uzalishaji**: Mifumo ya biashara kwa kupanua, kusimamia, na kuhifadhi mzigo wa AI
- **Mwongozo wa Utatuzi Maalum wa AI**: Utatuzi kamili kwa Modelle za Microsoft Foundry, Huduma za Kifahamu, na matatizo ya utekelezaji wa AI
- **Makumbusho ya Templeti za AI**: Mkusanyiko mkuu wa templeti za Microsoft Foundry zenye viwango vya ugumu
- **Vifaa vya Warsha**: Muundo kamili wa warsha na maabara za vitendo na vifaa vya rejea

#### Imeboreshwa
- **Muundo wa README**: Imeangazia waendelezaji wa AI ukitumia data ya maslahi ya jamii 45% kutoka Microsoft Foundry Discord
- **Njia za Kujifunza**: Safari maalum ya waendelezaji wa AI kando na njia za kawaida za wanafunzi na wahandisi wa DevOps
- **Mapendekezo ya Templeti**: Templeti za AI zinazoangaziwa ikiwa ni pamoja na azure-search-openai-demo, contoso-chat, na openai-chat-app-quickstart
- **Uingizaji wa Jamii**: Msaada wa jamii wa Discord umeboreshwa na vituo na majadiliano maalum ya AI

#### Usalama & Lengo la Uzalishaji
- **Mifumo ya Utambulisho Iliyosimamiwa**: Uthibitishaji wa AI maalum na usanidi wa usalama
- **Uboreshaji wa Gharama**: Ufuatiliaji wa matumizi ya tokeni na udhibiti wa bajeti kwa mizigo ya AI
- **Utekelezaji wa Maeneo Mengi**: Mikakati ya utekelezaji wa programu za AI kimataifa
- **Ufuatiliaji wa Utendaji**: Vipimo maalum vya AI na uingizaji wa Application Insights

#### Ubora wa Nyaraka
- **Muundo wa Kozi Mstari**: Maendeleo ya mantiki kutoka kwa waanzilishi hadi mifumo ya AI ya hali ya juu
- **URL Zilizothibitishwa**: Viungo vyote vya hifadhidata za nje vimehakikiwa na vinapatikana
- **Rejea Kamili**: Viungo vyote vya ndani vya nyaraka vimehakikiwa na vinafanya kazi
- **Tayari kwa Uzalishaji**: Mifumo ya utekelezaji wa biashara na mifano halisi

### [v2.0.0] - 2025-09-09

#### Mabadiliko Makubwa - Muundo wa Hifadhidata na Uboreshaji wa Kitaalamu
**Toleo hili linaonyesha mageuzi makubwa ya muundo wa hifadhidata na uwasilishaji wa maudhui.**

#### Imeongezwa
- **Mfumo wa Kujifunza uliopangwa**: Kurasa zote za nyaraka sasa zina sehemu za Utangulizi, Malengo ya Kujifunza, na Matokeo ya Kujifunza
- **Mfumo wa Usafiri**: Viungo vya Somo Lililopita/Linayofuata vimeongezwa katika nyaraka zote kwa kuongoza maendeleo ya kujifunza
- **Mwongozo wa Kujifunza**: study-guide.md kamili yenye malengo ya kujifunza, mazoezi ya vitendo, na vifaa vya tathmini
- **Uwasilishaji wa Kitaalamu**: Alama zote za emoji zimetolewa kwa upatikanaji bora na muonekano wa kitaaluma
- **Muundo wa Yaliyomo Ulioboreshwa**: Mpangilio na mtiririko bora wa vifaa vya kujifunza

#### Zimebadilishwa
- **Muundo wa Nyaraka**: Nyaraka zote zimepangwa kufuata muundo wa kujifunza unaoendelea
- **Mtiririko wa Usafiri**: Mtiririko wa mantiki umeanzishwa katika vifaa vyote vya kujifunza
- **Uwasilishaji wa Maudhui**: Vitu vya mapambo vimeondolewa na kubadilishwa na muundo wazi wa kitaaluma
- **Muundo wa Viungo**: Viungo vyote vya ndani vimeboreshwa kuunga mkono mfumo mpya wa usafiri

#### Imeboreshwa
- **Upatikanaji**: Kutegemea emoji kumeondolewa kwa ushirikiano bora na wasomaji wa skrini
- **Muonekano wa Kitaalamu**: Uwasilishaji safi wa mtindo wa kitaaluma unaofaa kwa mafunzo ya biashara
- **Uzoefu wa Kujifunza**: Mbinu iliyopangwa na malengo na matokeo wazi kwa kila somo
- **Mpangilio wa Maudhui**: Mtiririko mzuri wa mantiki na uunganisho kati ya mada zinazohusiana

### [v1.0.0] - 2025-09-09

#### Toleo la Awali - Hifadhidata Kamili ya Kujifunza AZD

#### Imeongezwa
- **Muundo wa Nyaraka za Msingi**
  - Mfululizo kamili wa mwongozo wa kuanza
  - Nyaraka kamili za utekelezaji na upatikanaji
  - Rasilimali za kina za utatuzi wa matatizo na mwongozo wa utafutaji hitilafu
  - Zana na taratibu za uthibitishaji kabla ya utekelezaji

- **Moduli ya Kuanzisha**
  - Misingi ya AZD: Dhana kuu na istilahi
  - Mwongozo wa Usakinishaji: Maelekezo ya usanidi wa jukwaa maalum
  - Mwongozo wa Usanidi: Usanidi wa mazingira na uthibitishaji
  - Mafunzo ya Mradi wa Kwanza: Hatua kwa hatua za kujifunza mikononi

- **Moduli ya Utekelezaji na Upatikanaji**
  - Mwongozo wa Utekelezaji: Nyaraka kamili za mchakato
  - Mwongozo wa Upatikanaji: Miundombinu kama Msimbo na Bicep
  - Mifano bora ya utekelezaji kwa uzalishaji
  - Mifumo ya miundo ya huduma nyingi

- **Moduli ya Uthibitishaji Kabla ya Utekelezaji**
  - Mipango ya Uwezo: Uthibitishaji wa upatikanaji wa rasilimali za Azure
  - Uchaguzi wa SKU: Mwongozo kamili wa ngazi za huduma
  - Ukaguzi wa Kabla ya Safari: Skripti za uthibitishaji za moja kwa moja (PowerShell na Bash)
  - Zana za makadirio ya gharama na upangaji bajeti

- **Moduli ya Utatuzi**
  - Masuala ya Kawaida: Matatizo yanayotokea mara kwa mara na suluhisho
  - Mwongozo wa Utafutaji Hitilafu: Mbinu za utatuzi wa matatizo kwa mfumo
  - Mbinu na zana za uchunguzi wa hali ya juu
  - Ufuatiliaji na uboreshaji wa utendaji

- **Rasilimali na Marejeo**
  - Orodha ya Amri Muhimu: Marejeo ya haraka kwa amri muhimu
  - Kamusi: Maelezo kamili ya istilahi na vifupi vya maneno
  - Maswali Yanayoulizwa Mara kwa Mara: Majibu ya kina kwa maswali ya kawaida
  - Viungo vya rasilimali za nje na uhusiano wa jamii

- **Mifano na Templeti**
  - Mfano rahisi wa Programu ya Wavuti
  - Templeti ya upatikanaji wa Tovuti Tulivu
  - Usanidi wa Programu ya Kontena
  - Mifumo ya ushirikiano wa hifadhidata
  - Mifano ya usanifu wa huduma ndogo ndogo
  - Utekelezaji wa kazi zisizo na seva

#### Vipengele
- **Msaada wa Majukwaa Mengi**: Mwongozo wa usakinishaji na usanidi kwa Windows, macOS, na Linux
- **Viwango Mbalimbali vya Ujuzi**: Maudhui yameundwa kwa wanafunzi hadi waendelezaji wa kitaaluma
- **Lengo la Vitendo**: Mifano ya mikono na hali halisi za matumizi
- **Ufunuo Kamili**: Kutoka kwa dhana za msingi hadi mifumo ya hali ya juu ya biashara
- **Mbinu za Usalama Kwanza**: Mazoezi bora ya usalama yaliyojumuishwa kote
- **Uboreshaji wa Gharama**: Mwongozo wa utekelezaji wa gharama nafuu na usimamizi wa rasilimali

#### Ubora wa Nyaraka
- **Mifano ya Msimbo ya Kina**: Sampuli za msimbo wa vitendo na zilizothibitishwa
- **Maelekezo ya Hatua kwa Hatua**: Mwongozo wazi na wa utekelezaji
- **Ushughulikiaji Kamili wa Makosa**: Utatuzi wa matatizo ya kawaida
- **Uingiliaji wa Mazoezi Bora**: Viwango vya viwanda na mapendekezo
- **Ulinganifu wa Toleo**: Upya wa hivi karibuni na huduma za Azure na vipengele vya azd

## Maboresho Yanayopangwa ya Baadaye

### Toelezo la 3.1.0 (Linalopangwa)
#### Upanuzi wa Jukwaa la AI
- **Msaada wa Miundo Mingi**: Mifumo ya uingizaji kwa Hugging Face, Azure Machine Learning, na miundo maalum
- **Mifumo ya Wakala wa AI**: Templeti za LangChain, Semantic Kernel, na AutoGen za utekelezaji
- **Mifumo ya Juu ya RAG**: Chaguzi za hifadhidata za vector zaidi ya Azure AI Search (Pinecone, Weaviate, nk.)
- **Ufuatiliaji wa AI**: Ufuatiliaji ulioimarishwa kwa utendaji wa mfano, matumizi ya tokeni, na ubora wa majibu

#### Uzoefu wa Mwaendelezaji
- **Kipenyo cha VS Code**: Uzalishaji wa AZD + uzoefu wa maendeleo wa Microsoft Foundry umejumuishwa
- **Uingizaji wa GitHub Copilot**: Uzalishaji wa templeti ya AZD kwa msaada wa AI
- **Mafunzo Yanayoshirikisha**: Mazoezi ya kuandika msimbo yenye uthibitishaji wa moja kwa moja kwa matukio ya AI
- **Maudhui ya Video**: Mafunzo ya video ya ziada kwa wanaojifunza kwa kuona wakilenga utekelezaji wa AI

### Toelezo la 4.0.0 (Linalopangwa)
#### Mifumo ya AI ya Biashara
- **Mfumo wa Usimamizi**: Usimamizi wa mfano wa AI, uzingatiaji sheria, na njia za ukaguzi
- **AI wa Wateja Wengi**: Mifumo ya kuhudumia wateja wengi kwa huduma za AI zilizojitenga
- **Utekelezaji wa AI Edge**: Uingizaji na Azure IoT Edge na kesi za container
- **AI ya Wingu Mchanganyiko**: Mifumo ya maeneo mengi na mchanganyiko ya utekelezaji kwa mzigo wa AI

#### Vipengele vya Hali ya Juu
- **Uendeshaji wa Mlolongo wa AI**: Uingizaji wa MLOps na mitaro ya Azure Machine Learning
- **Usalama wa Juu**: Mifumo isiyokuwa na imani, miisho binafsi, na ulinzi wa hali ya juu wa vitisho
- **Uboreshaji wa Utendaji**: Mikakati ya kuboresha na kupanua kwa programu za AI zenye tija kubwa
- **Usambazaji wa Ulimwengu**: Mifumo ya ugawaji maudhui na uhifadhi wa karibu kwa programu za AI

### Toelezo la 3.0.0 (Linalopangwa) - Limebadilishwa na Toleo la Sasa
#### Maongeza yaliyopendekezwa - Sasa Yatekelezwa katika v3.0.0
- ✅ **Maudhui Yanayolenga AI**: Uingizaji kamili wa Microsoft Foundry (Ulikamilika)
- ✅ **Mafunzo Shirikishi**: Warsha ya mikononi ya AI (Ulikamilika)
- ✅ **Moduli ya Usalama wa Hali ya Juu**: Mifumo ya usalama maalum ya AI (Ulikamilika)
- ✅ **Uboreshaji wa Utendaji**: Mikakati ya kusawazisha mzigo wa AI (Ulikamilika)

### Toelezo la 2.1.0 (Linalopangwa) - Sehemu Imetekelezwa katika v3.0.0
#### Maboresho Madogo - Baadhi Yamekamilika katika Toleo la Sasa
- ✅ **Mifano Zaidi**: Hali za utekelezaji zinazolenga AI (Ulikamilika)
- ✅ **Maswali ya FAQ Yaliyopanuliwa**: Maswali na utatuzi maalum ya AI (Ulikamilika)
- **Uingizaji wa Zana**: Mwongozo wa uingizaji bora wa IDE na mhariri
- ✅ **Upanuzi wa Ufuatiliaji**: Mifumo ya ufuatiliaji maalum ya AI na tahadhari (Ulikamilika)

#### Bado Yamepangwa kwa Toleo la Baadaye
- **Nyaraka Zinazofaa kwa Simu**: Ubunifu unaoweza kujibu kwa ujifunzaji wa simu
- **Upatikanaji wa Nje ya Mtandao**: Vifurushi vya nyaraka vinavyopakuliwa
- **Uingizaji Bora wa IDE**: Kipengele cha VS Code kwa AZD + michakato ya AI
- **Dashibodi ya Jamii**: Takwimu za jumuiya zenye wakati halisi na ufuatiliaji wa michango

## Kutoa Mchango kwa Kumbukumbu ya Mabadiliko

### Kuripoti Mabadiliko
Unapotoa mchango katika hifadhidata hii, tafadhali hakikisha vipengele vya kumbukumbu ya mabadiliko vinajumuisha:

1. **Nambari ya Toleo**: Kufuatia mchakato wa toleo lenye maana (kubwa.dogo.kipande)
2. **Tarehe**: Tarehe ya kutolewa au sasisho kwa muundo wa YYYY-MM-DD
3. **Kategoria**: Imeongezwa, Imebadilishwa, Imekatwa, Imetolewa, Imerekebishwa, Usalama
4. **Maelezo Yaliyo Wazi**: Maelezo mafupi ya mabadiliko yaliyofanyika
5. **Tathmini ya Athari**: Jinsi mabadiliko yanavyoathiri watumiaji waliopo

### Makategoria ya Mabadiliko

#### Imeongezwa
- Vipengele vipya, sehemu za nyaraka, au uwezo mpya
- Mifano mpya, templeti, au rasilimali za kujifunza
- Zana za ziada, skiripti, au huduma

#### Imebadilishwa
- Marekebisho ya kazi zilizopo au nyaraka
- Sasisho za kuboresha uwazi au usahihi
- Mageuzi ya yaliyomo au mpangilio

#### Imekatwa
- Vipengele au njia zinazopunguzwa
- Sehemu za nyaraka zilizopangwa kuondolewa
- Njia zenye mbadala bora

#### Imetolewa
- Vipengele, nyaraka, au mifano isiyo na maana tena
- Taarifa zilizopita wakati au njia zilizopitwa na wakati
- Maudhui yaliyojirudia au kuunganishwa

#### Imerekebishwa
- Marekebisho ya makosa katika nyaraka au msimbo
- Uamuzi wa matatizo yaliyoripotiwa au shida
- Maboresho ya usahihi au utendaji

#### Usalama
- Maboresho au marekebisho yanayohusiana na usalama
- Sasisho za mbinu bora za usalama
- Utatuzi wa udhaifu wa usalama

### Miongozo ya Utoaji Matoleo yenye Maana

#### Toleo Kuu (X.0.0)
- Mabadiliko makubwa yanayohitaji hatua kutoka kwa mtumiaji
- Mabadiliko makubwa ya muundo wa maudhui au mpangilio
- Mabadiliko yanayobadilisha mbinu au njia ya msingi

#### Toleo Dogo (X.Y.0)
- Sifa mpya au nyongeza za maudhui
- Maboresho yanayohifadhi muafaka wa nyuma
- Mifano zaidi, zana, au rasilimali

#### Toa la Marekebisho (X.Y.Z)
- Marekebisho ya hitilafu na usahihishaji
- Maboresho madogo kwa maudhui yaliyokuwepo
- Ufafanuzi na maboresho madogo

## Maoni na Mapendekezo ya Jamii

Tunahimiza maoni ya jamii kwa bidii ili kuboresha rasilimali hii ya kujifunza:

### Jinsi ya Kutoa Maoni
- **Masuala ya GitHub**: Ripoti matatizo au pendekeza maboresho (masuala maalum ya AI yanakaribishwa)
- **Majadiliano ya Discord**: Shiriki mawazo na kuingiliana na jamii ya Microsoft Foundry
- **Maombi ya Kubadilisha**: Changia maboresho ya moja kwa moja kwa maudhui, hasa templeti na miongozo ya AI
- **Microsoft Foundry Discord**: Shirikiana na kituo cha #Azure kwa mijadala ya AZD + AI
- **Majukwaa ya Jamii**: Shiriki majadiliano mapana ya waendelezaji wa Azure

### Aina za Maoni
- **Uhalisia wa Maudhui ya AI**: Marekebisho kuhusu huduma za AI na habari za utumiaji
- **Uzoefu wa Kujifunza**: Mapendekezo ya kuboresha mchakato wa kujifunza wa waendelezaji AI
- **Maudhui ya AI Yanayokosekana**: Maombi ya templeti, mifumo, au mifano zaidi ya AI
- **Ufikikaji**: Maboresho kwa mahitaji tofauti ya kujifunza
- **Uingiliano wa Zana za AI**: Mapendekezo ya uingiliano bora wa mchakato wa maendeleo ya AI
- **Mifumo ya Utengenezaji ya AI**: Maombi ya mifumo ya utumiaji wa AI kwa biashara

### Ahadi ya Majibu
- **Majibu kwa Masuala**: Ndani ya saa 48 kwa matatizo yaliyotolewa
- **Maombi ya Sifa**: Tathmini ndani ya wiki moja
- **Mchango wa Jamii**: Mapitio ndani ya wiki moja
- **Masuala ya Usalama**: Kipaumbele cha haraka kwa majibu ya haraka

## Ratiba ya Matengenezo

### Sasisho za Kawaida
- **Mapitio ya Kila Mwezi**: Uhalisia wa maudhui na uhakiki wa viungo
- **Sasisho za Robo Mwaka**: Nyongeza kubwa za maudhui na maboresho
- **Mapitio ya Nusu Mwaka**: Upangaji upya kamili na kuboresha
- **Matolewa ya Kila Mwaka**: Sasisho kubwa za toleo zenye maboresho makubwa

### Ufuatiliaji na Udhibiti wa Ubora
- **Upimaji Otomatik**: Uhakiki wa mara kwa mara wa mifano ya msimbo na viungo
- **Uingiliano wa Maoni ya Jamii**: Kuingiza mapendekezo ya watumiaji mara kwa mara
- **Sasisho za Teknolojia**: Kuendana na huduma mpya za Azure na matoleo ya azd
- **Ukaguzi wa Ufikikaji**: Mapitio ya mara kwa mara ya kanuni za muundo jumuishi

## Sera ya Msaada wa Toleo

### Msaada wa Toleo la Sasa
- **Toleo Kuu la Karibuni**: Msaada kamili na sasisho za mara kwa mara
- **Toleo Kuu lililopita**: Sasisho za usalama na marekebisho muhimu kwa miezi 12
- **Mito leo ya Kale**: Msaada wa jamii tu, hakuna sasisho rasmi

### Mwongozo wa Uhamishaji
Wakati matoleo makuu yanapotolewa, tunatoa:
- **Mwongozo wa Uhamishaji**: Maelekezo hatua kwa hatua ya mpito
- **Vidokezo vya Muafaka**: Maelezo kuhusu mabadiliko ya kuvunja
- **Msaada wa Zana**: Skripti au zana kusaidia uhamishaji
- **Msaada wa Jamii**: Majukwaa maalum kwa maswali ya uhamishaji

---

**Uavigesho**
- **Somo lililopita**: [Mwongozo wa Masomo](resources/study-guide.md)
- **Somo lijalo**: Rudi kwenye [README Kuu](README.md)

**Endelea Kusasishwa**: Tazama hazina hii kwa taarifa za matoleo mapya na sasisho muhimu kwa vifaa vya kujifunza.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->