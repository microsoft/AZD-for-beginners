# Porta la Tua App - Aggiungi azd a un Progetto Esistente

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 1 - Fondamenti & Avvio Rapido
- **⬅️ Precedente**: [Il Tuo Primo Progetto](first-project.md)
- **➡️ Successivo**: [Dev Containers & Codespaces](dev-containers.md)

> Revisione del comando e della configurazione obiettivo: `azd 1.37.2` (Novembre 2026). I file generati dipendono dall'applicazione rilevata; il deployment su Azure non è stato eseguito in questa revisione.

## Introduzione

In [Il Tuo Primo Progetto](first-project.md) hai distribuito un'app partendo da un modello. Ma la maggior parte delle volte hai già *un'app* — una API Node.js, un servizio Python Flask, un'app web .NET — che è seduta in una cartella sulla tua macchina. Questa lezione mostra come aggiungere azd a quel codice esistente così puoi distribuirlo con `azd up`, nessun modello richiesto.

## Obiettivi di Apprendimento

Al termine di questa lezione, tu:
- Capirai le tre modalità per iniziare un progetto azd
- Eseguirai `azd init` all'interno di un codice esistente
- Capirai cosa fanno `azure.yaml` e la cartella `infra/` per la tua app
- Saprai quando lasciare che azd generi l'infrastruttura e quando scrivere la tua
- Distribuirai la tua app esistente su Azure con `azd up`

## Risultati di Apprendimento

Dopo aver completato questa lezione, sarai in grado di:
- Inizializzare azd in un progetto che hai già
- Leggere e modificare un file `azure.yaml` di base
- Generare l'infrastruttura iniziale con `azd infra generate`
- Scegliere un host Azure appropriato per la tua app
- Distribuire e pulire la tua applicazione

---

## Tre Modi per Iniziare un Progetto azd

| Punto di partenza | Comando | Quando usarlo |
|----------------|---------|-------------|
| **Da un modello** | `azd init --template <name> .` (directory vuota) | Apprendimento, o avvio di una nuova app da un esempio comprovato |
| **Dal tuo codice esistente** | `azd init` (nella cartella del progetto) | Hai già un'app e vuoi distribuirla |
| **Da un repo Git** | `azd init --from-code` (in un repo clonato) | Adottare azd per un repository esistente |

Hai già praticato la prima opzione. Questa lezione copre la seconda — lo scenario reale più comune.

---

## Passo 1: Esegui `azd init` nel Tuo Progetto

Apri un terminale **dentro la cartella del tuo progetto esistente** ed esegui:

```bash
cd my-existing-app
azd init
```

azd chiederà come vuoi inizializzare. Scegli:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Scegli **"Usa il codice nella directory corrente."** azd poi scansiona la tua cartella, rileva il linguaggio e il framework, e propone un host.

### Cosa rileva azd

azd cerca segnali dell'applicazione come `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` o un `Dockerfile`. Il flusso da codice non è un generico wizard di selezione host per ogni target di deployment supportato:

| La tua app | Probabile host rilevato |
|----------|----------------------|
| App web Node.js / Python / .NET supportata | Tipicamente Azure Container Apps; ispeziona la definizione generata |
| App containerizzata (`Dockerfile`) | Azure Container Apps |
| App function o progetto Static Web Apps | Usa un template corrispondente o scrivi `azure.yaml` e infrastruttura se il flusso da codice non supporta il tuo layout |

Conferma il/i servizio/i rilevato/i, e azd crea i file necessari.

---

## Passo 2: Capire Cosa ha Creato azd

Dopo l'inizializzazione, ispeziona `azure.yaml`. Il flusso con infrastruttura generata può tenere implicita l'infrastruttura finché non esegui `azd infra generate`; non dare per scontato che `infra/` esista già:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — la definizione del progetto

