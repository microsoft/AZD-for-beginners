# Kapitola 5: Riešenia AI s viacagentovou architektúrou

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 2-3 hodiny | **⭐ Náročnosť**: Pokročilá

---

## Prehľad

Táto kapitola sa venuje pokročilým vzorcom viacagentovej architektúry, orchestrácii agentov a nasadeniu AI pripraveného na produkciu pre komplexné scenáre.

> Overené s `azd 1.23.12` v marci 2026.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Rozumieť viacagentovým architektonickým vzorcom
- Nasadzovať koordinované systémy AI agentov
- Implementovať komunikáciu medzi agentmi
- Vytvárať produkčne pripravené viacagentové riešenia

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------|-----|
| 1 | [Riešenie pre maloobchod s viac agentmi](../../examples/retail-scenario.md) | Kompletný prechod implementáciou | 90 min |
| 2 | [Vzory koordinácie](../chapter-06-pre-deployment/coordination-patterns.md) | Stratégie orchestrácie agentov | 30 min |
| 3 | [Nasadenie ARM šablóny](../../examples/retail-multiagent-arm-template/README.md) | Nasadenie jedným kliknutím | 30 min |

---

## 🚀 Rýchly štart

```bash
# Možnosť 1: Nasadiť z šablóny
azd init --template agent-openai-python-prompty
azd up

# Možnosť 2: Nasadiť z manifestu agenta (vyžaduje rozšírenie azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Ktorý prístup?** Použite `azd init --template` na začiatok s fungujúcim príkladom. Použite `azd ai agent init`, keď máte vlastný manifest agenta. Pozrite si [referenciu AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pre úplné detaily.

---

## 🤖 Viacagentová architektúra

```mermaid
graph TD
    Orchestrator[Orchestrátor Agent<br/>Prenáša požiadavky, spravuje pracovný tok] --> Customer[Agent zákazníka<br/>Dotazy používateľa, preferencie]
    Orchestrator --> Inventory[Agent zásob<br/>Stavy zásob, objednávky]
```
---

## 🎯 Vybrané riešenie: Maloobchodné viacagentové riešenie

[Riešenie Maloobchod s viac agentmi](../../examples/retail-scenario.md) demonštruje:

- **Agent zákazníka**: Rieši interakcie používateľa a preferencie
- **Agent zásob**: Spravuje sklad a spracovanie objednávok
- **Orchestrátor**: Koordinuje medzi agentmi
- **Zdieľaná pamäť**: Správa kontextu medzi agentmi

### Použité služby

| Služba | Účel |
|--------|-------|
| Microsoft Foundry Models | Porozumenie jazyka |
| Azure AI Search | Katalóg produktov |
| Cosmos DB | Stav a pamäť agentov |
| Container Apps | Hosting agentov |
| Application Insights | Monitorovanie |

---

## 🔗 Navigácia

| Smer | Kapitola |
|-------|---------|
| **Predchádzajúca** | [Kapitola 4: Infraštruktúra](../chapter-04-infrastructure/README.md) |
| **Nasledujúca** | [Kapitola 6: Pred nasadením](../chapter-06-pre-deployment/README.md) |

---

## 📖 Súvisiace zdroje

- [Sprievodca AI agentmi](../chapter-02-ai-development/agents.md)
- [Produkčné praktiky AI](../chapter-08-production/production-ai-practices.md)
- [Riešenie problémov AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie je odporúčaný profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->