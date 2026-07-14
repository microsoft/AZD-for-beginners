# Capitolo 8: Pattern di Produzione e Aziendali

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 2-3 ore | **⭐ Complessità**: Avanzato

---

## Panoramica

Questo capitolo tratta pattern di deployment pronti per l'azienda, rafforzamento della sicurezza, monitoraggio e ottimizzazione dei costi per carichi di lavoro AI in produzione.

> Validato con `azd 1.27.1` a luglio 2026.

## Obiettivi di Apprendimento

Completando questo capitolo, sarai in grado di:
- Distribuire applicazioni resilienti multi-regione
- Implementare pattern di sicurezza aziendali
- Configurare un monitoraggio completo
- Ottimizzare i costi su larga scala
- Impostare pipeline CI/CD con AZD

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Pratiche AI in Produzione](production-ai-practices.md) | Pattern di deployment aziendale | 90 min |

---

## 🚀 Lista di Controllo per la Produzione

- [ ] Deployment multi-regione per resilienza
- [ ] Identità gestita per autenticazione (nessuna chiave)
- [ ] Application Insights per monitoraggio
- [ ] Budget e alert sui costi configurati
- [ ] Scansione di sicurezza abilitata
- [ ] Integrazione pipeline CI/CD
- [ ] Piano di disaster recovery

---

## 🏗️ Pattern Architetturali

### Pattern 1: Microservizi AI

```mermaid
graph LR
    Gateway[Gateway API] --> AI[Servizio AI] --> Models[Modelli Microsoft Foundry]
    Gateway --> Auth[Servizio di Autenticazione]
    AI --> Data[Archivio Dati]
```

### Pattern 2: AI Event-Driven

```mermaid
graph LR
    EventGrid[Griglia Eventi] --> Functions[Funzioni] --> Pipeline[Pipeline AI]
```

---

## 🔐 Migliori Pratiche di Sicurezza

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

## 💰 Ottimizzazione dei Costi

| Strategia | Risparmio |
|----------|---------|
| Scalare a zero (Container Apps) | 60-80% |
| Usare livelli a consumo per sviluppo | 50-70% |
| Scalabilità programmata | 30-50% |
| Capacità riservata | 20-40% |

```bash
# Imposta avvisi di budget
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Configurazione del Monitoraggio

```bash
# Flusso di log
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
| **Precedente** | [Capitolo 7: Risoluzione Problemi](../chapter-07-troubleshooting/README.md) |
| **Corso Completo** | [Home del Corso](../../README.md) |

---

## 📖 Risorse Correlate

- [Guida agli Agenti AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Soluzioni Multi-Agente](../chapter-05-multi-agent/README.md)
- [Esempio Microservizi](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->