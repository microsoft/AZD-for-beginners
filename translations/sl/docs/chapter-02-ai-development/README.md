# Poglavje 2: Razvoj z umetno inteligenco v ospredju

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 4-5 ur vključno z delavnico | **⭐ Zapletenost**: Srednja

---

## Pregled

To poglavje se osredotoča na uvajanje aplikacij z umetno inteligenco z uporabo Azure Developer CLI in storitev Microsoft Foundry. Od preprostih klepetalnih aplikacij z umetno inteligenco do inteligentnih agentov z orodji.

> **Posodobitev Foundry GA (2026-11-09):** Paket `microsoft.foundry` 1.0 je [splošno dostopen](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Uporabite `azd >= 1.37.0`; evalvacije ostajajo ločena namestitev. [Vodnik za gostovanega agenta](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) pokriva lokalno testiranje Agent Inšpektorja in oddaljeno uvajanje kode. To je pregled dokumentacije, ne potrjevanje živega uvajanja; izbirne predogledne funkcije ohranjajo svoj status.

## Cilji učenja

Z zaključkom tega poglavja boste:
- Uvajali AI aplikacije z uporabo vnaprej izdelanih AZD predlog
- Razumeli integracijo Microsoft Foundry z AZD
- Namestili GA paket in preizkusili gostovanega agenta lokalno, preden uvajate njegovo izvorno kodo v Foundry
- Pregledali `azure.yaml`, evalvacijske vsebine in čiščenje novih proti ponovno uporabljenim projektom
- Konfigurirali in prilagodili AI agente z orodji
- Uvajali RAG (Generiranje z nadgradnjo z iskanjem) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry integracija](microsoft-foundry-integration.md) | GA paket, delovni tok gostovanega agenta od lokalnega do oblaka in evalvacije | 60 min |
| 2 | [Vodnik za AI agente](agents.md) | Uvajanje inteligentnih agentov z orodji | 45 min |
| 3 | [Uvajanje AI modelov](ai-model-deployment.md) | Uvajanje in konfiguracija AI modelov | 30 min |
| 4 | [Delavnica AI laboratorija](ai-workshop-lab.md) | Praktično: Raziskujte predlogo in načrtujte svojo pretvorbo | 2-3 ure |

---

## 🚀 Hiter začetek

Izberite eno možnost v novi prazni mapi. Zaključni `.` inicializira trenutno mapo; sicer lahko AZD ustvari podmapo, ne da bi spremenil delovno mapo vašega terminala.

Za **GA pot uvajanja kode gostovanega agenta** začnite z [vodnikom](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Zahteva AZD 1.37.0+, trenutno uv, Python 3.13+, dovoljenja Foundry in kvoto modela. Polne predloge aplikacij spodaj so alternative, ne pa pogoji za ta vodnik.

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

## 🤖 Izpostavljene AI predloge

| Predloga | Opis | Storitve |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG klepet z navedbami | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent z orodji | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Osnovni AI klepet | OpenAI + Container Apps |

---

## 💰 Ozaveščenost o stroških

To so ilustrativni razponi, ne ponudbe ali omejitve; promet modela, Search/compute SKU-ji, regija in izbirne funkcije jih lahko presegajo. Pred zagonom vedno preverite trenutna cenovna navodila izbranega vzorca.

| Okolje | Ocenjeni mesečni strošek |
|-------------|----------------------|
| Razvoj | 80-150 $ |
| Preizkus | 150-300 $ |
| Produkcija | 300-3 500+ $ |

**Čiščenje:** Pred potrditvijo preglejte `azd down`: za novo ustvarjen Foundry projekt briše skupino virov in vse v njej. Za ponovno uporabljen Foundry projekt pusti projekt in vire agenta; sledite [navodilom za čiščenje vodnika](microsoft-foundry-integration.md#7-clean-up-deliberately), da ločeno odstranite nezaželene vire.

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 1: Osnove](../chapter-01-foundation/README.md) |
| **Naslednje** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Preskoči na** | [Poglavje 8: Produkcijski vzorci](../chapter-08-production/README.md) |

---

## 📖 Sorodni viri

- [Reševanje težav z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produkcijske prakse AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->