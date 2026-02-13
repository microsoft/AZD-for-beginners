# 1. Chagua Kiolezo

!!! tip "MWISHO WA MODULI HII UTAWEZA"

    - [ ] Elezea kiolezo za AZD ni nini
    - [ ] Gundua na tumia kiolezo za AZD kwa AI
    - [ ] Anza na kiolezo la AI Agents
    - [ ] **Maabara 1:** AZD Mwanzo wa Haraka na GitHub Codespaces

---

## 1. Mfano wa Mjenzi

Kujenga programu ya kisasa ya AI inayostahimili kwa shirika _kuanzia mwanzo_ inaweza kuwa ya kutisha. Ni kama kujenga nyumba yako mpya mwenyewe, tofali kwa tofali. Ndiyo, inawezekana! Lakini si njia bora zaidi ya kupata matokeo unayotaka!

Badala yake, mara nyingi tunaanza na _ramani ya muundo_ iliyopo, na kufanya kazi na mbunifu wa miundo ili kuibadilisha kwa mahitaji yetu binafsi. Na hiyo ndiyo njia kamili ya kuchukua wakati wa kujenga programu za kibiashara. Kwanza, pata usanifu mzuri wa muundo unaofaa eneo la tatizo lako. Kisha fanya kazi na mbunifu wa suluhisho kubadilisha na kuendeleza suluhisho kwa senario yako maalum.

Lakini tunawezaje kupata ramani za muundo hizi? Na tunawezaje kupata mbunifu ambaye atakubali kutufundisha jinsi ya kubadilisha na kupeleka ramani hizi wenyewe? Katika warsha hii, tunajibu maswali hayo kwa kukutangazia teknolojia tatu:

1. [Azure Developer CLI](https://aka.ms/azd) - zana ya chanzo wazi inayoharakisha njia ya msanidi programu kutoka kwenye maendeleo ya ndani (kujenga) hadi uenezaji katika wingu (kuleta).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - hifadhidata za chanzo wazi za viwango vinavyojumuisha mfano wa msimbo, miundombinu na faili za usanidi kwa ajili ya kupeleka usanifu wa suluhisho la AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - wakala wa kuandika msimbo ambaye ana ujuzi wa Azure, na ambaye anaweza kutuongoza kwa kuvinjari msimbo na kufanya mabadiliko - kwa kutumia lugha ya asili.

Kwa zana hizi mkononi, sasa tunaweza _gundua_ kiolezo sahihi, _kupeleka_ ili kuthibitisha kinafanya kazi, na _kubadilisha_ ili kiendane na senario zetu maalum. Hebu tuchunguze na tujifunze jinsi zinavyofanya kazi.

---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) is an open-source commandline tool that can speed up your code-to-cloud journey with a set of developer-friendly commands that work consistently across your IDE (development) and CI/CD (devops) environments.

With `azd`, your deployment journey can be as simple as:

- `azd init` - Inaweka mradi mpya wa AI kutoka kwa kiolezo cha AZD kilicho tayari.
- `azd up` - Inatoa miundombinu na kupeleka programu yako kwa hatua moja.
- `azd monitor` - Pata ufuatiliaji wa papo kwa papo na utambuzi wa matatizo kwa programu uliyopeleka.
- `azd pipeline config` - Sanidi mabomba ya CI/CD ili kuendesha uenezaji kwenda Azure kwa njia ya otomatiki.

**🎯 | MAZOEZI**: <br/> 
Chunguza zana ya mstari wa amri `azd` katika mazingira yako ya GitHub Codespaces sasa. Anza kwa kuandika amri hii ili kuona zana inaweza kufanya nini:

```bash title="" linenums="0"
azd help
```

