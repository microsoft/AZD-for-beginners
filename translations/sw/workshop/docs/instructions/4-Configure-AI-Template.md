# 4. Sanidi Kiolezo

!!! tip "MWISHONI WA MODULI HII UTAWEZA"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Anza na kiolezo halisi

Fungua [`azure.yaml` katika Anza na Maajenti wa AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) katika hifadhi uliyoanzisha. Kiolezo cha juu kinaweza kubadilika kwa uhuru moja kwa moja na warsha hii. Sehemu ifuatayo ya **nakala** ilikaguliwa Novemba 4, 2026; si mbadala wa faili kamili:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` hutambua mradi wa AZD; `metadata.template` inarekodi toleo la kiolezo.
- `requiredVersions.azd` ni kiwango cha chini cha kiolezo, si ushauri wa kubaki kwenye CLI ya zamani. Tumia toleo la sasa linaloungwa mkono la AZD.
- `services` hufafanua malengo ya usambazaji wa programu. Kiolezo hiki hutusambaza API ya Python na mbele kama huduma moja ya Container Apps.
- `project` ni jumuishi kwa `azure.yaml`.
- `remoteBuild` huomba ujenzi wa kontena wa mbali. Utambulisho wako bado unahitaji ruhusa za Azure zinazohitajika.

Faili za Bicep za kiolezo chini ya `infra/`, si orodha ya `services` pekee, zinaeleza rasilimali kama Microsoft Foundry, usambazaji wa mifano, hifadhi, na AI Search hiari.

## 2. Elewa hooks za mzunguko wa maisha

Kagua sehemu ya `hooks` na hati zake zinazorejelewa kabla ya kuendesha kiolezo. Toleo lililokaguliwa lina:

| Hook | Kusudi | Tabia Muhimu |
|------|---------|--------------------|
| `preup` | Haki ingizo la mazingira ya kiolezo kabla ya mchakato wa `up` | Hati za shell maalum kwa jukwaa zinaweza kusitisha mchakato wakati wa kushindwa |
| `postdeploy` | Endesha usanidi wa kiolezo maalum baada ya usambazaji wa programu | Kagua `continueOnError` na matokeo ya hati; usambazaji uliofanikiwa hauoneshi kila kazi ya usanidi imefanikiwa |

Toleo hili halijumuishi **siyo** kizibo cha zamani cha `postprovision` / `write_env` kilichoonyeshwa katika nyenzo za warsha za awali. Usichukue marejeleo ya kizibo kwenda kwa skripti ambazo hazipo tena.

Funguo za kizibo huchagua matukio ya mzunguko wa maisha; `posix` na `windows` huchagua utekelezaji wa jukwaa. `shell`, `run`, `interactive`, na `continueOnError` hudhibiti utekelezaji. Hizi ni skripti zinazotekelezwa na ruhusa zako, kwa hivyo zipitie kama vile unavyofanya na msimbo wa programu.

Tazama [nyaraka za kizibo za AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) kwa mzunguko kamili wa maisha.

## 3. Fuata pembejeo za mazingira katika miundombinu

Endesha amri hizi kutoka kwenye hazina ya sampuli iliyowashwa:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Angalia `infra/main.parameters.json` kuona ni vigezo vya mazingira gani templeti inavyotumia kweli. Kuweka jina lolote kwa kutumia `azd env set` bado haibadilishi rasilimali yoyote ya Azure moja kwa moja.

Chaguo-msingi zilizopitiwa ni pamoja na:

| Ingizo | Chaguo-msingi / kusudi |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; vitengo vya ukubwa hutegemea mfano na aina ya usambazaji |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; acha kuwezesha isipokuwa ukaguzi wa usindikaji wa data umefanyika |

Hizi ni pembejeo maalum za sampuli, si mipangilio ya jumla ya AZD. Kagua [nyaraka za msaada wa mfano na eneo](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) na makubaliano ya usajili wako kabla ya kuchagua mfano, SKU, uwezo, au eneo. Usichukue kila kitengo cha uwezo kama tokeni 1,000 kwa dakika.

Kuchagua mfano wa mazungumzo tofauti, sasisha **jina, toleo, muundo, SKU, na uwezo kwa pamoja**, ukifuata [miongozo ya ubinafsishaji ya sampuli](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Kubadilisha jina tu kunaweza kusababisha toleo lisilotegemezana au aina ya usambazaji zisizolingana.

## 4. Maabara: wezesha utafutaji wa hiari na ufuatiliaji

!!! warning "Mipangilio hii inaweza kuongeza rasilimali zinazotozwa"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Mabadiliko ya miundombinu yanahitaji maandalizi; `azd deploy` peke yake husambaza tu huduma za programu. Kwa utafutaji wa alama na chaguzi za kuletwa zinazotegemewa, fuata [mwongozo wa AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Kwa ufuatiliaji, fuata [mwongozo wa uangalizi](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Usiwezeshe kunasa maudhui ya maombi/jawabu kwenye data halisi za wateja bila ridhaa inayotakiwa, udhibiti wa upatikanaji, sera ya uhifadhi, na utendakazi wa kufuta.

## 5. Rasilimali zilizopo na CI/CD

Ili kutumia tena mradi wa Foundry, fuata maagizo ya sampuli ya [rasilimali zilizopo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Kuweka `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` hubadilisha njia ya usambazaji; katika hali hiyo, templeti haitaunda Application Insights au AI Search kwa niaba yako. Thibitisha utegemezi, mgawanyo wa majukumu, na usambazaji wa mfano kwa uwazi.

Sehemu ya `pipeline.variables` hudhibiti maadili yanayotumwa katika bomba lililotengenezwa; si hazina ya siri na haitaunda rasilimali za Azure. Tumia utambulisho ulioendeshwa katika programu na OIDC kwa CI/CD. Faili za mazingira za AZD ni maandishi wazi na hazipaswi kuwekwa rasmi.

AZD inaunga mkono kuingiza faili ya dotenv iliyotayarishwa kwa kuaminika mahali hapa:

```bash
azd env set --file .env
```

Pitia faili hiyo kabla ya kuingiza, na usichapisha faili za mazingira zenye siri katika terminals za pamoja au kumbukumbu za CI.

## 6. Angalia uelewa wako

- Huduma gani ya `azure.yaml` husambaza programu?
- Parameta gani ya miundombinu hutumia kila thamani uliyobadilisha?
- Ni mabadiliko gani yanayohitaji maandalizi badala ya usambazaji tu?
- Je, eneo lililochaguliwa na usajili vilikuwezesha mfano na makubaliano?
- Je, viboreshaji vyote vya usanifu vilifanikiwa, na unaweza kuthibitisha mwenendo wa programu iliyo sambazwa?

Endelea kwa [Binafsisha Templeti](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->