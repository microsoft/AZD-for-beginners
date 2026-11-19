# Capitolo 2: Sviluppo AI-First

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 4-5 ore incluso il workshop | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo si concentra sul deployment di applicazioni potenziate dall'AI utilizzando Azure Developer CLI e i servizi Microsoft Foundry. Da semplici app di chat AI ad agenti intelligenti con strumenti.

> **Aggiornamento Foundry GA (2026-11-09):** Il bundle `microsoft.foundry` 1.0 è [generalmente disponibile](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Usa `azd >= 1.37.0`; le valutazioni rimangono una installazione separata. Il [walkthrough dell'hosted-agent](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) copre il testing locale con Agent Inspector e il deployment remoto del codice. Questa è una revisione della documentazione, non una convalida di deployment live; le funzionalità in anteprima opzionali mantengono il proprio status.

## Obiettivi di Apprendimento

Completando questo capitolo, sarai in grado di:
- Deployare applicazioni AI usando template AZD predefiniti
- Comprendere l'integrazione Microsoft Foundry con AZD
- Installare il bundle GA e testare un agente hostato localmente prima di deployare il suo codice sorgente su Foundry
- Rivedere `azure.yaml`, asset di valutazione, e pulizia tra progetti nuovi e riutilizzati
- Configurare e personalizzare agenti AI con strumenti
- Deployare applicazioni RAG (Retrieval-Augmented Generation)

---

## 📚 Lezioni

| # | Lezione | Descrizione | Durata |
|---|--------|-------------|------|
| 1 | [Integrazione Microsoft Foundry](microsoft-foundry-integration.md) | Bundle GA, workflow locale-cloud hosted-agent, e valutazioni | 60 min |
| 2 | [Guida agli Agenti AI](agents.md) | Deploy di agenti intelligenti con strumenti | 45 min |
| 3 | [Deployment Modelli AI](ai-model-deployment.md) | Deploy e configurazione di modelli AI | 30 min |
| 4 | [Laboratorio Workshop AI](ai-workshop-lab.md) | Pratica: Esplora un template e pianifica la conversione | 2-3 ore |

---

## 🚀 Avvio Rapido

Scegli un'opzione in una nuova directory vuota. Il trailing `.` inizializza la directory corrente; altrimenti AZD può creare una sottodirectory senza cambiare la directory di lavoro della shell.

Per il **percorso GA di deployment codice hosted-agent**, inizia con il [walkthrough guidato](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Richiede AZD 1.37.0+, uv corrente, Python 3.13+, permessi Foundry, e quota modelli. I template di applicazioni complete qui sotto sono alternative, non prerequisiti per quel walkthrough.

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

Questi sono range illustrativi, non preventivi o limiti; traffico modello, SKU di Search/compute, regione e funzionalità opzionali possono superarli. Controlla la guida alla tariffazione corrente del campione scelto prima di effettuare il provisioning.

| Ambiente | Costo Mensile Stimato |
|-------------|----------------------|
| Sviluppo | $80-150 |
| Staging | $150-300 |
| Produzione | $300-3,500+ |

**Pulizia:** Rivedi `azd down` prima di confermare: per un progetto Foundry appena creato cancella il gruppo di risorse e tutto il suo contenuto. Per un progetto Foundry riutilizzato, lascia in posto progetto e risorse dell'agente; segui la [guida alla pulizia del walkthrough](microsoft-foundry-integration.md#7-clean-up-deliberately) per rimuovere risorse indesiderate separatamente.

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 1: Fondamenti](../chapter-01-foundation/README.md) |
| **Successivo** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |
| **Salta a** | [Capitolo 8: Pattern di Produzione](../chapter-08-production/README.md) |

---

## 📖 Risorse Correlate

- [Risoluzione Problemi AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Pratiche AI in Produzione](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->