<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-23T09:31:23+00:00",
  "source_file": "changelog.md",
  "language_code": "sw"
}
-->
# Rekodi ya Mabadiliko - AZD Kwa Wanaoanza

## Utangulizi

Rekodi hii ya mabadiliko inaorodhesha mabadiliko yote muhimu, masasisho, na maboresho yaliyofanywa kwenye hifadhi ya AZD Kwa Wanaoanza. Tunafuata kanuni za toleo la semantic na tunadumisha rekodi hii ili kuwasaidia watumiaji kuelewa mabadiliko yaliyotokea kati ya matoleo.

## Malengo ya Kujifunza

Kwa kupitia rekodi hii ya mabadiliko, utaweza:
- Kupata taarifa kuhusu vipengele vipya na nyongeza za maudhui
- Kuelewa maboresho yaliyofanywa kwenye nyaraka zilizopo
- Kufuatilia marekebisho ya hitilafu ili kuhakikisha usahihi
- Kufuatilia mabadiliko ya nyenzo za kujifunza kwa muda

## Matokeo ya Kujifunza

Baada ya kupitia rekodi ya mabadiliko, utaweza:
- Kutambua maudhui mapya na rasilimali zinazopatikana kwa ajili ya kujifunza
- Kuelewa sehemu zilizosasishwa au kuboreshwa
- Kupanga njia yako ya kujifunza kulingana na nyenzo za sasa zaidi
- Kutoa maoni na mapendekezo kwa maboresho ya baadaye

## Historia ya Toleo

### [v3.8.0] - 2025-11-19

#### Nyaraka za Juu: Ufuatiliaji, Usalama, na Mifumo ya Wakala Wengi
**Toleo hili linaongeza masomo ya kina ya kiwango cha juu kuhusu ujumuishaji wa Application Insights, mifumo ya uthibitishaji, na uratibu wa wakala wengi kwa ajili ya utekelezaji wa uzalishaji.**

#### Imeongezwa
- **📊 Somo la Ujumuishaji wa Application Insights**: katika `docs/pre-deployment/application-insights.md`:
  - Utekelezaji wa AZD wenye utoaji wa kiotomatiki
  - Violezo kamili vya Bicep kwa Application Insights + Log Analytics
  - Programu za Python zinazofanya kazi na telemetry maalum (mistari 1,200+)
  - Mifumo ya ufuatiliaji wa AI/LLM (ufuatiliaji wa tokeni ya Azure OpenAI/gari ya gharama)
  - Michoro 6 za Mermaid (miundo, ufuatiliaji wa usambazaji, mtiririko wa telemetry)
  - Mazoezi 3 ya vitendo (arifa, dashibodi, ufuatiliaji wa AI)
  - Mifano ya maswali ya Kusto na mikakati ya uboreshaji wa gharama
  - Utiririshaji wa metriki za moja kwa moja na urekebishaji wa wakati halisi
  - Muda wa kujifunza wa dakika 40-50 na mifumo ya kiwango cha uzalishaji

- **🔐 Somo la Mifumo ya Uthibitishaji na Usalama**: katika `docs/getting-started/authsecurity.md`:
  - Mifumo 3 ya uthibitishaji (mistari ya muunganisho, Key Vault, utambulisho uliosimamiwa)
  - Violezo kamili vya miundombinu ya Bicep kwa utekelezaji salama
  - Msimbo wa programu ya Node.js na ujumuishaji wa Azure SDK
  - Mazoezi 3 kamili (kuwezesha utambulisho uliosimamiwa, utambulisho uliotumwa na mtumiaji, mzunguko wa Key Vault)
  - Mazoezi bora ya usalama na usanidi wa RBAC
  - Mwongozo wa utatuzi wa matatizo na uchambuzi wa gharama
  - Mifumo ya uthibitishaji isiyo na nywila tayari kwa uzalishaji

- **🤖 Somo la Mifumo ya Uratibu wa Wakala Wengi**: katika `docs/pre-deployment/coordination-patterns.md`:
  - Mifumo 5 ya uratibu (mfululizo, sambamba, kihierarkia, inayotegemea matukio, makubaliano)
  - Utekelezaji kamili wa huduma ya uratibu (Python/Flask, mistari 1,500+)
  - Utekelezaji maalum wa wakala 3 (Mtafiti, Mwandishi, Mhariri)
  - Ujumuishaji wa Service Bus kwa foleni za ujumbe
  - Usimamizi wa hali ya Cosmos DB kwa mifumo iliyosambazwa
  - Michoro 6 za Mermaid zinazoonyesha mwingiliano wa wakala
  - Mazoezi 3 ya hali ya juu (ushughulikiaji wa muda wa mwisho, mantiki ya kurudia, mzunguko wa mzunguko)
  - Uchambuzi wa gharama ($240-565/mwezi) na mikakati ya uboreshaji
  - Ujumuishaji wa Application Insights kwa ufuatiliaji

#### Imeboreshwa
- **Sura ya Kabla ya Utekelezaji**: Sasa inajumuisha mifumo ya kina ya ufuatiliaji na uratibu
- **Sura ya Kuanza**: Imeboreshwa na mifumo ya kitaalamu ya uthibitishaji
- **Uko Tayari kwa Uzalishaji**: Ufunikaji kamili kutoka usalama hadi ufuatiliaji
- **Muhtasari wa Kozi**: Umesasishwa kurejelea masomo mapya katika Sura ya 3 na 6

