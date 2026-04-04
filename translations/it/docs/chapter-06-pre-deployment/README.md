# Capitolo 6: Pianificazione e Validazione Pre-Distribuzione

**📚 Corso**: [AZD For Beginners](../../README.md) | **⏱️ Durata**: 1 ora | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo copre i passaggi essenziali di pianificazione e validazione prima di distribuire la tua applicazione. Impara a evitare errori costosi con una corretta pianificazione della capacità, selezione degli SKU e controlli preliminari.

> Validato con `azd 1.23.12` a marzo 2026.

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
| 1 | [Preflight Checks](preflight-checks.md) | Valida la configurazione prima della distribuzione | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Stima i requisiti delle risorse | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Scegli i livelli di prezzo appropriati | 15 min |
| 4 | [Application Insights](application-insights.md) | Configura il monitoraggio | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Flussi di lavoro di distribuzione del team | 15 min |

---

## 🚀 Avvio Rapido

```bash
# Verifica le quote della sottoscrizione
az vm list-usage --location eastus --output table

# Anteprima della distribuzione (nessuna risorsa verrà creata)
azd provision --preview

# Convalida la sintassi di Bicep
az bicep build --file infra/main.bicep

# Verifica la configurazione dell'ambiente
azd env get-values
```

---

## ☑️ Lista di Controllo Pre-Distribuzione

### Prima di `azd provision`

- [ ] Quota verificata per la regione
- [ ] SKU selezionati correttamente
- [ ] Stima dei costi revisionata
- [ ] Convenzione di denominazione coerente
- [ ] Sicurezza/RBAC configurata

### Prima di `azd deploy`

- [ ] Variabili d'ambiente impostate
- [ ] Segreti in Key Vault
- [ ] Stringhe di connessione verificate
- [ ] Controlli di integrità configurati

---

## 💰 Guida alla Selezione degli SKU

| Workload | Sviluppo | Produzione |
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
| **Successivo** | [Capitolo 7: Risoluzione dei Problemi](../chapter-07-troubleshooting/README.md) |

---

## 📖 Risorse Correlate

- [Guida alla Configurazione](../chapter-03-configuration/configuration.md)
- [Guida alla Distribuzione](../chapter-04-infrastructure/deployment-guide.md)
- [Problemi Comuni](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->