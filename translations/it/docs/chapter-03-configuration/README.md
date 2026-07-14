# Capitolo 3: Configurazione e Autenticazione

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 45-60 minuti | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo tratta la configurazione dell'ambiente, i modelli di autenticazione e le migliori pratiche di sicurezza per le distribuzioni con Azure Developer CLI.

> Validato con `azd 1.27.1` a luglio 2026.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Padroneggiare la gerarchia di configurazione di AZD
- Gestire più ambienti (dev, staging, prod)
- Implementare un’autenticazione sicura con identità gestite
- Configurare impostazioni specifiche per ambiente

---

## 📚 Lezioni

| # | Lezione | Descrizione | Durata |
|---|--------|-------------|--------|
| 1 | [Guida alla Configurazione](configuration.md) | Configurazione e gestione dell'ambiente | 30 min |
| 2 | [Autenticazione e Sicurezza](authsecurity.md) | Modelli di identità gestita e RBAC | 30 min |

---

## 🚀 Avvio Rapido

```bash
# Crea più ambienti
azd env new dev
azd env new staging
azd env new prod

# Cambia ambiente
azd env select prod

# Imposta variabili di ambiente
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Visualizza configurazione
azd env get-values
```

---

## 🔧 Gerarchia di Configurazione

AZD applica le impostazioni in questo ordine (le successive sovrascrivono le precedenti):

1. **Valori predefiniti** (inclusi nei modelli)
2. **azure.yaml** (configurazione del progetto)
3. **Variabili d'ambiente** (`azd env set`)
4. **Flag da riga di comando** (`--location eastus`)

---

## 🔐 Migliori Pratiche di Sicurezza

```bash
# Usa l'identità gestita (consigliato)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Controlla lo stato di autenticazione AZD
azd auth status

# Facoltativo: verifica il contesto Azure CLI se prevedi di eseguire comandi az
az account show

# Effettua nuovamente l'autenticazione se necessario
azd auth login

# Facoltativo: aggiorna l'autenticazione Azure CLI per i comandi az
az login
```

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|----------|
| **Precedente** | [Capitolo 2: Sviluppo AI](../chapter-02-ai-development/README.md) |
| **Successivo** | [Capitolo 4: Infrastruttura](../chapter-04-infrastructure/README.md) |

---

## 📖 Risorse Correlate

- [Controlli Pre-Distribuzione](../chapter-06-pre-deployment/README.md)
- [Risoluzione Problemi](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->