Questo è il cuore di un progetto azd. La seguente **definizione illustrativa di App Service** richiede infrastruttura App Service corrispondente; non è una ragione per cambiare un host Container Apps generato senza cambiare l'infrastruttura:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Il blocco `services` è la parte chiave: ogni voce mappa una cartella del tuo codice a un host Azure. Se la tua app ha sia un frontend che un'API, avrai due servizi.

### `infra/` — le tue risorse Azure come codice

La cartella `infra/` contiene file Bicep che definiscono le risorse Azure di cui la tua app ha bisogno (l'App Service, il database, ecc.). Non devi scriverli a mano—azd genera un punto di partenza funzionante. Puoi *modificarli* successivamente per aggiungere risorse o aumentare la sicurezza (trattato in [Capitolo 4](../chapter-04-infrastructure/README.md)).

> **Suggerimento:** Vuoi vedere o personalizzare l'infrastruttura generata prima di distribuirla? Esegui `azd infra generate` (disponibile anche come `azd infra synth`) per scrivere l'IaC su disco così potrai rivederlo e controllare le versioni.

---

## Passo 3: Imposta la Configurazione Necessaria

Se la tua app ha bisogno di impostazioni o segreti (una stringa di connessione, una chiave API), non inserirli direttamente nel codice. Usa i valori di ambiente:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Questo memorizza un valore solo localmente. Per influenzare l'app, consumalo esplicitamente nei parametri dell'infrastruttura, in un'impostazione di servizio supportata, o in un hook; impostare una variabile arbitraria non configura il runtime distribuito.

Per i segreti veri, conservali in Key Vault e fai riferimento a essi dalla tua infrastruttura—vedi [Capitolo 3: Configurazione e Autenticazione](../chapter-03-configuration/authsecurity.md).

---

## Passo 4: Distribuisci

Ora usa lo stesso flusso di lavoro che conosci già:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Quando termina, azd stampa l'URL della tua app. Verificala come faresti con qualsiasi app azd:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Problemi Comuni al Primo Avvio

| Sintomo | Probabile causa | Soluzione |
|---------|--------------|-----|
| azd non ha rilevato la mia app | Mancanza di manifesto (es., `package.json`) | Aggiungi il manifesto, oppure scegli manualmente l'host durante `azd init` |
| La compilazione fallisce durante `azd up` | L'app necessita un passaggio di build | Configura gli script del pacchetto dell'app o il hook di servizio `prepackage`; usa `dist` per l'output di distribuzione, non `buildCommand`/`outputPath` |
| L'app si avvia ma restituisce errori | Mancanza di config/segreto | Collega i valori nelle impostazioni runtime dell'app o in un riferimento a Key Vault; `azd env set` da solo non è sufficiente |
| Host sbagliato scelto | Il rilevamento automatico non corrisponde alle tue esigenze | Cambia sia `host:` che l'infrastruttura corrispondente, o scegli un template che combaci |

Per altro, vedi [Capitolo 7: Risoluzione dei Problemi](../chapter-07-troubleshooting/README.md).

---

## Pulizia

```bash
azd down --force --purge
```

---

## Riepilogo

- `azd init` → **"Usa codice nella directory corrente"** aggiunge azd a un'app che già possiedi.
- `azure.yaml` mappa le tue cartelle di codice agli host Azure; `infra/` definisce le risorse come Bicep.
- `azd infra generate` ti permette di rivedere o personalizzare l'infrastruttura generata.
- Una volta inizializzata, la tua app esistente usa lo stesso identico flusso di lavoro `azd up` / `azd down` di un'app basata su template.

---

## 🔗 Navigazione

| Direzione | Lezione |
|-----------|--------|
| **Precedente** | [Il tuo primo progetto](first-project.md) |
| **Successivo** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Risorse Correlate

- [Nozioni di base di AZD](azd-basics.md)
- [Capitolo 4: Infrastruttura come Codice](../chapter-04-infrastructure/README.md)
- [Configurazione e Autenticazione](../chapter-03-configuration/authsecurity.md)
- [Scheda di Comandi](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->