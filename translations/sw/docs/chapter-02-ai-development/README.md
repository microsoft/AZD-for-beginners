# Sura 2: Uundaji wa Kwanza wa AI

**📚 Kozi**: [AZD For Beginners](../../README.md) | **⏱️ Muda**: 1-2 masaa | **⭐ Ugumu**: Wastani

---

## Muhtasari

Sura hii inazingatia kusambaza programu zenye nguvu za AI kwa kutumia Azure Developer CLI na huduma za Microsoft Foundry. Kutoka kwa programu rahisi za chat za AI hadi maajenti wenye akili walioboresha kwa zana.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umeweza:
- Sambaza programu za AI kwa kutumia kiolezo za AZD zilizotengenezwa
- Elewa uunganishaji wa Microsoft Foundry na AZD
- Sanidi na ubinafsishe maajenti wa AI pamoja na zana
- Sambaza programu za RAG (Retrieval-Augmented Generation)

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Unganisha AZD na huduma za Foundry | 30 min |
| 2 | [AI Agents Guide](agents.md) | Sambaza maajenti yenye akili kwa zana | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Sambaza na sanidi mifano ya AI | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Vitendo: Fanya suluhisho lako la AI liwe tayari kwa AZD | 60 min |

---

## 🚀 Anza Haraka

```bash
# Chaguo 1: Programu ya mazungumzo ya RAG
azd init --template azure-search-openai-demo
azd up

# Chaguo 2: Mawakala wa AI
azd init --template get-started-with-ai-agents
azd up

# Chaguo 3: Programu ya mazungumzo ya haraka
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Mifano Maarufu ya AI

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat ya RAG yenye marejeo | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Maajenti ya AI yenye zana | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat ya msingi ya AI | OpenAI + Container Apps |

---

## 💰 Ufahamu wa Gharama

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Vidokezo:** Endesha `azd down` baada ya kupima ili kuepuka malipo.

---

## 🔗 Uvinjari

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Inayofuata** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Ruka hadi** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Agalizo:
Waraka huu umetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokukamilika. Waraka asili katika lugha yake ya asili unapaswa kuchukuliwa kama chanzo rasmi. Kwa taarifa muhimu, tunapendekeza tafsiri ya kitaalamu ya mtu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->