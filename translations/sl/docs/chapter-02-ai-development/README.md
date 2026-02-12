# Poglavje 2: Razvoj, usmerjen na AI

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Čas trajanja**: 1-2 hours | **⭐ Zahtevnost**: Srednje

---

## Pregled

To poglavje se osredotoča na uvajanje aplikacij, podprtih z AI, z uporabo Azure Developer CLI in Microsoft Foundry storitev. Od preprostih AI klepetalnih aplikacij do inteligentnih agentov z orodji.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Razmestiti AI-aplikacije z uporabo vnaprej pripravljenih AZD predlog
- Razumeti integracijo Microsoft Foundry z AZD
- Konfigurirati in prilagoditi AI agente s orodji
- Razmestiti RAG (Retrieval-Augmented Generation) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Integracija Microsoft Foundry](microsoft-foundry-integration.md) | Povežite AZD s storitvami Foundry | 30 min |
| 2 | [Vodnik za AI agente](agents.md) | Razmestiti inteligentne agente z orodji | 45 min |
| 3 | [Razmestitev AI modelov](ai-model-deployment.md) | Razmestiti in konfigurirati AI modele | 30 min |
| 4 | [AI delavnica](ai-workshop-lab.md) | Praktično: Pripravite svojo AI rešitev za AZD | 60 min |

---

## 🚀 Hiter začetek

```bash
# Možnost 1: RAG aplikacija za klepet
azd init --template azure-search-openai-demo
azd up

# Možnost 2: AI agenti
azd init --template get-started-with-ai-agents
azd up

# Možnost 3: Hitra aplikacija za klepet
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Predstavljene AI predloge

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat z navedbami | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent z orodji | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Osnovni AI klepet | OpenAI + Container Apps |

---

## 💰 Zavedanje stroškov

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Namig:** Za zmanjšanje stroškov po testiranju zaženite `azd down`.

---

## 🔗 Navigacija

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Poglavje 1: Osnove](../chapter-01-foundation/README.md) |
| **Next** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Skip to** | [Poglavje 8: Produkcijski vzorci](../chapter-08-production/README.md) |

---

## 📖 Povezani viri

- [Odpravljanje težav z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prakse AI v produkciji](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden s pomočjo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->