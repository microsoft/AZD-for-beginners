# Capitolo 1: Fondamenti e Avvio Rapido

**📚 Corso**: [AZD per principianti](../../README.md) | **⏱️ Durata**: 30-45 minuti | **⭐ Complessità**: Principiante

---

## Panoramica

Questo capitolo introduce i fondamenti di Azure Developer CLI (azd). Imparerai i concetti chiave, installerai gli strumenti e distribuirai la tua prima applicazione su Azure.

## Obiettivi di apprendimento

Al termine di questo capitolo, sarai in grado di:
- Comprendere cos'è Azure Developer CLI e in cosa differisce da Azure CLI
- Installare e configurare AZD sulla tua piattaforma
- Distribuire la tua prima applicazione su Azure con `azd up`
- Ripulire le risorse con `azd down`

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Basi di AZD](azd-basics.md) | Concetti fondamentali, terminologia e struttura del progetto | 15 min |
| 2 | [Installazione e Configurazione](installation.md) | Guide di installazione specifiche per piattaforma | 10 min |
| 3 | [Il tuo primo progetto](first-project.md) | Esercitazione pratica: Distribuire un'app web su Azure | 20 min |

---

## 🚀 Avvio rapido

```bash
# Verifica l'installazione
azd version

# Accedi ad Azure
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
| **Successivo** | [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/README.md) |
| **Vai a** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |

---

## 📖 Risorse correlate

- [Cheat sheet comandi](../../resources/cheat-sheet.md)
- [Domande frequenti](../../resources/faq.md)
- [Glossario](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica di intelligenza artificiale [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di tenere presente che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua d'origine deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->