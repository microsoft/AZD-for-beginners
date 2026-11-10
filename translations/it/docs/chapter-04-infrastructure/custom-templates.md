# Creare il Tuo Proprio Template azd

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 4 - Infrastructure as Code & Deployment
- **⬅️ Precedente**: [Guida al Deployment](deployment-guide.md)
- **🚀 Prossimo Capitolo**: [Capitolo 5: Soluzioni Multi-Agente](../chapter-05-multi-agent/README.md)

> Revisionato rispetto a `azd 1.37.2` (Novembre 2026). Questa è una **guida alla creazione con file parziali**, non un template completo: devi fornire il codice applicativo e `modules/web.bicep` con il suo ambiente, registro, Container App e output prima del deployment. Il provisioning su Azure non è stato eseguito in questa revisione.

## Introduzione

Finora hai *consumato* template con `azd init --template <name>`. Ma una volta che hai un layout di progetto che il tuo team gradisce — per esempio, una Container App con Cosmos DB e il monitoraggio adeguato — vorrai trasformarlo in un template riutilizzabile tuo. Un template è semplicemente un repository Git con una struttura prevedibile che azd sa leggere. Questa lezione ti mostra come costruirne uno da zero, testarlo e (opzionalmente) pubblicarlo nella galleria della community.

## Obiettivi di Apprendimento

Alla fine di questa lezione, sarai in grado di:
- Capire cosa rende una cartella un "template azd"
- Conoscere i file e la struttura di cartelle richiesti
- Aggiungere un `azure.yaml` e `infra/` che altri possono riutilizzare
- Testare il tuo template localmente prima di condividerlo
- Pubblicarlo e (opzionalmente) inviarlo a Awesome AZD

## Risultati di Apprendimento

Dopo aver completato questa lezione, sarai in grado di:
- Creare lo scheletro di un nuovo repository template
- Parametrizzare l'infrastruttura in modo che funzioni in qualsiasi sottoscrizione
- Validare un template con `azd init` e `azd up`
- Aggiungere i metadati richiesti dalla galleria della community

---

## Cos'è Davvero un Template?

Un template azd è **un repository Git** che contiene, almeno:

| File / cartella | Scopo | Richiesto? |
|---------------|---------|-----------|
| `azure.yaml` | Descrive servizi, host e provider di infrastruttura | ✅ Sì |
| `infra/` | Definizioni di provisioning Bicep o Terraform | Richiesto per questo esempio esplicito di IaC; i progetti con infrastruttura generata possono ometterlo |
| `src/` (o il tuo codice) | Il codice applicativo che azd distribuisce | Richiesto per servizi basati su sorgente; non tutti i template contengono codice applicativo |
| `README.md` | Come usare il template | ✅ Fortemente raccomandato |
| `.azdo/` o `.github/` | Definizioni della pipeline CI/CD | Opzionale |
| `.devcontainer/` | Ambiente di sviluppo riproducibile | Opzionale |
| `azure.yaml` `metadata` | Identità/telemetria del template | Raccomandato; la pubblicazione di un repository Git non lo richiede |

Non c'è nulla di magico qui: quando esegui `azd init --template you/your-repo`, azd clona il repository e legge `azure.yaml`.

---

## Passo 1: Creare lo Scheletro del Repository

Crea la struttura delle cartelle a mano oppure parti da un template minimale e modificalo:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Una struttura tipica e completa appare così:

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

Questo è il cuore del template. Indica ad azd cosa distribuire e come:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Il campo `metadata.template` è ciò che la telemetria della galleria usa per contare gli utilizzi. Usa la convenzione `name@version`.

---

## Passo 3: Parametrizzare l'Infrastruttura

La regola più importante per un template *riutilizzabile*: **mai codificare direttamente nomi, regioni o valori specifici di sottoscrizione.** Usa parametri e il pattern di token risorsa affinché lo stesso template funzioni in qualsiasi sottoscrizione.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Due cose rendono questo template amico della riusabilità:

1. **Il tag `azd-env-name`** — azd lo usa per tracciare e pulire risorse per ambiente.
2. **Il token risorsa `uniqueString(...)`** — produce un suffisso hash stabile per ridurre collisioni; non garantisce unicità globale.

Il mancante `modules/web.bicep` deve accettare `name`, `location` e `tags`, provisioning dell'ambiente/registro Container Apps e app, taggare l'app con `azd-service-name: web`, ed esportare `uri`. Deve inoltre esporre i valori del registro necessari al flusso di build/deploy scelto (per esempio `AZURE_CONTAINER_REGISTRY_ENDPOINT` dal modulo root). Un solo output endpoint non collega il service discovery, le impostazioni app o l'autenticazione al registro.

Fornisci un file di parametri corrispondente che legga i valori che azd inietta dall'ambiente:

Salva quanto segue come `infra/main.parameters.json`:

```json
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

## Passo 4: Testare il Template Localmente

Prima di condividere, verifica che il template funzioni da uno stato pulito.

**Testa dalla cartella locale** (non è necessario pushare su Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Poi testa il teardown**—un buon template pulisce completamente:

```bash
azd down --force --purge
```

Se `azd down` lascia risorse residue, verifica la scoperta di ambiente/gruppo risorse, risorse esterne/condivise, permessi, blocchi e protezione da cancellazione. `--purge` non cancella lo stato locale di `.azure/`.

> **Suggerimento:** dopo aver fornito tutti i file mancanti, esegui prima `azd provision --preview`. Controlla gli hook prima dell'anteprima perché possono eseguire comandi con effetti collaterali. L'anteprima non è una stima dei costi né una garanzia del successo del provisioning.

---

## Passo 5: Pubblicare il Template

Invia il repository su GitHub (pubblico se vuoi che altri lo usino):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Ora chiunque può usarlo:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Passo 6 (Opzionale): Invia a Awesome AZD

La [galleria Awesome AZD](https://azure.github.io/awesome-azd/) elenca template della community. Per esserci, il tuo repo dovrebbe includere:

- ✅ Un `README.md` chiaro con prerequisiti, diagramma architetturale e note sui costi
- ✅ Un `azure.yaml` funzionante con `metadata.template`
- ✅ Infrastruttura che si provisiona pulita su una sottoscrizione nuova
- ✅ Un file `LICENSE`
- ✅ (Raccomandato) Un `.devcontainer/` per Codespaces con un clic

Invia aprendo una pull request che aggiunga il tuo template al file dati della galleria, seguendo la guida alla contribuzione nel [repository Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Errori Comuni

| Errore | Correzione |
|---------|-----|
| Nomi risorsa hardcoded | Usa il token risorsa `uniqueString()` |
| `azd down` lascia risorse | Tagga ogni risorsa (o il gruppo risorse) con `azd-env-name` |
| Il template funziona per te, ma fallisce per altri | Rimuovi ID sottoscrizione, ID tenant e assunzioni sulle regioni |
| Output non collegati all'app | Abbina `azd-service-name`/`resourceName` per il deployment e mappa esplicitamente gli output alle impostazioni app |
| Invio alla galleria rifiutato | Aggiungi `README.md`, `LICENSE` e `metadata.template` |

---

## Riepilogo

- Un template è semplicemente un repo Git con `azure.yaml`, `infra/` e il tuo codice.
- Parametrizza tutto — nomi, regioni e ID — così funziona ovunque.
- Tagga sempre le risorse con `azd-env-name` affinché `azd down` funzioni.
- Testa localmente con `azd init --template <local-path>` prima di pubblicare.
- Aggiungi metadati e un README per inviare a Awesome AZD.

---

## 🔗 Navigazione

| Direzione | Risorsa |
|-----------|----------|
| **Precedente** | [Guida al Deployment](deployment-guide.md) |
| **Home Capitolo** | [Capitolo 4: Infrastructure as Code](README.md) |
| **Prossimo Capitolo** | [Capitolo 5: Soluzioni Multi-Agente](../chapter-05-multi-agent/README.md) |

## 📖 Risorse Correlate

- [Provisioning Risorse](provisioning.md)
- [Galleria Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentazione ufficiale template azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->