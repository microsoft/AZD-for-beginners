# Capitolo 6: Pianificazione e Validazione Pre-Distribuzione

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 1 ora | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo copre i passaggi essenziali di pianificazione e validazione prima di distribuire la tua applicazione. Impara a evitare errori costosi con una corretta pianificazione della capacità, selezione dello SKU e controlli preliminari.

> Validato con `azd 1.27.1` a luglio 2026.

## Obiettivi di Apprendimento

Completando questo capitolo, sarai in grado di:
- Eseguire controlli preliminari prima della distribuzione
- Pianificare la capacità e stimare i requisiti delle risorse
- Selezionare gli SKU appropriati per l’ottimizzazione dei costi
- Configurare Application Insights per il monitoraggio
- Comprendere i modelli di coordinamento del team

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Controlli Preliminari](preflight-checks.md) | Validare la configurazione prima della distribuzione | 15 min |
| 2 | [Pianificazione della Capacità](capacity-planning.md) | Stimare i requisiti delle risorse | 20 min |
| 3 | [Selezione SKU](sku-selection.md) | Scegliere i livelli di prezzo appropriati | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurare il monitoraggio | 20 min |
| 5 | [Modelli di Coordinamento](coordination-patterns.md) | Workflow di distribuzione del team | 15 min |

---

## 🚀 Avvio Rapido

```bash
# Controlla le quote di sottoscrizione
az vm list-usage --location eastus --output table

# Anteprima distribuzione (nessuna risorsa creata)
azd provision --preview

# Valida la sintassi Bicep
az bicep build --file infra/main.bicep

# Controlla la configurazione dell'ambiente
azd env get-values
```

---

## ☑️ Lista di Controllo Pre-Distribuzione

### Prima di `azd provision`

- [ ] Quota verificata per la regione
- [ ] SKU selezionati appropriatamente
- [ ] Stima dei costi rivista
- [ ] Convenzione di denominazione coerente
- [ ] Sicurezza/RBAC configurata

### Prima di `azd deploy`

- [ ] Variabili d’ambiente impostate
- [ ] Segreti nel Key Vault
- [ ] Stringhe di connessione verificate
- [ ] Controlli di integrità configurati

---

## 💰 Guida alla Selezione SKU

| Carico di lavoro | Sviluppo | Produzione |
|----------|-------------|------------|
| Container Apps | Consumo | Dedicato D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Base | Standard S2+ |

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Successivo** | [Capitolo 7: Risoluzione Problemi](../chapter-07-troubleshooting/README.md) |

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