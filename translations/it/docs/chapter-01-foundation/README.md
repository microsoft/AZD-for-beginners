# Capitolo 1: Fondamenti & Avvio Rapido

**📚 Corso**: [AZD per Principianti](../../README.md) | **⏱️ Durata**: 75-120 minuti incluso il primo deployment; esercizi aggiuntivi richiedono più tempo | **⭐ Complessità**: Principiante

---

## Panoramica

Questo capitolo introduce i fondamenti di Azure Developer CLI (azd). Imparerai i concetti base, installerai gli strumenti e distribuirai la tua prima applicazione su Azure.

> Obiettivo revisione comandi e configurazioni: `azd 1.37.2` (novembre 2026). La provisioning live di Azure non è stata eseguita durante la revisione.

## Obiettivi di Apprendimento

Completando questo capitolo, sarai in grado di:
- Comprendere cos’è Azure Developer CLI e come si differenzia da Azure CLI
- Installare e configurare AZD sulla tua piattaforma
- Distribuire la tua prima applicazione su Azure con `azd up`
- Pulire le risorse con `azd down`

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Nozioni di base AZD](azd-basics.md) | Concetti base, terminologia e struttura del progetto | 15 min |
| 2 | [Installazione & Configurazione](installation.md) | Guide all’installazione specifiche per piattaforma | 10 min |
| 3 | [Il tuo primo progetto](first-project.md) | Pratico: Distribuire un’app web su Azure | 20 min |
| 4 | [Porta la tua app](bring-your-own-app.md) | Aggiungi azd a un progetto esistente che hai già | 15 min |
| 5 | [Container di sviluppo & Codespaces](dev-containers.md) | Ambienti azd riproducibili con container di sviluppo | 15 min |

---

## ✅ Inizia Qui: Valida la tua Configurazione

Prima di iniziare, conferma che la tua macchina locale sia pronta per il template del Capitolo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se lo script segnala strumenti mancanti, risolvili prima e poi continua con il capitolo.

---

## 🚀 Avvio Rapido

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Criteri di Successo

Dopo aver completato questo capitolo, dovresti essere in grado di:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Successivo** | [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/README.md) |
| **Salta a** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |

---

## 📖 Risorse Correlate

- [Scheda Rapida Comandi](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossario](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->