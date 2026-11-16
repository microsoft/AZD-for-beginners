# Kapitola 2: AI-First Vývoj

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Délka**: 4-5 hodin včetně workshopu | **⭐ Složitost**: Středně pokročilá

---

## Přehled

Tato kapitola se zaměřuje na nasazování aplikací poháněných AI pomocí Azure Developer CLI a služeb Microsoft Foundry. Od jednoduchých AI chatovacích aplikací po inteligentní agenty s nástroji.

> **Revize vydání (2026-11-04):** AI CLI pokyny byly ověřeny proti publikovaným dokumentacím/zdrojům `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, a `azure.ai.evaluations` `1.0.0-beta.2`. Pro kombinovaný pracovní postup použijte `azd >= 1.37.0`. Hodnocení nyní používají samostatný jmenný prostor `azd ai eval`; viz [změny ve vydání a pokyny k migraci](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Toto není validace nasazení v živém provozu.

## Cíle učení

Po dokončení této kapitoly budete schopni:
- Nasazovat AI aplikace pomocí předpřipravených šablon AZD
- Rozumět integraci Microsoft Foundry s AZD
- Konfigurovat a přizpůsobovat AI agenty s nástroji
- Nasazovat RAG (Retrieval-Augmented Generation) aplikace

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Integrace Microsoft Foundry](microsoft-foundry-integration.md) | Propojení AZD se službami Foundry | 30 min |
| 2 | [Průvodce AI Agenty](agents.md) | Nasazení inteligentních agentů s nástroji | 45 min |
| 3 | [Nasazení AI Modelů](ai-model-deployment.md) | Nasazení a konfigurace AI modelů | 30 min |
| 4 | [AI Workshop Laboratoř](ai-workshop-lab.md) | Prakticky: Prozkoumejte šablonu a naplánujte konverzi | 2-3 hodiny |

---

## 🚀 Rychlý start

Vyberte jednu možnost v novém prázdném adresáři. Koncový `.` inicializuje aktuální adresář; jinak může AZD vytvořit podsložku bez změny pracovního adresáře shellu.

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

## 🤖 Doporučené AI šablony

| Šablona | Popis | Služby |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citacemi | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s nástroji | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Základní AI chat | OpenAI + Container Apps |

---

## 💰 Povšimněte si nákladů

Toto jsou ilustrativní rozpětí, ne nabídky nebo limity; provoz modelu, instance Search/výpočetní jednotky, region a volitelné funkce je mohou překročit. Před nasazením si zkontrolujte aktuální ceník zvoleného vzoru.

| Prostředí | Odhadované měsíční náklady |
|-------------|----------------------|
| Vývoj | 80-150 $ |
| Testovací prostředí | 150-300 $ |
| Produkce | 300-3,500+ $ |

**Tip:** Spusťte `azd down` po testování, abyste se vyhnuli poplatkům.

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 1: Základy](../chapter-01-foundation/README.md) |
| **Další** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |
| **Přeskočit na** | [Kapitola 8: Produkční vzory](../chapter-08-production/README.md) |

---

## 📖 Související zdroje

- [Řešení problémů s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produkční praktiky AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->