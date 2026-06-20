# Capitolo 6: Pianificazione e convalida pre-distribuzione

**📚 Corso**: [AZD per principianti](../../README.md) | **⏱️ Durata**: 1 ora | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo tratta i passaggi essenziali di pianificazione e convalida prima di distribuire la tua applicazione. Impara a evitare errori costosi con una corretta pianificazione della capacità, la selezione degli SKU e i controlli preliminari.

> Validato con `azd 1.25.6` a giugno 2026.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Eseguire controlli preliminari prima della distribuzione
- Pianificare la capacità e stimare i requisiti delle risorse
- Selezionare SKU appropriati per l'ottimizzazione dei costi
- Configurare Application Insights per il monitoraggio
- Comprendere i modelli di coordinamento del team

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Controlli Preliminari](preflight-checks.md) | Convalidare la configurazione prima della distribuzione | 15 min |
| 2 | [Pianificazione della capacità](capacity-planning.md) | Stimare i requisiti delle risorse | 20 min |
| 3 | [Selezione SKU](sku-selection.md) | Scegliere i livelli tariffari appropriati | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurare il monitoraggio | 20 min |
| 5 | [Modelli di coordinamento](coordination-patterns.md) | Flussi di lavoro per la distribuzione del team | 15 min |

---

## 🚀 Avvio rapido

```bash
# Controlla le quote della sottoscrizione
az vm list-usage --location eastus --output table

# Anteprima della distribuzione (nessuna risorsa creata)
azd provision --preview

# Verifica la sintassi di Bicep
az bicep build --file infra/main.bicep

# Verifica la configurazione dell'ambiente
azd env get-values
```

---

## ☑️ Lista di controllo pre-distribuzione

### Prima di `azd provision`

- [ ] Quote verificate per la regione
- [ ] SKU selezionati correttamente
- [ ] Stima dei costi rivista
- [ ] Convenzione di denominazione coerente
- [ ] Sicurezza/RBAC configurati

### Prima di `azd deploy`

- [ ] Variabili d'ambiente impostate
- [ ] Segreti in Key Vault
- [ ] Stringhe di connessione verificate
- [ ] Controlli di integrità configurati

---

## 💰 Guida alla selezione degli SKU

| Carico di lavoro | Sviluppo | Produzione |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Successivo** | [Capitolo 7: Risoluzione dei problemi](../chapter-07-troubleshooting/README.md) |

---

## 📖 Risorse correlate

- [Guida alla configurazione](../chapter-03-configuration/configuration.md)
- [Guida alla distribuzione](../chapter-04-infrastructure/deployment-guide.md)
- [Problemi comuni](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->