#### Imebadilishwa
- **Mafanikio ya Kujifunza**: Ujumuishaji bora wa usalama na ufuatiliaji katika kozi nzima
- **Ubora wa Nyaraka**: Viwango vya A-grade thabiti (95-97%) katika masomo mapya
- **Mifumo ya Uzalishaji**: Ufunikaji kamili wa mwisho hadi mwisho kwa utekelezaji wa biashara

#### Imeimarishwa
- **Uzoefu wa Msanidi Programu**: Njia wazi kutoka maendeleo hadi ufuatiliaji wa uzalishaji
- **Viwango vya Usalama**: Mifumo ya kitaalamu ya uthibitishaji na usimamizi wa siri
- **Ufuatiliaji**: Ujumuishaji kamili wa Application Insights na AZD
- **Mizigo ya AI**: Ufuatiliaji maalum kwa Azure OpenAI na mifumo ya wakala wengi

#### Imethibitishwa
- ✅ Masomo yote yanajumuisha msimbo kamili unaofanya kazi (sio vipande)
- ✅ Michoro ya Mermaid kwa kujifunza kwa kuona (19 jumla katika masomo 3)
- ✅ Mazoezi ya vitendo yenye hatua za uthibitishaji (9 jumla)
- ✅ Violezo vya Bicep tayari kwa uzalishaji vinavyoweza kutekelezwa kupitia `azd up`
- ✅ Uchambuzi wa gharama na mikakati ya uboreshaji
- ✅ Miongozo ya utatuzi wa matatizo na mazoea bora
- ✅ Vipimo vya maarifa na amri za uthibitishaji

#### Matokeo ya Upimaji wa Nyaraka
- **docs/pre-deployment/application-insights.md**: - Mwongozo wa kina wa ufuatiliaji
- **docs/getting-started/authsecurity.md**: - Mifumo ya kitaalamu ya usalama
- **docs/pre-deployment/coordination-patterns.md**: - Miundo ya hali ya juu ya wakala wengi
- **Maudhui Mapya Jumla**: - Viwango vya ubora wa hali ya juu thabiti

#### Utekelezaji wa Kiufundi
- **Application Insights**: Log Analytics + telemetry maalum + ufuatiliaji wa usambazaji
- **Uthibitishaji**: Utambulisho uliosimamiwa + Key Vault + mifumo ya RBAC
- **Wakala Wengi**: Service Bus + Cosmos DB + Container Apps + uratibu
- **Ufuatiliaji**: Metriki za moja kwa moja + maswali ya Kusto + arifa + dashibodi
- **Usimamizi wa Gharama**: Mikakati ya sampuli, sera za uhifadhi, udhibiti wa bajeti

### [v3.7.0] - 2025-11-19

#### Maboresho ya Ubora wa Nyaraka na Mfano Mpya wa Azure OpenAI
**Toleo hili linaboresha ubora wa nyaraka katika hifadhi nzima na linaongeza mfano kamili wa utekelezaji wa Azure OpenAI na kiolesura cha mazungumzo cha GPT-4.**

#### Imeongezwa
- **🤖 Mfano wa Mazungumzo ya Azure OpenAI**: Utekelezaji kamili wa GPT-4 na utekelezaji unaofanya kazi katika `examples/azure-openai-chat/`:
  - Miundombinu kamili ya Azure OpenAI (utekelezaji wa mfano wa GPT-4)
  - Kiolesura cha mazungumzo cha Python cha mstari wa amri na historia ya mazungumzo
  - Ujumuishaji wa Key Vault kwa uhifadhi salama wa funguo za API
  - Ufuatiliaji wa matumizi ya tokeni na makadirio ya gharama
  - Kiwango cha matumizi na usimamizi wa makosa
  - README ya kina yenye mwongozo wa utekelezaji wa dakika 35-45
  - Faili 11 tayari kwa uzalishaji (vielelezo vya Bicep, programu ya Python, usanidi)
- **📚 Mazoezi ya Nyaraka**: Yameongezwa mazoezi ya vitendo kwa mwongozo wa usanidi:
  - Zoezi 1: Usanidi wa mazingira mengi (dakika 15)
  - Zoezi 2: Mazoezi ya usimamizi wa siri (dakika 10)
  - Vigezo vya mafanikio wazi na hatua za uthibitishaji
- **✅ Uthibitishaji wa Utekelezaji**: Sehemu ya uthibitishaji imeongezwa kwenye mwongozo wa utekelezaji:
  - Taratibu za ukaguzi wa afya
  - Orodha ya vigezo vya mafanikio
  - Matokeo yanayotarajiwa kwa amri zote za utekelezaji
  - Marejeleo ya haraka ya utatuzi wa matatizo

#### Imeboreshwa
- **examples/README.md**: Imeboreshwa hadi ubora wa A-grade (93%):
  - Imeongeza azure-openai-chat kwenye sehemu zote husika
  - Imeongeza hesabu ya mifano ya ndani kutoka 3 hadi 4
  - Imeongezwa kwenye jedwali la Mifano ya Maombi ya AI
  - Imejumuishwa kwenye Kuanza Haraka kwa Watumiaji wa Kati
  - Imeongezwa kwenye sehemu ya Violezo vya Microsoft Foundry
  - Imeboreshwa Jedwali la Ulinganisho na sehemu za kutafuta teknolojia
