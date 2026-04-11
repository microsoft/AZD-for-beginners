# Sura 2: Maendeleo ya Kwanza ya AI

**📚 Kozi**: [AZD For Beginners](../../README.md) | **⏱️ Muda**: 1-2 saa | **⭐ Ugumu**: Wastani

---

## Muhtasari

Sura hii inalenga katika kuweka mienendo ya programu zinazoendeshwa na AI kwa kutumia Azure Developer CLI na huduma za Microsoft Foundry. Kuanzia programu rahisi za mazungumzo za AI hadi maajenti wenye akili yenye zana.

> **Kumbusho la uthibitisho (2026-03-25):** Mtiririko wa amri na mwongozo wa ugani katika sura hii ulipitiwa dhidi ya `azd` `1.23.12` na toleo la awali la ugani wa wakala wa AI `azure.ai.agents` `0.1.18-preview`. Ikiwa uko kwenye toleo la zamani la AZD, sasisha kwanza kisha endelea na mazoezi.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utapenda:
- Weka programu za AI kwa kutumia templates za AZD zilizojengwa tayari
- Elewa ujumuishaji wa Microsoft Foundry na AZD
- Sanidi na rekebisha maajenti wa AI pamoja na zana
- Weka programu za RAG (Retrieval-Augmented Generation)

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Unganisha AZD na huduma za Foundry | 30 dak |
| 2 | [AI Agents Guide](agents.md) | Weka maajenti wenye akili pamoja na zana | 45 dak |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Weka na sanidi mifano ya AI | 30 dak |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Vitendo: Fanya suluhisho lako la AI kuwa tayari kwa AZD | 60 dak |

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

## 🤖 Violezo vya AI vilivyopendekezwa

| Kiolezo | Maelezo | Huduma |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Mazungumzo ya RAG yenye rejea | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Wakala wa AI pamoja na zana | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Mazungumzo ya msingi ya AI | OpenAI + Container Apps |

---

## 💰 Uelewa wa Gharama

| Mazingira | Gharama Inayokadiriwa kwa Mwezi |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Ushauri:** Endesha `azd down` baada ya majaribio ili kuepuka malipo.

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyotangulia** | [Sura 1: Msingi](../chapter-01-foundation/README.md) |
| **Ifuatayo** | [Sura 3: Usanidi](../chapter-03-configuration/README.md) |
| **Ruka hadi** | [Sura 8: Mifumo ya Uzalishaji](../chapter-08-production/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Utatuzi wa matatizo ya AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Mbinu za AI kwa Uzalishaji](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kauli ya kutowajibika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Wakati tunajitahidi kuwa sahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya awali kwa lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya kitaalamu iliyofanywa na mwanadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zitakazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->