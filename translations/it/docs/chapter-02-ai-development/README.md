# Chapter 2: AI-First Development

**📚 Corso**: [AZD For Beginners](../../README.md) | **⏱️ Durata**: 1-2 ore | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo si concentra sul deploy di applicazioni potenziate dall'IA utilizzando Azure Developer CLI e i servizi Microsoft Foundry. Da semplici app di chat AI ad agenti intelligenti con strumenti.

> **Nota di convalida (2026-03-25):** Il flusso di comandi e le indicazioni sulle estensioni in questo capitolo sono stati revisionati rispetto a `azd` `1.23.12` e alla release preview corrente dell'estensione AI agent `azure.ai.agents` `0.1.18-preview`. Se stai usando una build AZD precedente, aggiorna prima e poi continua con gli esercizi.

## Obiettivi di apprendimento

Completando questo capitolo, potrai:
- Distribuire applicazioni AI usando template AZD predefiniti
- Comprendere l'integrazione di Microsoft Foundry con AZD
- Configurare e personalizzare agenti AI con strumenti
- Distribuire applicazioni RAG (Generazione aumentata dal recupero)

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Integrazione Microsoft Foundry](microsoft-foundry-integration.md) | Collegare AZD ai servizi Foundry | 30 min |
| 2 | [Guida agli agenti AI](agents.md) | Distribuire agenti intelligenti con strumenti | 45 min |
| 3 | [Distribuzione modelli AI](ai-model-deployment.md) | Distribuire e configurare modelli AI | 30 min |
| 4 | [Laboratorio AI Workshop](ai-workshop-lab.md) | Esercitazione pratica: rendi la tua soluzione AI pronta per AZD | 60 min |

---

## 🚀 Avvio rapido

```bash
# Opzione 1: Applicazione chat RAG
azd init --template azure-search-openai-demo
azd up

# Opzione 2: Agenti IA
azd init --template get-started-with-ai-agents
azd up

# Opzione 3: App di chat rapida
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
| Sviluppo | $80-150 |
| Pre-produzione | $150-300 |
| Produzione | $300-3,500+ |

**Suggerimento:** Esegui `azd down` dopo i test per evitare addebiti.

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Successivo** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Vai a** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Risorse correlate

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su IA [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->