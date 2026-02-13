# Sura 5: Suluhisho za AI za Wakala-Wengi

**📚 Kozi**: [AZD Kwa Waanze](../../README.md) | **⏱️ Muda**: 2-3 hours | **⭐ Ugumu**: Juu

---

## Muhtasari

Sura hii inashughulikia mifumo ya usanifu ya wakala-wengi za hali ya juu, uratibu wa mawakala, na uanzishaji wa AI tayari kwa uzalishaji kwa hali ngumu.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umeweza:
- Kuelewa mifumo ya usanifu ya wakala-wengi
- Kuweka mifumo ya mawakala wa AI iliyoratibiwa
- Kutekeleza mawasiliano kati ya mawakala
- Kujenga suluhisho za wakala-wengi zilizo tayari kwa uzalishaji

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Suluhisho la Wakala-Wengi kwa Rejareja](../../examples/retail-scenario.md) | Mwongozo kamili wa utekelezaji | 90 min |
| 2 | [Mifumo ya Uratibu](../chapter-06-pre-deployment/coordination-patterns.md) | Mikakati ya uratibu wa mawakala | 30 min |
| 3 | [Utekelezaji wa Kiolezo cha ARM](../../examples/retail-multiagent-arm-template/README.md) | Uanzishaji kwa bonyeza moja | 30 min |

---

## 🚀 Anza Haraka

```bash
# Sakinisha suluhisho la mawakala wengi kwa sekta ya rejareja
cd examples/retail-multiagent-arm-template
./deploy.sh

# Au tumia kiolezo moja kwa moja
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Usanifu wa Wakala-Wengi

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Suluhisho Maarufu: Wakala-Wengi wa Rejareja

The [Suluhisho la Wakala-Wengi kwa Rejareja](../../examples/retail-scenario.md) linaonyesha:

- **Wakala wa Mteja**: Hushughulikia mwingiliano wa mtumiaji na mapendeleo
- **Wakala wa Hifadhi**: Husimamia hisa na usindikaji wa maagizo
- **Mratibu**: Anaratibu kati ya mawakala
- **Kumbukumbu Iliyogawanywa**: Usimamizi wa muktadha unaogawanywa kati ya mawakala

### Huduma Zinazotumika

| Huduma | Madhumuni |
|---------|---------|
| Azure OpenAI | Ufafanuzi wa lugha |
| Azure AI Search | Katalogi ya bidhaa |
| Cosmos DB | Hali na kumbukumbu ya wakala |
| Container Apps | Uwekaji mwenyeji wa mawakala |
| Application Insights | Ufuatiliaji |

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyotangulia** | [Sura 4: Miundombinu](../chapter-04-infrastructure/README.md) |
| **Ifuatayo** | [Sura 6: Kabla ya Uanzishaji](../chapter-06-pre-deployment/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Mwongozo wa Wakala wa AI](../chapter-02-ai-development/agents.md)
- [Mbinu za AI kwa Uzalishaji](../chapter-08-production/production-ai-practices.md)
- [Utatuzi wa Matatizo ya AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tamko la kutohusika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali kumbuka kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kasoro. Nyaraka ya awali katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya kitaalamu iliyofanywa na mtaalamu wa kibinadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->