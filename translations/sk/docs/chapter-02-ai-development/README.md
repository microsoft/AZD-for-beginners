# Kapitola 2: Vývoj orientovaný na AI

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Doba trvania**: 1-2 hours | **⭐ Náročnosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola sa zameriava na nasadzovanie aplikácií poháňaných AI pomocou Azure Developer CLI a služieb Microsoft Foundry. Od jednoduchých AI chatovacích aplikácií po inteligentných agentov s nástrojmi.

> **Validation note (2026-06-15):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.25.6` and the current preview AI agent extension release `azure.ai.agents` `0.1.40-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## Ciele učenia

Po dokončení tejto kapitoly budete:
- Nasadzovať AI aplikácie pomocou predpripravených AZD šablón
- Rozumieť integrácii Microsoft Foundry s AZD
- Konfigurovať a prispôsobovať AI agentov s nástrojmi
- Nasadzovať RAG (Retrieval-Augmented Generation) aplikácie

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Integrácia Microsoft Foundry](microsoft-foundry-integration.md) | Prepojte AZD so službami Foundry | 30 min |
| 2 | [Sprievodca AI agentmi](agents.md) | Nasadiť inteligentných agentov s nástrojmi | 45 min |
| 3 | [Nasadenie AI modelu](ai-model-deployment.md) | Nasadiť a nakonfigurovať AI modely | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Prakticky: Pripravte svoje AI riešenie pre AZD | 60 min |

---

## 🚀 Rýchly štart

```bash
# Možnosť 1: RAG chatová aplikácia
azd init --template azure-search-openai-demo
azd up

# Možnosť 2: AI agenti
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

## 💰 Informácie o nákladoch

| Prostredie | Odhadované mesačné náklady |
|-------------|----------------------|
| Vývoj | $80-150 |
| Testovacie prostredie | $150-300 |
| Produkčné | $300-3,500+ |

**Tip:** Spustite `azd down` po testovaní, aby ste sa vyhli poplatkom.

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 1: Základy](../chapter-01-foundation/README.md) |
| **Ďalšia** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |
| **Prejsť na** | [Kapitola 8: Produkčné vzory](../chapter-08-production/README.md) |

---

## 📖 Súvisiace zdroje

- [Riešenie problémov s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Praktiky pre produkčné AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->