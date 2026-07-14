# Capitolo 4: Infrastructure as Code & Deployment

**📚 Corso**: [AZD For Beginners](../../README.md) | **⏱️ Durata**: 1-1,5 ore | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo copre i modelli Infrastructure as Code (IaC) con template Bicep, il provisioning delle risorse e le strategie di deployment usando Azure Developer CLI.

> Validato con `azd 1.27.1` a luglio 2026.

## Obiettivi di Apprendimento

Completando questo capitolo, imparerai a:
- Comprendere la struttura e la sintassi dei template Bicep
- Effettuare il provisioning delle risorse Azure con `azd provision`
- Distribuire applicazioni con `azd deploy`
- Implementare strategie di deployment blue-green e rolling

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Provisioning delle Risorse](provisioning.md) | Gestione delle risorse Azure con AZD | 45 min |
| 2 | [Guida al Deployment](deployment-guide.md) | Strategie di distribuzione dell'applicazione | 45 min |
| 3 | [Creare il Tuo Template](custom-templates.md) | Costruire e pubblicare template azd riutilizzabili | 30 min |

---

## 🚀 Avvio Rapido

```bash
# Inizializza dal modello
azd init --template azure-functions-python-v2-http

# Anteprima di ciò che verrà creato
azd provision --preview

# Provisiona solo l'infrastruttura
azd provision

# Distribuisci solo il codice
azd deploy

# O entrambi insieme
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
| `azd deploy` | Distribuisci il codice dell'applicazione |
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
- [Esempi Container App](../../examples/container-app/README.md)
- [Esempio Database App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->