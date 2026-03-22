# Chapter 6: Pre-Deployment Planning & Validation

**📚 Corso**: [AZD per principianti](../../README.md) | **⏱️ Durata**: 1 ora | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo copre i passaggi essenziali di pianificazione e convalida prima di distribuire la tua applicazione. Impara a evitare errori costosi con una corretta pianificazione della capacità, selezione degli SKU e controlli preflight.

## Obiettivi di apprendimento

Al completamento di questo capitolo, sarai in grado di:
- Eseguire controlli preflight prima del deployment
- Pianificare la capacità e stimare i requisiti delle risorse
- Selezionare SKU appropriati per l'ottimizzazione dei costi
- Configurare Application Insights per il monitoraggio
- Comprendere i modelli di coordinamento del team

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Controlli Preliminari](preflight-checks.md) | Valida la configurazione prima del deployment | 15 min |
| 2 | [Pianificazione della capacità](capacity-planning.md) | Stima i requisiti delle risorse | 20 min |
| 3 | [Selezione SKU](sku-selection.md) | Scegli i livelli di prezzo appropriati | 15 min |
| 4 | [Application Insights](application-insights.md) | Configura il monitoraggio | 20 min |
| 5 | [Modelli di coordinamento](coordination-patterns.md) | Flussi di lavoro di deployment del team | 15 min |

---

## 🚀 Avvio rapido

```bash
# Verifica le quote della sottoscrizione
az vm list-usage --location eastus --output table

# Anteprima della distribuzione (nessuna risorsa creata)
azd provision --preview

# Valida la sintassi di Bicep
az bicep build --file infra/main.bicep

# Verifica la configurazione dell'ambiente
azd env get-values
```

---

## ☑️ Checklist pre-distribuzione

### Prima di `azd provision`

- [ ] Quota verificata per la regione
- [ ] SKU selezionati correttamente
- [ ] Stima dei costi rivista
- [ ] Convenzione di denominazione coerente
- [ ] Sicurezza/RBAC configurata

### Prima di `azd deploy`

- [ ] Variabili d'ambiente impostate
- [ ] Segreti in Key Vault
- [ ] Stringhe di connessione verificate
- [ ] Controlli di integrità configurati

---

## 💰 Guida alla selezione SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigazione

| Direction | Chapter |
|-----------|---------|
| **Precedente** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Successivo** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 Risorse correlate

- [Guida alla configurazione](../chapter-03-configuration/configuration.md)
- [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md)
- [Problemi comuni](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci a garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->