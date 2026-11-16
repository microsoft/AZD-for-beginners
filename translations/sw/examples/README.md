# Mifano — Chanzo la Kiingereza na Sampuli za Azure

Hizi ni sampuli za kujifunza, sio programu zilizoidhinishwa kwa uzalishaji. Soma kila
masharti ya mfano, vizingiti, gharama, na maelekezo ya usafi kabla
ya kuendesha amri. Upatikanaji wa Azure na viwango lazima vihakikiwe kwenye usajili wako.

- [Nyumbani kwa kozi](../README.md)
- [Ufungaji](../docs/chapter-01-foundation/installation.md)
- [Kutatua matatizo](../docs/chapter-07-troubleshooting/common-issues.md)

## Kinachopatikana kweli hapa kwa ndani

Kuna **sampuli nne za programu** na **mfiti mmoja wa miundombinu**:

| Mfano | Utekelezaji wa ndani | Lengo la kujifunza | Kiwango |
|---|---|---|---|
| [API Rahisi ya Flask](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Uwekaji wa kontena, vipimo, rekodi | Mwanzo |
| [Huduma mbili za microservices](../../../examples/container-app/microservices) | Kiwango cha Node.js na huduma ya bidhaa ya Python ya kusoma tu, Dockerfiles, Bicep, `azure.yaml` | Mawasiliano ya ndani ya HTTPS, upanuzi huru | Kati |
| [Programu ya hifadhidata](../../../examples/database-app) | API ya kufungua ya Flask, Azure SQL, Huduma ya Programu, Bicep, `azure.yaml` | Muunganisho wa SQL, uanzishaji, rekodi | Kati |
| [Mazungumzo ya Azure OpenAI](../../../examples/azure-openai-chat) | CLI ya Python ya sehemu, Azure OpenAI na Key Vault Bicep, miundombinu tu `azure.yaml` | Utayarishaji wa modeli, historia za mazungumzo, makadirio ya tokeni | Kati |
| [Miundombinu ya rejareja](../../../examples/retail-multiagent-arm-template) | Kiolezo cha ARM, vigezo, skiripti ya usambazaji ya Bash; **kontena za hello-world tu** | Miundombinu kwa programu yajayo yenye waagizaji wengi | Juu |

Hali ya [rejareja](retail-scenario.md) ni **mfano wa usanifu**, si
utekelezaji kamili wa wakala wengi. Hakuna msimbo wa wakala wa rejareja, mbele ya mazungumzo, kipokeaji
API, bomba la data za utafutaji, CLI ya tathmini, kukimbia kwa kiotomatiki kwa kasoro, au ugumu wa uzalishaji unajumuishwa. 
Hizi lazima ziundwe, zijengwe, na zijaribiwe kivyake.

Muhtasari wa [microservices](microservices/README.md) unaelekeza kwenye inayoweza kuendeshwa
sampuli ya huduma mbili; si saraka nyingine ya uenezi.

## Njia iliyopendekezwa ya kujifunza

1. Sambaza API ya Flask na uthibitishe `/health` na operesheni za CRUD.
2. Sambaza programu ya hifadhidata na uthibitishe bidhaa zake tano zilizopandwa.
3. Sambaza mfano wa huduma mbili na uthibitishe maombi ya lango-kwa-bidhaa.
4. Andaa rasilimali za mazungumzo na endesha CLI ya mwingiliano **kwa karibu**.
5. Soma mchoro wa rejareja baada ya kukamilisha mifano inayofanya kazi.

Ruhusu takriban dakika 30–60 kwa sampuli ya maombi ikijumuisha mahitaji ya awali na
uthibitisho. Utekelezaji wa rejareja ni mradi tofauti wa maendeleo, si
warsha ya dakika 30. Kusoma usanifu wake kunachukua takriban saa 2–3; utekelezaji
na maandalizi kwa uzalishaji yanaweza kuchukua muda mrefu zaidi kuliko
saa 80–120 za maendeleo kama ilivyoelezwa katika mwongozo.

## Anza haraka

Kutoka kwenye mzizi wa hifadhidata, kwa sampuli ya kontena ya kwanza:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Kinachotarajiwa: HTTP 200 na JSON yenye `"status": "healthy"`.
Unahitaji Docker ikifanyakazi kwa ajili ya kujenga kontena la eneo hilo.

Kwa mazungumzo, fuata [chat README](azure-openai-chat/README.md): tumia
`azd provision`, pakua ufunguo wa API kutoka Key Vault kwenye shell ya sasa, sanidi
`src/requirements.txt`, na kuendesha `python src/chat.py`. Hakuna huduma ya mazungumzo inayohudumiwa.

Kwa rejareja, tumia [mwongozo wa ARM](retail-multiagent-arm-template/README.md).
Haijumuishi `azure.yaml` na **siyo** imewekwa au kuondolewa na `azd up`/`azd down`.

## Gharama na vikwazo

- Usambazaji wote unaunda rasilimali za Azure zinazolipishwa. Kupungua hadi sifuri kunahusu tu
  uhesabu wa programu; haiondoi gharama za rejista, hifadhidata, uhifadhi, utafutaji, au kumbukumbu.
- Bei halisi hutegemea eneo, sarafu, trafiki, modeli/SKU, na uhifadhi.
  Tumia [kalkuleta ya bei ya Azure](https://azure.microsoft.com/pricing/calculator/)
  kabla ya usambazaji na weka bajeti katika Azure Cost Management.
- Data ya Flask CRUD iko katika kumbukumbu ya muda, inamraba kazi mmoja na mfano mmoja kwa
  chaguo-msingi. Huo hupotea wakati wa kuanzisha upya au kupungua hadi sifuri. Hii si uhifadhi wa kudumu.
- Microservice ya bidhaa inaeleza tu pointi za GET. Hakuna huduma ya agizo, huduma ya mtumiaji,
  hifadhidata, Service Bus, utekelezaji wa C#, au Go umejumuishwa.
- Rasilimali za Application Insights hazichukuzi moja kwa moja programu zote.
  Angalia kila mfano kwa telemetry inayotolewa.
- Sampuli hazitekelezi uthibitishaji wa programu. Ongeza utambulisho, idhini,
  uhifadhi wa kudumu, udhibiti wa mtandao, majaribio, na taratibu za uendeshaji kabla ya kuzalisha.

## Sampuli Za Nje za Azure — zirekebishwe kwa pekee

Viungo hivi ni marejeleo kwa hifadhidata tofauti, **si mifano ya ndani**.
Wamiliki wake wana mikondo ya maelekezo, utekelezaji, utegemezi, na gharama.

| Sampuli | Lengo |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Programu ya Node.js yenye hifadhidata |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# na Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Mbele ya wavuti wa statiki na C# Functions na SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Programu isiyo na seva ya Python |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Backend ya duka iliyo ndani ya kontena |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | Programu ya mazungumzo ya AI |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Programu ya mawakala |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG na utafutaji na marejeleo |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Mfano wa mazungumzo ya AI |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Microservices za Java |

Gundua miradi zaidi katika [gallerii ya templeti ya AZD](https://azure.github.io/awesome-azd/).
Usidhani mradi wa nje unaunga mkono `azd` bila kukagua README yake ya sasa.

## Muundo wa hifadhidata

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

Hakuna `configurations/`, `scripts/`, au saraka ya mtihani inayosharediwa inayohakikisha na
faharasa hii. Faili halisi na mawazo ya nyongeza ya hiari yamebainishwa katika kila mwongozo.

## Usafishaji

Kwa sampuli nne za AZD, endesha hii **kutoka kwenye saraka ya sampuli iliyochaguliwa**:

```bash
azd down
```

Kagua agizo la kufuta. Kwa rejareja, futa kikundi cha rasilimali ulichounda tu,
ukitumia maelekezo katika mwongozo wa ARM. Angalia Azure Cost Management
baada ya usafishaji; data za bili zinweza kuja baadaye.

## Kuchangia

Jumuisha chanzo, miundombinu, usanidi wa utoaji, hatua za usanidi na uthibitishaji unaotekelezeka,
vikwazo, na maelekezo ya usafishaji pamoja na kila sampuli ya programu. Tambulisha vifaa vya usanifu tu na
vipande visivyokamilika waziwazi.
Usidai usahihi wa uzalishaji bila majaribio ya utoaji, kazi, na uendeshaji.

[Maswali Yanayoulizwa Mara kwa Mara](../resources/faq.md) · [Mwongozo wa kusoma](../resources/study-guide.md) ·
[Ripoti tatizo](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->