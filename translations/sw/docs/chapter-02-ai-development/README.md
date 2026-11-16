# Sura ya 2: Maendeleo ya AI-Kwanza

**📚 Kozi**: [AZD Kwa Komo](../../README.md) | **⏱️ Muda**: Masaa 4-5 ikijumuisha warsha | **⭐ Ugumu**: Kiwango cha Kati

---

## Muhtasari

Sura hii inalenga katika kutekeleza programu zilizoendeshwa na AI kwa kutumia Azure Developer CLI na huduma za Microsoft Foundry. Kuanzia programu rahisi za mazungumzo ya AI hadi mawakala wenye akili na zana.

> **Mapitio ya toleo (2026-11-04):** Mwongozo wa AI CLI ulichunguzwa dhidi ya hati/chanzo zilizochapishwa za `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, na `azure.ai.evaluations` `1.0.0-beta.2`. Tumia `azd >= 1.37.0` kwa mchakato wa kazi uliounganishwa. Tathmini sasa zinatumia hifadhi ya pekee ya majina ya `azd ai eval`; ona [mabadiliko ya toleo na mwongozo wa uhamaji](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Hii si uthibitisho wa utekelezaji wa moja kwa moja.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utaweza:
- Tekeleza programu za AI kwa kutumia templeti za AZD zilizotengenezwa awali
- Kuelewa ushirikiano wa Microsoft Foundry na AZD
- Kusanidi na kubinafsisha mawakala wa AI kwa kutumia zana
- Tekeleza programu za RAG (Uzalishaji Ulioboreshwa kwa Upataji)

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Ushirikiano wa Microsoft Foundry](microsoft-foundry-integration.md) | Unganisha AZD na huduma za Foundry | Dakika 30 |
| 2 | [Mwongozo wa Mawakala wa AI](agents.md) | Tekeleza mawakala wa akili kwa zana | Dakika 45 |
| 3 | [Utekelezaji wa Mfano wa AI](ai-model-deployment.md) | Tekeleza na usanidi wa mifano ya AI | Dakika 30 |
| 4 | [Maabara ya Warsha ya AI](ai-workshop-lab.md) | Vitendo: Chunguza templeti na panga mabadiliko yako | Masaa 2-3 |

---

## 🚀 Anza Haraka

Chagua chaguo moja katika saraka mpya tupu. `.` ya mwisho huanzisha saraka ya sasa; vinginevyo AZD inaweza kuunda saraka ndogo bila kubadilisha saraka ya kazi ya shell yako.

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

## 🤖 Templeti Bora za AI

| Templeti | Maelezo | Huduma |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Mazungumzo ya RAG yenye marejeo | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Wakili wa AI kwa zana | Huduma ya Wakili wa AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Mazungumzo ya AI ya msingi | OpenAI + Container Apps |

---

## 💰 Uelewa wa Gharama

Hizi ni viwango vya mfano, sio nukuu au viwango vya juu; trafiki ya mfano, SKU za Utafutaji/hisabati, eneo, na vipengele hiari vinaweza kuzidi. Pitia mwongozo wa bei wa sampuli uliyochagua kabla ya kuandaa.

| Mazingira | Gharama ya Kila Mwezi |
|-------------|----------------------|
| Maendeleo | $80-150 |
| Uandaaji | $150-300 |
| Uzalishaji | $300-3,500+ |

**Ushauri:** Endesha `azd down` baada ya majaribio ili kuzuia malipo.

---

## 🔗 Uelekezaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyotangulia** | [Sura 1: Msingi](../chapter-01-foundation/README.md) |
| **Ifuatayo** | [Sura 3: Usanidi](../chapter-03-configuration/README.md) |
| **Ruka kwenda** | [Sura 8: Mifumo ya Uzalishaji](../chapter-08-production/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ushughulikiaji wa Masuala ya AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Mazoea ya AI Kwenye Uzalishaji](../chapter-08-production/production-ai-practices.md)
- [Uchambuzi wa Maombi](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->