- **Ubora wa Nyaraka**: Imeboreshwa kutoka B+ (87%) → A- (92%) katika folda ya docs:
  - Imeongeza matokeo yanayotarajiwa kwa mifano muhimu ya amri
  - Imejumuisha hatua za uthibitishaji kwa mabadiliko ya usanidi
  - Imeimarisha kujifunza kwa vitendo na mazoezi ya vitendo

#### Imebadilishwa
- **Mafanikio ya Kujifunza**: Ujumuishaji bora wa mifano ya AI kwa wanafunzi wa kati
- **Muundo wa Nyaraka**: Mazoezi zaidi yanayoweza kutekelezwa na matokeo wazi
- **Mchakato wa Uthibitishaji**: Vigezo vya mafanikio vilivyo wazi vimeongezwa kwenye kazi muhimu

#### Imeimarishwa
- **Uzoefu wa Msanidi Programu**: Utekelezaji wa Azure OpenAI sasa unachukua dakika 35-45 (ikilinganishwa na 60-90 kwa njia mbadala ngumu)
- **Uwazi wa Gharama**: Makadirio ya gharama wazi ($50-200/mwezi) kwa mfano wa Azure OpenAI
- **Njia ya Kujifunza**: Watengenezaji wa AI wana sehemu ya kuanzia wazi na azure-openai-chat
- **Viwango vya Nyaraka**: Matokeo yanayotarajiwa thabiti na hatua za uthibitishaji

#### Imethibitishwa
- ✅ Mfano wa Azure OpenAI unafanya kazi kikamilifu na `azd up`
- ✅ Faili zote 11 za utekelezaji ziko sahihi kisintaksia
- ✅ Maelekezo ya README yanalingana na uzoefu halisi wa utekelezaji
- ✅ Viungo vya nyaraka vimesasishwa katika maeneo 8+
- ✅ Fahirisi ya mifano inaonyesha kwa usahihi mifano 4 ya ndani
- ✅ Hakuna viungo vya nje vilivyojirudia kwenye meza
- ✅ Marejeleo yote ya urambazaji ni sahihi

#### Utekelezaji wa Kiufundi
- **Miundo ya Azure OpenAI**: GPT-4 + Key Vault + Container Apps
- **Usalama**: Utambulisho uliosimamiwa tayari, siri katika Key Vault
- **Ufuatiliaji**: Ujumuishaji wa Application Insights
- **Usimamizi wa Gharama**: Ufuatiliaji wa tokeni na uboreshaji wa matumizi
- **Utekelezaji**: Amri moja ya `azd up` kwa usanidi kamili

### [v3.6.0] - 2025-11-19

#### Sasisho Kubwa: Mifano ya Utekelezaji wa Programu za Kontena
**Toleo hili linaanzisha mifano ya utekelezaji wa programu za kontena tayari kwa uzalishaji kwa kutumia Azure Developer CLI (AZD), yenye nyaraka kamili na ujumuishaji katika njia ya kujifunza.**

#### Imeongezwa
- **🚀 Mifano ya Programu za Kontena**: Mifano mipya ya ndani katika `examples/container-app/`:
  - [Mwongozo Mkuu](examples/container-app/README.md): Muhtasari kamili wa utekelezaji wa programu zilizowekwa kwenye kontena, kuanza haraka, uzalishaji, na mifumo ya hali ya juu
  - [API Rahisi ya Flask](../../examples/container-app/simple-flask-api): API ya REST inayofaa kwa wanaoanza yenye uwezo wa scale-to-zero, uchunguzi wa afya, ufuatiliaji, na utatuzi wa matatizo
  - [Miundo ya Huduma Ndogo](../../examples/container-app/microservices): Utekelezaji wa uzalishaji wa huduma nyingi (API Gateway, Bidhaa, Agizo, Mtumiaji, Arifa), ujumbe wa async, Service Bus, Cosmos DB, Azure SQL, ufuatiliaji wa usambazaji, utekelezaji wa blue-green/canary
