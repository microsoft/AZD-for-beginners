# 2. Thibitisha Kiolezo

> Imethibitishwa dhidi ya `azd 1.27.1` Julai 2026.

!!! tip "MWISHONI MWA MODULI HII UTAPATA KUNAWEZA KUFANYA"

    - [ ] Kuchambua Usanifu wa Suluhisho la AI
    - [ ] Kuelewa Mchakato wa Utekelezaji wa AZD
    - [ ] Kutumia GitHub Copilot kupata msaada juu ya matumizi ya AZD
    - [ ] **Zo8602.:** Tengeneza na Thibitisha kiolezo cha Mawakala wa AI

---


## 1. Utangulizi

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) au `azd` ni zana ya msimbo wa amri wazi inayorahisisha mchakato wa mtengenezaji wakati wa kujenga na kusambaza programu kwa Azure.

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ni hifadhidata zilizopangwa ambazo zinajumuisha msimbo wa programu mfano, mali za _miundombinu-kama-msimbo_, na faili za usanidi za `azd` kwa usanifu mzuri wa suluhisho. Utoaji wa miundombinu unakuwa rahisi kama amri ya `azd provision` - wakati kutumia `azd up` hukuruhusu kutoa miundombinu **na** kusambaza programu yako mara moja!

Kwa hiyo, kuanza mchakato wa maendeleo ya programu yako inaweza kuwa rahisi kama kupata kiolezo sahihi cha _AZD Starter_ kinachokaribia mahitaji yako ya programu na miundombinu - kisha kubinafsisha hifadhidata ili kufaa mahitaji ya hali yako.

Kabla ya kuanza, hebu tuhakikishe una Azure Developer CLI imewekwa.

1. Fungua terminal ya VS Code na andika amri hii:

      ```bash title="" linenums="0"
      azd version
      ```

1. Unapaswa kuona kitu kama hiki!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Sasa uko tayari kuchagua na kusambaza kiolezo kwa kutumia azd**

---

## 2. Uchaguzi wa Kiolezo

Jukwaa la Microsoft Foundry linakuja na [seti ya violezo vya AZD vinavyopendekezwa](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) vinavyojumuisha hali maarufu za suluhisho kama _utendaji kazi wa mawakala wengi_ na _uchakataji wa maudhui wa modal nyingi_. Pia unaweza kugundua violezo hivi kwa kutembelea lango la Microsoft Foundry.

