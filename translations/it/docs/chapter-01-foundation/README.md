# Capitolo 1: Fondamenti & Avvio Rapido

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 30-45 minuti | **⭐ Complessità**: Principiante

---

## Panoramica

Questo capitolo introduce i fondamenti di Azure Developer CLI (azd). Imparerai i concetti principali, installerai gli strumenti e distribuirai la tua prima applicazione su Azure.

> Validato con `azd 1.27.1` a luglio 2026.

## Obiettivi di Apprendimento

Completando questo capitolo, sarai in grado di:
- Capire cos'è Azure Developer CLI e come si differenzia da Azure CLI
- Installare e configurare AZD sulla tua piattaforma
- Distribuire la tua prima applicazione su Azure con `azd up`
- Pulire le risorse con `azd down`

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Fondamenti di AZD](azd-basics.md) | Concetti principali, terminologia e struttura del progetto | 15 min |
| 2 | [Installazione & Configurazione](installation.md) | Guide specifiche per piattaforma per l'installazione | 10 min |
| 3 | [Il Tuo Primo Progetto](first-project.md) | Pratica: Distribuire un'app web su Azure | 20 min |
| 4 | [Porta la Tua App](bring-your-own-app.md) | Aggiungi azd a un progetto esistente che hai già | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Ambienti azd riproducibili con contenitori di sviluppo | 15 min |

---

## ✅ Inizia Qui: Verifica la Tua Configurazione

Prima di iniziare, conferma che la tua macchina locale sia pronta per il modello del Capitolo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se lo script segnala strumenti mancanti, correggi quelli prima di continuare con il capitolo.

---

## 🚀 Avvio Rapido

```bash
# Verifica l'installazione
azd version

# Autenticati per AZD
# Opzionale: az login se prevedi di eseguire direttamente comandi Azure CLI
azd auth login

# Distribuisci la tua prima app
azd init --template todo-nodejs-mongo
azd up

# Pulisci quando hai finito
azd down --force --purge
```

---

## ✅ Criteri di Successo

Dopo aver completato questo capitolo, dovresti essere in grado di:

```bash
azd version              # Mostra versione installata
azd init --template todo-nodejs-mongo  # Inizializza progetto
azd up                   # Distribuisce su Azure
azd show                 # Mostra URL dell'app in esecuzione
azd down --force --purge # Pulisce le risorse
```

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Successivo** | [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/README.md) |
| **Salta a** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |

---

## 📖 Risorse Correlate

- [Cheat Sheet Comandi](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossario](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->