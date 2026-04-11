# Capitolo 8: Produzione e pattern aziendali

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 2-3 ore | **⭐ Complessità**: Avanzato

---

## Panoramica

Questo capitolo tratta pattern di deployment pronti per l'azienda, hardening della sicurezza, monitoraggio e ottimizzazione dei costi per carichi di lavoro AI in produzione.

> Validato con `azd 1.23.12` a marzo 2026.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Distribuire applicazioni resilienti multi-regione
- Implementare pattern di sicurezza aziendale
- Configurare un monitoraggio completo
- Ottimizzare i costi su larga scala
- Configurare pipeline CI/CD con AZD

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Pratiche AI di produzione](production-ai-practices.md) | Pattern di deployment aziendale | 90 min |

---

## 🚀 Checklist di produzione

- [ ] Distribuzione multi-regione per resilienza
- [ ] Identità gestita per l'autenticazione (senza chiavi)
- [ ] Application Insights per il monitoraggio
- [ ] Budget dei costi e avvisi configurati
- [ ] Scansione della sicurezza abilitata
- [ ] Integrazione della pipeline CI/CD
- [ ] Piano di disaster recovery

---

## 🏗️ Pattern architetturali

### Pattern 1: Microservizi AI

```mermaid
graph LR
    Gateway[Gateway API] --> AI[Servizio AI] --> Models[Modelli Microsoft Foundry]
    Gateway --> Auth[Servizio di autenticazione]
    AI --> Data[Archivio dati]
```
### Pattern 2: AI basata su eventi

```mermaid
graph LR
    EventGrid[Griglia di eventi] --> Functions[Funzioni] --> Pipeline[Pipeline di IA]
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

| Strategia | Risparmi |
|----------|---------|
| Scalare a zero (Container Apps) | 60-80% |
| Usare livelli di consumo per sviluppo | 50-70% |
| Ridimensionamento pianificato | 30-50% |
| Capacità riservata | 20-40% |

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
azd monitor --overview

# Visualizza metriche
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 7: Risoluzione dei problemi](../chapter-07-troubleshooting/README.md) |
| **Corso completo** | [Home del corso](../../README.md) |

---

## 📖 Risorse correlate

- [Guida agli agenti AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Soluzioni multi-agente](../chapter-05-multi-agent/README.md)
- [Esempio di microservizi](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si segnala che le traduzioni automatizzate possono contenere errori o inesattezze. Il documento originale nella sua lingua madre dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->