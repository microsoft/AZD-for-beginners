# Creare il tuo template azd

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 4 - Infrastructure as Code e Distribuzione
- **⬅️ Precedente**: [Guida alla distribuzione](deployment-guide.md)
- **🚀 Capitolo successivo**: [Capitolo 5: Soluzioni Multi-Agente](../chapter-05-multi-agent/README.md)

> Validato con `azd 1.25.6` a giugno 2026.

## Introduzione

Finora hai *consumato* template con `azd init --template <name>`. Ma una volta che hai una struttura di progetto che piace al tuo team — ad esempio, una Container App con Cosmos DB e il giusto monitoraggio — vorrai trasformarla in un template riutilizzabile. Un template è semplicemente un repository Git con una struttura prevedibile che azd sa leggere. Questa lezione ti mostra come costruirne uno da zero, testarlo e (opzionalmente) pubblicarlo nella gallery della community.

## Obiettivi di apprendimento

Al termine di questa lezione, sarai in grado di:
- Capire cosa rende una cartella un "template azd"
- Conoscere i file e la struttura di cartelle richiesti
- Aggiungere un `azure.yaml` e una cartella `infra/` che altri possono riutilizzare
- Testare il tuo template localmente prima di condividerlo
- Pubblicarlo e (opzionalmente) inviarlo ad Awesome AZD

## Risultati di apprendimento

Dopo aver completato questa lezione, potrai:
- Scaffoldare un nuovo repository di template
- Parametrizzare l'infrastruttura in modo che funzioni in qualsiasi subscription
- Validare un template con `azd init` e `azd up`
- Aggiungere i metadati richiesti dalla gallery

---

## Che cos'è davvero un template?

Un azd template è **un repository Git** che contiene, almeno:

| File / folder | Scopo | Richiesto? |
|---------------|---------|-----------|
| `azure.yaml` | Descrive servizi, host e il provider dell'infrastruttura | ✅ Sì |
| `infra/` | Bicep, Terraform o Pulumi che provvede alla creazione delle risorse | ✅ Sì |
| `src/` (or your code) | Il codice dell'applicazione che azd distribuisce | ✅ Sì |
| `README.md` | Come usare il template | ✅ Fortemente consigliato |
| `.azdo/` o `.github/` | Definizioni della pipeline CI/CD | Opzionale |
| `.devcontainer/` | Ambiente di sviluppo riproducibile | Opzionale |
| `azure.yaml` `metadata` | Informazioni per la gallery e telemetria | Opzionale (richiesto per pubblicare) |

Non c'è nulla di magico: quando esegui `azd init --template you/your-repo`, azd clona il repo e legge `azure.yaml`.

---

## Passo 1: Scaffold del repository

Crea la struttura di cartelle a mano o parti da un template minimale e modificalo:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Crea il layout standard
mkdir -p src infra
```

Una tipica struttura finale appare così:

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

## Passo 2: Scrivere `azure.yaml`

Questo è il cuore del template. Dice ad azd cosa distribuire e come:

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

> Il campo `metadata.template` è ciò che la telemetria della gallery usa per contare l'uso. Usa la convenzione `name@version`.

---

## Passo 3: Parametrizzare l'infrastruttura

La regola più importante per un template *riutilizzabile*: **non codificare mai nomi, regioni o valori specifici della subscription.** Usa parametri e il pattern del resource token in modo che lo stesso template funzioni in qualunque subscription.

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

Due aspetti rendono questo template amichevole:

1. **tag `azd-env-name`** — azd lo usa per tracciare e pulire le risorse per ambiente.
2. **token risorsa `uniqueString(...)`** — produce un suffisso stabile e globalmente unico così i nomi non collidono.

Fornisci un file di parametri corrispondente che legga i valori che azd inietta dall'ambiente:

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

## Passo 4: Testare il tuo template localmente

Prima di condividere, dimostra che il template funziona da uno stato pulito.

**Testa dalla cartella locale** (non è necessario fare push su Git):

```bash
# Da una directory vuota, inizializza usando il percorso del modello locale
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisioning e deployment end-to-end
azd auth login
azd up
```

**Poi testa il teardown**—un buon template pulisce completamente:

```bash
azd down --force --purge
```

Se `azd down` lascia risorse, probabilmente ti sei dimenticato del tag `azd-env-name` su una risorsa.

> **Suggerimento:** esegui prima `azd provision --preview`. Esegue un what-if e mette in evidenza gli errori del template prima che qualsiasi risorsa sia creata.

---

## Passo 5: Pubblicare il template

Fai push del repository su GitHub (pubblico se vuoi che altri lo usino):

```bash
gh repo create my-azd-template --public --source=. --push
```

Chiunque ora può usarlo:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Passo 6 (Opzionale): Inviare ad Awesome AZD

La [Awesome AZD gallery](https://azure.github.io/awesome-azd/) elenca i template della community. Per essere elencato il tuo repo dovrebbe includere:

- ✅ Un `README.md` chiaro con prerequisiti, un diagramma architetturale e note sui costi
- ✅ Un `azure.yaml` funzionante con `metadata.template`
- ✅ Infrastruttura che provisioninga correttamente in una subscription pulita
- ✅ Un file `LICENSE`
- ✅ (Consigliato) Una `.devcontainer/` per Codespaces con un click

Invia aprendo una pull request che aggiunga il tuo template al file dei dati della gallery, seguendo la guida di contribuzione nel repository [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Errori comuni

| Problema | Soluzione |
|---------|-----|
| Nomi delle risorse codificati | Usa il token risorsa `uniqueString()` |
| `azd down` lascia risorse | Tagga ogni risorsa (o il resource group) con `azd-env-name` |
| Il template funziona per te, fallisce per altri | Rimuovi subscription ID, tenant ID e assunzioni sulla regione |
| Output non collegati all'app | Esporta `SERVICE_<NAME>_ENDPOINT_URL` e altri output `AZURE_*` |
| Invio alla gallery rifiutato | Aggiungi `README.md`, `LICENSE` e `metadata.template` |

---

## Riepilogo

- Un template è solo un repo Git con `azure.yaml`, `infra/` e il tuo codice.
- Parametrizza tutto — nomi, regioni e ID — così funziona ovunque.
- Tagga sempre le risorse con `azd-env-name` in modo che `azd down` funzioni.
- Testa localmente con `azd init --template <local-path>` prima di pubblicare.
- Aggiungi metadati e un README per inviare il template ad Awesome AZD.

---

## 🔗 Navigazione

| Direction | Resource |
|-----------|----------|
| **Precedente** | [Guida alla distribuzione](deployment-guide.md) |
| **Home del Capitolo** | [Capitolo 4: Infrastructure as Code](README.md) |
| **Capitolo Successivo** | [Capitolo 5: Soluzioni Multi-Agente](../chapter-05-multi-agent/README.md) |

## 📖 Risorse correlate

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Documentazione ufficiale dei template azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->