# Kapitel 2: AI-Esimene Arendus

**📚 Kursus**: [AZD Algajatele](../../README.md) | **⏱️ Kestus**: 4-5 tundi koos töötoaga | **⭐ Tase**: Kesktase

---

## Ülevaade

See peatükk keskendub AI-toega rakenduste juurutamisele kasutades Azure Developer CLI-d ja Microsoft Foundry teenuseid. Lihtsatest AI vestlusrakendustest kuni tööriistadega intelligentsete agentideni.

> **Väljalaske ülevaade (2026-11-04):** AI CLI juhised on kontrollitud avaldatud `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` ja `azure.ai.evaluations` `1.0.0-beta.2` dokumentatsiooni/allika vastu. Kasuta `azd >= 1.37.0` kombineeritud töövoo jaoks. Hinnangud kasutavad nüüd eraldi `azd ai eval` nimeruumi; vt [väljalaske muudatusi ja migratsioonijuhiseid](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). See ei ole reaalajas juurutuse valideerimine.

## Õpieesmärgid

Selle peatüki lõpetamisel saad:
- Juurutada AI rakendusi eelpõhjustatud AZD mallide abil
- Mõista Microsoft Foundry integreerimist AZD-ga
- Seadistada ja kohandada AI agente koos tööriistadega
- Juurutada RAG (otsingupõhine genereerimine) rakendusi

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integratsioon](microsoft-foundry-integration.md) | Ühenda AZD Foundry teenustega | 30 min |
| 2 | [AI Agendi Juhend](agents.md) | Juuruta tööriistadega intelligentsed agendid | 45 min |
| 3 | [AI Mudeli Juurutamine](ai-model-deployment.md) | Juuruta ja seadista AI mudeleid | 30 min |
| 4 | [AI Töötuba](ai-workshop-lab.md) | Praktiline: Uuri malli ja planeeri üleminek | 2-3 tundi |

---

## 🚀 Kiire Algus

Vali üks variant uues tühjas kataloogis. Järgnev `.` initsialiseerib praeguse kataloogi; muidu võib AZD luua alamkataloogi ilma töökataloogi muutmata.

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

## 🤖 Esiletõstetud AI Mallid

| Mall | Kirjeldus | Teenused |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG vestlus viidetega | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent koos tööriistadega | AI Agendi Teenus |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Põhiline AI vestlus | OpenAI + Container Apps |

---

## 💰 Kulu Teadlikkus

Need on illustratiivsed vahemikud, mitte hinnapakkumised ega limiidid; mudeli liiklus, Search/compute SKUd, regioon ja valikulised funktsioonid võivad neist üle minna. Vaata oma valitud näidise praegust hinnajuhendit enne ressursside loomist.

| Keskkond | Hinnanguline kuumakse |
|-------------|----------------------|
| Arendus | $80-150 |
| Katsetus | $150-300 |
| Tootmine | $300-3,500+ |

**Nipp:** Käivita `azd down` pärast testimist kulude vältimiseks.

---

## 🔗 Navigatsioon

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 1: Alus](../chapter-01-foundation/README.md) |
| **Järgmine** | [Peatükk 3: Seadistus](../chapter-03-configuration/README.md) |
| **Hüppa** | [Peatükk 8: Tootmismustrid](../chapter-08-production/README.md) |

---

## 📖 Seotud Ressursid

- [AI Tõrkeotsing](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Tootmise AI Tavad](../chapter-08-production/production-ai-practices.md)
- [Rakenduse Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->