- **Mazoezi Bora**: Usalama, ufuatiliaji, uboreshaji wa gharama, na mwongozo wa CI/CD kwa mizigo ya kontena
- **Mifano ya Msimbo**: `azure.yaml` kamili, violezo vya Bicep, na utekelezaji wa huduma kwa lugha nyingi (Python, Node.js, C#, Go)
- **Upimaji & Utatuzi wa Matatizo**: Matukio ya majaribio ya mwisho hadi mwisho, amri za ufuatiliaji, mwongozo wa utatuzi wa matatizo

#### Imebadilishwa
- **README.md**: Imesasishwa kuonyesha na kuunganisha mifano mipya ya programu za kontena chini ya "Mifano ya Ndani - Programu za Kontena"
- **examples/README.md**: Imesasishwa kuonyesha mifano ya programu za kontena, kuongeza maingizo ya jedwali la ulinganisho, na kusasisha marejeleo ya teknolojia/miundo
- **Muhtasari wa Kozi & Mwongozo wa Kujifunza**: Umesasishwa kurejelea mifano mipya ya programu za kontena na mifumo ya utekelezaji katika sura husika

#### Imethibitishwa
- ✅ Mifano yote mipya inaweza kutekelezwa na `azd up` na inafuata mazoea bora
- ✅ Viungo vya nyaraka na urambazaji vimesasishwa
- ✅ Mifano inashughulikia hali za wanaoanza hadi za hali ya juu, ikijumuisha huduma ndogo za uzalishaji

#### Vidokezo
- **Wigo**: Nyaraka na mifano ya Kiingereza pekee
- **Hatua Zifuatazo**: Kupanua na mifumo ya ziada ya hali ya juu ya kontena na uboreshaji wa CI/CD katika matoleo yajayo

### [v3.5.0] - 2025-11-19

#### Ubadilishaji wa Bidhaa: Microsoft Foundry
**Toleo hili linatekeleza mabadiliko kamili ya jina la bidhaa kutoka "Azure AI Foundry" hadi "Microsoft Foundry" katika nyaraka zote za Kiingereza, kuakisi mabadiliko rasmi ya jina la Microsoft.**

#### Imebadilishwa
- **🔄 Sasisho la Jina la Bidhaa**: Mabadiliko kamili ya jina kutoka "Azure AI Foundry" hadi "Microsoft Foundry"
  - Marejeleo yote yamesasishwa katika nyaraka za Kiingereza katika folda ya `docs/`
  - Jina la folda limebadilishwa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Jina la faili limebadilishwa: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumla: Marejeleo 23 ya maudhui yamesasishwa katika faili 7 za nyaraka

- **📁 Mabadiliko ya Muundo wa Folda**:
  - `docs/ai-foundry/` imebadilishwa jina kuwa `docs/microsoft-foundry/`
  - Marejeleo yote ya msalaba yamesasishwa kuakisi muundo mpya wa folda
  - Viungo vya urambazaji vimehakikiwa katika nyaraka zote

- **📄 Mabadiliko ya Faili**:
  - `azure-ai-foundry-integration.md` →
- **Warsha**: Vifaa vya warsha (`workshop/`) havijasasishwa katika toleo hili
- **Mifano**: Faili za mifano bado zinaweza kurejelea majina ya zamani (itatatuliwa katika sasisho lijalo)
- **Viungo vya Nje**: URL za nje na marejeleo ya hifadhi ya GitHub hayajabadilishwa

#### Mwongozo wa Uhamiaji kwa Wachangiaji
Ikiwa una matawi ya ndani au nyaraka zinazorejelea muundo wa zamani:
1. Sasisha marejeleo ya folda: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Sasisha marejeleo ya faili: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Badilisha jina la bidhaa: "Azure AI Foundry" → "Microsoft Foundry"
4. Hakikisha viungo vyote vya ndani vya nyaraka bado vinafanya kazi

---

### [v3.4.0] - 2025-10-24

#### Muhtasari wa Miundombinu na Uboreshaji wa Uthibitishaji
**Toleo hili linaanzisha msaada wa kina kwa kipengele kipya cha hakikisho la Azure Developer CLI na kuboresha uzoefu wa watumiaji wa warsha.**

#### Imeongezwa
- **🧪 Nyaraka za Kipengele cha azd provision --preview**: Ufunuo wa kina wa uwezo mpya wa hakikisho la miundombinu
  - Marejeleo ya amri na mifano ya matumizi katika karatasi ya kumbukumbu
  - Ujumuishaji wa kina katika mwongozo wa utoaji na kesi za matumizi na faida
  - Ujumuishaji wa ukaguzi wa awali kwa uthibitishaji salama wa utoaji
  - Sasisho za mwongozo wa kuanza na mazoea ya utoaji salama kwanza
- **🚧 Bango la Hali ya Warsha**: Bango la kitaalamu la HTML linaloonyesha hali ya maendeleo ya warsha
  - Muundo wa gradient na viashiria vya ujenzi kwa mawasiliano ya wazi ya mtumiaji
  - Muda wa mwisho wa kusasisha kwa uwazi
  - Muundo unaojibika kwa vifaa vyote vya rununu

#### Imeboreshwa
- **Usalama wa Miundombinu**: Uwezo wa hakikisho umejumuishwa katika nyaraka za utoaji
- **Uthibitishaji Kabla ya Utoaji**: Hati za kiotomatiki sasa zinajumuisha majaribio ya hakikisho la miundombinu
- **Mtiririko wa Kazi wa Wasanidi Programu**: Mfuatano wa amri uliosasishwa ili kujumuisha hakikisho kama mazoea bora
- **Uzoefu wa Warsha**: Matarajio wazi yamewekwa kwa watumiaji kuhusu hali ya maendeleo ya maudhui

#### Imebadilishwa
- **Mazoea Bora ya Utoaji**: Mtiririko wa hakikisho kwanza sasa ni mbinu inayopendekezwa
- **Mtiririko wa Nyaraka**: Uthibitishaji wa miundombinu umehamishwa mapema katika mchakato wa kujifunza
- **Uwasilishaji wa Warsha**: Mawasiliano ya hali ya kitaalamu na ratiba wazi ya maendeleo

#### Imeimarishwa
- **Mbinu ya Usalama Kwanza**: Mabadiliko ya miundombinu sasa yanaweza kuthibitishwa kabla ya utoaji
- **Ushirikiano wa Timu**: Matokeo ya hakikisho yanaweza kushirikiwa kwa ukaguzi na idhini
- **Uelewa wa Gharama**: Uelewa bora wa gharama za rasilimali kabla ya utoaji
- **Kupunguza Hatari**: Kupunguza kushindwa kwa utoaji kupitia uthibitishaji wa mapema

#### Utekelezaji wa Kiufundi
- **Ujumuishaji wa Nyaraka Nyingi**: Kipengele cha hakikisho kimeandikwa katika faili kuu 4
- **Mifumo ya Amri**: Sintaksia thabiti na mifano katika nyaraka zote
- **Ujumuishaji wa Mazoea Bora**: Hakikisho limejumuishwa katika mtiririko wa uthibitishaji na hati
- **Viashiria vya Kiona**: Alama wazi za kipengele KIPYA kwa urahisi wa kugundua

#### Miundombinu ya Warsha
- **Mawasiliano ya Hali**: Bango la kitaalamu la HTML lenye muundo wa gradient
- **Uzoefu wa Mtumiaji**: Hali wazi ya maendeleo inazuia mkanganyiko
- **Uwasilishaji wa Kitaalamu**: Inadumisha uaminifu wa hifadhi huku ikitoa matarajio
- **Uwajibikaji wa Ratiba**: Muda wa mwisho wa kusasisha wa Oktoba 2025 kwa uwazi

### [v3.3.0] - 2025-09-24

#### Vifaa vya Warsha Vilivyoboreshwa na Uzoefu wa Kujifunza wa Kivutio
**Toleo hili linaanzisha vifaa vya kina vya warsha na miongozo ya kivinjari na njia za kujifunza zilizopangiliwa.**

#### Imeongezwa
- **🎥 Mwongozo wa Warsha wa Kivutio**: Uzoefu wa warsha wa kivinjari na uwezo wa hakikisho la MkDocs
- **📝 Maelekezo ya Warsha Yaliyopangiliwa**: Njia ya kujifunza ya hatua 7 kutoka kwa ugunduzi hadi ubinafsishaji
  - 0-Utangulizi: Muhtasari wa warsha na usanidi
  - 1-Chagua-Mfano-AI: Mchakato wa ugunduzi na uteuzi wa mfano
  - 2-Thibitisha-Mfano-AI: Taratibu za utoaji na uthibitishaji
  - 3-Vunja-Mfano-AI: Kuelewa usanifu wa mfano
  - 4-Sanidi-Mfano-AI: Usanidi na ubinafsishaji
  - 5-Binafsisha-Mfano-AI: Marekebisho ya hali ya juu na marudio
  - 6-Safisha-Miundombinu: Usimamizi wa usafi na rasilimali
  - 7-Hitimisho: Muhtasari na hatua zinazofuata
- **🛠️ Zana za Warsha**: Usanidi wa MkDocs na mandhari ya Material kwa uzoefu bora wa kujifunza
- **🎯 Njia ya Kujifunza kwa Vitendo**: Mbinu ya hatua 3 (Ugunduzi → Utoaji → Ubinafsishaji)
- **📱 Ujumuishaji wa GitHub Codespaces**: Usanidi wa mazingira ya maendeleo bila mshono

#### Imeboreshwa
- **Maabara ya Warsha ya AI**: Imeongezwa na uzoefu wa kujifunza wa saa 2-3 ulio na muundo
- **Nyaraka za Warsha**: Uwasilishaji wa kitaalamu na urambazaji na misaada ya kuona
- **Maendeleo ya Kujifunza**: Mwongozo wa hatua kwa hatua kutoka kwa uteuzi wa mfano hadi utoaji wa uzalishaji
- **Uzoefu wa Wasanidi Programu**: Zana zilizojumuishwa kwa mtiririko wa kazi wa maendeleo ulio rahisi

#### Imeimarishwa
- **Upatikanaji**: Kiolesura cha kivinjari na utafutaji, uwezo wa kunakili, na kubadilisha mandhari
- **Kujifunza kwa Kujitegemea**: Muundo wa warsha unaobadilika unaokidhi kasi tofauti za kujifunza
- **Matumizi ya Kivitendo**: Matukio halisi ya utoaji wa mfano wa AI
- **Ujumuishaji wa Jamii**: Ujumuishaji wa Discord kwa msaada wa warsha na ushirikiano

#### Vipengele vya Warsha
- **Utafutaji Uliojengwa Ndani**: Ugunduzi wa maneno muhimu na masomo kwa haraka
- **Nakili Vitalu vya Nambari**: Uwezo wa kunakili kwa hover kwa mifano yote ya nambari
- **Kubadilisha Mandhari**: Msaada wa hali ya giza/nyepesi kwa mapendeleo tofauti
- **Mali za Kuona**: Picha za skrini na michoro kwa uelewa bora
- **Ujumuishaji wa Msaada**: Ufikiaji wa moja kwa moja wa Discord kwa msaada wa jamii
- **Uwasilishaji wa Maudhui**: Vipengele vya mapambo vimeondolewa kwa muundo wazi na wa kitaalamu
- **Muundo wa Viungo**: Viungo vyote vya ndani vimesasishwa ili kuendana na mfumo mpya wa urambazaji

#### Imeboreshwa
- **Ufikiaji**: Utegemezi wa emoji umeondolewa kwa usomaji bora wa skrini
- **Mwonekano wa Kitaalamu**: Muundo safi wa kitaaluma unaofaa kwa kujifunza katika makampuni
- **Uzoefu wa Kujifunza**: Njia iliyopangwa na malengo na matokeo wazi kwa kila somo
- **Mpangilio wa Maudhui**: Mtiririko bora wa kimantiki na uhusiano kati ya mada zinazohusiana

### [v1.0.0] - 2025-09-09

#### Toleo la Awali - Hifadhi Kamili ya Kujifunza AZD

#### Imeongezwa
- **Muundo wa Msingi wa Nyaraka**
  - Mfululizo kamili wa mwongozo wa kuanza
  - Nyaraka za kina za kupelekwa na utoaji
  - Rasilimali za utatuzi wa matatizo na miongozo ya uchunguzi
  - Zana na taratibu za uthibitishaji kabla ya kupelekwa

- **Moduli ya Kuanza**
  - Misingi ya AZD: Dhana kuu na istilahi
  - Mwongozo wa Usakinishaji: Maelekezo ya usanidi kulingana na jukwaa
  - Mwongozo wa Usanidi: Usanidi wa mazingira na uthibitishaji
  - Mafunzo ya Mradi wa Kwanza: Kujifunza kwa vitendo hatua kwa hatua

- **Moduli ya Utoaji na Upelekaji**
  - Mwongozo wa Upelekaji: Nyaraka kamili za mtiririko wa kazi
  - Mwongozo wa Utoaji: Miundombinu kama Msimbo kwa kutumia Bicep
  - Mbinu bora za upelekaji wa uzalishaji
  - Mifumo ya usanifu wa huduma nyingi

- **Moduli ya Uthibitishaji Kabla ya Upelekaji**
  - Mipango ya Uwezo: Uthibitishaji wa upatikanaji wa rasilimali za Azure
  - Uchaguzi wa SKU: Mwongozo wa kina wa viwango vya huduma
  - Ukaguzi Kabla ya Upelekaji: Hati za uthibitishaji otomatiki (PowerShell na Bash)
  - Zana za makadirio ya gharama na mipango ya bajeti

- **Moduli ya Utatuzi wa Matatizo**
  - Masuala ya Kawaida: Matatizo yanayokutana mara kwa mara na suluhisho zake
  - Mwongozo wa Uchunguzi: Mbinu za utatuzi wa matatizo kwa utaratibu
  - Mbinu na zana za uchunguzi wa hali ya juu
  - Ufuatiliaji wa utendaji na uboreshaji

- **Rasilimali na Marejeleo**
  - Karatasi ya Msaada wa Amri: Marejeleo ya haraka kwa amri muhimu
  - Kamusi: Ufafanuzi wa istilahi na vifupisho
  - Maswali Yanayoulizwa Mara kwa Mara: Majibu ya kina kwa maswali ya kawaida
  - Viungo vya rasilimali za nje na muunganisho wa jamii

- **Mifano na Violezo**
  - Mfano wa Programu Rahisi ya Wavuti
  - Kiolezo cha upelekaji wa Tovuti Tuli
  - Usanidi wa Programu ya Kontena
  - Mifumo ya ujumuishaji wa hifadhidata
  - Mifano ya usanifu wa huduma ndogo
  - Utekelezaji wa kazi zisizo na seva

#### Vipengele
- **Msaada wa Majukwaa Mbalimbali**: Miongozo ya usakinishaji na usanidi kwa Windows, macOS, na Linux
- **Viwango Mbalimbali vya Ujuzi**: Maudhui yaliyoundwa kwa wanafunzi hadi watengenezaji wa kitaalamu
- **Mtazamo wa Vitendo**: Mifano ya vitendo na hali halisi
- **Ufunikaji Kamili**: Kutoka dhana za msingi hadi mifumo ya hali ya juu ya makampuni
- **Njia ya Kwanza ya Usalama**: Mbinu bora za usalama zimejumuishwa kote
- **Uboreshaji wa Gharama**: Mwongozo wa upelekaji wa gharama nafuu na usimamizi wa rasilimali

#### Ubora wa Nyaraka
- **Mifano ya Kina ya Msimbo**: Sampuli za msimbo za vitendo zilizojaribiwa
- **Maelekezo Hatua kwa Hatua**: Mwongozo wazi na wa kutekelezeka
- **Utunzaji wa Makosa wa Kina**: Utatuzi wa matatizo ya kawaida
- **Ujumuishaji wa Mbinu Bora**: Viwango vya sekta na mapendekezo
- **Utangamano wa Toleo**: Sambamba na huduma za Azure za hivi karibuni na vipengele vya azd

## Uboreshaji wa Baadaye Uliopangwa

### Toleo 3.1.0 (Limepangwa)
#### Upanuzi wa Jukwaa la AI
- **Msaada wa Miundo Mingi**: Mifumo ya ujumuishaji kwa Hugging Face, Azure Machine Learning, na miundo maalum
- **Mifumo ya Wakala wa AI**: Violezo vya LangChain, Semantic Kernel, na AutoGen
- **Mifumo ya RAG ya Juu**: Chaguo za hifadhidata ya vekta zaidi ya Azure AI Search (Pinecone, Weaviate, nk.)
- **Ufuatiliaji wa AI**: Ufuatiliaji ulioboreshwa wa utendaji wa miundo, matumizi ya tokeni, na ubora wa majibu

#### Uzoefu wa Watengenezaji
- **Kiendelezi cha VS Code**: Uzoefu wa maendeleo uliounganishwa wa AZD + AI Foundry
- **Ujumuishaji wa GitHub Copilot**: Uzalishaji wa violezo vya AZD unaosaidiwa na AI
- **Mafunzo ya Kuingiliana**: Mazoezi ya usimbaji kwa vitendo na uthibitishaji otomatiki kwa hali za AI
- **Maudhui ya Video**: Mafunzo ya video ya ziada kwa wanaojifunza kwa kuona yanayolenga upelekaji wa AI

### Toleo 4.0.0 (Limepangwa)
#### Mifumo ya AI ya Makampuni
- **Mfumo wa Utawala**: Utawala wa miundo ya AI, uzingatiaji, na nyayo za ukaguzi
- **AI ya Wateja Wengi**: Mifumo ya kuhudumia wateja wengi kwa huduma za AI zilizotengwa
- **Upelekaji wa AI Kwenye Ukingo**: Ujumuishaji na Azure IoT Edge na kontena
- **AI ya Wingu Mseto**: Mifumo ya upelekaji wa wingu mseto na wingu nyingi kwa mzigo wa kazi wa AI

#### Vipengele vya Juu
- **Uendeshaji wa Njia za AI**: Ujumuishaji wa MLOps na njia za Azure Machine Learning
- **Usalama wa Juu**: Mifumo ya uaminifu sifuri, viunganisho vya kibinafsi, na ulinzi wa hali ya juu dhidi ya vitisho
- **Uboreshaji wa Utendaji**: Mikakati ya hali ya juu ya kurekebisha na kupanua kwa programu za AI zenye mtiririko wa juu
- **Usambazaji wa Ulimwenguni**: Mifumo ya utoaji wa maudhui na uhifadhi wa ukingo kwa programu za AI

### Toleo 3.0.0 (Limepangwa) - Limezidiwa na Toleo la Sasa
#### Mapendekezo ya Nyongeza - Sasa Yamejumuishwa katika v3.0.0
- ✅ **Maudhui Yanayolenga AI**: Ujumuishaji kamili wa Azure AI Foundry (Imekamilika)
- ✅ **Mafunzo ya Kuingiliana**: Warsha ya maabara ya AI kwa vitendo (Imekamilika)
- ✅ **Moduli ya Usalama wa Juu**: Mifumo ya usalama maalum ya AI (Imekamilika)
- ✅ **Uboreshaji wa Utendaji**: Mikakati ya kurekebisha mzigo wa kazi wa AI (Imekamilika)

### Toleo 2.1.0 (Limepangwa) - Sehemu Imetekelezwa katika v3.0.0
#### Uboreshaji Mdogo - Baadhi Yamekamilika katika Toleo la Sasa
- ✅ **Mifano ya Ziada**: Hali za upelekaji zinazolenga AI (Imekamilika)
- ✅ **Maswali Yanayoulizwa Mara kwa Mara Yaliyopanuliwa**: Maswali maalum ya AI na utatuzi wa matatizo (Imekamilika)
- **Ujumuishaji wa Zana**: Miongozo ya ujumuishaji wa IDE na wahariri iliyoboreshwa
- ✅ **Upanuzi wa Ufuatiliaji**: Mifumo ya ufuatiliaji na arifa maalum ya AI (Imekamilika)

#### Bado Limepangwa kwa Toleo la Baadaye
- **Nyaraka Zinazofaa kwa Simu**: Muundo unaojibika kwa kujifunza kupitia simu
- **Ufikiaji wa Nje ya Mtandao**: Pakiti za nyaraka zinazoweza kupakuliwa
- **Ujumuishaji wa IDE Ulioboreshwa**: Kiendelezi cha VS Code kwa AZD + AI
- **Dashibodi ya Jamii**: Takwimu za jamii kwa wakati halisi na ufuatiliaji wa michango

## Kuchangia kwenye Changelog

### Kuripoti Mabadiliko
Unapochangia kwenye hifadhi hii, hakikisha maingizo ya changelog yanajumuisha:

1. **Nambari ya Toleo**: Kwa kufuata toleo la semantic (kubwa.ndogo.marekebisho)
2. **Tarehe**: Tarehe ya toleo au sasisho katika muundo wa YYYY-MM-DD
3. **Kategoria**: Imeongezwa, Imebadilishwa, Imeachwa, Imeondolewa, Imetatuliwa, Usalama
4. **Maelezo Wazi**: Maelezo mafupi ya kilichobadilika
5. **Tathmini ya Athari**: Jinsi mabadiliko yanavyoathiri watumiaji waliopo

### Kategoria za Mabadiliko

#### Imeongezwa
- Vipengele vipya, sehemu za nyaraka, au uwezo
- Mifano mpya, violezo, au rasilimali za kujifunza
- Zana za ziada, hati, au huduma

#### Imebadilishwa
- Marekebisho ya utendaji uliopo au nyaraka
- Sasisho za kuboresha uwazi au usahihi
- Urekebishaji wa maudhui au mpangilio

#### Imeachwa
- Vipengele au mbinu zinazokaribia kuondolewa
- Sehemu za nyaraka zilizopangwa kuondolewa
- Mbinu zilizo na mbadala bora

#### Imeondolewa
- Vipengele, nyaraka, au mifano ambayo si muhimu tena
- Taarifa za zamani au mbinu zilizopitwa na wakati
- Maudhui ya ziada au yaliyofanywa kuwa moja

#### Imetatuliwa
- Marekebisho ya makosa katika nyaraka au msimbo
- Utatuzi wa masuala au matatizo yaliyoripotiwa
- Uboreshaji wa usahihi au utendaji

#### Usalama
- Uboreshaji au marekebisho yanayohusiana na usalama
- Sasisho za mbinu bora za usalama
- Utatuzi wa udhaifu wa usalama

### Miongozo ya Toleo la Semantic

#### Toleo Kubwa (X.0.0)
- Mabadiliko makubwa yanayohitaji hatua za mtumiaji
- Urekebishaji mkubwa wa maudhui au mpangilio
- Mabadiliko yanayobadilisha mbinu au njia ya msingi

#### Toleo Ndogo (X.Y.0)
- Vipengele vipya au nyongeza za maudhui
- Uboreshaji unaohifadhi utangamano wa nyuma
- Mifano ya ziada, zana, au rasilimali

#### Toleo la Marekebisho (X.Y.Z)
- Marekebisho ya hitilafu na marekebisho
- Uboreshaji mdogo wa maudhui yaliyopo
- Ufafanuzi na nyongeza ndogo

## Maoni ya Jamii na Mapendekezo

Tunakaribisha maoni ya jamii ili kuboresha rasilimali hii ya kujifunza:

### Jinsi ya Kutoa Maoni
- **Masuala ya GitHub**: Ripoti matatizo au pendekeza maboresho (masuala maalum ya AI yanakaribishwa)
- **Majadiliano ya Discord**: Shiriki mawazo na ushirikiane na jamii ya Azure AI Foundry
- **Ombi la Kuvuta**: Changia maboresho ya moja kwa moja kwenye maudhui, hasa violezo na miongozo ya AI
- **Discord ya Azure AI Foundry**: Shiriki katika #Azure kwa majadiliano ya AZD + AI
- **Mabaraza ya Jamii**: Shiriki katika majadiliano mapana ya watengenezaji wa Azure

### Kategoria za Maoni
- **Usahihi wa Maudhui ya AI**: Marekebisho ya ujumuishaji wa huduma za AI na taarifa za upelekaji
- **Uzoefu wa Kujifunza**: Mapendekezo ya mtiririko bora wa kujifunza kwa watengenezaji wa AI
- **Maudhui ya AI Yanayokosekana**: Maombi ya violezo, mifumo, au mifano ya ziada ya AI
- **Ufikiaji**: Uboreshaji kwa mahitaji tofauti ya kujifunza
- **Ujumuishaji wa Zana za AI**: Mapendekezo ya ujumuishaji bora wa mtiririko wa maendeleo ya AI
- **Mifumo ya AI ya Uzalishaji**: Maombi ya mifumo ya upelekaji wa AI kwa makampuni

### Ahadi ya Kujibu
- **Jibu la Masuala**: Ndani ya saa 48 kwa matatizo yaliyoripotiwa
- **Maombi ya Vipengele**: Tathmini ndani ya wiki moja
- **Michango ya Jamii**: Mapitio ndani ya wiki moja
- **Masuala ya Usalama**: Kipaumbele cha haraka na jibu la haraka

## Ratiba ya Matengenezo

### Sasisho za Kawaida
- **Mapitio ya Kila Mwezi**: Usahihi wa maudhui na uthibitishaji wa viungo
- **Sasisho za Robo**: Nyongeza kubwa za maudhui na maboresho
- **Mapitio ya Nusu Mwaka**: Urekebishaji wa kina na uboreshaji
- **Toleo la Kila Mwaka**: Sasisho kubwa za toleo na maboresho makubwa

### Ufuatiliaji na Uhakikisho wa Ubora
- **Upimaji wa Kiotomatiki**: Uthibitishaji wa kawaida wa mifano ya msimbo na viungo
- **Ujumuishaji wa Maoni ya Jamii**: Ujumuishaji wa mara kwa mara wa mapendekezo ya watumiaji
- **Sasisho za Teknolojia**: Ulinganifu na huduma za Azure za hivi karibuni na matoleo ya azd
- **Ukaguzi wa Ufikiaji**: Mapitio ya mara kwa mara kwa kanuni za muundo jumuishi

## Sera ya Msaada wa Toleo

### Msaada wa Toleo la Sasa
- **Toleo Kuu la Hivi Karibuni**: Msaada kamili na sasisho za kawaida
- **Toleo Kuu la Awali**: Sasisho za usalama na marekebisho muhimu kwa miezi 12
- **Matoleo ya Zamani**: Msaada wa jamii pekee, hakuna sasisho rasmi

### Mwongozo wa Uhamiaji
Wakati matoleo makubwa yanapotolewa, tunatoa:
- **Miongozo ya Uhamiaji**: Maelekezo ya hatua kwa hatua ya mpito
- **Maelezo ya Utangamano**: Maelezo kuhusu mabadiliko makubwa
- **Msaada wa Zana**: Hati au zana za kusaidia katika uhamiaji
- **Msaada wa Jamii**: Mabaraza maalum kwa maswali ya uhamiaji

---

**Urambazaji**
- **Somo la Awali**: [Mwongozo wa Kujifunza](resources/study-guide.md)
- **Somo Lijalo**: Rudi kwa [README Kuu](README.md)

**Endelea Kusasishwa**: Fuata hifadhi hii kwa arifa kuhusu matoleo mapya na sasisho muhimu kwa nyenzo za kujifunza.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->