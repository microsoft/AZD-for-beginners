# Infrastruttura di Multi-Agente per il Retail

**Esempio avanzato di architettura — non un'applicazione multi-agente funzionante.**

[Home del corso](../../README.md) ·
[Capitolo 5](../../docs/chapter-05-multi-agent/README.md) ·
[Progetto dell'architettura](../retail-scenario.md)

## Cosa viene distribuito

Questa cartella contiene un template ARM, parametri, e uno script Bash di distribuzione.
Non c'è **nessun `azure.yaml` o sorgente di applicazione retail**.

| Risorsa | Stato effettivo dopo il provisioning |
|---|---|
| Account Azure OpenAI primario | Distribuzione `gpt-4.1-chat` usando `gpt-4.1` versione `2025-04-14`, `GlobalStandard` |
| Account OpenAI secondario (opzionale) | `gpt-4.1-mini-inventory`, modello `gpt-4.1-mini` versione `2025-04-14`, `GlobalStandard` |
| Account Embeddings (opzionale) | `text-embedding-ada-002` versione `2`, `Standard`; nessuna pipeline di indicizzazione |
| Account OpenAI Grader | `gpt-4.1-grader`, modello `gpt-4.1` versione `2025-04-14`, `GlobalStandard`; nessun valutatore |
| AI Search | Servizio vuoto; nessun indice o documenti |
| Storage | Contenitori blob `documents` e `uploads` vuoti |
| Cosmos DB | Account serverless, database `chathistory`, contenitore `conversations` partizionato da `/userId`, TTL elemento 30 giorni |
| Container Apps | Router e frontend entrambi eseguiti `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` sulla porta 80 |
| Key Vault (opzionale) | Vault vuoto abilitato RBAC; **nessun segreto o assegnazione di ruolo** |
| Application Insights / Log Analytics (opzionale) | Collezione log risorse e ambiente; nessuna strumentazione app personalizzata, avvisi o dashboard |
| Document Intelligence | Account S0; nessun flusso di lavoro di elaborazione documenti |

Il Legacy Bing Search v7 è stato ritirato l’11 agosto 2025 ed è **non provisionato**.
Non è stata implementata alcuna integrazione sostitutiva di web grounding.

**Non inclusi:** agenti clienti/inventario, API router `/chat`, interfaccia chat frontend,
schema di ricerca o script di ingestion, Azure Container Registry, endpoint privati,
identità gestite, assegnazioni RBAC, failover automatico, Front Door, scanner red-team,
CLI di valutazione, autenticazione o CI/CD.

Un messaggio di successo ARM conferma solo il provisioning delle risorse. Non certifica
la funzionalità dell’applicazione, la sicurezza, la disponibilità o la prontezza per la produzione.

## Prerequisiti e costi

- Bash (Git Bash/WSL su Windows) e
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Un abbonamento con autorizzazioni per creare tutte le risorse elencate.
- Verificare la disponibilità di **ogni modello/versione/SKU in ogni regione selezionata** e
  la quota per il vostro abbonamento. I valori predefiniti sono esempi, non garanzie.
  Consultare [disponibilità modello](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Scegliere un gruppo di risorse dedicato che si può eliminare dopo i test.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Posizioni predefinite: primario `eastus2`, secondario `westus2`, embeddings `francecentral`;
il grader predefinito usa la regione primaria a meno che non sia fornito `graderLocation`.
`--no-multi-region` salta gli account secondari e embeddings; non salta
l’account grader.

Search viene addebitato mentre è provisionato anche se vuoto. Replica minima del contenitore,
ridondanza dello storage, richieste/storage Cosmos DB, token modello, chiamate Document Intelligence
e ingestion/storage dei log possono aggiungere costi. Non esiste un **totale mensile fisso o validato**.
Stimare gli SKU esatti nel
[calcolatore prezzi Azure](https://azure.microsoft.com/pricing/calculator/) e
configurare un budget prima della distribuzione.

### Modalità di distribuzione

Queste impostazioni indicano le dimensioni delle risorse, **non certificazioni di produzione o SLA**:

| Modalità | Unità capacità chat / mini / embedding / grader | Replica router | Replica frontend | Livello search | Storage |
|---|---|---|---|---|---|
| minimo | 10 / 10 / 20 / 5 | 0–3 | 1–2 | base, 1 replica | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replica | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 repliche | Standard_GRS |

Le unità di capacità modello sono specifiche per modello/SKU; non sommarle come garanzia universale TPM.
Premium non abilita Container Apps ridondanti per zona: ciò richiede
una progettazione aggiuntiva di rete. Basic Search supporta la ricerca vettoriale, soggetta a
limiti del servizio; non è intrinsecamente incompatibile con i vettori.

## 🚀 Distribuzione rapida

Rivedere prima `azuredeploy.json` e `azuredeploy.parameters.json`. I comandi
seguenti **creano risorse Azure fatturabili**; non sono controlli offline.

Dalla radice del repository:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Lo script usa percorsi relativi alla propria directory, verifica login/strumenti/argomenti,
crea il gruppo di risorse se assente, valida la distribuzione, provvede e
mostra output non segreti. Non è richiesto né eseguito alcun `jq`, popolamento dati,
recupero segreti o configurazione post-distribuzione dell’applicazione.

I valori predefiniti della riga di comando dello script sovrascrivono i valori corrispondenti nel
file dei parametri. Modificare il file dei parametri per impostazioni come regioni secondarie/terziarie;
usare la distribuzione CLI diretta se necessarie sovrascritture arbitrarie dei parametri:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

Il provisioning può impiegare 15–45 minuti o più, e può fallire per quote regionali o restrizioni
sul ciclo di vita del modello. Non riprovare ciecamente: leggere prima l’operazione fallita.

## Opzioni di configurazione

| Parametro | Predefinito nel template | Significato |
|---|---|---|
| `projectName` | Obbligatorio (`retail` nel file parametri) | 3–10 lettere/minuscole o cifre |
| `location` | Posizione gruppo di risorse | Regione primaria (`eastus2` nel file parametri) |
| `secondaryLocation` | `westus2` | Regione account modello mini |
| `tertiaryLocation` | `francecentral` | Regione account embeddings |
| `graderLocation` | Regione primaria | Regione account grader indipendente |
| `environmentName` | `dev` | `dev`, `staging`, o `prod`; solo nome, non un toggle di hardening |
| `deploymentMode` | `standard` | Selezione SKU/capacità |
| `enableMultiRegion` | `true` | Aggiungi account secondari ed embeddings |
| `enableMonitoring` | `true` | Aggiungi raccolta log Insights/workspace e ambiente |
| `enableSecurity` | `true` | Crea solo un vault RBAC vuoto |

Il fuorviante parametro `openAiApiVersion` è stato rimosso: una versione API data-plane
non controlla versioni risorsa ARM o versioni modello. Coppie nome/versione modello
sono in `variables.modelDeployments`; verificarle insieme allo SKU di distribuzione.

## Verifica del provisioning

Usare il nome di distribuzione dall’output dello script o `az deployment group list`.
Per la distribuzione diretta sopra:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Previsto: stato distribuzione `Succeeded`. In caso di errore, ispezionare i dettagli dell’operazione.
L’output della lista delle risorse da solo non è un controllo affidabile dello stato del provisioning.

Testare il placeholder **root**, non un endpoint agente inesistente:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Previsto: pagina hello-world HTTP 200, **non una risposta chat**. Un errore HTTP
non conta come verifica riuscita.

Per testare l’effettiva inferenza modello primaria (fatturabile):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Previsto: JSON con `choices` e `usage`. Il nome della distribuzione è
`gpt-4.1-chat`, non il nome modello sottostante `gpt-4.1`.

## 🔧 Post-distribuzione: Passi successivi

Questo è un **backlog di sviluppo**, non un esercizio concluso:

1. Implementare agenti clienti/inventario autenticati e il contratto router.
2. Implementare il frontend e validarne la configurazione.
3. Creare e popolare un indice di ricerca con una dimensione/profilo corrispondente al vostro
   modello embedding, e gestire errori e aggiornamenti documenti.
4. Creare un registro e configurare identità/autorizzazioni pull immagini.
5. Costruire e spingere immagini reali. Modificare le porte ingress/probe di Container App per
   adattarsi a quelle immagini prima del test; la porta 80 qui appartiene ai placeholder.
6. Configurare segreti o identità gestite e ruoli scoped data-plane. Non
   fare riferimento a nomi segreti immaginari: questo template non crea segreti applicativi.
7. Strumentare le applicazioni, configurare avvisi, testare fallimenti/recupero e valutare
   i risultati con ground truth rappresentativo e revisione umana.

Consultare il [modello architetturale](../retail-scenario.md) per i limiti di progettazione.

## Risoluzione problemi e limiti di sicurezza

- **Modello non disponibile:** verificare modello/versione/SKU, regione e quota abbonamento;
  lo script non effettua preflight dei cataloghi modello.
- **Monitoraggio disabilitato:** la destinazione log ambiente è `none`, non una
  configurazione Log Analytics vuota non valida.
- **Solo placeholder:** `/chat`, valutazione agente e ingestion file non esistono.
- **Rete/identità:** endpoint pubblici e autenticazione locale sono abilitati.
  Abilitare solo RBAC Key Vault non crea assegnazioni di ruolo o identità.
- **Produzione:** aggiungere autenticazione, identità scoped, gestione segreti,
  rete privata ove appropriato, progettazione disponibilità e test operativi.
  Account modello multi-regione da soli non forniscono failover.

## Pulizia

Non esiste un progetto AZD qui; `azd down` non è il comando di pulizia.
Dopo aver verificato che il gruppo contenga solo risorse di apprendimento:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Previsto dopo la cancellazione: `false`. Risorse soft-deleted di Key Vault e Cognitive Services
possono mantenere i nomi; il purge richiede autorizzazioni appropriate.
Verificare Cost Management per addebiti di utilizzo ritardati.

[Segnala un problema](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->