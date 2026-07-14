# Porta la tua app - Aggiungi azd a un progetto esistente

**Navigazione Capitolo:**
- **📚 Home del corso**: [AZD per Principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 1 - Fondamenta & Avvio rapido
- **⬅️ Precedente**: [Il tuo primo progetto](first-project.md)
- **➡️ Successivo**: [Dev Containers & Codespaces](dev-containers.md)

> Validato con `azd 1.27.1` nel luglio 2026.

## Introduzione

In [Il tuo primo progetto](first-project.md) hai distribuito un'app partendo da un modello. Ma la maggior parte delle volte hai già *un'app* — un'API Node.js, un servizio Python Flask, un'app web .NET — che si trova in una cartella sul tuo computer. Questa lezione mostra come aggiungere azd a quel codice esistente in modo da poterlo distribuire con `azd up`, senza bisogno di un modello.

## Obiettivi di apprendimento

Al termine di questa lezione, sarai in grado di:
- Capire i tre modi per iniziare un progetto azd
- Eseguire `azd init` all'interno di un codice esistente
- Comprendere cosa fanno `azure.yaml` e la cartella `infra/` per la tua app
- Sapere quando lasciare che azd generi l'infrastruttura o scriverla da te
- Distribuire la tua app esistente su Azure con `azd up`

## Risultati di apprendimento

Dopo aver completato questa lezione, sarai capace di:
- Inizializzare azd in un progetto che hai già
- Leggere e modificare un file `azure.yaml` di base
- Generare infrastruttura iniziale con `azd infra generate`
- Scegliere un host Azure appropriato per la tua app
- Distribuire e pulire la tua applicazione

---

## Tre modi per iniziare un progetto azd

| Punto di partenza | Comando | Quando usarlo |
|-----------------|---------|--------------|
| **Da un modello** | `azd init --template <name>` | Per imparare, o avviare una nuova app da un esempio collaudato |
| **Dal tuo codice esistente** | `azd init` (nella cartella del tuo progetto) | Hai già un'app e vuoi distribuirla |
| **Da un repository Git** | `azd init --from-code` (in un repo clonato) | Per adottare azd in un repository esistente |

Hai già provato la prima opzione. Questa lezione copre la seconda — lo scenario reale più comune.

---

## Passo 1: Esegui `azd init` nel tuo progetto

Apri un terminale **all'interno della cartella del tuo progetto esistente** ed esegui:

```bash
cd my-existing-app
azd init
```

azd ti chiederà come vuoi inizializzare. Scegli:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Seleziona **"Usa il codice nella directory corrente."** azd quindi analizza la tua cartella, rileva il linguaggio e il framework, e propone un host.

### Cosa rileva azd

azd cerca segnali come `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` o un `Dockerfile`, e suggerisce un host Azure corrispondente:

| La tua app | Host probabilmente rilevato |
|-----------|----------------------------|
| App Node.js / Python / .NET web | Azure App Service o Container Apps |
| App containerizzata (`Dockerfile`) | Azure Container Apps |
| App Function | Azure Functions |
| Sito statico (output build React/Vue) | Azure Static Web Apps |

Conferma il/i servizio/i rilevato/i, e azd crea i file necessari.

---

## Passo 2: Comprendi cosa azd ha creato

Dopo init, avrai due nuovi elementi nel tuo progetto:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — la definizione del progetto

Questo è il cuore di un progetto azd. Uno minimale è simile a questo:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Il blocco `services` è la parte chiave: ogni voce mappa una cartella del tuo codice a un host Azure. Se la tua app ha front-end e API, avrai due servizi.

### `infra/` — le tue risorse Azure come codice

La cartella `infra/` contiene file Bicep che definiscono le risorse Azure necessarie alla tua app (App Service, database, ecc.). Non devi scriverli a mano — azd genera un punto di partenza funzionante. Puoi modificarli in seguito per aggiungere risorse o migliorare la sicurezza (trattato in [Capitolo 4](../chapter-04-infrastructure/README.md)).

> **Suggerimento:** Vuoi vedere o personalizzare l'infrastruttura generata prima di distribuire? Esegui `azd infra generate` (disponibile anche come `azd infra synth`) per scrivere l'IaC su disco e poterla rivedere e gestire con il versionamento.

---

## Passo 3: Imposta la configurazione richiesta

Se la tua app necessita di impostazioni o segreti (una stringa di connessione, una chiave API), non inserirli direttamente nel codice. Usa i valori di ambiente:

```bash
# Crea un ambiente
azd env new dev

# Imposta un valore non segreto
azd env set API_VERSION 1.0.0
```

Per i veri segreti, salvali in Key Vault e fai riferimento a essi dalla tua infrastruttura — vedi [Capitolo 3: Configurazione & Autenticazione](../chapter-03-configuration/authsecurity.md).

---

## Passo 4: Distribuisci

Ora usa lo stesso flusso di lavoro che già conosci:

```bash
# Autenticare (richiesto per azd)
azd auth login

# Anteprima delle risorse che verranno create
azd provision --preview

# Fornire l'infrastruttura e distribuire il tuo codice
azd up
```

Al termine, azd stampa l'URL della tua app. Verificala allo stesso modo di qualsiasi app azd:

```bash
azd show           # mostra endpoint
azd monitor --logs # controlla i log se necessario
```

---

## Problemi comuni al primo avvio

| Sintomo | Causa probabile | Soluzione |
|---------|-----------------|----------|
| azd non ha rilevato la mia app | Mancanza di manifest (per es., `package.json`) | Aggiungi il manifest o scegli l'host manualmente durante `azd init` |
| Build fallisce durante `azd up` | L'app necessita di una fase di build | Aggiungi `buildCommand`/`outputPath` sotto il servizio in `azure.yaml` |
| L'app parte ma genera errori | Mancanza di configurazione/secret | Imposta i valori con `azd env set` o collega Key Vault |
| Host sbagliato scelto | Rilevamento automatico errato | Modifica `host:` in `azure.yaml` e riesegui `azd up` |

Per altro, vedi [Capitolo 7: Risoluzione problemi](../chapter-07-troubleshooting/README.md).

---

## Pulizia

```bash
azd down --force --purge
```

---

## Riepilogo

- `azd init` → **"Usa il codice nella directory corrente"** aggiunge azd a un'app che hai già.
- `azure.yaml` mappa le cartelle del tuo codice agli host Azure; `infra/` definisce le risorse come Bicep.
- `azd infra generate` ti permette di rivedere o personalizzare l'infrastruttura generata.
- Una volta inizializzata, la tua app esistente usa lo stesso flusso `azd up` / `azd down` di un'app basata su modello.

---

## 🔗 Navigazione

| Direzione | Lezione |
|-----------|--------|
| **Precedente** | [Il tuo primo progetto](first-project.md) |
| **Successivo** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Risorse correlate

- [Nozioni di base su AZD](azd-basics.md)
- [Capitolo 4: Infrastruttura come codice](../chapter-04-infrastructure/README.md)
- [Configurazione & Autenticazione](../chapter-03-configuration/authsecurity.md)
- [Cheat Sheet dei Comandi](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->