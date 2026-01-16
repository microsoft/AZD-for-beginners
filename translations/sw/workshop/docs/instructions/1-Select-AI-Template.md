<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "06d6207eff634aefcaa41739490a5324",
  "translation_date": "2025-09-25T01:58:30+00:00",
  "source_file": "workshop/docs/instructions/1-Select-AI-Template.md",
  "language_code": "sw"
}
-->
# 1. Chagua Kiolezo

!!! tip "MWISHO WA MODULI HII UTAWEZA"

    - [ ] Eleza kile AZD templates zinamaanisha
    - [ ] Gundua na tumia AZD templates kwa AI
    - [ ] Anza na kiolezo cha AI Agents
    - [ ] **Maabara 1:** AZD Quickstart na GitHub Codespaces

---

## 1. Mfano wa Kujenga

Kujenga programu ya kisasa ya AI inayofaa kwa biashara _kutoka mwanzo_ inaweza kuwa changamoto kubwa. Ni kama kujenga nyumba yako mpya mwenyewe, ukitumia matofali moja baada ya jingine. Ndiyo, inawezekana! Lakini si njia bora zaidi ya kufanikisha matokeo unayotaka!

Badala yake, mara nyingi tunaanza na _mchoro wa muundo_ uliopo, na tunafanya kazi na mbunifu ili kuubadilisha kulingana na mahitaji yetu binafsi. Na hiyo ndiyo njia sahihi ya kuchukua unapojenga programu za akili. Kwanza, tafuta muundo mzuri wa usanifu unaofaa kwa tatizo lako. Kisha fanya kazi na mbunifu wa suluhisho ili kubadilisha na kuendeleza suluhisho kwa hali yako maalum.

Lakini tunawezaje kupata michoro hii ya muundo? Na tunawezaje kupata mbunifu ambaye yuko tayari kutufundisha jinsi ya kubadilisha na kupeleka michoro hii peke yetu? Katika warsha hii, tunajibu maswali hayo kwa kukutambulisha kwa teknolojia tatu:

1. [Azure Developer CLI](https://aka.ms/azd) - zana ya chanzo huria inayoharakisha njia ya msanidi programu kutoka maendeleo ya ndani (kujenga) hadi upelekaji wa wingu (kusafirisha).
1. [Azure AI Foundry Templates](https://ai.azure.com/templates) - hifadhi za chanzo huria zilizo na sampuli za msimbo, miundombinu, na faili za usanidi kwa ajili ya kupeleka usanifu wa suluhisho la AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - wakala wa usimbaji uliojikita katika maarifa ya Azure, ambao unaweza kutuongoza katika kuvinjari msimbo na kufanya mabadiliko - kwa kutumia lugha ya kawaida.

Kwa zana hizi mkononi, sasa tunaweza _kugundua_ kiolezo sahihi, _kukipeleka_ ili kuthibitisha kinafanya kazi, na _kukibadilisha_ ili kifae hali zetu maalum. Hebu tuanze na tujifunze jinsi zinavyofanya kazi.

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (au `azd`) ni zana ya chanzo huria ya mstari wa amri inayoweza kuharakisha safari yako ya msimbo hadi wingu kwa seti ya amri rafiki kwa msanidi programu zinazofanya kazi kwa uthabiti katika mazingira yako ya IDE (maendeleo) na CI/CD (devops).

Kwa kutumia `azd`, safari yako ya upelekaji inaweza kuwa rahisi kama:

- `azd init` - Inaanzisha mradi mpya wa AI kutoka kwa kiolezo cha AZD kilichopo.
- `azd up` - Inaandaa miundombinu na kupeleka programu yako kwa hatua moja.
- `azd monitor` - Pata ufuatiliaji wa wakati halisi na uchunguzi wa programu yako iliyopelekwa.
- `azd pipeline config` - Sanidi njia za CI/CD ili kuendesha upelekaji wa Azure kiotomatiki.

**🎯 | ZOEZI**: <br/> Chunguza zana ya mstari wa amri ya `azd` katika mazingira yako ya GitHub Codespaces sasa. Anza kwa kuandika amri hii ili kuona kile zana inaweza kufanya:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/sw/azd-flow.19ea67c2f81eaa66.png)

---

## 3. Kiolezo cha AZD

Ili `azd` kufanikisha hili, inahitaji kujua miundombinu ya kuandaa, mipangilio ya usanidi ya kutekeleza, na programu ya kupeleka. Hapa ndipo [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) zinapokuja.

AZD templates ni hifadhi za chanzo huria zinazochanganya msimbo wa sampuli na faili za miundombinu na usanidi zinazohitajika kwa kupeleka usanifu wa suluhisho.
Kwa kutumia mbinu ya _Infrastructure-as-Code_ (IaC), zinaruhusu ufafanuzi wa rasilimali za kiolezo na mipangilio ya usanidi kudhibitiwa kwa toleo (kama vile msimbo wa chanzo wa programu) - na hivyo kuunda mtiririko wa kazi unaoweza kutumika tena na thabiti kwa watumiaji wa mradi huo.

Unapounda au kutumia kiolezo cha AZD kwa hali yako, zingatia maswali haya:

1. Unajenga nini? → Je, kuna kiolezo chenye msimbo wa kuanzia kwa hali hiyo?
1. Suluhisho lako limeundwa vipi? → Je, kuna kiolezo chenye rasilimali zinazohitajika?
1. Suluhisho lako linapelekwa vipi? → Fikiria `azd deploy` na hooks za usindikaji kabla/baada!
1. Unawezaje kukiboresha zaidi? → Fikiria ufuatiliaji wa ndani na njia za kiotomatiki za upelekaji!

**🎯 | ZOEZI**: <br/> 
Tembelea [Awesome AZD](https://azure.github.io/awesome-azd/) gallery na tumia vichujio kuchunguza violezo 250+ vilivyopo. Angalia kama unaweza kupata kimoja kinacholingana na mahitaji ya hali yako.

![Code](../../../../../translated_images/sw/azd-code-to-cloud.2d9503d69d3400da.png)

---

## 4. Violezo vya Programu za AI

---

