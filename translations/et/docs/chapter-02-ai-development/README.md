# 2. peatükk: AI-esimene arendus

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1-2 tundi | **⭐ Keerukus**: Keskmine

---

## Ülevaade

See peatükk keskendub AI-ga täiustatud rakenduste juurutamisele, kasutades Azure Developer CLI-d ja Microsoft Foundry teenuseid. Alates lihtsatest AI-vestlusrakendustest kuni tööriistadega varustatud intelligentsete agentideni.

## Õpieesmärgid

Selle peatüki lõpetamisel saate:
- Juurutada AI-rakendusi, kasutades eelnevalt valmistatud AZD-malle
- Mõista Microsoft Foundry integreerimist AZD-ga
- Konfigureerida ja kohandada AI-agente tööriistadega
- Juurutada RAG (Retrieval-Augmented Generation) rakendusi

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Ühenda AZD Foundry teenustega | 30 min |
| 2 | [AI Agents Guide](agents.md) | Juuruta nutikaid agente tööriistadega | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Juuruta ja konfigureeri AI-mudeleid | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktiline: tee oma AI-lahendus AZD-valmis | 60 min |

---

## 🚀 Kiire algus

```bash
# Valik 1: RAG-vestlusrakendus
azd init --template azure-search-openai-demo
azd up

# Valik 2: tehisintellekti agendid
azd init --template get-started-with-ai-agents
azd up

# Valik 3: kiire vestlusrakendus
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Esiletõstetud AI-mallid

| Mall | Kirjeldus | Teenused |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-vestlus viidetega | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent tööriistadega | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Põhiline AI-vestlus | OpenAI + Container Apps |

---

## 💰 Kuluteadlikkus

| Keskkond | Hinnanguline igakuine kulu |
|-------------|----------------------|
| Arendus | $80-150 |
| Testkeskkond | $150-300 |
| Tootmine | $300-3,500+ |

**Vihje:** Käivitage `azd down` pärast testimist, et vältida tasusid.

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [1. peatükk: Põhitõed](../chapter-01-foundation/README.md) |
| **Järgmine** | [3. peatükk: Konfiguratsioon](../chapter-03-configuration/README.md) |
| **Hüppa** | [8. peatükk: Tootmismustrid](../chapter-08-production/README.md) |

---

## 📖 Seotud ressursid

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastutusest loobumine:
See dokument on tõlgitud tehisintellekti tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi me püüame tagada täpsust, pidage meeles, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle algkeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi arusaamatuse ega väärtõlgenduse eest, mis tuleneb selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->