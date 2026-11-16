# 2. fejezet: AI-First Fejlesztés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 4-5 óra, beleértve a műhelyt | **⭐ Összetettség**: Középhaladó

---

## Áttekintés

Ez a fejezet az AI által vezérelt alkalmazások telepítésére összpontosít az Azure Developer CLI és a Microsoft Foundry szolgáltatások használatával. Egyszerű AI csevegőalkalmazásoktól az eszközökkel felszerelt intelligens ügynökökig.

> **Kiadás áttekintés (2026-11-04):** Az AI CLI útmutatót összevetették a közzétett `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` és `azure.ai.evaluations` `1.0.0-beta.2` dokumentáció/forrással. A kombinált munkafolyamathoz használja a `azd >= 1.37.0` parancsot. Az értékelések most a különálló `azd ai eval` névteret használják; lásd a [kiadási változtatásokat és migrációs útmutatót](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Ez nem élő telepítés érvényesítés.

## Tanulási célok

E fejezet elvégzése után a következőket tanulja meg:
- AI alkalmazások telepítése előre elkészített AZD sablonok segítségével
- Microsoft Foundry integráció megértése az AZD-vel
- AI ügynökök eszközökkel való konfigurálása és testreszabása
- RAG (Retrieval-Augmented Generation) alkalmazások telepítése

---

## 📚 Tananyagok

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry integráció](microsoft-foundry-integration.md) | AZD összekapcsolása a Foundry szolgáltatásokkal | 30 perc |
| 2 | [AI ügynökök útmutatója](agents.md) | Intelligens ügynökök telepítése eszközökkel | 45 perc |
| 3 | [AI modell telepítés](ai-model-deployment.md) | AI modellek telepítése és konfigurálása | 30 perc |
| 4 | [AI műhely labor](ai-workshop-lab.md) | Gyakorlati: Sablon felfedezése és konverziós terv készítése | 2-3 óra |

---

## 🚀 Gyors indulás

Válasszon egy lehetőséget egy új, üres könyvtárban. A végén lévő `.` inicializálja az aktuális könyvtárat; különben az AZD létrehozhat egy alkönyvtárat anélkül, hogy az shell munkakönyvtárát megváltoztatná.

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

## 🤖 Kiemelt AI sablonok

| Sablon | Leírás | Szolgáltatások |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG csevegés hivatkozásokkal | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI ügynök eszközökkel | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Alap AI csevegő | OpenAI + Container Apps |

---

## 💰 Költségtudatosság

Ezek csak illusztratív tartományok, nem árajánlatok vagy korlátok; a modelltforgalom, a Search/feldolgozó SKU-k, a régió és az opcionális funkciók meghaladhatják ezeket. Mielőtt indítaná, nézze meg a választott minta aktuális árképzését.

| Környezet | Becslések szerinti havi költség |
|-------------|----------------------|
| Fejlesztés | $80-150 |
| Tesztelés | $150-300 |
| Éles | $300-3,500+ |

**Tipp:** Futtassa a `azd down` parancsot tesztelés után a díjak elkerülése érdekében.

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [1. fejezet: Alapok](../chapter-01-foundation/README.md) |
| **Következő** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |
| **Ugrás ide** | [8. fejezet: Éles minták](../chapter-08-production/README.md) |

---

## 📖 Kapcsolódó források

- [AI hibakeresés](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Éles AI gyakorlatok](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->