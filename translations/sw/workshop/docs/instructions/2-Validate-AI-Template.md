# 2. Thibitisha Templeti

> Imethibitishwa kwa `azd 1.25.6` Juni 2026.

!!! tip "MWISHONI MWA MODULI HII UTAWEZA"

    - [ ] Chambua Usanifu wa Suluhisho la AI
    - [ ] Elewa mtiririko wa kupeleka (deployment) kwa AZD
    - [ ] Tumia GitHub Copilot kupata msaada kwa matumizi ya AZD
    - [ ] **Maabara 2:** Weka na Thibitisha templeti ya Wakala wa AI

---


## 1. Utangulizi

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) au `azd` ni zana ya mstari wa amri ya chanzo wazi inayorahisisha mtiririko wa kazi wa msanidi programu wakati wa kujenga na kupeleka programu kwenye Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ni hifadhidata zilizowekwa pamoja (standardized repositories) zinazoonyesha msimbo wa programu wa mfano, mali za _infrastructure-as-code_, na faili za usanidi za `azd` kwa usanifu wa suluhisho uliozingatiwa. Kuweka miundombinu kunakuwa rahisi kama amri ya `azd provision` - wakati `azd up` inakuwezesha kuweka miundombinu **na** kupeleka programu yako kwa mara moja!

Kama matokeo, kuanza mchakato wako wa maendeleo ya programu kunaweza kuwa rahisi kama kupata _AZD Starter template_ inayofanana zaidi na mahitaji ya programu na miundombinu yako - kisha kubadilisha hifadhidata ya mradi ili iendane na mahitaji ya tukio lako.

Kabla ya kuanza, hebu tusaidie kuhakikisha umeweka Azure Developer CLI.

1. Fungua terminal ya VS Code na uandike amri hii:

      ```bash title="" linenums="0"
      azd version
      ```

1. Unapaswa kuona kitu kama hiki!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Sasa uko tayari kuchagua na kupeleka templeti kwa kutumia azd**

---

## 2. Uchaguzi wa Templeti

Jukwaa la Microsoft Foundry linakuja na [seti ya templeti za AZD zilizopendekezwa](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) zinazofunika matukio maarufu ya suluhisho kama _otomesheni ya mtiririko wa kazi wa mawakala wengi_ na _usindikaji wa yaliyomo kwa njia nyingi (multi-modal)_. Pia unaweza kugundua templeti hizi kwa kutembelea portal ya Microsoft Foundry.

1. Tembelea [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Ingia kwenye portal ya Microsoft Foundry utaombwa - utaona kitu kama hiki.

![Chagua](../../../../../translated_images/sw/01-pick-template.60d2d5fff5ebc374.webp)


Chaguzi za **Basic** ni templeti zako za kuanzia:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) ambayo inaweka programu ya mazungumzo ya msingi _ikiwa na data yako_ kwenye Azure Container Apps. Tumia hili kuchunguza senario ya chatbot ya AI ya msingi.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) ambayo pia inaweka Wakala wa AI wa kawaida (na Wakala wa Foundry). Tumia hili kujifunza suluhisho za agentic AI zinazoingiza zana na mifano.

Tembelea kiungo cha pili kwenye kichupo kipya cha kivinjari (au bonyeza `Open in GitHub` kwa kadi husika). Unapaswa kuona hifadhidata ya mradi wa AZD. Chukua dakika kuvinjari README. Usanifu wa programu unaonekana kama ifuatavyo:

![Usanifu](../../../../../translated_images/sw/architecture.8cec470ec15c65c7.webp)

---

## 3. Uanzishaji wa Templeti

