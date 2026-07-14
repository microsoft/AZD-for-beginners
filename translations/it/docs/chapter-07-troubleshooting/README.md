# Capitolo 7: Risoluzione dei Problemi e Debugging

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 1-1.5 ore | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo ti aiuta a diagnosticare e risolvere problemi comuni quando si lavora con Azure Developer CLI. Dai fallimenti di distribuzione a problemi specifici dell'AI.

> Validato con `azd 1.27.1` a luglio 2026.

## Obiettivi di Apprendimento

Completando questo capitolo, sarai in grado di:
- Diagnosticare i fallimenti comuni di distribuzione AZD
- Debuggare problemi di autenticazione e permessi
- Risolvere problemi di connettività del servizio AI
- Usare Azure Portal e CLI per la risoluzione dei problemi

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Problemi Comuni](common-issues.md) | Problemi frequentemente riscontrati | 30 min |
| 2 | [Guida al Debugging](debugging.md) | Strategie di debugging passo-passo | 45 min |
| 3 | [Risoluzione Problemi AI](ai-troubleshooting.md) | Problemi specifici dell'AI | 30 min |

---

## 🚨 Soluzioni Veloci

### Problemi di Autenticazione
```bash
# Necessario per i flussi di lavoro AZD
azd auth login

# Opzionale se stai anche usando direttamente i comandi Azure CLI
az login

azd auth status
```

### Fallimenti di Provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflitti di Risorse
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Quota Superata
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Riferimento Codici di Errore

| Errore | Causa | Soluzione |
|-------|-------|----------|
| `AuthenticationError` | Non autenticato | `azd auth login` |
| `ResourceNotFound` | Risorsa mancante | Controlla i nomi risorsa |
| `QuotaExceeded` | Limiti di sottoscrizione | Richiedi aumento quota |
| `InvalidTemplate` | Errore di sintassi Bicep | `az bicep build` |
| `Conflict` | Risorsa esistente | Usa un nome nuovo o cancella |
| `Forbidden` | Permessi insufficienti | Controlla ruoli RBAC |

---

## 🔄 Reset e Ripristino

```bash
# Reset soft (mantieni risorse, ridistribuisci codice)
azd deploy --force

# Reset hard (elimina tutto, ricomincia da capo)
azd down --force --purge
azd up
```

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 6: Pre-Distribuzione](../chapter-06-pre-deployment/README.md) |
| **Successivo** | [Capitolo 8: Produzione](../chapter-08-production/README.md) |

---

## 📖 Risorse Correlate

- [Controlli Pre-Distribuzione](../chapter-06-pre-deployment/preflight-checks.md)
- [Guida alla Configurazione](../chapter-03-configuration/configuration.md)
- [Issue GitHub AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->