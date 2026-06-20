# 5. fejezet: Többügynökös MI megoldások

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 2-3 óra | **⭐ Bonyolultság**: Haladó

---

## Áttekintés

Ez a fejezet összetett többügynökös architektúra mintákat, ügynökök koordinálását és termelésre kész MI telepítéseket ismertet bonyolult forgatókönyvek esetén.

> Tesztelve az `azd 1.25.6` verzióval 2026 júniusában.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- Megérteni a többügynökös architektúra mintákat
- Koordinált MI ügynök rendszerek telepítésére
- Ügynökök közötti kommunikáció megvalósítására
- Termelésre kész többügynökös megoldások építésére

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Többügynökös alapok](multi-agent-basics.md) | Gyakorlati: működő többügynökös alkalmazás telepítése `azd up` segítségével | 45 perc |
| 2 | [Koordinációs minták](../chapter-06-pre-deployment/coordination-patterns.md) | Ügynök koordinációs stratégiák (folytatódik a 6. fejezetben) | 30 perc |
| 3 | [ARM sablon telepítés](../../examples/retail-multiagent-arm-template/README.md) | Egykattintásos telepítési példa | 30 perc |

> **Kezdd az 1. leckével!** Ez az egyetlen teljesen gyakorlati, telepíthető lecke ebben a fejezetben. A 2. lecke a 6. fejezetben van (előtelepítési tervezéssel együtt), a [Kiskereskedelmi Többügynökös Megoldás](../../examples/retail-scenario.md) pedig egy architektúra tervrajz – tervezési referencia, nem egy parancssoros sablon.

---

## 🚀 Gyors indítás

```bash
# 1. lehetőség: Kiadás sablonból
azd init --template agent-openai-python-prompty
azd up

# 2. lehetőség: Kiadás ügynök manifesztből (az azure.ai.agents bővítményt igényli)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Melyik megközelítést válasszuk?** Használd az `azd init --template` parancsot egy működő mintából való induláshoz. Az `azd ai agent init` parancsot akkor használd, ha saját ügynök-nyilatkozatod van. Lásd az [AZD MI CLI referenciát](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) a teljes részletekért.

---

## 🤖 Többügynökös architektúra

```mermaid
graph TD
    Orchestrator[Orchestrátor Ügynök<br/>Kérelmek irányítása, munkafolyamat kezelése] --> Customer[Vevő Ügynök<br/>Felhasználói lekérdezések, preferenciák]
    Orchestrator --> Inventory[Készlet Ügynök<br/>Készletszintek, megrendelések]
```

---

## 🎯 Kiemelt megoldás: Kiskereskedelmi többügynökös rendszer

A [Kiskereskedelmi Többügynökös Megoldás](../../examples/retail-scenario.md) bemutatja:

- **Ügyfélügynök**: Kezeli a felhasználói interakciókat és preferenciákat
- **Készletügynök**: Kezeli a készletet és a megrendeléseket
- **Koordinátor**: Ügynökök közötti összehangolás
- **Megosztott memória**: Ügynökök közötti kontextuskezelés

### Használt szolgáltatások

| Szolgáltatás | Cél |
|---------|---------|
| Microsoft Foundry Models | Nyelvi megértés |
| Azure MI Keresés | Termékkatalógus |
| Cosmos DB | Ügynök állapot és memória |
| Konténer alkalmazások | Ügynök hosztolás |
| Application Insights | Monitorozás |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [4. fejezet: Infrastruktúra](../chapter-04-infrastructure/README.md) |
| **Következő** | [6. fejezet: Előtelepítés](../chapter-06-pre-deployment/README.md) |

---

## 📖 Kapcsolódó források

- [MI Ügynökök Útmutató](../chapter-02-ai-development/agents.md)
- [Termelésre szánt MI gyakorlatok](../chapter-08-production/production-ai-practices.md)
- [MI hibakeresés](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->