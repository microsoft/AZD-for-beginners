# Sura ya 2: Maendeleo ya AI-Kwanza

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: Masaa 1-2 | **⭐ Ugumu**: Kiwango cha Kati

---

## Muhtasari

Sura hii inalenga katika kuanzisha programu zinazotumia AI kwa kutumia Azure Developer CLI na huduma za Microsoft Foundry. Kuanzia programu rahisi za AI za mazungumzo hadi maajenti werevu wenye zana.

> **Kumbuka ya uthibitisho (2026-07-13):** Mtiririko wa amri na mwongozo wa nyongeza katika sura hii ulipitiwa dhidi ya `azd` `1.27.1` na toleo la sasa la nyongeza ya maajenti wa AI la awali `azure.ai.agents` `1.0.0-beta.5`. Ikiwa uko katika toleo la zamani la AZD, sasisha kwanza kisha endelea na mazoezi.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umejifunza:
- Kuanzisha programu za AI kwa kutumia templeti za AZD zilizojengwa awali
- Kuelewa ujumuishaji wa Microsoft Foundry na AZD
- Kusanidi na kubinafsisha maajenti wa AI wenye zana
- Kuanzisha programu za RAG (Retrieval-Augmented Generation)

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Ujumuishaji wa Microsoft Foundry](microsoft-foundry-integration.md) | Kuunganisha AZD na huduma za Foundry | 30 min |
| 2 | [Mwongozo wa Maajenti wa AI](agents.md) | Kuanzisha maajenti werevu wenye zana | 45 min |
| 3 | [Uanzishaji wa Mfano wa AI](ai-model-deployment.md) | Kuanzisha na kusanidi mifano ya AI | 30 min |
| 4 | [Warsha ya AI](ai-workshop-lab.md) | Vitendo: Tengeneza suluhisho lako la AI lisiwe tayari kwa AZD | 60 min |

---

## 🚀 Anza Haraka

```bash
# Chaguo 1: Programu ya Mazungumzo ya RAG
azd init --template azure-search-openai-demo
azd up

# Chaguo 2: Wakala wa AI
azd init --template get-started-with-ai-agents
azd up

# Chaguo 3: Programu ya Mazungumzo ya Haraka
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Templeti Maarufu za AI

| Templeti | Maelezo | Huduma |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Mazungumzo ya RAG yenye marejeo | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Maajenti wa AI wenye zana | Huduma ya Maajenti wa AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Mazungumzo ya AI ya Msingi | OpenAI + Container Apps |

---

## 💰 Uelewa wa Gharama

| Mazingira | Gharama Inakadiriwa Kila Mwezi |
|-------------|----------------------|
| Maendeleo | $80-150 |
| Maandalizi | $150-300 |
| Uzalishaji | $300-3,500+ |

**Ushauri:** Endesha `azd down` baada ya majaribio ili kuepuka malipo.

---

## 🔗 Urambazaji

| Mwanga | Sura |
|-----------|---------|
| **Iliyopita** | [Sura ya 1: Msingi](../chapter-01-foundation/README.md) |
| **Inayofuata** | [Sura ya 3: Usanidi](../chapter-03-configuration/README.md) |
| **Ruka hadi** | [Sura ya 8: Mifumo ya Uzalishaji](../chapter-08-production/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Utatuzi wa Matatizo ya AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Mazoezi ya AI kwa Uzalishaji](../chapter-08-production/production-ai-practices.md)
- [Maarifa ya Programu](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->