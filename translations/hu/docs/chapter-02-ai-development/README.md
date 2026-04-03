# 2. fejezet: AI-első fejlesztés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-2 óra | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet az Azure Developer CLI és a Microsoft Foundry szolgáltatások használatával AI-alapú alkalmazások telepítésére fókuszál. Egyszerű AI chat alkalmazásoktól az eszközökkel rendelkező intelligens ügynökökig.

> **Érvényesítési megjegyzés (2026-03-25):** A parancsfutás és bővítmény útmutatás ezen fejezetben az `azd` `1.23.12` verziója, valamint a jelenlegi előzetes AI ügynök bővítménykiadás `azure.ai.agents` `0.1.18-preview` alapján lett ellenőrizve. Ha régebbi AZD verziót használ, frissítsen először, majd folytassa a gyakorlatokat.

## Tanulási célok

A fejezet befejezésével Ön:
- AI alkalmazásokat telepít előre elkészített AZD sablonokkal
- Megérti a Microsoft Foundry integrációját az AZD-vel
- Konfigurálja és testreszabja az AI ügynököket eszközökkel
- Telepít Retrieval-Augmented Generation (RAG) alkalmazásokat

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry integráció](microsoft-foundry-integration.md) | AZD összekapcsolása a Foundry szolgáltatásokkal | 30 perc |
| 2 | [AI ügynökök útmutató](agents.md) | Intelligens ügynökök telepítése eszközökkel | 45 perc |
| 3 | [AI modell telepítés](ai-model-deployment.md) | AI modellek telepítése és konfigurálása | 30 perc |
| 4 | [AI műhely labor](ai-workshop-lab.md) | Gyakorlati: Készítse elő AI megoldását AZD-re | 60 perc |

---

## 🚀 Gyors kezdés

```bash
# 1. lehetőség: RAG Chat alkalmazás
azd init --template azure-search-openai-demo
azd up

# 2. lehetőség: Mesterséges intelligencia ügynökök
azd init --template get-started-with-ai-agents
azd up

# 3. lehetőség: Gyors chat alkalmazás
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Kiemelt AI sablonok

| Sablon | Leírás | Szolgáltatások |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat idézetekkel | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Eszközökkel rendelkező AI ügynök | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Alap AI chat | OpenAI + Container Apps |

---

## 💰 Költségtudatosság

| Környezet | Várható havi költség |
|-------------|----------------------|
| Fejlesztés | 80-150 USD |
| Tesztelés | 150-300 USD |
| Éles | 300-3500+ USD |

**Tipp:** Tesztelés után futtassa az `azd down` parancsot, hogy elkerülje a költségeket.

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [1. fejezet: Alapok](../chapter-01-foundation/README.md) |
| **Következő** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |
| **Ugorjon ide** | [8. fejezet: Éles üzem minták](../chapter-08-production/README.md) |

---

## 📖 Kapcsolódó források

- [AI hibakeresés](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Éles AI gyakorlatok](../chapter-08-production/production-ai-practices.md)
- [Alkalmazásfigyelés](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:  
Ezt a dokumentumot az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) használatával fordítottuk le. Bár a pontosságra törekszünk, kérjük vegye figyelembe, hogy az automatikus fordítások tartalmazhatnak hibákat vagy pontatlanságokat. Az eredeti dokumentum az anyanyelvén tekintendő hivatalos forrásnak. Fontos információk esetén javasolt szakmai emberi fordítás igénybevétele. Semmilyen felelősséget nem vállalunk a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->