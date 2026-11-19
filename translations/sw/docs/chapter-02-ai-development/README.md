# Sura ya 2: Uendelezaji wa AI-Kwanza

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: Masaa 4-5 ikijumuisha warsha | **⭐ Ugumu**: Kati

---

## Muhtasari

Sura hii inalenga katika kutekeleza programu zinazotumia AI kwa kutumia Azure Developer CLI na huduma za Microsoft Foundry. Kuanzia programu rahisi za mazungumzo za AI hadi mawakala werevu wenye zana.

> **Mabadiliko ya Foundry GA (2026-11-09):** Kifurushi cha `microsoft.foundry` 1.0 kipo [kupanuliwa kwa ujumla](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Tumia `azd >= 1.37.0`; tathmini bado ni usakinishaji tofauti. [Mapitio ya mwongozo wa mwenyeji](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) yanahusu upimaji wa Agent Inspector wa ndani na kuweka msimbo mbali. Hii ni ukaguzi wa nyaraka, sio uthibitisho wa kuweka moja kwa moja; vipengele vya awali vya hiari vinaendelea na hadhi zao.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utaweza:
- Kutekeleza programu za AI kwa kutumia templeti za AZD zilizojengwa tayari
- Kuelewa muunganiko wa Microsoft Foundry na AZD
- Kusakinisha kifurushi cha GA na kupima jwakala wa mwenyeji ndani kabla ya kuweka chanzo chake Foundry
- Kukagua `azure.yaml`, mali za tathmini, na usafishaji wa mradi mpya dhidi ya mradi uliotumika tena
- Kusanidi na kubinafsisha mawakala wa AI wenye zana
- Kutekeleza programu za RAG (Kizazi Kilichoongezwa kwa Kurejea)

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Muunganiko wa Microsoft Foundry](microsoft-foundry-integration.md) | Kifurushi cha GA, mtiririko wa kazi wa mwenda mwenyeji wa ndani-kwa-wingu, na tathmini | 60 dakika |
| 2 | [Mwongozo wa Wakala wa AI](agents.md) | Weka mawakala werevu wenye zana | 45 dakika |
| 3 | [Kuweka Mfano wa AI](ai-model-deployment.md) | Weka na usanidi wa mifano ya AI | 30 dakika |
| 4 | [Maabara ya Warsha ya AI](ai-workshop-lab.md) | Vitendo: Chunguza templeti na panga uongofu wako | Masaa 2-3 |

---

## 🚀 Anza Haraka

Chagua chaguo moja katika saraka mpya tupu. Kifurushi cha `.` kinanzisha saraka ya sasa; vinginevyo AZD inaweza kuunda saraka ndogo bila kubadilisha saraka ya kazi ya shell yako.

Kwa **njia ya kuweka msimbo wa mwakilishi mwenyeji wa GA**, anza na [mwongozo ulioongozwa](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Inahitaji AZD 1.37.0+, uv wa sasa, Python 3.13+, ruhusa za Foundry, na kikomo cha mfano. Templeti kamili za programu hapa chini ni mbadala, sio vigezo vya mwongozo huo.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Templeti Maarufu za AI

| Templeti | Maelezo | Huduma |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Mazungumzo ya RAG yenye marejeleo | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Mwakala wa AI mwenye zana | Huduma ya Mwakala wa AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Mazungumzo ya msingi ya AI | OpenAI + Container Apps |

---

## 💰 Uelewa wa Gharama

Hizi ni anuwai za maelezo, si nukuu au viwango; trafiki ya mfano, SKUs za Tafutiza/uhesabu, eneo, na vipengele vya hiari vinaweza kuzidi. Pitia mwongozo wa bei wa sampuli uliyochagua kabla ya kuanzisha.

| Mazingira | Gharama ya Kila Mwezi Inakadiriwa |
|-------------|----------------------|
| Maendeleo | $80-150 |
| Kujaribu | $150-300 |
| Uzalishaji | $300-3,500+ |

**Usafishaji:** Kagua `azd down` kabla ya kuthibitisha: kwa mradi mpya wa Foundry huondoa kikundi cha rasilimali na kila kitu ndani yake. Kwa mradi uliotumika tena wa Foundry, huacha rasilimali za mradi na wakala mahali; fuata [maelekezo ya usafishaji wa mwongozo](microsoft-foundry-integration.md#7-clean-up-deliberately) kuondoa rasilimali zisizohitajika tofauti.

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura ya 1: Msingi](../chapter-01-foundation/README.md) |
| **Ifuatayo** | [Sura ya 3: Usanidi](../chapter-03-configuration/README.md) |
| **Ruka kwa** | [Sura ya 8: Mifumo ya Uzalishaji](../chapter-08-production/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Kutatua Tatizo la AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Mazingira ya AI ya Uzalishaji](../chapter-08-production/production-ai-practices.md)
- [Uchambuzi wa Programu](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->