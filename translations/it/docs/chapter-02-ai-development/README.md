# Capitolo 2: Sviluppo AI-First

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 4-5 ore inclusi workshop | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo si concentra sul deployment di applicazioni potenziate da AI usando Azure Developer CLI e i servizi Microsoft Foundry. Da semplici app di chat AI ad agenti intelligenti con strumenti.

> **Revisione rilascio (2026-11-04):** Le linee guida AI CLI sono state verificate rispetto alla documentazione/fonte pubblicata `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, e `azure.ai.evaluations` `1.0.0-beta.2`. Usare `azd >= 1.37.0` per il workflow combinato. Le valutazioni ora usano il namespace separato `azd ai eval`; vedi [cambiamenti rilascio e guida alla migrazione](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Questa non è una convalida di deployment live.

## Obiettivi di Apprendimento

Completando questo capitolo, sarai in grado di:
- Distribuire applicazioni AI usando template AZD predefiniti
- Comprendere l'integrazione di Microsoft Foundry con AZD
- Configurare e personalizzare agenti AI con strumenti
- Distribuire applicazioni RAG (Retrieval-Augmented Generation)

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Integrazione Microsoft Foundry](microsoft-foundry-integration.md) | Connettere AZD con i servizi Foundry | 30 min |
| 2 | [Guida agli Agenti AI](agents.md) | Distribuire agenti intelligenti con strumenti | 45 min |
| 3 | [Deployment Modello AI](ai-model-deployment.md) | Distribuire e configurare modelli AI | 30 min |
| 4 | [Laboratorio Workshop AI](ai-workshop-lab.md) | Pratica: Esplora un template e pianifica la tua conversione | 2-3 ore |

---

## 🚀 Avvio Rapido

Scegli un'opzione in una nuova directory vuota. Il `.` finale inizializza la directory corrente; altrimenti AZD può creare una sottodirectory senza cambiare la directory di lavoro del terminale.

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

## 🤖 Template AI in Evidenza

| Template | Descrizione | Servizi |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG con citazioni | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente AI con strumenti | Servizio Agente AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI di base | OpenAI + Container Apps |

---

## 💰 Consapevolezza dei Costi

Questi sono intervalli illustrativi, non preventivi né limiti; traffico modello, SKU di Search/compute, regione e funzionalità opzionali possono superarli. Verifica i prezzi aggiornati del campione scelto prima di provisionare.

| Ambiente | Costo Mensile Stimato |
|-------------|----------------------|
| Sviluppo | $80-150 |
| Staging | $150-300 |
| Produzione | $300-3.500+ |

**Suggerimento:** Esegui `azd down` dopo i test per evitare addebiti.

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 1: Fondazioni](../chapter-01-foundation/README.md) |
| **Successivo** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |
| **Salta a** | [Capitolo 8: Pattern di Produzione](../chapter-08-production/README.md) |

---

## 📖 Risorse Correlate

- [Risoluzione Problemi AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Pratiche di Produzione AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->