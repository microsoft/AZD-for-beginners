# Capitolo 4: Infrastructure as Code & Deployment

**📚 Corso**: [AZD Per Principianti](../../README.md) | **⏱️ Durata**: 2-3 ore di lettura; prevedere tempo extra per gli esercizi di deployment | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo tratta i modelli di Infrastructure as Code (IaC) con template Bicep, il provisioning delle risorse e le strategie di deployment usando Azure Developer CLI.

> Obiettivo di revisione di comandi e configurazioni: `azd 1.37.2` (Novembre 2026). Il provisioning Azure in tempo reale non è stato eseguito durante la revisione.

## Obiettivi di Apprendimento

Completando questo capitolo, imparerai a:
- Comprendere la struttura e la sintassi dei template Bicep
- Effettuare il provisioning delle risorse Azure con `azd provision`
- Eseguire il deployment delle applicazioni con `azd deploy`
- Implementare strategie di deployment blue-green e rolling

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Provisioning Risorse](provisioning.md) | Gestione risorse Azure con AZD | 45 min |
| 2 | [Guida al Deployment](deployment-guide.md) | Strategie di deployment applicazioni | 45 min |
| 3 | [Creazione del Tuo Template](custom-templates.md) | Costruisci e pubblica template azd riutilizzabili | 30 min |

---

## 🚀 Avvio Rapido

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 Struttura del Progetto AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Comandi Essenziali

| Comando | Descrizione |
|---------|-------------|
| `azd init` | Inizializza progetto |
| `azd provision` | Crea risorse Azure |
| `azd deploy` | Esegui il deployment del codice applicativo |
| `azd up` | provisioning + deployment |
| `azd down` | Elimina tutte le risorse |

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |
| **Successivo** | [Capitolo 5: Soluzioni Multi-Agente](../chapter-05-multi-agent/README.md) |

---

## 📖 Risorse Correlate

- [Controlli Pre-Deployment](../chapter-06-pre-deployment/README.md)
- [Esempi di Container App](../../examples/container-app/README.md)
- [Esempio di Database App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->