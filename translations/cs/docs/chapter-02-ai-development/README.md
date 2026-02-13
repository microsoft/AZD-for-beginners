# Kapitola 2: Vývoj zaměřený na AI

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1-2 hodiny | **⭐ Složitost**: Středně pokročilé

---

## Přehled

Tato kapitola se zaměřuje na nasazování aplikací poháněných AI pomocí Azure Developer CLI a služeb Microsoft Foundry. Od jednoduchých chatovacích AI aplikací až po inteligentní agenty s nástroji.

## Cíle učení

Po absolvování této kapitoly budete:
- Nasadit aplikace s AI pomocí předpřipravených šablon AZD
- Porozumět integraci Microsoft Foundry s AZD
- Nakonfigurujete a přizpůsobíte AI agenty s nástroji
- Nasadíte RAG (Retrieval-Augmented Generation) aplikace

---

## 📚 Lekce

| # | Lekce | Popis | Doba |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Propojit AZD se službami Foundry | 30 min |
| 2 | [AI Agents Guide](agents.md) | Nasadit inteligentní agenty s nástroji | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Nasadit a konfigurovat AI modely | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktické cvičení: Připravte své AI řešení pro AZD | 60 min |

---

## 🚀 Rychlý start

```bash
# Možnost 1: RAG chatovací aplikace
azd init --template azure-search-openai-demo
azd up

# Možnost 2: AI agenti
azd init --template get-started-with-ai-agents
azd up

# Možnost 3: Rychlá chatovací aplikace
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Vybrané AI šablony

| Šablona | Popis | Služby |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citacemi | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s nástroji | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Základní AI chat | OpenAI + Container Apps |

---

## 💰 Informace o nákladech

| Prostředí | Odhadované měsíční náklady |
|-------------|----------------------|
| Vývoj | $80-150 |
| Testovací | $150-300 |
| Produkční | $300-3,500+ |

**Tip:** Spusťte `azd down` po testování, abyste se vyhnuli poplatkům.

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 1: Základy](../chapter-01-foundation/README.md) |
| **Další** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |
| **Přejít na** | [Kapitola 8: Produkční vzory](../chapter-08-production/README.md) |

---

## 📖 Související zdroje

- [Řešení problémů s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Postupy pro produkční AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Prohlášení o vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí služby automatického překladu umělé inteligence [Co-op Translator](https://github.com/Azure/co-op-translator). Ač usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo mylné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->