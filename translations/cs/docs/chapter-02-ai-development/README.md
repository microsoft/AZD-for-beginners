# Chapter 2: AI-First Development

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1-2 hodiny | **⭐ Složitost**: Střední

---

## Přehled

Tato kapitola se zaměřuje na nasazování aplikací řízených AI pomocí Azure Developer CLI a služeb Microsoft Foundry. Od jednoduchých AI chat aplikací po inteligentní agenty s nástroji.

> **Poznámka ověření (2026-06-15):** Průběh příkazů a pokyny k rozšíření v této kapitole byly přezkoumány vůči `azd` `1.25.6` a aktuálnímu preview vydání rozšíření AI agenta `azure.ai.agents` `0.1.40-preview`. Pokud používáte starší sestavení AZD, nejprve aktualizujte a pak pokračujte v cvičeních.

## Cíle učení

Po dokončení této kapitoly budete umět:
- Nasadit AI aplikace pomocí předpřipravených AZD šablon
- Porozumět integraci Microsoft Foundry s AZD
- Konfigurovat a upravovat AI agenty s nástroji
- Nasadit aplikace RAG (Retrieval-Augmented Generation)

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Integrace Microsoft Foundry](microsoft-foundry-integration.md) | Propojit AZD se službami Foundry | 30 min |
| 2 | [Průvodce AI agenty](agents.md) | Nasadit inteligentní agenty s nástroji | 45 min |
| 3 | [Nasazení AI modelu](ai-model-deployment.md) | Nasadit a nakonfigurovat AI modely | 30 min |
| 4 | [Lab: AI Workshop](ai-workshop-lab.md) | Prakticky: Připravte své AI řešení pro AZD | 60 min |

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
| Vývoj | $80-150 |
| Testovací | $150-300 |
| Produkce | $300-3,500+ |

**Tip:** Po testování spusťte `azd down`, abyste se vyhnuli poplatkům.

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
- [Produkční postupy pro AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->