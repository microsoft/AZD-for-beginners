# 2. peatükk: AI-esimene arendus

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1-2 tundi | **⭐ Keerukus**: Kesktase

---

## Ülevaade

See peatükk keskendub Azure Developer CLI ja Microsoft Foundry teenuste abil AI-põhiste rakenduste juurutamisele. Lihtsatest AI vestlusrakendustest kuni tööriistadega intelligentsete agentideni.

> **Kinnitusmärkuse kuupäev (2026-07-13):** Selles peatükis käsitletud käsupäring ja laienduste juhised vaadati üle versioonidega `azd` `1.27.1` ja praeguse eelvaate AI agentide laienduse versiooniga `azure.ai.agents` `1.0.0-beta.5`. Kui kasutate vanemat AZD versiooni, uuendage esmalt ja jätkake seejärel harjutustega.

## Õpieesmärgid

Selle peatüki läbimisega:
- Juurutate AI-rakendusi eelvalmistatud AZD mallide abil
- Mõistate Microsoft Foundry integreerimist AZD-ga
- Konfigureerite ja kohandate tööriistadega AI agente
- Juurutate RAG (tagasitoomise rikastatud generatsiooni) rakendusi

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry integreerimine](microsoft-foundry-integration.md) | Ühenda AZD Foundry teenustega | 30 min |
| 2 | [AI agentide juhend](agents.md) | Juuruta tööriistadega intelligentseid agente | 45 min |
| 3 | [AI mudelite juurutamine](ai-model-deployment.md) | Juuruta ja konfigureeri AI mudeleid | 30 min |
| 4 | [AI töötuba - labor](ai-workshop-lab.md) | Praktika: tee oma AI lahendus AZD-valmis | 60 min |

---

## 🚀 Kiirstart

```bash
# Valik 1: RAG vestlusrakendus
azd init --template azure-search-openai-demo
azd up

# Valik 2: AI agendid
azd init --template get-started-with-ai-agents
azd up

# Valik 3: Kiirvestluse rakendus
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Esile tõstetud AI mallid

| Mall | Kirjeldus | Teenused |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG vestlus allikaviidetega | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Tööriistadega AI agent | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Lihtne AI vestlus | OpenAI + Container Apps |

---

## 💰 Kulu teadlikkus

| Keskkond | Hinnanguline kuuline kulu |
|-------------|----------------------|
| Arendus | $80-150 |
| Testkeskkond | $150-300 |
| Tootmine | $300-3,500+ |

**Nipp:** Käivita testi järel `azd down`, et vältida kulusid.

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [1. peatükk: Vundament](../chapter-01-foundation/README.md) |
| **Järgmine** | [3. peatükk: Konfiguratsioon](../chapter-03-configuration/README.md) |
| **Jäta vahele kuni** | [8. peatükk: Tootmismustrid](../chapter-08-production/README.md) |

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