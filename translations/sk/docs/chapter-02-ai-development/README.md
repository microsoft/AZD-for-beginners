# Kapitola 2: Vývoj s prioritou AI

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Dĺžka**: 4-5 hodín vrátane workshopu | **⭐ Zložitosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola sa zameriava na nasadzovanie aplikácií poháňaných AI pomocou nástroja Azure Developer CLI a služieb Microsoft Foundry. Od jednoduchých AI chatovacích aplikácií po inteligentných agentov s nástrojmi.

> **Revizia vydania (2026-11-04):** AI CLI návod bol overený v publikovanej dokumentácii/zdrojoch `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` a `azure.ai.evaluations` `1.0.0-beta.2`. Použite `azd >= 1.37.0` pre kombinovaný pracovný tok. Hodnotenia teraz používajú samostatný namespace `azd ai eval`; pozrite si [zmeny v vydaní a pokyny na migráciu](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Toto nie je validácia živého nasadenia.

## Výukové ciele

Po dokončení tejto kapitoly budete:
- Nasadzovať AI aplikácie pomocou predpripravených šablón AZD
- Pochopiť integráciu Microsoft Foundry s AZD
- Konfigurovať a prispôsobiť AI agentov s nástrojmi
- Nasadzovať aplikácie RAG (Retrieval-Augmented Generation)

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Integrácia Microsoft Foundry](microsoft-foundry-integration.md) | Prepojenie AZD so službami Foundry | 30 min |
| 2 | [Sprievodca AI agentmi](agents.md) | Nasadzovanie inteligentných agentov s nástrojmi | 45 min |
| 3 | [Nasadenie AI modelu](ai-model-deployment.md) | Nasadenie a konfigurácia AI modelov | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Prakticky: Preskúmajte šablónu a naplánujte konverziu | 2-3 hodiny |

---

## 🚀 Rýchly štart

Vyberte si jednu možnosť v novom prázdnom adresári. Koncový `.` inicializuje aktuálny adresár; inak AZD môže vytvoriť podadresár bez zmeny pracovného adresára shellu.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Odporúčané AI šablóny

| Šablóna | Popis | Služby |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citáciami | OpenAI + AI Vyhľadávanie |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s nástrojmi | Služba AI agentov |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Základný AI chat | OpenAI + Kontajnerové aplikácie |

---

## 💰 Povšimnutie nákladov

Toto sú orientačné rozsahy, nie ceny alebo limity; objem modelu, SKU vyhľadávania/výpočtu, región a voliteľné funkcie môžu tieto hodnoty prekročiť. Pred poskytnutím si skontrolujte aktuálne cenové pokyny zvoleného príkladu.

| Prostredie | Odhadované mesačné náklady |
|-------------|----------------------|
| Vývoj | $80-150 |
| Testovanie | $150-300 |
| Produkcia | $300-3,500+ |

**Tip:** Spustite `azd down` po testovaní, aby ste sa vyhli poplatkom.

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