1. Tembelea [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Ingia kwenye lango la Microsoft Foundry unapoombwa - utaona kitu kama hiki.

![Pick](../../../../../translated_images/sw/01-pick-template.60d2d5fff5ebc374.webp)


Chaguo la **Msingi** ni violezo vyako vya kuanzia:

1. [ ] [Anza na AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) ambayo inasambaza programu ya mazungumzo ya msingi _na data yako_ kwa Azure Container Apps. Tumia hii kuchunguza hali rahisi ya AI chatbot.
1. [X] [Anza na Mawakala wa AI](https://github.com/Azure-Samples/get-started-with-ai-agents) ambayo pia inasambaza Wakala wa AI wa kawaida (na Mawakala wa Foundry). Tumia hii kujifunza suluhisho za AI zinazohusisha zana na mifano.

Tembelea kiungo cha pili katika kichupo kipya cha kivinjari (au bonyeza `Open in GitHub` kwa kadi inayohusiana). Unapaswa kuona hifadhidata ya Kiolezo cha AZD hiki. Chukua dakika kuchunguza README. Usanifu wa programu unaonekana kama huu:

![Arch](../../../../../translated_images/sw/architecture.8cec470ec15c65c7.webp)

---

## 3. Uanzishaji wa Kiolezo

Tujaribu kusambaza kiolezo hiki na kuhakikisha ni halali. Tutaifuata mwongozo wa sehemu ya [Kuanzia](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Chagua mazingira ya kazi kwa ajili ya hifadhidata ya kiolezo:

      - **GitHub Codespaces**: Bonyeza [kiungo hiki](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) na thibitisha `Create codespace`
      - **Kuchonga au kontena la maendeleo la mtaani**: Chonga `Azure-Samples/get-started-with-ai-agents` na uifungue katika VS Code

1. Subiri hadi terminal ya VS Code itakapo kuwa tayari, kisha andika amri ifuatayo:

   ```bash title="" linenums="0"
   azd up
   ```

Maliza hatua za mchakato ambazo hii itasababisha:

1. Utaombwa uingie kwenye Azure - fuata maelekezo kuthibitisha utambulisho
1. Weka jina la mazingira la kipekee kwa ajili yako - mfano, nilitumia `nitya-mshack-azd`
1. Hii itaunda folda la `.azure/` - utaona folda ndogo yenye jina la mazingira
1. Utaombwa kuchagua jina la usajili - chagua chaguo la kawaida
1. Utaombwa chaguzi ya eneo - tumia `East US 2`

Sasa, subiri hadi utoaji ukamilike. **Hii huchukua dakika 10-15**

1. Ukitimiza, konsoli yako itaonyesha ujumbe wa MAFANIKIO kama huu:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portal yako ya Azure sasa itakuwa na kundi la rasilimali lililotolewa na jina hilo la mazingira:

      ![Infra](../../../../../translated_images/sw/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sasa uko tayari kuthibitisha miundombinu iliyosambazwa na programu**.

---

## 4. Uthibitishaji wa Kiolezo

1. Tembelea ukurasa wa Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - ingia unapoombwa
1. Bonyeza kwenye RG la jina lako la mazingira - utaona ukurasa ulio hapo juu

      - bonyeza kwenye rasilimali ya Azure Container Apps
      - bonyeza kwenye Url ya Programu katika sehemu ya _Essentials_ (juu kulia)

1. Unapaswa kuona UI ya mbele ya programu iliyohifadhiwa kama hii:

   ![App](../../../../../translated_images/sw/03-test-application.471910da12c3038e.webp)

1. Jaribu kuuliza maswali machache ya [mfano](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Uliza: ```What is the capital of France?``` 
      1. Uliza: ```What's the best tent under $200 for two people, and what features does it include?```

1. Unapaswa kupata majibu yanayofanana na yaliyoonyeshwa hapa chini. _Lakini hii inafanya kazi vipi?_

      ![App](../../../../../translated_images/sw/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Uthibitishaji wa Wakala

Azure Container App husambaza mshale unaounganisha na Wakala wa AI aliyetolewa kwenye mradi wa Microsoft Foundry kwa kiolezo hiki. Hebu tuchunguze maana yake.

1. Rudi kwenye ukurasa wa Azure Portal _Muhtasari_ wa kundi lako la rasilimali

1. Bonyeza kwenye rasilimali ya `Microsoft Foundry` kwenye orodha hiyo

1. Unapaswa kuona hivi. Bonyeza kitufe cha `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/sw/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Unapaswa kuona ukurasa wa Mradi wa Foundry kwa ajili ya programu yako ya AI
   ![Project](../../../../../translated_images/sw/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Bonyeza `Agents` - utaona Wakala wa chaguo ulioletwa kwenye mradi wako
   ![Agents](../../../../../translated_images/sw/06-visit-agents.bccb263f77b00a09.webp)

1. Uchague - utaona maelezo ya Wakala. Angalia yafuatayo:

      - Wakala hutumia Utafutaji wa Faili kama chaguo la msingi (daima)
      - `Knowledge` ya wakala inaonyesha ina faili 32 zilizo upload (kwa utafutaji wa faili)
      ![Agents](../../../../../translated_images/sw/07-view-agent-details.0e049f37f61eae62.webp)

1. Tafuta chaguo la `Data+indexes` kwenye menyu ya kushoto na bonyeza kwa maelezo.

      - Unapaswa kuona faili 32 za data zilizopakiwa kwa maarifa.
      - Hizi zitahusiana na faili 12 za wateja na faili 20 za bidhaa chini ya `src/files`
      ![Data](../../../../../translated_images/sw/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Umehakiki utendakazi wa Wakala!**

1. Majibu ya wakala yanatokana na maarifa yaliyomo kwenye faili hizo. 
1. Sasa unaweza kuuliza maswali yanayohusiana na data hiyo, na kupata majibu yaliyotangazwa.
1. Mfano: `customer_info_10.json` inaelezea ununuzi 3 uliofanywa na "Amanda Perez"

Rudi kwenye kichupo cha kivinjari chenye mshale wa Container App na uliza: `What products does Amanda Perez own?`. Unapaswa kuona kitu kama hiki:

![Data](../../../../../translated_images/sw/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Uwanja wa Mawakala

Hebu tujenge ufahamu zaidi juu ya uwezo wa Microsoft Foundry, kwa kujaribu Wakala kwenye Uwanja wa Mawakala.

1. Rudi kwenye ukurasa wa `Agents` katika Microsoft Foundry - chagua wakala wa chaguo
1. Bonyeza chaguo la `Try in Playground` - unapaswa kupata UI ya Uwanja kama huu
1. Uliza swali lile lile: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/sw/09-ask-in-playground.a1b93794f78fa676.webp)

Unapata jibu sawa (au karibu sawa) - lakini pia unapata taarifa zaidi unazoweza kutumia kuelewa ubora, gharama, na utendaji wa programu yako ya wakala. Kwa mfano:

1. Kumbuka kwamba jibu linataja faili za data zilizotumika "kutoa msingi" wa jibu
1. Panda panya juu ya lebo yoyote ya faili hizi - je data inalingana na swali lako na jibu lililoonyeshwa?

Pia unaona mstari wa _takwimu_ chini ya jibu.

1. Panda panya juu ya kipimo chochote - mfano, Usalama. Unaona kitu kama hiki
1. Je kiwango kilichopimwa kinaendana na hisia zako kuhusu kiwango cha usalama wa jibu?

      ![Data](../../../../../translated_images/sw/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Uwezaji wa Kuonekanwa Kikiwa Kimejengwa

Kuonekanwa ni kuhusu kuwekewa vifaa programu yako ili kutoa data inayoweza kutumika kuelewa, kubaini hitilafu, na kuboresha utendakazi wake. Ili kupata picha hii:

1. Bonyeza kitufe cha `View Run Info` - unapaswa kuona mtazamo huu. Huu ni mfano wa [Kufuata wakala](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) ukiwa hai. _Unaweza pia kupata mtazamo huu kwa kubonyeza Thread Logs kwenye menyu ya juu_.

   - Pata picha ya hatua za mchakato na zana zinazotumiwa na wakala
   - Elewa hesabu jumla ya Token (ikilinganishwa na matumizi ya token za toleo) kwa jibu
   - Elewa ucheleweshaji na wapi muda unatumika katika utekelezaji

      ![Agent](../../../../../translated_images/sw/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Bonyeza kichupo cha `Metadata` kuona sifa za ziada kwa mchakato, ambazo zinaweza kutoa muktadha muhimu kwa kubaini hitilafu baadaye.

      ![Agent](../../../../../translated_images/sw/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Bonyeza kichupo cha `Evaluations` kuona tathmini za moja kwa moja zilizofanywa juu ya majibu ya wakala. Hii ni pamoja na tathmini za usalama (mfano, Kujidhalilisha) na tathmini maalum za wakala (mfano, Utatuzi wa nia, Ufuataji wa kazi).

      ![Agent](../../../../../translated_images/sw/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Mwisho lakini si wa mwisho, bonyeza kichupo cha `Monitoring` kwenye menyu ya pembeni.

      - Chagua kichupo cha `Resource usage` kwenye ukurasa unaoonyeshwa - na tazama vipimo.
      - Fuatilia matumizi ya programu kwa kuzingatia gharama (tokeni) na mzigo (maombi).
      - Fuatilia ucheleweshaji wa programu hadi bayte ya kwanza (usindikaji wa ingizo) na bayte ya mwisho (matokeo).

      ![Agent](../../../../../translated_images/sw/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Mabadiliko ya Mazingira

Hadi sasa, tumepitia utoaji katika kivinjari - na kuthibitisha kuwa miundombinu yetu imetolewa na programu inafanya kazi. Lakini kufanya kazi na msimbo wa programu kwanza, tunahitaji kusanidi mazingira yetu ya maendeleo ya ndani na mabadiliko muhimu yanayohitajika kufanya kazi na rasilimali hizi. Kutumia `azd` kunarahisisha hili.

1. Azure Developer CLI [hutumia mabadiliko ya mazingira](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) kuhifadhi na kusimamia usanidi kwa ajili ya utoaji wa programu.

1. Mabadiliko ya mazingira huhifadhiwa katika `.azure/<env-name>/.env` - hii huwazuia kwa mazingira ya `env-name` yaliyotumika wakati wa utoaji na kusaidia kutenganisha mazingira kwa malengo tofauti ya utoaji ndani ya hifadhidata moja.

1. Mabadiliko ya mazingira huwa yanapakiwa moja kwa moja na amri ya `azd` kila wakati inapoendesha amri maalum (mfano, `azd up`). Kumbuka kwamba `azd` haisomei moja kwa moja mabadiliko ya mazingira ya _ngazi ya OS_ (mfano, yaliyo wekwa kwenye shell) - badala yake tumia `azd set env` na `azd get env` kuhamisha taarifa ndani ya scripts.


Hebu tujaribu amri chache:

1. Pata mabadiliko yote ya mazingira yaliyowekwa kwa `azd` katika mazingira haya:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Unaona kitu kama:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Pata thamani maalum - mfano, nataka kujua kama tumeweka thamani ya `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Unaona kitu kama hiki - hakuwekwa kwa chaguo la kawaida!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Weka mabadiliko mapya ya mazingira kwa `azd`. Hapa, tunasasisha jina la modeli ya wakala. _Kumbuka: mabadiliko yoyote yatakayo wekwa yataonyeshwa moja kwa moja katika faili `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sasa, tunapaswa kuona thamani imewekwa:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Kumbuka kuwa baadhi ya rasilimali ni endelevu (mfano, utoaji wa modeli) na zitahitaji zaidi ya `azd up` moja tu kufanikisha utoaji upya. Hebu tujaribu kuondoa utoaji wa awali na utoe upya na mabadiliko ya mabadiliko ya mazingira.

1. **Sasisha tena** Ikiwa tayari ulitoa miundombinu kwa kutumia kiolezo cha azd - unaweza _kusasisha_ hali ya mabadiliko ya mazingira ya ndani kulingana na hali halisi ya utoaji wako wa Azure kwa kutumia amri hii:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Huu ni njia yenye nguvu ya _sync_ mabadiliko ya mazingira katika mazingira mawili au zaidi ya maendeleo ya ndani (kwa mfano, timu yenye waendelezaji kadhaa) - kuruhusu miundombinu iliyowekwa kutumika kama ukweli wa msingi kwa hali ya mabadiliko ya mazingira. Wanachama wa timu wanahitaji tu _refresh_ mabadiliko kupata upatanisho tena.

---

## 9. Hongera 🏆

Umeumaliza mchakato wa kazi mzima ambapo:

- [X] Umechagua Kiolezo cha AZD Unachotaka Kutumia
- [X] Umefungua kiolezo katika mazingira yanayotegemewa ya maendeleo
- [X] Umetumia Kiolezo na kuthibitisha kinafanya kazi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->