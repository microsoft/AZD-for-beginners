# 2. fejezet: AI-első fejlesztés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-2 óra | **⭐ Nehézségi szint**: Középhaladó

---

## Áttekintés

Ez a fejezet az AI-alapú alkalmazások telepítésére összpontosít az Azure Developer CLI és a Microsoft Foundry szolgáltatások használatával. Egyszerű AI chat alkalmazásoktól az eszközökkel rendelkező intelligens ügynökökig.

> **Érvényességi megjegyzés (2026-06-15):** A fejezetben bemutatott parancsfolyamatokat és kiterjesztési útmutatót az `azd` `1.25.6` verzióhoz és a jelenlegi előzetes AI ügynök kiterjesztés kiadáshoz, az `azure.ai.agents` `0.1.40-preview`-hoz igazították. Ha régebbi AZD verziót használsz, először frissíts, majd folytasd a gyakorlatokat.

## Tanulási célok

A fejezet befejezésével képes leszel:
- AI alkalmazások telepítése előre elkészített AZD sablonokkal
- A Microsoft Foundry integrációjának megértése az AZD-vel
- AI ügynökök konfigurálása és testreszabása eszközökkel
- RAG (Retrieval-Augmented Generation) alkalmazások telepítése

---

## 📚 Tananyagok

| # | Tananyag | Leírás | Idő |
|---|----------|---------|-----|
| 1 | [Microsoft Foundry integráció](microsoft-foundry-integration.md) | AZD összekapcsolása a Foundry szolgáltatásokkal | 30 perc |
| 2 | [AI ügynökök útmutató](agents.md) | Intelligens ügynökök telepítése eszközökkel | 45 perc |
| 3 | [AI modell telepítés](ai-model-deployment.md) | AI modellek telepítése és konfigurálása | 30 perc |
| 4 | [AI műhely labor](ai-workshop-lab.md) | Gyakorlati feladat: AI megoldásod AZD-re alkalmassá tétele | 60 perc |

---

## 🚀 Gyors indulás

```bash
# 1. lehetőség: RAG chat alkalmazás
azd init --template azure-search-openai-demo
azd up

# 2. lehetőség: AI ügynökök
azd init --template get-started-with-ai-agents
azd up

# 3. lehetőség: Gyors chat alkalmazás
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Kiemelt AI sablonok

| Sablon | Leírás | Szolgáltatások |
|--------|---------|----------------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat hivatkozásokkal | OpenAI + AI keresés |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI ügynök eszközökkel | AI Agent szolgáltatás |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Alap AI chat | OpenAI + Konténeralkalmazások |

---

## 💰 Költségtudatosság

| Környezet | Becslés havi költség |
|-----------|----------------------|
| Fejlesztés | 80-150 USD |
| Tesztelés | 150-300 USD |
| Éles | 300-3,500+ USD |

**Tipp:** Tesztelés után futtasd az `azd down` parancsot a díjak elkerülésére.

---

## 🔗 Navigáció

| Irány | Fejezet |
|--------|---------|
| **Előző** | [1. fejezet: Alapok](../chapter-01-foundation/README.md) |
| **Következő** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |
| **Ugrás ide** | [8. fejezet: Éles környezeti minták](../chapter-08-production/README.md) |

---

## 📖 Kapcsolódó anyagok

- [AI hibaelhárítás](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Éles AI gyakorlatok](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->