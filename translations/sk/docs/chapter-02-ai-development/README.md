# Kapitola 2: Vývoj s prioritou AI

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 1-2 hodiny | **⭐ Zložitosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola sa zameriava na nasadzovanie aplikácií poháňaných AI pomocou Azure Developer CLI a služieb Microsoft Foundry. Od jednoduchých AI chat aplikácií po inteligentných agentov s nástrojmi.

> **Poznámka k overeniu (2026-07-13):** Tok príkazov a návody k rozšíreniam v tejto kapitole boli preskúmané vzhľadom na `azd` `1.27.1` a aktuálne vydanie rozšírenia AI agentov v preview `azure.ai.agents` `1.0.0-beta.5`. Ak používate staršiu verziu AZD, najprv ju aktualizujte a potom pokračujte v cvičeniach.

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
| 1 | [Integrácia Microsoft Foundry](microsoft-foundry-integration.md) | Prepojenie AZD so službami Foundry | 30 min |
| 2 | [Sprievodca AI agentmi](agents.md) | Nasadenie inteligentných agentov s nástrojmi | 45 min |
| 3 | [Nasadenie AI modelov](ai-model-deployment.md) | Nasadenie a konfigurácia AI modelov | 30 min |
| 4 | [AI workshop laboratórium](ai-workshop-lab.md) | Prakticky: Pripravte vaše AI riešenie pre AZD | 60 min |

---

## 🚀 Rýchly štart

```bash
# Možnosť 1: RAG Chat aplikácia
azd init --template azure-search-openai-demo
azd up

# Možnosť 2: AI agenti
azd init --template get-started-with-ai-agents
azd up

# Možnosť 3: Rýchla chat aplikácia
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Odporúčané AI šablóny

| Šablóna | Popis | Služby |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citáciami | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s nástrojmi | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Základný AI chat | OpenAI + Container Apps |

---

## 💰 Informácie o nákladoch

| Prostredie | Odhadované mesačné náklady |
|-------------|--------------------------|
| Vývoj | 80-150 $ |
| Testovacie prostredie | 150-300 $ |
| Produkcia | 300-3 500+ $ |

**Tip:** Po testovaní spustite `azd down`, aby ste sa vyhli poplatkom.

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
- [Produkčné praktiky AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->