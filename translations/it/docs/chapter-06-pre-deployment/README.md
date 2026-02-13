# Capitolo 6: Pianificazione pre-distribuzione e convalida

**📚 Corso**: [AZD per principianti](../../README.md) | **⏱️ Durata**: 1 ora | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo copre i passaggi essenziali di pianificazione e convalida prima di distribuire la tua applicazione. Impara a evitare errori costosi con una corretta pianificazione della capacità, selezione degli SKU e controlli preflight.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Eseguire i controlli preflight prima della distribuzione
- Pianificare la capacità e stimare i requisiti di risorse
- Selezionare SKU appropriate per l'ottimizzazione dei costi
- Configurare Application Insights per il monitoraggio
- Comprendere i modelli di coordinamento del team

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Controlli Preflight](preflight-checks.md) | Convalidare la configurazione prima della distribuzione | 15 min |
| 2 | [Pianificazione della capacità](capacity-planning.md) | Stimare i requisiti di risorse | 20 min |
| 3 | [Selezione SKU](sku-selection.md) | Scegliere i livelli di prezzo appropriati | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurare il monitoraggio | 20 min |
| 5 | [Modelli di coordinamento](coordination-patterns.md) | Flussi di lavoro del team per il deployment | 15 min |

---

## 🚀 Avvio rapido

```bash
# Verificare le quote della sottoscrizione
az vm list-usage --location eastus --output table

# Anteprima della distribuzione (nessuna risorsa creata)
azd provision --preview

# Convalidare la sintassi di Bicep
az bicep build --file infra/main.bicep

# Verificare la configurazione dell'ambiente
azd env get-values
```

---

## ☑️ Lista di controllo pre-distribuzione

### Before `azd provision`

- [ ] Quote verificate per la regione
- [ ] SKU selezionati correttamente
- [ ] Stima dei costi verificata
- [ ] Convenzione di denominazione coerente
- [ ] Sicurezza/RBAC configurata

### Before `azd deploy`

- [ ] Variabili d'ambiente impostate
- [ ] Segreti in Key Vault
- [ ] Stringhe di connessione verificate
- [ ] Controlli di integrità configurati

---

## 💰 Guida alla selezione degli SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
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
- [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md)
- [Problemi comuni](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Dichiarazione di non responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su intelligenza artificiale Co-op Translator (https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->