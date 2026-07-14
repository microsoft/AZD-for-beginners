# Kapitola 2: Vývoj s primárním zaměřením na AI

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Délka**: 1-2 hodiny | **⭐ Složitost**: Středně pokročilý

---

## Přehled

Tato kapitola se zaměřuje na nasazení aplikací poháněných AI pomocí Azure Developer CLI a služeb Microsoft Foundry. Od jednoduchých chatovacích AI aplikací až po inteligentní agenty s nástroji.

> **Poznámka k ověření (2026-07-13):** Průběh příkazů a doporučení k rozšíření v této kapitole byly ověřeny vůči `azd` `1.27.1` a aktuálnímu preview vydání AI agent rozšíření `azure.ai.agents` `1.0.0-beta.5`. Pokud máte starší verzi AZD, nejprve ji aktualizujte a poté pokračujte v cvičeních.

## Výukové cíle

Dokončením této kapitoly budete schopni:
- Nasazovat AI aplikace pomocí předpřipravených šablon AZD
- Pochopit integraci Microsoft Foundry s AZD
- Konfigurovat a přizpůsobovat AI agenty s nástroji
- Nasazovat aplikace RAG (Retrieval-Augmented Generation)

---

## 📚 Lekce

| # | Lekce | Popis | Doba |
|---|--------|-------------|------|
| 1 | [Integrace Microsoft Foundry](microsoft-foundry-integration.md) | Propojení AZD se službami Foundry | 30 min |
| 2 | [Průvodce AI agenty](agents.md) | Nasazení inteligentních agentů s nástroji | 45 min |
| 3 | [Nasazení AI modelu](ai-model-deployment.md) | Nasazení a konfigurace AI modelů | 30 min |
| 4 | [AI workshop laboratoř](ai-workshop-lab.md) | Prakticky: Připravte své AI řešení pro AZD | 60 min |

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

## 🤖 Doporučené AI šablony

| Šablona | Popis | Služby |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citacemi | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s nástroji | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Základní AI chat | OpenAI + Container Apps |

---

## 💰 Povědomí o nákladech

| Prostředí | Odhadované měsíční náklady |
|-------------|----------------------|
| Vývojové | 80-150 $ |
| Testovací | 150-300 $ |
| Produkční | 300-3 500+ $ |

**Tip:** Po testování spusťte `azd down`, abyste se vyhnuli poplatkům.

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 1: Základy](../chapter-01-foundation/README.md) |
| **Následující** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |
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