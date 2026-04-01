# 2. peatükk: AI-esimene arendus

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1–2 tundi | **⭐ Tase**: Kesktase

---

## Ülevaade

See peatükk keskendub AI-põhiste rakenduste juurutamisele kasutades Azure Developer CLI-d ja Microsoft Foundry teenuseid. Alates lihtsatest AI vestlusrakendustest kuni tööriistadega intelligentsete agentideni.

> **Kinnitamise märkus (2026-03-25):** Selle peatüki käsujada ja laienduse juhendi üle vaadati `azd` versiooniga `1.23.12` ning praeguse eelvaate AI agentide laienduse `azure.ai.agents` `0.1.18-preview`. Kui kasutate vanemat AZD versiooni, uuendage esmalt ning jätkake siis harjutustega.

## Õpieesmärgid

Selle peatüki lõpetades:
- Juurutate AI rakendusi, kasutades eelvalmiste AZD mallide põhjal
- Mõistate Microsoft Foundry integreerimist AZD-ga
- Konfigureerite ja kohandate AI agente tööriistadega
- Juurutate RAG (otsingu-tugevdusel põhinevaid) rakendusi

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|----------|-----------|-----|
| 1 | [Microsoft Foundry integreerimine](microsoft-foundry-integration.md) | Ühendage AZD Foundry teenustega | 30 min |
| 2 | [AI agentide juhend](agents.md) | Juurutage tööriistadega intelligentseid agente | 45 min |
| 3 | [AI mudelite juurutamine](ai-model-deployment.md) | Juurutage ja seadistage AI mudeleid | 30 min |
| 4 | [AI töötoa labor](ai-workshop-lab.md) | Praktikum: Tehke oma AI lahendus AZD-valmis | 60 min |

---

## 🚀 Kiire algus

```bash
# Valik 1: RAG vestlusrakendus
azd init --template azure-search-openai-demo
azd up

# Valik 2: Tehisintellekti agendid
azd init --template get-started-with-ai-agents
azd up

# Valik 3: Kiire vestlusrakendus
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Esile tõstetud AI mallid

| Mall | Kirjeldus | Teenused |
|------|-----------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG vestlus tsitaatidega | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent tööriistadega | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Lihtne AI vestlus | OpenAI + Container Apps |

---

## 💰 Kulu teadlikkus

| Keskkond | Hinnanguline kuukulu |
|----------|---------------------|
| Arendus | $80–150 |
| Testkeskkond | $150–300 |
| Tootmine | $300–3,500+ |

**Nipp:** Käivitage pärast testimist käsuga `azd down`, et vältida tasusid.

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|--------|---------|
| **Eelmine** | [1. peatükk: Alused](../chapter-01-foundation/README.md) |
| **Järgmine** | [3. peatükk: Seadistamine](../chapter-03-configuration/README.md) |
| **Hüppa** | [8. peatükk: Tootmise mustrid](../chapter-08-production/README.md) |

---

## 📖 Seotud ressursid

- [AI tõrkeotsing](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Tootmise AI tavad](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlemine**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, palun pange tähele, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma algkeeles tuleks pidada autoriteetseks allikaks. Olulise info puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi arusaamatuse või valesti mõistmise eest, mis tuleneb selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->