# Capitolo 3: Configurazione e Autenticazione

**📚 Corso**: [AZD per principianti](../../README.md) | **⏱️ Durata**: 45-60 minuti | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo tratta la configurazione dell'ambiente, i modelli di autenticazione e le migliori pratiche di sicurezza per le distribuzioni con Azure Developer CLI.

> Validato con `azd 1.23.12` a marzo 2026.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Padroneggiare la gerarchia di configurazione di AZD
- Gestire più ambienti (dev, staging, prod)
- Implementare un'autenticazione sicura con identità gestite
- Configurare impostazioni specifiche per l'ambiente

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Guida alla configurazione](configuration.md) | Configurazione e gestione dell'ambiente | 30 min |
| 2 | [Autenticazione e Sicurezza](authsecurity.md) | Identità gestite e modelli RBAC | 30 min |

---

## 🚀 Avvio rapido

```bash
# Creare più ambienti
azd env new dev
azd env new staging
azd env new prod

# Passare tra gli ambienti
azd env select prod

# Impostare le variabili d'ambiente
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Visualizzare la configurazione
azd env get-values
```

---

## 🔧 Gerarchia di configurazione

AZD applica le impostazioni in questo ordine (quelle successive sovrascrivono le precedenti):

1. **Default values** (integrati nei template)
2. **azure.yaml** (configurazione del progetto)
3. **Variabili d'ambiente** (`azd env set`)
4. **Opzioni della riga di comando** (`--location eastus`)

---

## 🔐 Migliori pratiche di sicurezza

```bash
# Usa l'identità gestita (consigliato)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Verifica lo stato di autenticazione di AZD
azd auth status

# Opzionale: verifica il contesto di Azure CLI se prevedi di eseguire comandi az
az account show

# Riautenticati se necessario
azd auth login

# Opzionale: aggiorna l'autenticazione di Azure CLI per i comandi az
az login
```

---

## 🔗 Navigazione

| Direction | Chapter |
|-----------|---------|
| **Precedente** | [Capitolo 2: Sviluppo AI](../chapter-02-ai-development/README.md) |
| **Successivo** | [Capitolo 4: Infrastruttura](../chapter-04-infrastructure/README.md) |

---

## 📖 Risorse correlate

- [Controlli pre-distribuzione](../chapter-06-pre-deployment/README.md)
- [Risoluzione dei problemi](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatizzate possono contenere errori o inesattezze. Il documento originale nella sua lingua madre deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->