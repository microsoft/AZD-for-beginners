# Kapitola 5: Multiagentní AI řešení

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 2-3 hodiny | **⭐ Složitost**: Pokročilý

---

## Přehled

Tato kapitola pokrývá pokročilé vzory multiagentní architektury, orchestraci agentů a produkčně připravená AI nasazení pro složité scénáře.

> Ověřeno s `azd 1.23.12` v březnu 2026.

## Výukové cíle

Po dokončení této kapitoly budete:
- Rozumět vzorům multiagentní architektury
- Nasazovat koordinované systémy AI agentů
- Implementovat komunikaci mezi agenty
- Vytvářet produkčně připravená multiagentní řešení

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Retail Multi-Agent Solution](../../examples/retail-scenario.md) | Kompletní průvodce implementací | 90 min |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | Strategie orchestrace agentů | 30 min |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | Nasazení jedním kliknutím | 30 min |

---

## 🚀 Rychlý start

```bash
# Možnost 1: Nasadit z šablony
azd init --template agent-openai-python-prompty
azd up

# Možnost 2: Nasadit z manifestu agenta (vyžaduje rozšíření azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Který přístup?** Použijte `azd init --template` pro start ze vzorového řešení. Použijte `azd ai agent init`, pokud máte vlastní manifest agenta. Kompletní informace najdete v [AZD AI CLI referenci](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

---

## 🤖 Multiagentní architektura

```mermaid
graph TD
    Orchestrator[Orchestrace Agent<br/>Řídí požadavky, spravuje pracovní postup] --> Customer[Agent zákazníka<br/>Dotazy uživatelů, preference]
    Orchestrator --> Inventory[Agent skladu<br/>Stavy zásob, objednávky]
```
---

## 🎯 Doporučené řešení: Retail Multi-Agent

[Řešení Retail Multi-Agent](../../examples/retail-scenario.md) demonstruje:

- **Agent zákazníka**: Zpracovává uživatelské interakce a preference
- **Agent zásob**: Spravuje sklad a zpracování objednávek
- **Orchestrátor**: Koordinuje mezi agenty
- **Sdílená paměť**: Správa kontextu mezi agenty

### Použité služby

| Služba | Účel |
|---------|---------|
| Microsoft Foundry Models | Porozumění jazyku |
| Azure AI Search | Produktový katalog |
| Cosmos DB | Stav a paměť agenta |
| Container Apps | Hostování agentů |
| Application Insights | Monitorování |

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 4: Infrastruktura](../chapter-04-infrastructure/README.md) |
| **Další** | [Kapitola 6: Před nasazením](../chapter-06-pre-deployment/README.md) |

---

## 📖 Související zdroje

- [Průvodce AI agenty](../chapter-02-ai-development/agents.md)
- [Produkční AI postupy](../chapter-08-production/production-ai-practices.md)
- [Řešení problémů s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné výklady vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->