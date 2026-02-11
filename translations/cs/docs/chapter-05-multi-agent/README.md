# Kapitola 5: Řešení AI s více agenty

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 2-3 hodiny | **⭐ Složitost**: Pokročilé

---

## Přehled

Tato kapitola pokrývá pokročilé vzory architektury více agentů, orchestraci agentů a produkčně připravená nasazení AI pro složité scénáře.

## Výukové cíle

Po dokončení této kapitoly budete:
- Rozumět vzorům architektury více agentů
- Nasadit koordinované systémy AI agentů
- Implementovat komunikaci mezi agenty
- Vytvořit produkčně připravená řešení s více agenty

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Maloobchodní řešení s více agenty](../../examples/retail-scenario.md) | Kompletní průvodce implementací | 90 min |
| 2 | [Koordinační vzory](../chapter-06-pre-deployment/coordination-patterns.md) | Strategie orchestrace agentů | 30 min |
| 3 | [Nasazení ARM šablony](../../examples/retail-multiagent-arm-template/README.md) | Jednoklikové nasazení | 30 min |

---

## 🚀 Rychlý start

```bash
# Nasadit maloobchodní řešení s více agenty
cd examples/retail-multiagent-arm-template
./deploy.sh

# Nebo použijte šablonu přímo
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Architektura více agentů

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

## 🎯 Doporučené řešení: Maloobchodní řešení s více agenty

[Maloobchodní řešení s více agenty](../../examples/retail-scenario.md) demonstruje:

- **Agent zákazníka**: Zpracovává interakce s uživatelem a preference
- **Agent skladu**: Spravuje zásoby a zpracování objednávek
- **Orchestrátor**: Koordinuje spolupráci mezi agenty
- **Sdílená paměť**: Správa kontextu mezi agenty

### Použité služby

| Služba | Účel |
|---------|---------|
| Azure OpenAI | Porozumění jazyku |
| Azure AI Search | Katalog produktů |
| Cosmos DB | Stav a paměť agenta |
| Container Apps | Hostování agentů |
| Application Insights | Monitorování |

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| **Další** | [Kapitola 6: Před nasazením](../chapter-06-pre-deployment/README.md) |

---

## 📖 Související zdroje

- [Průvodce AI agenty](../chapter-02-ai-development/agents.md)
- [Postupy pro produkční AI](../chapter-08-production/production-ai-practices.md)
- [Řešení problémů s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí služby pro překlad pomocí umělé inteligence Co-op Translator (https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za závazný zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědni za žádná nedorozumění nebo mylné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->