![Mtiririko](../../../../../translated_images/sw/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Kiolezo cha AZD

Ili `azd` ifanikishe hili, inahitaji kujua miundombinu ya kuandaa, mipangilio ya usanidi ya kutekeleza, na programu ya kupeleka. Hapa ndipo [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) zinapokuja.

Violezo vya AZD ni hifadhidata za chanzo wazi zinazochanganya mfano wa msimbo pamoja na faili za miundombinu na usanidi zinazohitajika kwa kupeleka usanifu wa suluhisho.
Kwa kutumia mbinu ya _Infrastructure-as-Code_ (IaC), zinaruhusu ufafanuzi wa rasilimali za kiolezo na mipangilio ya usanidi kuwekwa chini ya udhibiti wa toleo (kama msimbo wa chanzo wa programu) - kuunda mitiririko inayoweza kutumika tena na yenye kukua kwa watumiaji wa mradi huo.

Unapounda au kutumia tena kiolezo cha AZD kwa senario _yako_, zingatia maswali haya:

1. Unajenga nini? → Je, kuna kiolezo chenye msimbo wa kuanzia kwa senario hilo?
1. Suluhisho lako limepangwa vipi? → Je, kuna kiolezo chenye rasilimali zinazohitajika?
1. Suluhisho lako linapeleka vipi? → Fikiria `azd deploy` na hooks za kabla/baada za usindikaji!
1. Unaweza kuiboresha vipi zaidi? → Fikiria ufuatiliaji uliojengewa ndani na mabomba ya utekelezaji ya otomatiki!

**🎯 | MAZOEZI**: <br/> 
Tembelea maktaba ya [Awesome AZD](https://azure.github.io/awesome-azd/) na tumia vichujio kuchunguza kiolezo 250+ zinazopatikana sasa. Angalia kama unaweza kupata kimoja kinacholingana na mahitaji ya senario _yako_.

![Msimbo](../../../../../translated_images/sw/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Violezo vya Programu za AI

Kwa programu zinazotegemea AI, Microsoft hutoa violezo maalum vinavyofuatilia **Microsoft Foundry** na **Foundry Agents**. Violezo hivi vinakukwamua njia yako ya kujenga programu zenye akili, zinazoweza kutumika uzalishaji.

### Violezo vya Microsoft Foundry & Foundry Agents

Chagua kiolezo hapa chini kupeleka. Kila kiolezo kinapatikana kwenye [Awesome AZD](https://azure.github.io/awesome-azd/) na kinaweza kuanzishwa kwa amri mojawapo.

| Kiolezo | Maelezo | Amri ya Kupeleka |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Programu ya mazungumzo inayotumia Retrieval Augmented Generation kwa kutumia Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Jenga maajenti ya AI kwa kutumia Foundry Agents kwa ajili ya utekelezaji wa kazi kwa uhuru | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Ratibu maajenti wengi wa Foundry kwa mtiririko tata wa kazi | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Toa na chunguza nyaraka kwa kutumia modeli za Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Jenga chatbots za kisasa zilizounganishwa na Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Tengeneza picha kwa kutumia DALL-E kupitia Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Maajenti ya AI wakitumia Semantic Kernel pamoja na Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Mifumo ya maajenti wengi ikitumia mfumo wa AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Mwanzo wa Haraka

1. **Vinjari violezo**: Tembelea [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) na chuja kwa `AI`, `Agents`, au `Microsoft Foundry`
2. **Chagua kiolezo chako**: Chagua kile kinacholingana na matumizi yako
3. **Anzisha**: Endesha amri `azd init` kwa kiolezo ulichochagua
4. **Peleka**: Endesha `azd up` kuandaa miundombinu na kupeleka

**🎯 | MAZOEZI**: <br/>
Chagua mojawapo ya violezo hapo juu kulingana na senario yako:

- **Unajenga chatbot?** → Anza na **AI Chat with RAG** au **Conversational AI Bot**
- **Unahitaji maajenti wa kujitegemea?** → Jaribu **Foundry Agent Service Starter** au **Multi-Agent Orchestration**
- **Unachakata nyaraka?** → Tumia **AI Document Intelligence**
- **Unataka msaada wa uandishi wa msimbo kwa AI?** → Chunguza **Semantic Kernel Agent** au **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Chunguza Violezo Zaidi"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwajibika:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za otomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Nyaraka ya awali katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tunapendekeza kufanya tafsiri kwa mtaalamu wa binadamu. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->