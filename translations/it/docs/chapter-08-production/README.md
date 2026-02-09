# Capitolo 8: Modelli di Produzione e Aziendali

**📚 Corso**: [AZD per Principianti](../../README.md) | **⏱️ Durata**: 2-3 hours | **⭐ Complessità**: Avanzato

---

## Panoramica

Questo capitolo tratta modelli di distribuzione pronti per l'azienda, hardening della sicurezza, monitoraggio e ottimizzazione dei costi per carichi di lavoro AI in produzione.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Distribuire applicazioni resilienti multi-regione
- Implementare pattern di sicurezza aziendali
- Configurare monitoraggio completo
- Ottimizzare i costi su larga scala
- Impostare pipeline CI/CD con AZD

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Pratiche AI di Produzione](production-ai-practices.md) | Modelli di distribuzione per aziende | 90 min |

---

## 🚀 Checklist di produzione

- [ ] Distribuzione multi-regione per resilienza
- [ ] Managed identity per l'autenticazione (senza chiavi)
- [ ] Application Insights per il monitoraggio
- [ ] Budget dei costi e avvisi configurati
- [ ] Scansione di sicurezza abilitata
- [ ] Integrazione della pipeline CI/CD
- [ ] Piano di disaster recovery

---

## 🏗️ Modelli architetturali

### Modello 1: Microservizi AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Modello 2: AI basata su eventi

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Migliori pratiche di sicurezza

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Ottimizzazione dei costi

| Strategia | Risparmio |
|----------|---------|
| Scale to zero (Container Apps) | 60-80% |
| Use consumption tiers for dev | 50-70% |
| Scheduled scaling | 30-50% |
| Reserved capacity | 20-40% |

```bash
# Imposta avvisi sul budget
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Configurazione del monitoraggio

```bash
# Streaming dei log
azd monitor --logs

# Controlla Application Insights
azd monitor

# Visualizza metriche
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigazione

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Capitolo 7: Risoluzione dei problemi](../chapter-07-troubleshooting/README.md) |
| **Course Complete** | [Course Home](../../README.md) |

---

## 📖 Risorse correlate

- [Guida agli agenti AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Soluzioni multi-agente](../chapter-05-multi-agent/README.md)
- [Esempio microservizi](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Dichiarazione di non responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur facendo il possibile per garantire l'accuratezza, si tenga presente che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda di ricorrere a una traduzione professionale eseguita da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->