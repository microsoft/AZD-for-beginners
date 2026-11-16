# Capitolo 7: Risoluzione problemi e Debug

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 1-1.5 ore | **⭐ Difficoltà**: Intermedio

---

## Panoramica

Questo capitolo ti aiuta a diagnosticare e risolvere problemi comuni quando lavori con Azure Developer CLI. Dai fallimenti di distribuzione ai problemi specifici dell'AI.

> Guida ai comandi verificata rispetto alla versione ufficiale di `azd 1.37.2`. Le distribuzioni cloud non sono state eseguite. Sostituisci i nomi e gli ID delle risorse di esempio prima di usare i comandi.

## Obiettivi di Apprendimento

Completando questo capitolo, potrai:
- Diagnosticare i fallimenti comuni nelle distribuzioni AZD
- Debuggare problemi di autenticazione e permessi
- Risolvere problemi di connettività ai servizi AI
- Usare Azure Portal e CLI per la risoluzione dei problemi

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Problemi Comuni](common-issues.md) | Problemi frequentemente riscontrati | 30 min |
| 2 | [Guida al Debugging](debugging.md) | Strategie di debugging passo-passo | 45 min |
| 3 | [Risoluzione Problemi AI](ai-troubleshooting.md) | Problemi specifici AI | 30 min |

---

## 🚨 Soluzioni Veloci

### Problemi di Autenticazione
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Fallimenti di Provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflitti di Risorse
Ispeziona prima le risorse esistenti e gli errori di distribuzione. Non eliminare un ambiente condiviso o di produzione per risolvere un conflitto di nomi. Per un **nuovo ambiente usa e getta**, usa un nome unico:

```bash
azd env new different-name
azd up
```

### Quota Superata
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Cambiare `AZURE_LOCATION` non sposta le risorse esistenti e può causare conflitti di localizzazione alla ridistribuzione.

---

## 📋 Riferimento Codici di Errore

| Errore | Causa | Soluzione |
|-------|-------|----------|
| `AuthenticationError` | Non loggato | `azd auth login` |
| `ResourceNotFound` | Risorsa mancante | Controlla i nomi delle risorse |
| `QuotaExceeded` | Limiti sottoscrizione | Richiedi aumento quota |
| `InvalidTemplate` | Errore sintassi Bicep | `az bicep build` |
| `Conflict` | Risorsa esistente | Usa un nome nuovo o elimina |
| `Forbidden` | Permessi insufficienti | Controlla i ruoli RBAC |

---

## 🔄 Reset e Recupero

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Il reset completo elimina dati e può cambiare gli endpoint. Esegui un backup prima e rivedi le richieste di eliminazione interattive. `--force --purge` è appropriato solo per ambienti usa e getta quando si intende un'eliminazione irreversibile.

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 6: Pre-Distribuzione](../chapter-06-pre-deployment/README.md) |
| **Successivo** | [Capitolo 8: Produzione](../chapter-08-production/README.md) |

---

## 📖 Risorse Correlate

- [Verifiche Pre-Distribuzione](../chapter-06-pre-deployment/preflight-checks.md)
- [Guida alla Configurazione](../chapter-03-configuration/configuration.md)
- [Issue GitHub AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->