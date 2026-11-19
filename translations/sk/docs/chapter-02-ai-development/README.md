# Kapitola 2: Vývoj orientovaný na AI

**📚 Kurz**: [AZD pre začiatočníkov](../../README.md) | **⏱️ Trvanie**: 4-5 hodín vrátane workshopu | **⭐ Zložitosť**: Stredne pokročilý

---

## Prehľad

Táto kapitola sa zameriava na nasadzovanie aplikácií podporovaných AI pomocou Azure Developer CLI a služieb Microsoft Foundry. Od jednoduchých AI chatovacích aplikácií až po inteligentných agentov s nástrojmi.

> **Aktualizácia Foundry GA (2026-11-09):** Balík `microsoft.foundry` 1.0 je [vo všeobecnej dostupnosti](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Používajte `azd >= 1.37.0`; hodnotenia zostávajú samostatnou inštaláciou. [Prehliadka hostovaného agenta](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) pokrýva testovanie lokálneho Agent Inspector a vzdialené nasadenie kódu. Toto je prehľad dokumentácie, nie overenie živého nasadenia; voliteľné náhľadové funkcie si zachovávajú svoj vlastný stav.

## Výučbové ciele

Po dokončení tejto kapitoly budete schopní:
- Nasadzovať AI aplikácie pomocou predpripravených šablón AZD
- Pochopiť integráciu Microsoft Foundry s AZD
- Nainštalovať GA balík a otestovať hostovaného agenta lokálne pred nasadením jeho zdrojového kódu do Foundry
- Preskúmať `azure.yaml`, hodnotiace prostriedky a čistenie nových verzus znovu použitých projektov
- Konfigurovať a prispôsobovať AI agentov s nástrojmi
- Nasadzovať RAG (Retrieval-Augmented Generation) aplikácie

---

## 📚 Lekcie

| # | Lekcia | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Integrácia Microsoft Foundry](microsoft-foundry-integration.md) | GA balík, workflow lokálneho a cloud hostovaného agenta, a hodnotenia | 60 min |
| 2 | [Sprievodca AI agentmi](agents.md) | Nasadenie inteligentných agentov s nástrojmi | 45 min |
| 3 | [Nasadenie AI modelu](ai-model-deployment.md) | Nasadenie a konfigurácia AI modelov | 30 min |
| 4 | [AI Workshop Laboratórium](ai-workshop-lab.md) | Praktické: Preskúmajte šablónu a naplánujte konverziu | 2-3 hodiny |

---

## 🚀 Rýchly štart

Vyberte jednu možnosť v novom prázdnom adresári. Koncový `.` inicializuje aktuálny adresár; inak môže AZD vytvoriť podadresár bez zmeny pracovného adresára vášho shellu.

Pre **cestu nasadenia kódu GA hostovaného agenta** začnite s [riadenou prehliadkou](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Vyžaduje AZD 1.37.0+, aktuálny uv, Python 3.13+, Foundry oprávnenia a kvótu modelu. Kompletné šablóny aplikácií nižšie sú alternatívy, nie predpoklady pre túto prehliadku.

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

## 🤖 Doporučené AI šablóny

| Šablóna | Popis | Služby |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citáciami | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s nástrojmi | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Základný AI chat | OpenAI + Container Apps |

---

## 💰 Povedomie o nákladoch

Toto sú ilustračné rozsahy, nie cenové ponuky alebo limity; premávka modelov, SKU vyhľadávania/výpočtu, región a voliteľné funkcie ich môžu prekročiť. Pred nasadením si overte aktuálne cenové pokyny pre vybraný príklad.

| Prostredie | Odhadované mesačné náklady |
|-------------|----------------------|
| Vývoj | $80-150 |
| Testovanie | $150-300 |
| Produkcia | $300-3,500+ |

**Vyčistenie:** Pred potvrdením si preverte `azd down`: pre novo vytvorený projekt Foundry vymaže skupinu zdrojov a všetko v nej. Pre znovu použitý projekt Foundry ponechá zdroje projektu a agenta na mieste; postupujte podľa [návodu na čistenie](microsoft-foundry-integration.md#7-clean-up-deliberately), aby ste neželané zdroje odstránili samostatne.

---

## 🔗 Navigácia

| Smer | Kapitola |
|-----------|---------|
| **Predchádzajúca** | [Kapitola 1: Základy](../chapter-01-foundation/README.md) |
| **Ďalšia** | [Kapitola 3: Konfigurácia](../chapter-03-configuration/README.md) |
| **Preskočiť na** | [Kapitola 8: Produkčné vzory](../chapter-08-production/README.md) |

---

## 📖 Súvisiace zdroje

- [Riešenie problémov s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produkčné postupy AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->