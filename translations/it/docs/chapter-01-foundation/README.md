# Capitolo 1: Fondamenti & Avvio Rapido

**📚 Corso**: [AZD per principianti](../../README.md) | **⏱️ Durata**: 30-45 minuti | **⭐ Complessità**: Principiante

---

## Panoramica

Questo capitolo introduce i fondamenti di Azure Developer CLI (azd). Imparerai i concetti principali, installerai gli strumenti e distribuirai la tua prima applicazione su Azure.

> Validato con `azd 1.23.12` a marzo 2026.

## Obiettivi di apprendimento

Al completamento di questo capitolo, sarai in grado di:
- Comprendere cos'è Azure Developer CLI e come si differenzia da Azure CLI
- Installare e configurare AZD sulla tua piattaforma
- Distribuire la tua prima applicazione su Azure con `azd up`
- Ripulire le risorse con `azd down`

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Nozioni di base di AZD](azd-basics.md) | Concetti fondamentali, terminologia e struttura del progetto | 15 min |
| 2 | [Installazione e configurazione](installation.md) | Guide di installazione specifiche per piattaforma | 10 min |
| 3 | [Il tuo primo progetto](first-project.md) | Esercitazione pratica: distribuire un'app web su Azure | 20 min |

---

## ✅ Inizia Qui: valida la tua configurazione

Prima di iniziare, verifica che la tua macchina locale sia pronta per il template del Capitolo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se lo script segnala strumenti mancanti, correggili prima e poi continua con il capitolo.

---

## 🚀 Avvio rapido

```bash
# Verifica l'installazione
azd version

# Autenticati per AZD
# Opzionale: esegui az login se prevedi di eseguire comandi Azure CLI direttamente
azd auth login

# Distribuisci la tua prima app
azd init --template todo-nodejs-mongo
azd up

# Pulisci quando hai finito
azd down --force --purge
```

---

## ✅ Criteri di successo

Dopo aver completato questo capitolo, dovresti essere in grado di:

```bash
azd version              # Mostra la versione installata
azd init --template todo-nodejs-mongo  # Inizializza il progetto
azd up                   # Distribuisce su Azure
azd show                 # Mostra l'URL dell'app in esecuzione
azd down --force --purge # Pulisce le risorse
```

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Next** | [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/README.md) |
| **Skip to** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |

---

## 📖 Risorse correlate

- [Scheda dei comandi](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossario](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per l'accuratezza, si prega di tenere presente che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua originale dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->