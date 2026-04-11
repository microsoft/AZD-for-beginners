# 2. Thibitisha Kiolezo

> Imethibitishwa dhidi ya `azd 1.23.12` mnamo Machi 2026.

!!! tip "MWISHONI WA MODULI HII UTAWEZA"

    - [ ] Changanua Usanifu wa Suluhisho la AI
    - [ ] Elewa Mtiririko wa Utumaji wa AZD
    - [ ] Tumia GitHub Copilot kupata msaada juu ya matumizi ya AZD
    - [ ] **Maabara 2:** Weka & Thibitisha kiolezo cha Maajenti wa AI

---


## 1. Utangulizi

The [CLI ya Azure Developer](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` ni zana ya mstari wa amri ya chanzo huria inayorahisisha mtiririko wa kazi wa watengenezaji wakati wa kujenga na kutuma programu kwenye Azure. 

[Violezo vya AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ni hazina zilizopangwa kwa viwango vinavyojumuisha msimbo wa programu wa mfano, _miundombinu-kama-msimbo_ mali, na faili za usanidi za `azd` kwa usanifu thabiti wa suluhisho. Kuweka miundombinu kunakuwa rahisi kama kuendesha amri ya `azd provision` - wakati kutumia `azd up` kunakuwezesha kuweka miundombinu **na** kutuma programu yako kwa mara moja!

Kwa hiyo, kuanzisha mchakato wa maendeleo ya programu yako inaweza kuwa rahisi kama kupata _AZD Starter template_ inayokaribia zaidi mahitaji yako ya programu na miundombinu - kisha kubadilisha hazina ili kuendana na mahitaji ya senario yako.

Kabla hatujaanza, hebu tusimamie kuwa umeweka CLI ya Azure Developer.

1. Fungua terminal ya VS Code na andika amri hii:

      ```bash title="" linenums="0"
      azd version
      ```

1. Unapaswa kuona kitu kama hiki!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Sasa uko tayari kuchagua na kupeleka kiolezo na `azd`**

---

## 2. Uteuzi wa Kiolezo

Jukwaa la Microsoft Foundry linakuja na [seti ya violezo vya AZD vinavyopendekezwa](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) vinavyofunika senario maarufu za suluhisho kama _uendeshaji wa kazi wa maajenti wengi_ na _usindikaji wa maudhui wa modal nyingi_. Unaweza pia kugundua violezo hivi kwa kutembelea portal ya Microsoft Foundry.

1. Tembelea [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Ingia kwenye portal ya Microsoft Foundry wakati utaombwa - utaona kitu kama hiki.

![Chagua](../../../../../translated_images/sw/01-pick-template.60d2d5fff5ebc374.webp)


Chaguzi za **Msingi** ni violezo zako za kuanzia:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) ambayo inaweka programu ya mazungumzo ya msingi _na data yako_ kwenye Azure Container Apps. Tumia hii kuchunguza senario ya chatbot ya AI ya msingi.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) ambayo pia inaweka Ajenti wa AI wa kawaida (na Maajenti ya Foundry). Tumia hii kujizoea suluhisho za AI za maajenti zinazohusisha zana na mifano.

Tembelea kiungo cha pili katika kichupo kipya cha kivinjari (au bonyeza `Open in GitHub` kwa kadi husika). Unapaswa kuona hazina ya kiolezo hiki cha AZD. Chukua dakika moja kuchunguza README. Usanifu wa programu unaonekana kama hili:

![Usanifu](../../../../../translated_images/sw/architecture.8cec470ec15c65c7.webp)

---

## 3. Uanzishaji wa Kiolezo

Hebu tujaribu kupeleka kiolezo hiki na kuhakikisha kinathibitishwa. Tutafuata miongozo katika sehemu ya [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Chagua mazingira ya kazi kwa hazina ya kiolezo:

      - **GitHub Codespaces**: Bonyeza [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) na thibitisha `Create codespace`
      - **Kukopa kwa lokal au dev container**: Kopa `Azure-Samples/get-started-with-ai-agents` na uifungue katika VS Code

1. Subiri hadi terminal ya VS Code iwe tayari, kisha andika amri ifuatayo:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. Utaombwa kuingia kwenye Azure - fuata maelekezo kuthibitisha
1. Weka jina la mazingira la kipekee kwako - kwa mfano, nilitumia `nitya-mshack-azd`
1. Hii itaunda folda `.azure/` - utaona folda ndogo yenye jina la mazingira
1. Utaombwa kuchagua jina la usajili (subscription) - chagua chaguo-msingi
1. Utaombwa kuchagua eneo - tumia `East US 2`

Sasa, subiri hadi uundaji wa miundombinu ukamilike. **Hii inachukua dakika 10-15**

1. Wakati imemaliza, console yako itaonyesha ujumbe wa MAFANIKIO kama huu:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portal yako ya Azure sasa itakuwa na kikundi cha rasilimali kilichopangwa kwa jina hilo la mazingira:

      ![Miundombinu](../../../../../translated_images/sw/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sasa uko tayari kuthibitisha miundombinu iliyowekwa na programu**.

---

## 4. Uthibitisho wa Kiolezo

1. Tembelea ukurasa wa Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - ingia unapoulizwa
1. Bonyeza RG kwa jina la mazingira yako - utaona ukurasa hapo juu

      - bonyeza rasilimali ya Azure Container Apps
      - bonyeza Application Url katika sehemu ya _Essentials_ (juu kulia)

1. Unapaswa kuona UI ya mbele ya programu iliyohifadhiwa kama hii:

   ![Programu](../../../../../translated_images/sw/03-test-application.471910da12c3038e.webp)

1. Jaribu kuuliza maswali machache ya [mfano](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Uliza: ```What is the capital of France?``` 
      1. Uliza: ```What's the best tent under $200 for two people, and what features does it include?```

1. Unapaswa kupata majibu yanayofanana na yale yanayoonyeshwa hapa chini. _Lakini hii inafanya kazi vipi?_ 

      ![Programu](../../../../../translated_images/sw/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Uthibitisho wa Ajenti

Azure Container App inaweka endpoint inayounganisha na Ajenti wa AI uliowasilishwa katika mradi wa Microsoft Foundry kwa kiolezo hiki. Hebu tuangalie maana ya hilo.

1. Rudi kwenye ukurasa wa Azure Portal _Overview_ kwa kikundi chako cha rasilimali

1. Bonyeza rasilimali ya `Microsoft Foundry` katika orodha hiyo

1. Unapaswa kuona hii. Bonyeza kitufe cha `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/sw/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Unapaswa kuona ukurasa wa Mradi wa Foundry kwa programu yako ya AI
   ![Mradi](../../../../../translated_images/sw/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Bonyeza `Agents` - utaona Ajenti chaguo-msingi uliowasilishwa katika mradi wako
   ![Maajenti](../../../../../translated_images/sw/06-visit-agents.bccb263f77b00a09.webp)

1. Ichague - na utaona maelezo ya Ajenti. Kumbuka yafuatayo:

      - Ajenti hutumia File Search kwa chaguo-msingi (daima)
      - Ajenti `Knowledge` inaonyesha kuwa ina faili 32 zilizopakiwa (kwa utafutaji wa faili)
      ![Maajenti](../../../../../translated_images/sw/07-view-agent-details.0e049f37f61eae62.webp)

1. Tafuta chaguo la `Data+indexes` katika menyu ya kushoto na bonyeza kuona maelezo. 

      - Unapaswa kuona faili 32 za data zilizopakiwa kwa ajili ya knowledge.
      - Hizi zitatokana na faili 12 za wateja na faili 20 za bidhaa chini ya `src/files` 
      ![Data](../../../../../translated_images/sw/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Umetathmini uendeshaji wa Ajenti!** 

1. Majibu ya ajenti yanaungwa kwenye maarifa yaliyomo katika faili hizo. 
1. Sasa unaweza kuuliza maswali yanayohusiana na data hiyo, na kupata majibu yaliyounganishwa na vyanzo.
1. Mfano: `customer_info_10.json` inaeleza manunuzi 3 yaliyofanywa na "Amanda Perez"

Rudi kwenye kichupo cha kivinjari kilicho na endpoint ya Container App na uliza: `What products does Amanda Perez own?`. Unapaswa kuona kitu kama hiki:

![Data](../../../../../translated_images/sw/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Hebu tupandishe ufahamu kidogo juu ya uwezo wa Microsoft Foundry, kwa kujaribu Ajenti katika Uwanja wa Majaribio ya Ajenti. 

1. Rudi kwenye ukurasa wa `Agents` katika Microsoft Foundry - chagua ajenti chaguo-msingi
1. Bonyeza chaguo la `Try in Playground` - utapata UI ya Playground kama hii
1. Uliza swali lile lile: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/sw/09-ask-in-playground.a1b93794f78fa676.webp)

Unapata jibu sawa (au linalofanana) - lakini pia unapata taarifa za ziada unazoweza kutumia kuelewa ubora, gharama, na utendaji wa programu yako ya ajenti. Kwa mfano:

1. Kumbuka kuwa jibu linataja faili za data zilizotumika ku "kuimarisha" jibu
1. Pitia juu ya lebo yoyote ya faili hizi - je, data inalingana na swali lako na jibu lililoonyeshwa?

Unaona pia safu ya _stats_ chini ya jibu. 

1. Pitia juu ya kipimo chochote - mfano, Safety. Utaona kitu kama hiki
1. Je, ukadiriaji wa tathmini unalingana na hisia zako kuhusu kiwango cha usalama cha jibu?

      ![Data](../../../../../translated_images/sw/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Ufuatiliaji uliojengwa

Ufuatiliaji ni kuhusu kuingiza vifaa kwenye programu yako ili kuzalisha data inayoweza kutumiwa kuelewa, kufuata hitilafu, na kuboresha utendaji wake. Ili kupata mtazamo wa hili:

1. Bonyeza kitufe cha `View Run Info` - unapaswa kuona mtazamo huu. Hii ni mfano wa [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) ukienda. _Unaweza pia kupata mtazamo huu kwa kubonyeza Thread Logs katika menyu ya ngazi ya juu_.

   - Pata hisia ya hatua za utekelezaji na zana zilizotumika na ajenti
   - Elewa jumla ya idadi ya Tokeni (dhidi ya matumizi ya tokeni za pato) kwa jibu
   - Elewa ucheleweshaji na ni wapi muda unatumika katika utekelezaji

      ![Ajenti](../../../../../translated_images/sw/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Bonyeza kichupo cha `Metadata` kuona sifa za ziada za utekelezaji, ambazo zinaweza kutoa muktadha muhimu wa kufuatilia matatizo baadaye.   

      ![Ajenti](../../../../../translated_images/sw/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Bonyeza kichupo cha `Evaluations` kuona tathmini za moja kwa moja zilizofanywa kwenye jibu la ajenti. Hizi zinajumuisha tathmini za usalama (mfano, Kujihatarisha) na tathmini maalum za ajenti (mfano, Ufafanuzi wa Nia, Uzingatiaji wa Kazi).

      ![Ajenti](../../../../../translated_images/sw/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Mwisho lakini si mdogo, bonyeza kichupo cha `Monitoring` katika menyu ya pembeni.

      - Chagua kichupo cha `Resource usage` kwenye ukurasa unaoonyeshwa - na angalia vipimo.
      - Fuata matumizi ya programu kwa upande wa gharama (tokeni) na mzigo (maombi).
      - Fuata ucheleweshaji wa programu hadi byte ya kwanza (uchakataji wa pembezo) na byte ya mwisho (pato).

      ![Ajenti](../../../../../translated_images/sw/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Vigezo vya Mazingira

Hadi sasa, tumepitia uenezaji kupitia kivinjari - na kuthibitisha kuwa miundombinu yetu imewekwa na programu inaendesha. Lakini kufanya kazi na msimbo wa programu kwa njia ya kwanza (code-first), tunahitaji kusanidi mazingira yetu ya maendeleo ya ndani na vigezo vinavyohitajika kufanya kazi na rasilimali hizi. Kutumia `azd` kunafanya iwe rahisi.

1. The Azure Developer CLI [inatumia vigezo vya mazingira](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) kuhifadhi na kusimamia mipangilio ya usanidi kwa ajili ya uenezaji wa programu.

1. Vigezo vya mazingira vinahifadhiwa katika `.azure/<env-name>/.env` - hii inavipa mipaka kwa mazingira yaliyotumika wakati wa uenezaji na inakusaidia kutenganisha mazingira kati ya malengo tofauti ya uenezaji katika hazina hiyo hiyo.

1. Vigezo vya mazingira vinapakuliwa moja kwa moja na amri ya `azd` kila wakati inapoendesha amri maalum (mfano, `azd up`). Kumbuka kuwa `azd` haitasoma moja kwa moja vigezo vya mazingira vya ngazi ya OS (yaani, zilizowekwa kwenye shell) - badala yake tumia `azd set env` na `azd get env` kusafirisha taarifa ndani ya skripti.


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

1. Pata thamani maalum - mfano, nataka kujua kama tuliweka thamani ya `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Unaona kitu kama hiki - haikuwekwa kwa chaguo-msingi!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Weka kigezo kipya cha mazingira kwa `azd`. Hapa, tunasasisha jina la mfano wa ajenti. _Kumbuka: mabadiliko yoyote yaliyofanywa yataonyeshwa mara moja katika faili `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sasa, tunapaswa kupata thamani imewekwa:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Kumbuka kuwa baadhi ya rasilimali ni za kudumu (mfano, uenezaji wa mifano) na zitatakasa zaidi ya `azd up` tu ili kulazimisha uwekezaji upya. Hebu tujaribu kuvunja uenezaji wa awali na kuuenza upya na vigezo vya mazingira vilivyobadilishwa.

1. **Refresh** Ikiwa umewahi kuweka miundombinu kwa kutumia kiolezo cha azd - unaweza _refresh_ hali ya vigezo vya mazingira vya ndani zako kulingana na hali ya sasa ya uenezaji wako wa Azure kwa kutumia amri hii:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Huu ni njia yenye nguvu ya _kusawazisha_ vigezo vya mazingira kati ya mazingira mawili au zaidi ya maendeleo ya ndani (kwa mfano, timu yenye waendelezaji wengi) - ikiruhusu miundombinu iliyotekelezwa kuwa chanzo cha ukweli kuhusu hali ya vigezo vya mazingira. Wanachama wa timu wanaweza tu _sasaisha_ vigezo ili kurudi kusawazishwa.

---

## 9. Hongera 🏆

Umekamilisha tu mtiririko wa kazi kutoka mwanzo hadi mwisho ambapo ulifanya:

- [X] Umechagua AZD Template unayotaka kutumia
- [X] Umefungua template katika mazingira ya maendeleo yanayounga mkono
- [X] Umetekeleza Template na kuthibitisha inafanya kazi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kukata dhamana**:
Waraka huu umetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kwamba tafsiri za otomatiki zinaweza kuwa na makosa au kasoro. Waraka asili katika lugha yake ya asili unapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatuwajibiki kwa uelewa mbaya au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->