# Capitolo 5: Soluzioni IA Multi-Agente

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 2-3 hours | **⭐ Complessità**: Avanzato

---

## Panoramica

Questo capitolo tratta modelli avanzati di architettura multi-agente, orchestrazione degli agenti e deployment di IA pronti per la produzione per scenari complessi.

## Obiettivi di Apprendimento

Completando questo capitolo, sarai in grado di:
- Comprendere i modelli di architettura multi-agente
- Distribuire sistemi di agenti IA coordinati
- Implementare la comunicazione tra agenti
- Costruire soluzioni multi-agente pronte per la produzione

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Soluzione Multi-Agente per il Retail](../../examples/retail-scenario.md) | Guida completa all'implementazione | 90 min |
| 2 | [Modelli di Coordinazione](../chapter-06-pre-deployment/coordination-patterns.md) | Strategie di orchestrazione degli agenti | 30 min |
| 3 | [Distribuzione con template ARM](../../examples/retail-multiagent-arm-template/README.md) | Distribuzione con un clic | 30 min |

---

## 🚀 Avvio Rapido

```bash
# Distribuisci la soluzione multi-agente per il settore retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Oppure usa il modello direttamente
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Architettura Multi-Agente

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Soluzione in Evidenza: Multi-Agente per il Retail

La [Soluzione Multi-Agente per il Retail](../../examples/retail-scenario.md) dimostra:

- **Agente Cliente**: Gestisce le interazioni con l'utente e le preferenze
- **Agente Inventario**: Gestisce le scorte e l'elaborazione degli ordini
- **Orchestratore**: Coordina tra gli agenti
- **Memoria Condivisa**: Gestione del contesto tra agenti

### Servizi Utilizzati

| Servizio | Scopo |
|---------|---------|
| Azure OpenAI | Comprensione del linguaggio |
| Azure AI Search | Catalogo prodotti |
| Cosmos DB | Stato e memoria degli agenti |
| Container Apps | Hosting degli agenti |
| Application Insights | Monitoraggio |

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 4: Infrastruttura](../chapter-04-infrastructure/README.md) |
| **Successivo** | [Capitolo 6: Pre-Distribuzione](../chapter-06-pre-deployment/README.md) |

---

## 📖 Risorse Correlate

- [Guida Agenti IA](../chapter-02-ai-development/agents.md)
- [Pratiche per l'IA in Produzione](../chapter-08-production/production-ai-practices.md)
- [Risoluzione dei Problemi IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto tramite il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci a garantire la massima accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua madre deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->