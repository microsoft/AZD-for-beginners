# Kapitola 2: Vývoj orientovaný na AI

**📚 Kurz**: [AZD For Beginners](../../README.md) | **⏱️ Trvanie**: 1-2 hodiny | **⭐ Zložitosť**: Stredná

---

## Prehľad

Táto kapitola sa zameriava na nasadzovanie aplikácií poháňaných AI pomocou Azure Developer CLI a služieb Microsoft Foundry. Od jednoduchých AI chatovacích aplikácií až po inteligentných agentov s nástrojmi.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Nasadíte AI aplikácie pomocou predpripravených AZD šablón
- Pochopíte integráciu Microsoft Foundry s AZD
- Konfigurujete a prispôsobíte AI agentov s nástrojmi
- Nasadíte RAG (Retrieval-Augmented Generation) aplikácie

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Integrácia Microsoft Foundry](microsoft-foundry-integration.md) | Pripojiť AZD k službám Foundry | 30 min |
| 2 | [Sprievodca AI agentmi](agents.md) | Nasadiť inteligentných agentov s nástrojmi | 45 min |
| 3 | [Nasadenie AI modelov](ai-model-deployment.md) | Nasadiť a nakonfigurovať AI modely | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktické cvičenie: Pripraviť vaše AI riešenie pre AZD | 60 min |

---

## 🚀 Rýchly štart

```bash
# Možnosť 1: RAG chatová aplikácia
azd init --template azure-search-openai-demo
azd up

# Možnosť 2: Agenti umelej inteligencie
azd init --template get-started-with-ai-agents
azd up

# Možnosť 3: Rýchla chatová aplikácia
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Vybrané AI šablóny

| Šablóna | Popis | Služby |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citáciami | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s nástrojmi | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Základný AI chat | OpenAI + Container Apps |

---

## 💰 Prehľad nákladov

| Prostredie | Odhadované mesačné náklady |
|-------------|----------------------|
| Vývoj | $80-150 |
| Predprodukcia | $150-300 |
| Produkcia | $300-3,500+ |

**Tip:** Spustite `azd down` po testovaní, aby ste predišli poplatkom.

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúce** | [Kapitola 1: Základy](../chapter-01-foundation/README.md) |
| **Ďalšie** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |
| **Preskočiť na** | [Kapitola 8: Produkčné vzory](../chapter-08-production/README.md) |

---

## 📖 Súvisiace zdroje

- [Riešenie problémov s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Postupy pre produkčné AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou služby prekladu založenej na umelej inteligencii [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre dôležité informácie sa odporúča odborný ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->