# Poglavje 2: Razvoj, ki je najprej osredotočen na AI

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 1-2 uri | **⭐ Kompleksnost**: Srednja

---

## Pregled

To poglavje se osredotoča na uvajanje aplikacij, ki jih poganja AI, s pomočjo Azure Developer CLI in Microsoft Foundry storitev. Od preprostih klepetalnih AI aplikacij do inteligentnih agentov z orodji.

> **Opomba o validaciji (2026-07-13):** Potek ukazov in smernice za razširitve v tem poglavju so bile pregledane glede na `azd` `1.27.1` in trenutno predogledno izdajo AI agent razširitve `azure.ai.agents` `1.0.0-beta.5`. Če imate starejšo različico AZD, jo najprej posodobite in nato nadaljujte z vajami.

## Cilji učenja

S tem poglavjem boste:
- Uvajali AI aplikacije z uporabo že pripravljenih AZD predlog
- Razumeli integracijo Microsoft Foundry z AZD
- Konfigurirali in prilagajali AI agente z orodji
- Uvajali RAG (generiranje s povečanim iskanjem) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Integracija Microsoft Foundry](microsoft-foundry-integration.md) | Povezava AZD s storitvami Foundry | 30 min |
| 2 | [Vodnik za AI agente](agents.md) | Uvajanje inteligentnih agentov z orodji | 45 min |
| 3 | [Uvajanje AI modelov](ai-model-deployment.md) | Uvajanje in konfiguracija AI modelov | 30 min |
| 4 | [AI delavnica laboratorij](ai-workshop-lab.md) | Praktično: Pripravite svojo AI rešitev za AZD | 60 min |

---

## 🚀 Hiter začetek

```bash
# Možnost 1: RAG klepetalna aplikacija
azd init --template azure-search-openai-demo
azd up

# Možnost 2: AI agenti
azd init --template get-started-with-ai-agents
azd up

# Možnost 3: Hitro klepetalna aplikacija
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Priporočene AI predloge

| Predloga | Opis | Storitve |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG klepet s citati | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent z orodji | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Osnovni AI klepet | OpenAI + Container Apps |

---

## 💰 Zavedanje o stroških

| Okolje | Ocenjeni mesečni strošek |
|-------------|----------------------|
| Razvojno | 80-150 $ |
| Predprodukcijsko | 150-300 $ |
| Produkcijsko | 300-3.500+ $ |

**Namig:** Po testiranju zaženite `azd down`, da se izognete stroškom.

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 1: Osnove](../chapter-01-foundation/README.md) |
| **Naslednje** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Preskoči na** | [Poglavje 8: Produkcijski vzorci](../chapter-08-production/README.md) |

---

## 📖 Sorodni viri

- [Razreševanje težav z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prakse produkcijskega AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->