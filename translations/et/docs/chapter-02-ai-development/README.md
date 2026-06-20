# Chapter 2: AI-esimene arendus

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1-2 tundi | **⭐ Keerukus**: Kesktase

---

## Ülevaade

See peatükk keskendub AI-põhiste rakenduste juurutamisele, kasutades Azure Developer CLI-d ja Microsoft Foundry teenuseid. Alates lihtsatest AI-vestlusrakendustest kuni intelligentsete agentideni koos tööriistadega.

> **Kinnituse märkus (2026-06-15):** Selle peatüki käsuviiba voogu ja laienduste juhiseid vaadati läbi `azd` `1.25.6` ja praeguse eelvaate AI-agendi laienduse `azure.ai.agents` `0.1.40-preview` vastavuses. Kui kasutate vanemat AZD versiooni, uuendage esmalt ja jätkake seejärel harjutustega.

## Õpieesmärgid

Selle peatüki lõpetamisel:
- Juurutate AI-rakendusi kasutades eelnevalt koostatud AZD malle
- Mõistate Microsoft Foundry integreerimist AZD-ga
- Konfigureerite ja kohandate AI-agente koos tööriistadega
- Juurutate RAG-i (Retrieval-Augmented Generation) rakendusi

---

## 📚 Tunnid

| # | Tund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry integreerimine](microsoft-foundry-integration.md) | Ühendage AZD Foundry teenustega | 30 min |
| 2 | [AI agentide juhend](agents.md) | Juurutage intelligentseid agente koos tööriistadega | 45 min |
| 3 | [AI mudeli juurutamine](ai-model-deployment.md) | Juurutage ja konfigureerige AI mudeleid | 30 min |
| 4 | [AI töötoa labor](ai-workshop-lab.md) | Praktikum: tehke oma AI lahendus AZD-valmis | 60 min |

---

## 🚀 Kiire algus

```bash
# Võimalus 1: RAG vestlusrakendus
azd init --template azure-search-openai-demo
azd up

# Võimalus 2: tehisintellekti agendid
azd init --template get-started-with-ai-agents
azd up

# Võimalus 3: Kiire vestlusrakendus
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Soovitatud AI mallid

| Mall | Kirjeldus | Teenused |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG vestlus viidetega | OpenAI + AI otsing |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent koos tööriistadega | AI agentide teenus |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Põhiline AI vestlus | OpenAI + konteinerirakendused |

---

## 💰 Kuluteadlikkus

| Keskkond | Hinnanguline kuukulu |
|-------------|----------------------|
| Arendus | $80-150 |
| Staging | $150-300 |
| Tootmine | $300-3,500+ |

**Nipp:** Käivitage `azd down` pärast testimist kulude vältimiseks.

---

## 🔗 Navigatsioon

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 1: Alused](../chapter-01-foundation/README.md) |
| **Järgmine** | [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/README.md) |
| **Mine otse** | [Peatükk 8: Tootmisviisid](../chapter-08-production/README.md) |

---

## 📖 Seotud ressursid

- [AI tõrkeotsing](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Tootmis-AI praktikad](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->