# Chapter 5: Multi-Agent AI Solutions

**📚 Tanfolyam**: [AZD For Beginners](../../README.md) | **⏱️ Időtartam**: 2-3 óra | **⭐ Bonyolultság**: Haladó

---

## Áttekintés

Ez a fejezet a fejlett többügynökös architektúra mintákat, az ügynökök összehangolását és az élesbe vihető AI telepítéseket tárgyalja összetett forgatókönyvekhez.

## Tanulási célok

A fejezet teljesítése után:
- Megérteni a többügynökös architektúra mintáit
- Koordinált AI ügynök rendszerek telepítése
- Ügynökök közötti kommunikáció megvalósítása
- Gyártásra kész többügynökös megoldások építése

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Retail Multi-Agent Solution](../../examples/retail-scenario.md) | Teljes megvalósítás bemutatása | 90 perc |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | Ügynök összehangolási stratégiák | 30 perc |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | Egykattintásos telepítés | 30 perc |

---

## 🚀 Gyors kezdés

```bash
# Telepítse a kiskereskedelmi többügynökös megoldást
cd examples/retail-multiagent-arm-template
./deploy.sh

# Vagy használja közvetlenül a sablont
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Többügynökös architektúra

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

## 🎯 Kiemelt megoldás: Kiskereskedelmi többügynökös

A [Retail Multi-Agent Solution](../../examples/retail-scenario.md) bemutatja:

- **Ügyfélügynök**: Kezeli a felhasználói interakciókat és preferenciákat
- **Készletügynök**: Kezeli a készletet és a megrendelés feldolgozását
- **Orkesztrátor**: Összehangolja az ügynökök közötti működést
- **Megosztott memória**: Ügynökök közötti kontextus kezelése

### Használt szolgáltatások

| Service | Purpose |
|---------|---------|
| Azure OpenAI | Nyelvi megértés |
| Azure AI Search | Termékkatalógus |
| Cosmos DB | Ügynök állapot és memória |
| Container Apps | Ügynök hosztolása |
| Application Insights | Megfigyelés |

---

## 🔗 Navigáció

| Direction | Chapter |
|-----------|---------|
| **Előző** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| **Következő** | [Chapter 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |

---

## 📖 Kapcsolódó források

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ezt a dokumentumot a [Co-op Translator](https://github.com/Azure/co-op-translator) nevű mesterséges intelligencia alapú fordítószolgáltatással fordítottuk le. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus jelentőségű információk esetén professzionális, emberi fordítást javaslunk. Nem vállalunk felelősséget a jelen fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->