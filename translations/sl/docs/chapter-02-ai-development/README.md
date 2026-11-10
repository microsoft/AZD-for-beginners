# Poglavje 2: Razvoj z umetno inteligenco na prvem mestu

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 4-5 ur vključno z delavnico | **⭐ Zahtevnost**: Srednja

---

## Pregled

To poglavje se osredotoča na uvajanje aplikacij, podprtih z umetno inteligenco, z uporabo Azure Developer CLI in Microsoft Foundry storitev. Od preprostih klepetalnih aplikacij do inteligentnih agentov z orodji.

> **Pregled izdaje (2026-11-04):** Navodila za AI CLI so bila preverjena z objavljeno dokumentacijo/viri `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` in `azure.ai.evaluations` `1.0.0-beta.2`. Za združeni potek dela uporabite `azd >= 1.37.0`. Evaluacije sedaj uporabljajo ločen imenik `azd ai eval`; glejte [spremembe izdaje in navodila za migracijo](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). To ni preverjanje v živo za uvajanje.

## Cilji učenja

S tem poglavjem boste:
- Uvajali aplikacije z umetno inteligenco z uporabo vnaprej pripravljenih AZD predlog
- Razumeli integracijo Microsoft Foundry z AZD
- Konfigurirali in prilagajali AI agente z orodji
- Uvajali RAG (Retrieval-Augmented Generation) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Integracija Microsoft Foundry](microsoft-foundry-integration.md) | Povezava AZD s storitvami Foundry | 30 min |
| 2 | [Vodnik za AI agente](agents.md) | Uvajanje inteligentnih agentov z orodji | 45 min |
| 3 | [Uvajanje AI modelov](ai-model-deployment.md) | Uvajanje in konfiguracija AI modelov | 30 min |
| 4 | [AI delavnica lab](ai-workshop-lab.md) | Praktično: Raziščite predlogo in načrtujte svojo pretvorbo | 2-3 ure |

---

## 🚀 Hiter začetek

Izberite eno možnost v novi prazni mapi. Zaključni `.` inicializira trenutno mapo; drugače lahko AZD ustvari podmapo brez spremembe delovnega imenika vašega lupinskega okolja.

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

## 🤖 Prikazane AI predloge

| Predloga | Opis | Storitve |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG klepet s citati | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent z orodji | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Osnovni AI klepet | OpenAI + Container Apps |

---

## 💰 Ozaveščenost o stroških

To so ilustrativni razponi, ne ponudbe ali zgornje meje; promet modelov, SKU-ji za Search/računanje, regija in dodatne funkcije jih lahko presegajo. Pred pripravo preglejte trenutno cenovno usmeritev za izbrani vzorec.

| Okolje | Ocenjeni mesečni strošek |
|-------------|----------------------|
| Razvoj | 80-150 $ |
| Predprodukcija | 150-300 $ |
| Produkcija | 300-3.500+ $ |

**Namig:** Za izogibanje stroškom zaženite `azd down` po testiranju.

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 1: Osnove](../chapter-01-foundation/README.md) |
| **Naslednje** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Preskoči na** | [Poglavje 8: Vzori produkcije](../chapter-08-production/README.md) |

---

## 📖 Sorodni viri

- [Reševanje težav z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prakse AI v produkciji](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->