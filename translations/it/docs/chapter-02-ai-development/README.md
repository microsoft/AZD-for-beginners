# Capitolo 2: Sviluppo AI-First

**📚 Corso**: [AZD For Beginners](../../README.md) | **⏱️ Durata**: 1-2 ore | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo si concentra sul deploy di applicazioni potenziate dall'AI utilizzando Azure Developer CLI e i servizi Microsoft Foundry. Dalle semplici app di chat AI ad agenti intelligenti con strumenti.

## Obiettivi di apprendimento

Al completamento di questo capitolo, sarai in grado di:
- Distribuire applicazioni AI usando template AZD predefiniti
- Comprendere l'integrazione di Microsoft Foundry con AZD
- Configurare e personalizzare agenti AI con strumenti
- Distribuire applicazioni RAG (Retrieval-Augmented Generation)

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Integrazione Microsoft Foundry](microsoft-foundry-integration.md) | Collegare AZD ai servizi Foundry | 30 min |
| 2 | [Guida agli agenti AI](agents.md) | Distribuire agenti intelligenti con strumenti | 45 min |
| 3 | [Distribuzione dei modelli AI](ai-model-deployment.md) | Distribuire e configurare modelli AI | 30 min |
| 4 | [Laboratorio pratico AI](ai-workshop-lab.md) | Pratico: rendi la tua soluzione AI compatibile con AZD | 60 min |

---

## 🚀 Avvio rapido

```bash
# Opzione 1: Applicazione di chat RAG
azd init --template azure-search-openai-demo
azd up

# Opzione 2: Agenti IA
azd init --template get-started-with-ai-agents
azd up

# Opzione 3: App di chat veloce
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Template AI in evidenza

| Template | Descrizione | Servizi |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG con citazioni | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente AI con strumenti | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI di base | OpenAI + Container Apps |

---

## 💰 Consapevolezza dei costi

| Ambiente | Costo mensile stimato |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Suggerimento:** Esegui `azd down` dopo i test per evitare addebiti.

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 1: Fondamenti](../chapter-01-foundation/README.md) |
| **Successivo** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |
| **Vai a** | [Capitolo 8: Modelli di produzione](../chapter-08-production/README.md) |

---

## 📖 Risorse correlate

- [Risoluzione problemi AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Pratiche AI in produzione](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avvertenza:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica Co-op Translator (https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire l’accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella lingua di partenza deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non ci riteniamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->