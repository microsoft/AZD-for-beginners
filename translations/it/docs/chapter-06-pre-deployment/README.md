# Capitolo 6: Pianificazione e Validazione Pre-Distribuzione

**📚 Corso**: [AZD per Principianti](../../README.md) | **⏱️ Durata**: 2-4 ore di lettura; tempo aggiuntivo per laboratori adattati | **⭐ Complessità**: Intermedio–Avanzato

---

## Panoramica

Questo capitolo copre i passaggi essenziali di pianificazione e validazione prima di distribuire la tua applicazione. Impara a evitare errori costosi con una corretta pianificazione della capacità, selezione degli SKU e controlli pre-volo.

> Indicazioni sui comandi riviste rispetto al riferimento rilasciato `azd 1.37.2`. Le distribuzioni cloud non sono state eseguite. Le lezioni più lunghe includono frammenti illustrativi, non progetti completi di distribuzione locale.

## Obiettivi di Apprendimento

Completando questo capitolo, sarai in grado di:
- Eseguire controlli pre-volo prima della distribuzione
- Pianificare la capacità e stimare i requisiti delle risorse
- Selezionare SKU appropriate per l'ottimizzazione dei costi
- Configurare Application Insights per il monitoraggio
- Comprendere i modelli di coordinamento multi-agente e i loro requisiti di distribuzione

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Controlli Pre-Vol](preflight-checks.md) | Validare la configurazione prima della distribuzione | 15 min |
| 2 | [Pianificazione della Capacità](capacity-planning.md) | Stimare i requisiti delle risorse | 20 min |
| 3 | [Selezione SKU](sku-selection.md) | Scegliere livelli di prezzo appropriati | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurare il monitoraggio | 20 min |
| 5 | [Modelli di Coordinamento](coordination-patterns.md) | Progettazione avanzata di orchestrazione multi-agente | 60-75 min |

---

## 🚀 Avvio Rapido

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Checklist Pre-Distribuzione

### Prima di `azd provision`

- [ ] Quota verificata per regione
- [ ] SKU selezionati correttamente
- [ ] Stima dei costi revisionata
- [ ] Convenzione di denominazione coerente
- [ ] Sicurezza/RBAC configurata

### Prima di `azd deploy`

- [ ] Variabili d'ambiente impostate
- [ ] Segreti in Key Vault
- [ ] Stringhe di connessione verificate
- [ ] Controlli di salute configurati

---

## 💰 Guida alla Selezione SKU

| Carico di lavoro | Sviluppo | Produzione |
|----------|-------------|------------|
| Container Apps | Consumo | Consumo o profilo di carico dedicato, basato sul carico misurato |
| App Service | B1/B2 | P1v3+ |
| Modelli Azure OpenAI | Tipo di distribuzione a consumo supportato | Consumo o throughput provvisto; dipendente da modello/regione |
| AI Search | Free/Base nei limiti | Tier Base o Standard dimensionato per indice, repliche e carico query |

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 5: Multi-Agente](../chapter-05-multi-agent/README.md) |
| **Successivo** | [Capitolo 7: Risoluzione dei Problemi](../chapter-07-troubleshooting/README.md) |

---

## 📖 Risorse Correlate

- [Guida alla Configurazione](../chapter-03-configuration/configuration.md)
- [Guida alla Distribuzione](../chapter-04-infrastructure/deployment-guide.md)
- [Problemi Comuni](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->