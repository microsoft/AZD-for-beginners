# Poglavje 2: Razvoj, usmerjen v AI

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 1-2 ure | **⭐ Zapletenost**: Srednje

---

## Pregled

To poglavje se osredotoča na uvajanje aplikacij, podprtih z AI, z uporabo Azure Developer CLI in storitev Microsoft Foundry. Od preprostih AI klepetalnih aplikacij do inteligentnih agentov z orodji.

> **Opomba preverjanja (2026-03-25):** Potek ukazov in smernice za razširitve v tem poglavju so bili pregledani glede na `azd` `1.23.12` in trenutno predogledno izdajo razširitve AI agentov `azure.ai.agents` `0.1.18-preview`. Če uporabljate starejšo različico AZD, najprej izvedite posodobitev in nato nadaljujte z vajami.

## Učni cilji

Po končanem poglavju boste:
- Razmestili AI-aplikacije z uporabo vnaprej pripravljenih AZD predlog
- Razumeli integracijo Microsoft Foundry z AZD
- Konfigurirali in prilagodili AI-agente z orodji
- Razmestili RAG (Retrieval-Augmented Generation) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Integracija z Microsoft Foundry](microsoft-foundry-integration.md) | Povežite AZD s storitvami Foundry | 30 min |
| 2 | [Vodnik za AI agente](agents.md) | Razmestite inteligentne agente z orodji | 45 min |
| 3 | [Razmestitev AI modelov](ai-model-deployment.md) | Razmestite in konfigurirajte AI modele | 30 min |
| 4 | [AI delavnica](ai-workshop-lab.md) | Praktično: Pripravite svojo AI-rešitev za AZD | 60 min |

---

## 🚀 Hitri začetek

```bash
# Možnost 1: RAG aplikacija za klepet
azd init --template azure-search-openai-demo
azd up

# Možnost 2: AI agenti
azd init --template get-started-with-ai-agents
azd up

# Možnost 3: Aplikacija za hiter klepet
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Izpostavljene AI predloge

| Predloga | Opis | Storitve |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG klepet z navedbami | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent z orodji | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Osnovni AI klepet | OpenAI + Container Apps |

---

## 💰 Zavedanje stroškov

| Okolje | Ocenjeni mesečni strošek |
|-------------|----------------------|
| Razvoj | $80-150 |
| Predprodukcija | $150-300 |
| Produkcija | $300-3,500+ |

**Namig:** Za izogibanje stroškom zaženite `azd down` po testiranju.

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 1: Osnove](../chapter-01-foundation/README.md) |
| **Naslednje** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Preskoči na** | [Poglavje 8: Produkcijski vzorci](../chapter-08-production/README.md) |

---

## 📖 Povezani viri

- [Odpravljanje težav z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prakse AI v produkciji](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da samodejni prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za kakršne koli nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->