# Capitolo 7: Risoluzione dei problemi e debugging

**📚 Corso**: [AZD per principianti](../../README.md) | **⏱️ Durata**: 1-1.5 ore | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo ti aiuta a diagnosticare e risolvere problemi comuni quando si lavora con Azure Developer CLI. Dagli errori di distribuzione ai problemi specifici per l'IA.

> Validato con `azd 1.25.6` nel giugno 2026.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Diagnosticare i comuni errori di distribuzione di AZD
- Eseguire il debug di problemi di autenticazione e autorizzazioni
- Risolvere problemi di connettività dei servizi IA
- Usare il Portale di Azure e la CLI per la risoluzione dei problemi

---

## 📚 Lezioni

| # | Lezione | Descrizione | Durata |
|---|--------|-------------|------|
| 1 | [Problemi comuni](common-issues.md) | Problemi frequentemente riscontrati | 30 min |
| 2 | [Guida al Debug](debugging.md) | Strategie di debug passo dopo passo | 45 min |
| 3 | [Risoluzione problemi IA](ai-troubleshooting.md) | Problemi specifici per l'IA | 30 min |

---

## 🚨 Soluzioni rapide

### Problemi di autenticazione
```bash
# Necessario per i workflow AZD
azd auth login

# Opzionale se usi anche direttamente i comandi Azure CLI
az login

azd auth status
```

### Errori di provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflitti di risorse
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Quota superata
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Riferimento codici di errore

| Errore | Causa | Soluzione |
|-------|-------|----------|
| `AuthenticationError` | Non effettuato l'accesso | `azd auth login` |
| `ResourceNotFound` | Risorsa mancante | Verificare i nomi delle risorse |
| `QuotaExceeded` | Limiti della sottoscrizione | Richiedere un aumento della quota |
| `InvalidTemplate` | Errore di sintassi Bicep | `az bicep build` |
| `Conflict` | La risorsa esiste | Usare un nuovo nome o eliminare |
| `Forbidden` | Permessi insufficienti | Verificare i ruoli RBAC |

---

## 🔄 Ripristino e recupero

```bash
# Ripristino soft (mantieni le risorse, ridistribuisci il codice)
azd deploy --force

# Ripristino hard (elimina tutto, ricomincia da capo)
azd down --force --purge
azd up
```

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 6: Pre-distribuzione](../chapter-06-pre-deployment/README.md) |
| **Successivo** | [Capitolo 8: Produzione](../chapter-08-production/README.md) |

---

## 📖 Risorse correlate

- [Controlli pre-distribuzione](../chapter-06-pre-deployment/preflight-checks.md)
- [Guida alla configurazione](../chapter-03-configuration/configuration.md)
- [Segnalazioni GitHub di AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->