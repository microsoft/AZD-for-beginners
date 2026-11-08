# Capitolo 3: Configurazione e Autenticazione

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 90-150 minuti incluso esercizi di integrazione | **⭐ Difficoltà**: Intermedio

---

## Panoramica

Questo capitolo copre la configurazione dell'ambiente, i modelli di autenticazione e le migliori pratiche di sicurezza per i deployment con Azure Developer CLI.

> Obiettivo di revisione comandi e configurazione: `azd 1.37.2` (Novembre 2026). La distribuzione live su Azure non è stata eseguita durante la revisione.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Padroneggiare la gerarchia di configurazione di AZD
- Gestire ambienti multipli (dev, staging, prod)
- Implementare un'autenticazione sicura con managed identities
- Configurare impostazioni specifiche per l'ambiente

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Guida alla Configurazione](configuration.md) | Configurazione e gestione dell'ambiente | 30 min |
| 2 | [Autenticazione e Sicurezza](authsecurity.md) | Identità gestite e modelli RBAC | 30 min |

---

## 🚀 Avvio Rapido

Esegui dalla radice di un **applicazione azd già inizializzata**, non dal repository del corso. Usa nomi di ambiente non utilizzati se questi esistono già.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` è illustrativo: influisce sull'infrastruttura solo se il tuo template lo consuma esplicitamente. I normali valori di `azd env set` sono salvati localmente in testo non criptato; non sono una memorizzazione sicura dei segreti.

---

## 🔧 Gerarchia di Configurazione

Mantieni separate tre superfici di configurazione: preferenze globali (`azd config`), struttura del progetto (`azure.yaml`) e valori per ambiente (`azd env`). Le flag sovrascrivono solo le impostazioni che effettivamente supportano; non esiste un'applicazione universale di variabili d'ambiente arbitrarie su `azure.yaml` o Bicep.

---

## 🔐 Migliori Pratiche di Sicurezza

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 2: Sviluppo AI](../chapter-02-ai-development/README.md) |
| **Successivo** | [Capitolo 4: Infrastruttura](../chapter-04-infrastructure/README.md) |

---

## 📖 Risorse Correlate

- [Controlli Pre-Deployment](../chapter-06-pre-deployment/README.md)
- [Risoluzione Problemi](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->