# 2. fejezet: AI-központú fejlesztés

**📚 Tanfolyam**: [AZD For Beginners](../../README.md) | **⏱️ Időtartam**: 1-2 óra | **⭐ Bonyolultság**: Közepes

---

## Áttekintés

Ez a fejezet az Azure Developer CLI és a Microsoft Foundry szolgáltatások használatával történő MI-vezérelt alkalmazások telepítésére összpontosít. Az egyszerű MI-csevegőalkalmazásoktól az eszközökkel rendelkező intelligens ügynökökig.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- AI-alkalmazások telepítése előre elkészített AZD-sablonokkal
- A Microsoft Foundry és az AZD integrációjának megértése
- Az AI-ügynökök eszközeinek konfigurálása és testreszabása
- RAG (Retrieval-Augmented Generation) alkalmazások telepítése

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Csatlakoztasd az AZD-t a Foundry szolgáltatásokkal | 30 perc |
| 2 | [AI Agents Guide](agents.md) | Telepíts intelligens ügynököket eszközökkel | 45 perc |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI modellek telepítése és konfigurálása | 30 perc |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Gyakorlati: Tedd AZD-kompatibilissé az MI-megoldásodat | 60 perc |

---

## 🚀 Gyors kezdés

```bash
# Opció 1: RAG csevegőalkalmazás
azd init --template azure-search-openai-demo
azd up

# Opció 2: MI-ügynökök
azd init --template get-started-with-ai-agents
azd up

# Opció 3: Gyors csevegőalkalmazás
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Kiemelt MI-sablonok

| Sablon | Leírás | Szolgáltatások |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG csevegés hivatkozásokkal | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Eszközökkel rendelkező AI-ügynök | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Alapvető AI csevegés | OpenAI + Container Apps |

---

## 💰 Költségtudatosság

| Környezet | Becsült havi költség |
|-------------|----------------------|
| Fejlesztés | $80-150 |
| Tesztelés | $150-300 |
| Éles | $300-3,500+ |

**Tipp:** Futtasd az `azd down` parancsot a tesztelés után, hogy elkerüld a költségeket.

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [1. fejezet: Alapok](../chapter-01-foundation/README.md) |
| **Következő** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |
| **Ugrás ide** | [8. fejezet: Éles minták](../chapter-08-production/README.md) |

---

## 📖 Kapcsolódó források

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ezt a dokumentumot az AI fordítószolgáltatás, a Co-op Translator (https://github.com/Azure/co-op-translator) segítségével fordítottuk. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatizált fordítások hibákat vagy pontatlanságokat tartalmazhatnak. A dokumentum eredeti, anyanyelvi változatát tekintse a hiteles forrásnak. Fontos információk esetén professzionális, emberi fordítást javaslunk. Nem vállalunk felelősséget az ezen fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->