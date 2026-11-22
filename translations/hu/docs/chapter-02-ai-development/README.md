# 2. fejezet: AI-első fejlesztés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 4-5 óra, beleértve a műhelymunkát | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet az AI-alapú alkalmazások telepítésére koncentrál az Azure Developer CLI és a Microsoft Foundry szolgáltatások használatával. Egyszerű AI chat alkalmazásoktól az eszközökkel rendelkező intelligens ügynökökig.

> **Foundry GA frissítés (2026-11-09):** Az `microsoft.foundry` 1.0 csomag [általánosan elérhető](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Használja az `azd >= 1.37.0`; az értékelések külön telepítést igényelnek. A [hosted-agent útmutató](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) lefedi a helyi Agent Inspector tesztelést és a távoli kód telepítést. Ez dokumentációs áttekintés, nem élő telepítés validáció; az opcionális előzetes funkciók megőrzik saját státuszukat.

## Tanulási célok

E fejezet elvégzésével képes lesz:
- AI alkalmazásokat telepíteni előre elkészített AZD sablonokkal
- Megérteni a Microsoft Foundry integrációját az AZD-vel
- Telepíteni a GA csomagot, és helyileg tesztelni egy hosted agentet mielőtt forrását a Foundry-be telepítené
- Áttekinteni az `azure.yaml`-t, az értékelési eszközöket és az új versus újrahasznosított projekt tisztítást
- Konfigurálni és testreszabni AI ügynököket eszközökkel
- RAG (Retrieval-Augmented Generation) alkalmazásokat telepíteni

---

## 📚 Tanórák

| # | Tanóra | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integráció](microsoft-foundry-integration.md) | GA csomag, hosted-agent helyi és felhős munkafolyamat, értékelések | 60 perc |
| 2 | [AI Ügynökök Útmutató](agents.md) | Intelligens ügynökök telepítése eszközökkel | 45 perc |
| 3 | [AI Modell Telepítés](ai-model-deployment.md) | AI modellek telepítése és konfigurálása | 30 perc |
| 4 | [AI Műhely Labor](ai-workshop-lab.md) | Gyakorlati: Sablon felfedezése és konverzió megtervezése | 2-3 óra |

---

## 🚀 Gyors kezdés

Válasszon egy lehetőséget egy új, üres könyvtárban. A végző `.` inicializálja az aktuális könyvtárat; ellenkező esetben az AZD létrehozhat egy alkönyvtárat anélkül, hogy módosítaná a shell munkakönyvtárát.

A **GA hosted-agent kódtelepítési folyamatához** kezdje a [vezetett útmutatóval](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Ehhez AZD 1.37.0+, aktuális uv, Python 3.13+, Foundry jogosultságok és modell kvóta szükséges. Az alábbi teljes alkalmazás sablonok alternatívák, nem feltételek az útmutatóhoz.

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

## 🤖 Kiemelt AI Sablonok

| Sablon | Leírás | Szolgáltatások |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat hivatkozásokkal | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI ügynök eszközökkel | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Alap AI chat | OpenAI + Container Apps |

---

## 💰 Költségtudatosság

Ezek szemléltető tartományok, nem árajánlatok vagy plafonok; a modell forgalom, Search/compute SKU-k, régió és opcionális funkciók meghaladhatják azokat. Tekintse át kiválasztott minta aktuális árazási iránymutatását a szolgáltatás előfizetése előtt.

| Környezet | Becslés havidíj |
|-------------|----------------------|
| Fejlesztés | 80-150 $ |
| Tesztelés | 150-300 $ |
| Éles | 300-3,500+ $ |

**Tisztítás:** Ellenőrizze az `azd down` használatát megerősítés előtt: újonnan létrehozott Foundry projekt esetén törli az erőforráscsoportot és minden benne lévőt. Újrahasznosított Foundry projektnél megtartja a projektet és az ügynök erőforrásokat; kövesse a [útmutató tisztítási tanácsait](microsoft-foundry-integration.md#7-clean-up-deliberately), hogy külön távolítsa el a nem kívánt erőforrásokat.

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
- [Alkalmazás elemzések](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->