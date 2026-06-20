# Capitolo 1: Fondamenti e Avvio Rapido

**📚 Corso**: [AZD per principianti](../../README.md) | **⏱️ Durata**: 30-45 minuti | **⭐ Complessità**: Principiante

---

## Panoramica

Questo capitolo introduce i fondamenti di Azure Developer CLI (azd). Imparerai i concetti principali, installerai gli strumenti e distribuirai la tua prima applicazione su Azure.

> Validato con `azd 1.25.6` a giugno 2026.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Capire cos'è Azure Developer CLI e come si differenzia da Azure CLI
- Installare e configurare AZD sulla tua piattaforma
- Distribuire la tua prima applicazione su Azure con `azd up`
- Ripulire le risorse con `azd down`

---

## 📚 Lezioni

| # | Lezione | Descrizione | Durata |
|---|--------|-------------|------|
| 1 | [Basi di AZD](azd-basics.md) | Concetti fondamentali, terminologia e struttura del progetto | 15 min |
| 2 | [Installazione e configurazione](installation.md) | Guide di installazione specifiche per piattaforma | 10 min |
| 3 | [Il tuo primo progetto](first-project.md) | Pratica: Distribuisci un'app web su Azure | 20 min |
| 4 | [Aggiungi azd a un'app esistente](bring-your-own-app.md) | Aggiungi azd a un progetto esistente che hai già | 15 min |
| 5 | [Dev Containers e Codespaces](dev-containers.md) | Ambienti azd riproducibili con dev container | 15 min |

---

## ✅ Inizia qui: Verifica la tua configurazione

Prima di iniziare, conferma che la tua macchina locale sia pronta per il template del Capitolo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 Avvio rapido

```bash
# Verifica l'installazione
azd version

# Autenticati per AZD
# Opzionale: az login se prevedi di eseguire direttamente comandi dell'Azure CLI
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
azd show                 # Visualizza l'URL dell'app in esecuzione
azd down --force --purge # Pulisce le risorse
```

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Next** | [Capitolo 2: Sviluppo incentrato sull'IA](../chapter-02-ai-development/README.md) |
| **Skip to** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |

---

## 📖 Risorse correlate

- [Riepilogo comandi](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossario](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->