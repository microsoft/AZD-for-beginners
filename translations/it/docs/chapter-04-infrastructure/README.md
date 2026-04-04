# Capitolo 4: Infrastruttura come codice e distribuzione

**📚 Corso**: [AZD per principianti](../../README.md) | **⏱️ Durata**: 1-1.5 ore | **⭐ Complessità**: Intermedio

---

## Panoramica

Questo capitolo tratta i pattern di Infrastructure as Code (IaC) con template Bicep, il provisioning delle risorse e le strategie di distribuzione usando Azure Developer CLI.

> Convalidato con `azd 1.23.12` a marzo 2026.

## Obiettivi di apprendimento

Completando questo capitolo, sarai in grado di:
- Comprendere la struttura e la sintassi dei template Bicep
- Eseguire il provisioning delle risorse Azure con `azd provision`
- Distribuire le applicazioni con `azd deploy`
- Implementare strategie di distribuzione blue-green e rolling

---

## 📚 Lezioni

| # | Lezione | Descrizione | Tempo |
|---|--------|-------------|------|
| 1 | [Provisioning delle risorse](provisioning.md) | Gestione delle risorse Azure con AZD | 45 min |
| 2 | [Guida alla distribuzione](deployment-guide.md) | Strategie di distribuzione delle applicazioni | 45 min |

---

## 🚀 Avvio rapido

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

## 📁 Struttura del progetto AZD

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

## 🔧 Comandi essenziali

| Comando | Descrizione |
|---------|-------------|
| `azd init` | Inizializza il progetto |
| `azd provision` | Crea risorse Azure |
| `azd deploy` | Distribuire il codice dell'applicazione |
| `azd up` | provision + deploy |
| `azd down` | Elimina tutte le risorse |

---

## 🔗 Navigazione

| Direzione | Capitolo |
|-----------|---------|
| **Precedente** | [Capitolo 3: Configurazione](../chapter-03-configuration/README.md) |
| **Successivo** | [Capitolo 5: Soluzioni multi-agente](../chapter-05-multi-agent/README.md) |

---

## 📖 Risorse correlate

- [Controlli pre-distribuzione](../chapter-06-pre-deployment/README.md)
- [Esempi di Container App](../../examples/container-app/README.md)
- [Esempio di Database App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->