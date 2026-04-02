# Chapter 2: Vývoj s prioritou na AI

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 1-2 hodiny | **⭐ Náročnosť**: Stredná

---

## Prehľad

Táto kapitola sa zameriava na nasadenie aplikácií poháňaných AI pomocou Azure Developer CLI a služieb Microsoft Foundry. Od jednoduchých AI chatovacích aplikácií až po inteligentných agentov s nástrojmi.

> **Poznámka k validácii (2026-03-25):** Priebeh príkazov a pokyny k rozšíreniam v tejto kapitole boli skontrolované voči `azd` `1.23.12` a aktuálnej ukážkovej verzii AI agent rozšírenia `azure.ai.agents` `0.1.18-preview`. Ak používate staršiu verziu AZD, najskôr aktualizujte a potom pokračujte v cvičeniach.

## Ciele učenia

Dokončením tejto kapitoly budete vedieť:
- Nasadiť AI aplikácie pomocou predpripravených AZD šablón
- Pochopiť integráciu Microsoft Foundry s AZD
- Konfigurovať a prispôsobiť AI agentov s nástrojmi
- Nasadiť RAG (Retrieval-Augmented Generation) aplikácie

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Integrácia Microsoft Foundry](microsoft-foundry-integration.md) | Prepojiť AZD so službami Foundry | 30 min |
| 2 | [Sprievodca AI agentmi](agents.md) | Nasadiť inteligentných agentov s nástrojmi | 45 min |
| 3 | [Nasadenie AI modelu](ai-model-deployment.md) | Nasadiť a nakonfigurovať AI modely | 30 min |
| 4 | [AI Workshop Laboratórium](ai-workshop-lab.md) | Prakticky: Pripravte svoje AI riešenie na AZD | 60 min |

---

## 🚀 Rýchly štart

```bash
# Možnosť 1: RAG Chat aplikácia
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
| Vývojové | 80-150 $ |
| Testovacie | 150-300 $ |
| Produkčné | 300-3 500+ $ |

**Tip:** Po testovaní spustite `azd down`, aby ste predišli poplatkom.

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 1: Základy](../chapter-01-foundation/README.md) |
| **Nasledujúca** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |
| **Preskočiť na** | [Kapitola 8: Produkčné vzory](../chapter-08-production/README.md) |

---

## 📖 Súvisiace zdroje

- [Riešenie problémov s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produkčné AI praktiky](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, upozorňujeme, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->