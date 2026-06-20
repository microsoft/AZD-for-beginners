# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD Per Principianti](../../README.md)
- **📖 Current Chapter**: Capitolo 1 - Fondamenti & Avvio Rapido
- **⬅️ Previous**: [Il tuo primo progetto](first-project.md)
- **➡️ Next**: [Dev Containers e Codespaces](dev-containers.md)

> Validated against `azd 1.25.6` in June 2026.

## Introduzione

In [Il tuo primo progetto](first-project.md) hai distribuito un'app partendo da un template. Ma nella maggior parte dei casi hai già un'app—un'API Node.js, un servizio Python Flask, un'app web .NET—che sta in una cartella sulla tua macchina. Questa lezione mostra come aggiungere azd a quel codice esistente così puoi distribuirlo con `azd up`, senza bisogno di un template.

## Obiettivi di apprendimento

Al termine di questa lezione:
- Capirai i tre modi di avviare un progetto azd
- Eseguirai `azd init` all'interno di una base di codice esistente
- Capirai cosa fanno `azure.yaml` e la cartella `infra/` per la tua app
- Saprai quando lasciare che azd generi l'infrastruttura vs. scriverla tu
- Distribuirai la tua app esistente su Azure con `azd up`

## Risultati dell'apprendimento

Dopo aver completato questa lezione, sarai in grado di:
- Inizializzare azd in un progetto che hai già
- Leggere e modificare un semplice file `azure.yaml`
- Generare l'infrastruttura iniziale con `azd infra generate`
- Scegliere un host Azure appropriato per la tua app
- Distribuire e rimuovere la tua applicazione

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
| **From your existing code** | `azd init` (in your project folder) | You already have an app and want to deploy it |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Adopting azd for an existing repository |

You already practiced the first option. This lesson covers the second—the most common real-world scenario.

---

## Passo 1: Esegui `azd init` nel tuo progetto

Open a terminal **inside your existing project folder** and run:

```bash
cd my-existing-app
azd init
```

azd will ask how you want to initialize. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Scegli **"Usa il codice nella directory corrente."** azd quindi scansiona la tua cartella, rileva il linguaggio e il framework, e propone un host.

### Cosa rileva azd

azd cerca segnali come `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, o un `Dockerfile`, e suggerisce un host Azure corrispondente:

| Your app | Likely detected host |
|----------|----------------------|
| App web Node.js / Python / .NET | Azure App Service o Container Apps |
| App containerizzata (`Dockerfile`) | Azure Container Apps |
| App Function | Azure Functions |
| Sito statico (output di build di React/Vue) | Azure Static Web Apps |

Conferma il/i servizio/i rilevati e azd genera gli scaffolding di file di cui hai bisogno.

---

## Passo 2: Capire cosa ha creato azd

After init, you'll have two new things in your project:

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

Questo è il cuore di un progetto azd. Una versione minimale appare così:

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

La cartella `infra/` contiene file Bicep che definiscono le risorse Azure di cui la tua app ha bisogno (l'App Service, il database, ecc.). Non devi scriverli a mano—azd genera un punto di partenza funzionante. Puoi modificarli in seguito per aggiungere risorse o aumentare la sicurezza (coperto nel [Capitolo 4](../chapter-04-infrastructure/README.md)).

> **Suggerimento:** Vuoi vedere o personalizzare l'infrastruttura generata prima di distribuire? Esegui `azd infra generate` (disponibile anche come `azd infra synth`) per scrivere l'IaC su disco in modo da poterla revisionare e versionare.

---

## Passo 3: Imposta la configurazione richiesta

If your app needs settings or secrets (a connection string, an API key), don't hardcode them. Use environment values:

```bash
# Crea un ambiente
azd env new dev

# Imposta un valore non segreto
azd env set API_VERSION 1.0.0
```

Per segreti veri, conservali in Key Vault e riferiscili dalla tua infrastruttura—vedi [Capitolo 3: Configurazione e Autenticazione](../chapter-03-configuration/authsecurity.md).

---

## Passo 4: Distribuisci

Now use the same workflow you already know:

```bash
# Autenticazione (necessaria per azd)
azd auth login

# Visualizza in anteprima le risorse che verranno create
azd provision --preview

# Provisionare l'infrastruttura e distribuire il tuo codice
azd up
```

When it finishes, azd prints your app's URL. Verify it the same way as any azd app:

```bash
azd show           # mostra gli endpoint
azd monitor --logs # controlla i log se necessario
```

---

## Problemi comuni al primo utilizzo

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

Per ulteriori informazioni, vedi [Capitolo 7: Risoluzione dei problemi](../chapter-07-troubleshooting/README.md).

---

## Pulizia

```bash
azd down --force --purge
```

---

## Riepilogo

- `azd init` → **"Usa il codice nella directory corrente"** aggiunge azd a un'app che hai già.
- `azure.yaml` mappa le cartelle del tuo codice a host Azure; `infra/` definisce le risorse come Bicep.
- `azd infra generate` ti permette di revisionare o personalizzare l'infrastruttura generata.
- Una volta inizializzato, la tua app esistente utilizza lo stesso flusso di lavoro `azd up` / `azd down` di un'app basata su template.

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Il tuo primo progetto](first-project.md) |
| **Next** | [Dev Containers e Codespaces](dev-containers.md) |

## 📖 Risorse correlate

- [Nozioni di base su AZD](azd-basics.md)
- [Capitolo 4: Infrastruttura come codice](../chapter-04-infrastructure/README.md)
- [Configurazione e Autenticazione](../chapter-03-configuration/authsecurity.md)
- [Promemoria dei comandi](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->