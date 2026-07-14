# Capitolo 2: Sviluppo AI-First

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 1-2 ore | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo si concentra sul deploy di applicazioni alimentate da AI utilizzando Azure Developer CLI e i servizi Microsoft Foundry. Da semplici app di chat AI ad agenti intelligenti con strumenti.

> **Nota di validazione (2026-07-13):** Il flusso di comandi e le indicazioni sull'estensione in questo capitolo sono stati rivisti rispetto a `azd` `1.27.1` e l'attuale versione preview dell’estensione agenti AI `azure.ai.agents` `1.0.0-beta.5`. Se utilizzi una versione precedente di AZD, aggiorna prima e poi continua con gli esercizi.

## Obiettivi di Apprendimento

Completando questo capitolo, potrai:
- Distribuire applicazioni AI utilizzando template AZD predefiniti
- Comprendere l’integrazione Microsoft Foundry con AZD
- Configurare e personalizzare agenti AI con strumenti
- Distribuire applicazioni RAG (Retrieval-Augmented Generation)

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Integrazione Microsoft Foundry](microsoft-foundry-integration.md) | Connettere AZD con i servizi Foundry | 30 min |
| 2 | [Guida agli Agenti AI](agents.md) | Distribuire agenti intelligenti con strumenti | 45 min |
| 3 | [Deploy Modelli AI](ai-model-deployment.md) | Distribuire e configurare modelli AI | 30 min |
| 4 | [Laboratorio Workshop AI](ai-workshop-lab.md) | Pratica: rendi la tua soluzione AI pronta per AZD | 60 min |

---

## 🚀 Avvio Rapido

```bash
# Opzione 1: Applicazione Chat RAG
azd init --template azure-search-openai-demo
azd up

# Opzione 2: Agenti AI
azd init --template get-started-with-ai-agents
azd up

# Opzione 3: App Chat Veloce
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Template AI in Evidenza

| Template | Descrizione | Servizi |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG con citazioni | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente AI con strumenti | Servizio AI Agent |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI di base | OpenAI + Container Apps |

---

## 💰 Consapevolezza dei Costi

| Ambiente | Costo Mensile Stimato |
|-------------|----------------------|
| Sviluppo | $80-150 |
| Pre-produzione | $150-300 |
| Produzione | $300-3.500+ |

**Suggerimento:** Esegui `azd down` dopo i test per evitare addebiti.

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 1: Fondamenta](../chapter-01-foundation/README.md) |
| **Successivo** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |
| **Vai a** | [Capitolo 8: Pattern di Produzione](../chapter-08-production/README.md) |

---

## 📖 Risorse Correlate

- [Risoluzione Problemi AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Pratiche AI di Produzione](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->