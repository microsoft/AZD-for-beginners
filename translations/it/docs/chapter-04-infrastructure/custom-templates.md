# Creare il proprio modello azd

**Navigazione Capitolo:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 4 - Infrastruttura come Codice e Distribuzione
- **⬅️ Precedente**: [Guida al deployment](deployment-guide.md)
- **🚀 Capitolo successivo**: [Capitolo 5: Soluzioni Multi-Agente](../chapter-05-multi-agent/README.md)

> Validato con `azd 1.27.1` a luglio 2026.

## Introduzione

Finora hai *utilizzato* modelli con `azd init --template <nome>`. Ma una volta che hai un layout di progetto che piace al tuo team—ad esempio, un Container App con Cosmos DB e il monitoraggio giusto—vorrai trasformarlo in un modello riutilizzabile tuo. Un modello è semplicemente un repository Git con una struttura prevedibile che azd sa leggere. Questa lezione ti mostra come crearne uno da zero, testarlo e (opzionalmente) pubblicarlo nella galleria della community.

## Obiettivi di apprendimento

Alla fine di questa lezione, sarai in grado di:
- Capire cosa rende una cartella un "modello azd"
- Conoscere i file richiesti e la struttura delle cartelle
- Aggiungere un `azure.yaml` e `infra/` che altri possono riutilizzare
- Testare localmente il tuo modello prima di condividerlo
- Pubblicarlo e (opzionalmente) inviarlo ad Awesome AZD

## Risultati di apprendimento

Dopo aver completato questa lezione, sarai in grado di:
- Creare lo scheletro di un nuovo repository modello
- Parametrizzare l'infrastruttura affinché funzioni in qualsiasi sottoscrizione
- Validare un modello con `azd init` e `azd up`
- Aggiungere i metadati richiesti dalla galleria della community

---

## Cos'è davvero un modello?

Un modello azd è **un repository Git** che contiene, almeno:

| File / cartella | Scopo | Richiesto? |
|---------------|---------|-----------|
| `azure.yaml` | Descrive servizi, host e provider di infrastruttura | ✅ Sì |
| `infra/` | Bicep, Terraform o Pulumi che crea risorse | ✅ Sì |
| `src/` (o il tuo codice) | Il codice dell'applicazione che azd distribuisce | ✅ Sì |
| `README.md` | Come usare il modello | ✅ Fortemente consigliato |
| `.azdo/` o `.github/` | Definizioni della pipeline CI/CD | Opzionale |
| `.devcontainer/` | Ambiente di sviluppo riproducibile | Opzionale |
| `azure.yaml` `metadata` | Info per la galleria e la telemetria | Opzionale (obbligatorio per pubblicare) |

Non c'è nulla di magico: quando esegui `azd init --template you/your-repo`, azd clona il repo e legge `azure.yaml`.

---

## Fase 1: Creare lo scheletro del repository

Crea la struttura delle cartelle a mano o parti da un modello minimale e modificalo:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Crea il layout standard
mkdir -p src infra
```

Un layout tipico e completo appare così:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Fase 2: Scrivere `azure.yaml`

Questa è la parte centrale del modello. Dice ad azd cosa distribuire e come:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Il campo `metadata.template` è quello che la telemetria della galleria utilizza per contare gli usi. Usa la convenzione `name@version`.

---

## Fase 3: Parametrizzare l'infrastruttura

La regola più importante per un modello *riutilizzabile*: **mai codificare nomi, regioni o valori specifici di una sottoscrizione.** Usa parametri e il pattern token risorsa così lo stesso modello funziona in qualsiasi sottoscrizione.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Due cose rendono questo modello amichevole:

1. **Tag `azd-env-name`** — azd lo usa per tracciare e pulire le risorse per ambiente.
2. **Token risorsa `uniqueString(...)`** — genera un suffisso stabile e univoco a livello globale così i nomi non collidono.

Fornisci un file parametri corrispondente che legge valori che azd inietta dall'ambiente:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd sostituisce automaticamente `${AZURE_ENV_NAME}` e `${AZURE_LOCATION}` dall'ambiente corrente.

---

## Fase 4: Testa localmente il tuo modello

Prima di condividere, dimostra che il modello funziona da uno stato pulito.

**Testa dalla cartella locale** (non serve push su Git):

```bash
# Da una directory vuota, inizializza utilizzando il percorso del template locale
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provision + distribuisci end to end
azd auth login
azd up
```

**Poi testa la rimozione**—un buon modello pulisce completamente:

```bash
azd down --force --purge
```

Se `azd down` lascia risorse, probabilmente hai dimenticato il tag `azd-env-name` su una risorsa.

> **Suggerimento:** esegui prima `azd provision --preview`. Fa un what-if e mostra errori nel modello prima che qualsiasi risorsa venga creata.

---

## Fase 5: Pubblica il modello

Pubblica il repository su GitHub (pubblico se vuoi che altri lo usino):

```bash
gh repo create my-azd-template --public --source=. --push
```

Ora chiunque può usarlo:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Fase 6 (opzionale): Invia ad Awesome AZD

La [galleria Awesome AZD](https://azure.github.io/awesome-azd/) elenca modelli della community. Per essere elencato il tuo repo dovrebbe includere:

- ✅ Un chiaro `README.md` con prerequisiti, un diagramma architetturale e note sui costi
- ✅ Un valido `azure.yaml` con `metadata.template`
- ✅ Infrastruttura che si crea correttamente in una sottoscrizione nuova
- ✅ Un file `LICENSE`
- ✅ (consigliato) Un `.devcontainer/` per Codespaces con un clic

Invia aprendo una pull request che aggiunge il tuo modello al file dati della galleria, seguendo la guida alla contribuzione nel [repository Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Errori Comuni

| Errore comune | Correzione |
|---------|-----|
| Nomi risorsa codificati | Usa il token risorsa `uniqueString()` |
| `azd down` lascia risorse | Tagga ogni risorsa (o il gruppo risorse) con `azd-env-name` |
| Il modello funziona per te, ma fallisce per altri | Rimuovi ID sottoscrizione, tenant, e assunzioni sulla regione |
| Output non collegati all'app | Esporta `SERVICE_<NAME>_ENDPOINT_URL` e altri output `AZURE_*` |
| Invio alla galleria rifiutato | Aggiungi `README.md`, `LICENSE` e `metadata.template` |

---

## Riepilogo

- Un modello è semplicemente un repo Git con `azure.yaml`, `infra/` e il tuo codice.
- Parametrizza tutto—nomi, regioni e ID—così funziona ovunque.
- Tagga sempre le risorse con `azd-env-name` così `azd down` funziona.
- Testa localmente con `azd init --template <local-path>` prima di pubblicare.
- Aggiungi metadati e un README per inviare ad Awesome AZD.

---

## 🔗 Navigazione

| Direzione | Risorsa |
|-----------|----------|
| **Precedente** | [Guida al deployment](deployment-guide.md) |
| **Home Capitolo** | [Capitolo 4: Infrastruttura come Codice](README.md) |
| **Capitolo Successivo** | [Capitolo 5: Soluzioni Multi-Agente](../chapter-05-multi-agent/README.md) |

## 📖 Risorse correlate

- [Provisioning delle risorse](provisioning.md)
- [Galleria Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentazione ufficiale del modello azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->