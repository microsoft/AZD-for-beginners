# Kapitola 5: Viacagentné AI riešenia

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Doba trvania**: 2-3 hodiny | **⭐ Zložitosť**: Pokročilá

---

## Prehľad

Táto kapitola pokrýva pokročilé vzory architektúry viacagentných systémov, orchestráciu agentov a nasadenia AI pripravené do produkcie pre zložité scenáre.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Pochopíte vzory architektúry viacagentných systémov
- Nasadíte koordinované viacagentné AI systémy
- Implementujete komunikáciu medzi agentmi
- Vybudujete produkčne pripravené viacagentné riešenia

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Maloobchodný viacagentný systém](../../examples/retail-scenario.md) | Kompletné prechádzanie implementácie | 90 min |
| 2 | [Vzory koordinácie](../chapter-06-pre-deployment/coordination-patterns.md) | Stratégie orchestrácie agentov | 30 min |
| 3 | [Nasadenie ARM šablóny](../../examples/retail-multiagent-arm-template/README.md) | Nasadenie jedným kliknutím | 30 min |

---

## 🚀 Rýchly štart

```bash
# Nasadiť maloobchodné viacagentné riešenie
cd examples/retail-multiagent-arm-template
./deploy.sh

# Alebo použite šablónu priamo
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Viacagentná architektúra

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

## 🎯 Predstavené riešenie: Maloobchodný viacagentný systém

The [Maloobchodný viacagentný systém](../../examples/retail-scenario.md) ukazuje:

- **Agent zákazníka**: Zabezpečuje interakcie s používateľom a jeho preferencie
- **Agent zásob**: Spravuje sklad a spracovanie objednávok
- **Orchestrátor**: Koordinuje činnosť agentov
- **Zdieľaná pamäť**: Riadenie kontextu medzi agentmi

### Použité služby

| Služba | Účel |
|---------|---------|
| Azure OpenAI | Porozumenie jazyku |
| Azure AI Search | Katalóg produktov |
| Cosmos DB | Stav a pamäť agenta |
| Container Apps | Hostovanie agentov |
| Application Insights | Monitorovanie |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 4: Infraštruktúra](../chapter-04-infrastructure/README.md) |
| **Nasledujúca** | [Kapitola 6: Pred nasadením](../chapter-06-pre-deployment/README.md) |

---

## 📖 Súvisiace zdroje

- [Sprievodca AI agentmi](../chapter-02-ai-development/agents.md)
- [Produkčné postupy AI](../chapter-08-production/production-ai-practices.md)
- [Riešenie problémov s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou služby AI prekladu Co-op Translator (https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->