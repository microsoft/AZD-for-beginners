# Capitolo 7: Risoluzione dei problemi e debugging

**📚 Corso**: [AZD For Beginners](../../README.md) | **⏱️ Durata**: 1-1.5 ore | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo ti aiuta a diagnosticare e risolvere problemi comuni quando lavori con Azure Developer CLI. Dalle operazioni di distribuzione non riuscite ai problemi specifici dell'AI.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Diagnosticare i fallimenti comuni nelle distribuzioni AZD
- Eseguire il debug di problemi di autenticazione e permessi
- Risolvere problemi di connettività dei servizi AI
- Usare il Portale di Azure e la CLI per la risoluzione dei problemi

---

## 📚 Lezioni

| # | Lezione | Descrizione | Durata |
|---|--------|-------------|------|
| 1 | [Problemi comuni](common-issues.md) | Problemi frequentemente riscontrati | 30 min |
| 2 | [Guida al debug](debugging.md) | Strategie di debug passo-passo | 45 min |
| 3 | [Risoluzione problemi AI](ai-troubleshooting.md) | Problemi specifici dell'AI | 30 min |

---

## 🚨 Soluzioni rapide

### Problemi di autenticazione
```bash
azd auth login
az login
azd auth whoami
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
| `AuthenticationError` | Non autenticato | `azd auth login` |
| `ResourceNotFound` | Risorsa mancante | Controllare i nomi delle risorse |
| `QuotaExceeded` | Limiti della sottoscrizione | Richiedere l'aumento della quota |
| `InvalidTemplate` | Errore di sintassi Bicep | `az bicep build` |
| `Conflict` | Risorsa esistente | Usare un nuovo nome o eliminare |
| `Forbidden` | Permessi insufficienti | Verificare i ruoli RBAC |

---

## 🔄 Ripristino e recupero

```bash
# Ripristino parziale (mantieni le risorse, ridistribuisci il codice)
azd deploy --force

# Ripristino completo (elimina tutto, ricomincia da capo)
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
- [Segnalazioni AZD su GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Dichiarazione di non responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su intelligenza artificiale [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella lingua in cui è stato redatto deve essere considerato la fonte autorevole. Per informazioni di carattere critico si raccomanda una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->