# Capitolo 5: Soluzioni AI multi-agente

**📚 Corso**: [AZD per Principianti](../../README.md) | **⏱️ Durata**: 2-3 ore | **⭐ Complessità**: Avanzato

---

## Panoramica

Questo capitolo copre schemi architetturali multi-agente avanzati, orchestrazione degli agenti e distribuzioni AI pronte per la produzione per scenari complessi.

## Obiettivi di apprendimento

Completando questo capitolo, potrai:
- Comprendere gli schemi architetturali multi-agente
- Distribuire sistemi di agenti AI coordinati
- Implementare comunicazione agente-a-agente
- Costruire soluzioni multi-agente pronte per la produzione

---

## 📚 Lezioni

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Retail Multi-Agent Solution](../../examples/retail-scenario.md) | Complete implementation walkthrough | 90 min |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | Agent orchestration strategies | 30 min |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | One-click deployment | 30 min |

---

## 🚀 Avvio rapido

```bash
# Opzione 1: Distribuire da un modello
azd init --template agent-openai-python-prompty
azd up

# Opzione 2: Distribuire da un manifest dell'agente (richiede l'estensione azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Quale approccio?** Usa `azd init --template` per partire da un esempio funzionante. Usa `azd ai agent init` quando hai il tuo manifesto agente. Consulta il [Riferimento AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) per i dettagli completi.

---

## 🤖 Architettura multi-agente

```mermaid
graph TD
    Orchestrator[Agente Orchestratore<br/>Instrada le richieste, gestisce il flusso di lavoro] --> Customer[Agente Cliente<br/>Richieste dell'utente, preferenze]
    Orchestrator --> Inventory[Agente Inventario<br/>Livelli di stock, ordini]
```
---

## 🎯 Soluzione in evidenza: Retail Multi-Agente

La [Soluzione Retail Multi-Agente](../../examples/retail-scenario.md) dimostra:

- **Customer Agent**: Gestisce le interazioni con l'utente e le preferenze
- **Inventory Agent**: Gestisce le scorte e l'elaborazione degli ordini
- **Orchestrator**: Coordina tra gli agenti
- **Shared Memory**: Gestione del contesto condiviso tra agenti

### Servizi utilizzati

| Service | Purpose |
|---------|---------|
| Microsoft Foundry Models | Comprensione del linguaggio |
| Azure AI Search | Catalogo prodotti |
| Cosmos DB | Stato e memoria dell'agente |
| Container Apps | Hosting degli agenti |
| Application Insights | Monitoraggio |

---

## 🔗 Navigazione

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Capitolo 4: Infrastruttura](../chapter-04-infrastructure/README.md) |
| **Next** | [Capitolo 6: Pre-distribuzione](../chapter-06-pre-deployment/README.md) |

---

## 📖 Risorse correlate

- [Guida agli agenti AI](../chapter-02-ai-development/agents.md)
- [Pratiche AI per la produzione](../chapter-08-production/production-ai-practices.md)
- [Risoluzione dei problemi AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua madre deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->