# Capitolo 7: Risoluzione dei problemi e Debugging

**📚 Corso**: [AZD per principianti](../../README.md) | **⏱️ Durata**: 1-1.5 ore | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo ti aiuta a diagnosticare e risolvere problemi comuni quando lavori con Azure Developer CLI. Dai fallimenti di distribuzione ai problemi specifici dell'AI.

> Validato con `azd 1.23.12` a marzo 2026.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Diagnosticare i problemi comuni di distribuzione di AZD
- Risolvere i problemi di autenticazione e autorizzazione
- Risolvere problemi di connettività dei servizi AI
- Usare Azure Portal e la CLI per la risoluzione dei problemi

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Problemi comuni](common-issues.md) | Problemi frequentemente riscontrati | 30 min |
| 2 | [Guida al Debugging](debugging.md) | Strategie di debugging passo dopo passo | 45 min |
| 3 | [Risoluzione problemi AI](ai-troubleshooting.md) | Problemi specifici dell'AI | 30 min |

---

## 🚨 Soluzioni rapide

### Problemi di autenticazione
```bash
# Richiesto per i workflow AZD
azd auth login

# Opzionale se utilizzi anche direttamente i comandi della CLI di Azure
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

## 📋 Riferimento ai codici di errore

| Errore | Causa | Soluzione |
|-------|-------|----------|
| `AuthenticationError` | Non autenticato | `azd auth login` |
| `ResourceNotFound` | Risorsa mancante | Check resource names |
| `QuotaExceeded` | Limiti della sottoscrizione | Request quota increase |
| `InvalidTemplate` | Errore di sintassi Bicep | `az bicep build` |
| `Conflict` | La risorsa esiste | Use new name or delete |
| `Forbidden` | Permessi insufficienti | Check RBAC roles |

---

## 🔄 Ripristino e recupero

```bash
# Ripristino soft (mantieni le risorse, ridistribuisci il codice)
azd deploy --force

# Ripristino hard (elimina tutto, ricomincia da zero)
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
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per la precisione, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->