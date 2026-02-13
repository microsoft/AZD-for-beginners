# Capitolo 3: Configurazione e Autenticazione

**📚 Corso**: [AZD per Principianti](../../README.md) | **⏱️ Durata**: 45-60 minuti | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo tratta la configurazione dell'ambiente, i pattern di autenticazione e le migliori pratiche di sicurezza per le distribuzioni con Azure Developer CLI.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Padroneggiare la gerarchia di configurazione di AZD
- Gestire più ambienti (dev, staging, prod)
- Implementare l'autenticazione sicura con identità gestite
- Configurare impostazioni specifiche per ambiente

---

## 📚 Lezioni

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Guida alla configurazione](configuration.md) | Impostazione e gestione dell'ambiente | 30 min |
| 2 | [Autenticazione e Sicurezza](authsecurity.md) | Pattern per identità gestite e RBAC | 30 min |

---

## 🚀 Avvio rapido

```bash
# Crea più ambienti
azd env new dev
azd env new staging
azd env new prod

# Passa tra gli ambienti
azd env select prod

# Imposta le variabili d'ambiente
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Visualizza la configurazione
azd env get-values
```

---

## 🔧 Gerarchia di configurazione

AZD applica le impostazioni in questo ordine (le successive sovrascrivono le precedenti):

1. **Valori predefiniti** (inclusi nei template)
2. **azure.yaml** (configurazione del progetto)
3. **Variabili d'ambiente** (`azd env set`)
4. **Flag da riga di comando** (`--location eastus`)

---

## 🔐 Migliori pratiche di sicurezza

```bash
# Usare l'identità gestita (consigliato)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Verificare lo stato di autenticazione
azd auth whoami
az account show

# Riautenticarsi se necessario
azd auth login
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
Esclusione di responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su intelligenza artificiale Co‑op Translator (https://github.com/Azure/co-op-translator). Pur impegnandoci a garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua d'origine deve essere considerato la fonte autorevole. Per informazioni di natura critica si raccomanda la traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->