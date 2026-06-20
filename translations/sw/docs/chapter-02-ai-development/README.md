# Sura 2: Maendeleo ya AI-Kwanza

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: 1-2 hours | **⭐ Ugumu**: Kati

---

## Muhtasari

Sura hii inazingatia kupeleka programu zinazoendeshwa na AI kwa kutumia Azure Developer CLI na huduma za Microsoft Foundry. Kuanzia programu za mazungumzo za AI rahisi hadi mawakala wenye akili wenye zana.

> **Kumbusho la uthibitisho (2026-06-15):** Mtiririko wa amri na mwongozo wa nyongeza katika sura hii ulipitiwa dhidi ya `azd` `1.25.6` na toleo la awali la nyongeza ya wakala wa AI `azure.ai.agents` `0.1.40-preview`. Ikiwa uko kwenye toleo la AZD la kale, sasisha kwanza kisha endelea na mazoezi.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umefanikiwa:
- Kupeleka programu za AI kwa kutumia templet zilizotengenezwa kabla za AZD
- Kuelewa ujumuishaji wa Microsoft Foundry na AZD
- Kusanidi na kubinafsisha mawakala wa AI pamoja na zana
- Kupeleka programu za RAG (Retrieval-Augmented Generation)

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Muunganisho wa Microsoft Foundry](microsoft-foundry-integration.md) | Unganisha AZD na huduma za Foundry | 30 min |
| 2 | [Mwongozo wa Wakala wa AI](agents.md) | Sambaza mawakala wenye akili na zana | 45 min |
| 3 | [Ueneaji wa Modeli za AI](ai-model-deployment.md) | Sambaza na sanidi modeli za AI | 30 min |
| 4 | [Warsha ya Maabara ya AI](ai-workshop-lab.md) | Vitendo: Fanya suluhisho lako la AI liwe tayari kwa AZD | 60 min |

---

## 🚀 Anza Haraka

```bash
# Chaguo 1: Programu ya Gumzo ya RAG
azd init --template azure-search-openai-demo
azd up

# Chaguo 2: Mawakala wa AI
azd init --template get-started-with-ai-agents
azd up

# Chaguo 3: Programu ya Gumzo ya Haraka
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Violezo vya AI Vilivyopendekezwa

| Kiolezo | Maelezo | Huduma |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Zungumza RAG na marejeo | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Wakala wa AI akiwa na zana | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Zungumza AI ya Msingi | OpenAI + Container Apps |

---

## 💰 Uelewa wa Gharama

| Mazingira | Gharama Inakadiriwa Kila Mwezi |
|-------------|----------------------|
| Maendeleo | $80-150 |
| Uandaaji | $150-300 |
| Uzalishaji | $300-3,500+ |

**Ushauri:** Run `azd down` baada ya kupima ili kuepuka malipo.

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 1: Msingi](../chapter-01-foundation/README.md) |
| **Ifuatayo** | [Sura 3: Usanidi](../chapter-03-configuration/README.md) |
| **Ruka hadi** | [Sura 8: Mifumo ya Uzalishaji](../chapter-08-production/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Utatuzi wa AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Vitendo vya AI kwa Uzalishaji](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->