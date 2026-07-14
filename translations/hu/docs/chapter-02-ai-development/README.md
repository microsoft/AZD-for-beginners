# 2. fejezet: AI-első fejlesztés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-2 óra | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet az AI-alapú alkalmazások telepítésére fókuszál az Azure Developer CLI és a Microsoft Foundry szolgáltatások használatával. Egyszerű AI csevegőalkalmazásoktól az eszközökkel rendelkező intelligens ügynökökig.

> **Érvényesítési megjegyzés (2026-07-13):** A parancsfolyamot és a bővítményre vonatkozó útmutatást ebben a fejezetben az `azd` `1.27.1` és a jelenlegi előzetes AI ügynök bővítményverzió `azure.ai.agents` `1.0.0-beta.5` alapján ellenőriztük. Ha régebbi AZD verziót használsz, először frissíts, majd folytasd a gyakorlatokat.

## Tanulási célok

Ennek a fejezetnek a befejezésével a következőket fogod tudni:
- AI alkalmazások telepítése előre elkészített AZD sablonokkal
- A Microsoft Foundry integrációjának megértése az AZD-vel
- AI ügynökök eszközökkel való konfigurálása és testreszabása
- RAG (Retrieval-Augmented Generation) alkalmazások telepítése

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|--------|------|
| 1 | [Microsoft Foundry integráció](microsoft-foundry-integration.md) | AZD összekapcsolása Foundry szolgáltatásokkal | 30 perc |
| 2 | [AI Ügynökök útmutató](agents.md) | Intelligens ügynökök telepítése eszközökkel | 45 perc |
| 3 | [AI modell telepítése](ai-model-deployment.md) | AI modellek telepítése és konfigurálása | 30 perc |
| 4 | [AI műhely labor](ai-workshop-lab.md) | Gyakorlati: Tedd AI megoldásodat AZD-kompatibilissé | 60 perc |

---

## 🚀 Gyors indítás

```bash
# 1. lehetőség: RAG Chat alkalmazás
azd init --template azure-search-openai-demo
azd up

# 2. lehetőség: AI ügynökök
azd init --template get-started-with-ai-agents
azd up

# 3. lehetőség: Gyors Chat alkalmazás
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Kiemelt AI sablonok

| Sablon | Leírás | Szolgáltatások |
|---------|---------|--------------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG csevegés hivatkozásokkal | OpenAI + AI keresés |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI ügynök eszközökkel | AI ügynök szolgáltatás |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Alap AI csevegő | OpenAI + Konténeralkalmazások |

---

## 💰 Költségtudatosság

| Környezet | Becslés havi költség |
|----------|--------------------|
| Fejlesztés | 80-150 USD |
| Tesztelés | 150-300 USD |
| Üzemeltetés | 300-3,500+ USD |

**Tipp:** A tesztelés után futtasd az `azd down` parancsot a költségek elkerülése érdekében.

---

## 🔗 Navigáció

| Irány | Fejezet |
|-------|---------|
| **Előző** | [1. fejezet: Alapok](../chapter-01-foundation/README.md) |
| **Következő** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |
| **Ugrás ide** | [8. fejezet: Üzemeltetési minták](../chapter-08-production/README.md) |

---

## 📖 Kapcsolódó források

- [AI hibakeresés](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [AI az üzemeltetésben](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->