Hebu tujaribu kupeleka templeti hii na kuhakikisha inathibitishwa. Tutafuata mwongozo katika sehemu ya [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Chagua mazingira ya kazi kwa hifadhidata ya templeti:

      - **GitHub Codespaces**: Bonyeza [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) na thibitisha `Create codespace`
      - **Kukopa kwa ndani au dev container**: Nakili `Azure-Samples/get-started-with-ai-agents` na uifungue kwenye VS Code

1. Subiri hadi terminal ya VS Code iwe tayari, kisha andika amri ifuatayo:

   ```bash title="" linenums="0"
   azd up
   ```

Maliza hatua za mtiririko ambazo hii itasababisha:

1. Utaombwa kuingia Azure - fuata maelekezo kuthibitisha
1. Weka jina la mazingira la kipekee kwako - kwa mfano, mimi nilitumia `nitya-mshack-azd`
1. Hii itaunda folda `.azure/` - utaona folda ndogo yenye jina la env
1. Utaombwa kuchagua jina la usajili (subscription) - chagua default
1. Utaombwa kuchagua eneo - tumia `East US 2`

Sasa, subiri mpaka upaaji wa rasilimali ukamilike. **Hii inachukua dakika 10-15**

1. Wakati imemalizika, consola yako itaonyesha ujumbe wa SUCCESS kama huu:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portal yako ya Azure sasa itakuwa na group ya rasilimali iliyowekwa na jina la env hilo:

      ![Miundombinu](../../../../../translated_images/sw/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sasa uko tayari kuthibitisha miundombinu na programu iliyowekwa**.

---

## 4. Uthibitisho wa Templeti

1. Tembelea ukurasa wa Azure Portal wa [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - ingia unapohitajika
1. Bonyeza RG ya jina la mazingira yako - utaona ukurasa uliotajwa hapo juu

      - bonyeza rasilimali ya Azure Container Apps
      - bonyeza Application Url katika sehemu ya _Essentials_ (juu kulia)

1. Unapaswa kuona UI ya mbele ya programu iliyohifadhiwa kama hii:

   ![Programu](../../../../../translated_images/sw/03-test-application.471910da12c3038e.webp)

1. Jaribu kuuliza maswali kadhaa ya [mfano](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Uliza: ```Je, mji mkuu wa Ufaransa ni upi?``` 
      1. Uliza: ```Ni hema gani bora chini ya $200 kwa watu wawili, na inajumuisha vipengele gani?```

1. Unapaswa kupata majibu yanayofanana na yale yanayoonyeshwa hapa chini. _Lakini hizi zinafanyaje kazi?_ 

      ![Programu](../../../../../translated_images/sw/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Uthibitisho wa Wakala

Azure Container App inaweka endpoint inayounganisha na Wakala wa AI uliowekwa katika mradi wa Microsoft Foundry kwa templeti hii. Hebu tuchunguze maana yake.

1. Rudi kwenye ukurasa wa Muhtasari (Overview) wa kikundi chako cha rasilimali kwenye Azure Portal

1. Bonyeza rasilimali ya `Microsoft Foundry` katika orodha hiyo

1. Unapaswa kuona hii. Bonyeza kitufe cha `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/sw/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Unapaswa kuona ukurasa wa Mradi wa Foundry kwa programu yako ya AI
   ![Mradi](../../../../../translated_images/sw/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Bonyeza `Agents` - utaona Wakala chaguo-msingi aliyewekwa kwenye mradi wako
   ![Wakala](../../../../../translated_images/sw/06-visit-agents.bccb263f77b00a09.webp)

1. Chagua - na utaona taarifa za Wakala. Angalia yafuatayo:

      - Wakala hutumia File Search kwa chaguo-msingi (daima)
      - `Knowledge` ya wakala inaonyesha kuwa kuna faili 32 zilizo upload-ikiwa (kwa File Search)
      ![Wakala](../../../../../translated_images/sw/07-view-agent-details.0e049f37f61eae62.webp)

1. Tafuta chaguo la `Data+indexes` kwenye menyu ya kushoto na bonyeza kwa maelezo. 

      - Unapaswa kuona faili 32 za data zilizopakuliwa kwa maarifa.
      - Hizi zitakuwa zinahusiana na faili 12 za wateja na faili 20 za bidhaa chini ya `src/files`
      ![Data](../../../../../translated_images/sw/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Umehakiki uendeshaji wa Wakala!**

1. Majibu ya wakala yanatokana na maarifa yaliyomo katika faili hizo. 
1. Sasa unaweza kuuliza maswali yanayohusiana na data hiyo, na kupata majibu yaliyo na msingi.
1. Mfano: `customer_info_10.json` inaelezea ununuzi 3 uliofanywa na "Amanda Perez"

Rudia kichupo cha kivinjari chenye endpoint ya Container App na uulize: `What products does Amanda Perez own?`. Unapaswa kuona kitu kama hiki:

![Data](../../../../../translated_images/sw/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Uwanja wa Majaribio wa Wakala (Agent Playground)

Hebu tujenge hisia zaidi za uwezo wa Microsoft Foundry, kwa kumfunza Wakala kidogo katika Agents Playground. 

1. Rudi kwenye ukurasa wa `Agents` katika Microsoft Foundry - chagua wakala chaguo-msingi
1. Bonyeza chaguo la `Try in Playground` - utapata UI ya Playground kama hii
1. Uliza swali lile lile: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/sw/09-ask-in-playground.a1b93794f78fa676.webp)

Unapata jibu lile lile (au linalofanana) - lakini pia unapata taarifa za ziada zinazoweza kukusaidia kuelewa ubora, gharama, na utendakazi wa programu yako ya agentic. Kwa mfano:

1. Angalia kwamba jibu linataja faili za data zilizotumika kukiimarisha jibu
1. Elekeza kipanya juu ya lebo yoyote ya faili hizi - je, data inafanana na swali yako na jibu lililoonyeshwa?

Unaona pia safu ya _stats_ chini ya jibu. 

1. Elekeza kipanya juu ya kipimo chochote - kwa mfano, Safety. Unaona kitu kama hiki
1. Je, tathmini iliyokadiriwa inalingana na hisia zako za usalama wa jibu?

      ![Data](../../../../../translated_images/sw/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Ustadi wa Kuangalia (Built-in Observability)

Observability inahusu kuwekewa zana programu yako ili kuzalisha data inayoweza kutumika kuelewa, kutatua matatizo, na kuboresha uendeshaji wake. Ili kupata hisia ya hili:

1. Bonyeza kitufe cha `View Run Info` - utauona mtazamo huu. Huu ni mfano wa [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) ukiwa kazini. _Unaweza pia kupata mtazamo huu kwa kubonyeza Thread Logs katika menyu ya ngazi ya juu_.

   - Pata hisia ya hatua za utekelezaji na zana zilizotumika na wakala
   - Elewa hesabu jumla ya Token (ikilinganishwa na matumizi ya token za pato) kwa jibu
   - Elewa ucheleweshaji na wapi muda unatumika katika utekelezaji

      ![Wakala](../../../../../translated_images/sw/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Bonyeza kichupo cha `Metadata` kuona sifa za ziada za utekelezaji, ambazo zinaweza kutoa muktadha muhimu kwa kutatua matatizo baadaye.   

      ![Wakala](../../../../../translated_images/sw/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Bonyeza kichupo cha `Evaluations` kuona tathmini za kiotomatiki zilizofanywa kwenye jibu la wakala. Hizi zinajumuisha tathmini za usalama (kwa mfano, Kujiharibu) na tathmini maalum za wakala (kwa mfano, Ufafanuzi wa nia, Ufuatiliaji wa kazi).

      ![Wakala](../../../../../translated_images/sw/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Mwisho lakini sio mdogo, bonyeza kichupo cha `Monitoring` kwenye menyu ya pembetatu.

      - Chagua kichupo cha `Resource usage` kwenye ukurasa unaoonyeshwa - na angalia vipimo.
      - Fuata matumizi ya programu kwa upande wa gharama (tokens) na mzigo (maombi).
      - Fuata ucheleweshaji wa programu hadi byte ya kwanza (uchakataji wa pembejeo) na byte ya mwisho (toleo la pato).

      ![Wakala](../../../../../translated_images/sw/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Vigezo vya Mazingira (Environment Variables)

Hadi sasa, tume kupitia uanzishaji kwenye kivinjari - na kuthibitisha kuwa miundombinu yetu imewekwa na programu inafanya kazi. Lakini ili kufanya kazi na msimbo wa programu _kwa njia ya code-first_, tunahitaji kusanidi mazingira yetu ya maendeleo ya ndani na vigezo vinavyohitajika kuwasiliana na rasilimali hizi. Kutumia `azd` kunafanya iwe rahisi.

1. Azure Developer CLI [inatumia vigezo vya mazingira](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) kuhifadhi na kusimamia mipangilio ya usanidi kwa upeleaji wa programu.

1. Vigezo vya mazingira vinahifadhiwa katika `.azure/<env-name>/.env` - hii inavitenganisha kwa mazingira ya `env-name` yaliotumika wakati wa upeleaji na kukusaidia kutenganisha mazingira kati ya malengo tofauti ya upeleaji ndani ya hifadhidata moja.

1. Vigezo vya mazingira vinapakiwa moja kwa moja na amri ya `azd` kila inapofanya amri maalum (kwa mfano, `azd up`). Kumbuka kwamba `azd` haisomi moja kwa moja vigezo vya mazingira vya ngazi ya OS (kwa mfano, vilivyowekwa kwenye shell) - badala yake tumia `azd set env` na `azd get env` kuhamisha habari ndani ya skripti.


Hebu tujaribu amri chache:

1. Pata vigezo vyote vya mazingira vilivyowekwa kwa `azd` katika mazingira haya:

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

1. Pata thamani maalum - kwa mfano, nataka kujua ikiwa tumeweka thamani ya `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Unaona kitu kama hiki - haikuwekwa kwa default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Weka kigezo kipya cha mazingira kwa `azd`. Hapa, tunasasisha jina la mfano wa wakala. _Kumbuka: mabadiliko yoyote yataonyeshwa mara moja katika faili `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sasa, tunapaswa kupata kuwa thamani imewekwa:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Kumbuka kuwa baadhi ya rasilimali ni za kudumu (kwa mfano, upeleaji wa mifano) na zitahitaji zaidi ya `azd up` ili kulazimisha upeleaji upya. Hebu ujaribu kufuta upeleaji wa awali kisha kupeleka tena ukiwa umesasisha vigezo vya env.

1. **Refresh** Ikiwa ulikuwa umeweka miundombinu hapo awali kwa kutumia templeti ya azd - unaweza _kufanya refresh_ ya hali ya vigezo vya mazingira vya ndani kulingana na hali ya sasa ya upeleaji wako wa Azure kwa kutumia amri hii:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Hii ni njia yenye nguvu ya _kulandanisha_ vigezo vya mazingira kati ya mazingira ya maendeleo ya kienyeji mawili au zaidi (kwa mfano, timu yenye waendelezaji wengi) - kuruhusu miundombinu iliyotumishwa kutumika kama ukweli wa msingi kuhusu hali ya vigezo vya mazingira. Wanachama wa timu wanaweza tu _kusasisha_ vigezo ili kurudi kulandanishwa.

---

## 9. Hongera 🏆

Umekamilisha tu mtiririko wa kazi kutoka mwanzo hadi mwisho ambapo ulifanya:

- [X] Ulichagua AZD Template unayotaka kutumia
- [X] Umefungua kiolezo ndani ya mazingira ya maendeleo yanayoungwa mkono
- [X] Umepeleka kiolezo na kuthibitisha kuwa kinafanya kazi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->