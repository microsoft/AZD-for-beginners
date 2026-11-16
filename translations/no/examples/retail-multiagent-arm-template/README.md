# Infrastrukturrammeverk for detaljhandel med multi-agent

**Avansert arkitektur-eksempel — ikke en fungerende multi-agent-applikasjon.**

[Kurs hjem](../../README.md) ·
[Kapittel 5](../../docs/chapter-05-multi-agent/README.md) ·
[Arkitektur blåkopi](../retail-scenario.md)

## Hva dette distribuerer

Denne mappen inneholder en ARM-mal, parametere og et Bash utrullingsskript.
Det finnes **ingen `azure.yaml` eller kildemateriale for detaljhandel-applikasjon**.

| Ressurs | Faktisk tilstand etter utrulling |
|---|---|
| Primær Azure OpenAI-konto | `gpt-4.1-chat` distribusjon med `gpt-4.1` versjon `2025-04-14`, `GlobalStandard` |
| Sekundær OpenAI-konto (valgfritt) | `gpt-4.1-mini-inventory`, modell `gpt-4.1-mini` versjon `2025-04-14`, `GlobalStandard` |
| Embeddings-konto (valgfritt) | `text-embedding-ada-002` versjon `2`, `Standard`; ingen indekseringspipeline |
| Grader OpenAI-konto | `gpt-4.1-grader`, modell `gpt-4.1` versjon `2025-04-14`, `GlobalStandard`; ingen evaluator |
| AI Search | Tom tjeneste; ingen indeks eller dokumenter |
| Lagring | Tomme `documents` og `uploads` blobbeholdere |
| Cosmos DB | Serverløs konto, `chathistory` database, `conversations` beholder partisjonert etter `/userId`, 30 dagers gjenstand TTL |
| Container Apps | Router og frontend kjører begge `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` på port 80 |
| Key Vault (valgfritt) | Tom RBAC-aktivert hvelv; **ingen hemmeligheter eller rolleoppdrag** |
| Application Insights / Log Analytics (valgfritt) | Ressurser og miljølogginnsamling; ingen egendefinert app-instrumentering, varsler eller dashbord |
| Document Intelligence | S0-konto; ingen dokumentbehandlingsflyt |

Legacy Bing Search v7 ble avsluttet 11. august 2025 og er **ikke utplassert**.
Ingen erstatning for web-grounding integrasjon er implementert.

**Ikke inkludert:** kunde-/lager-agenter, router `/chat` API, frontend chat UI,
søkeskjema eller inntaksskript, Azure Container Registry, private endepunkter,
administrerte identiteter, RBAC-oppdrag, automatisk failover, Front Door, red-team
skanner, evaluerings-CLI, autentisering eller CI/CD.

En ARM-suksessmelding bekrefter kun ressursutrulling. Den garanterer ikke
applikasjonsfunksjonalitet, sikkerhet, tilgjengelighet eller produksjonsklarhet.

## Forutsetninger og kostnader

- Bash (Git Bash/WSL på Windows) og
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Et abonnement med tillatelser til å opprette alle listede ressurser.
- Sjekk tilgjengelighet for **hver modell/versjon/SKU i hver valgt region** og
  kvote for abonnementet ditt. Standardverdiene er eksempler, ikke garantier.
  Konsulter [modelltilgjengelighet](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Velg en dedikert ressursgruppe som du kan slette etter testing.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Standard lokasjoner: primær `eastus2`, sekundær `westus2`, embeddings `francecentral`;
grader standardiseres til primærregionen med mindre `graderLocation` leveres.
`--no-multi-region` hopper over sekundære og embeddings kontoer; den hopper ikke over
grader-kontoen.

Search belastes mens den er utplassert, selv når den er tom. Container minimum replikaer,
lagringsredundans, Cosmos DB forespørsler/lagring, modell tokens, Document Intelligence
anrop, og logg inntak/lagring kan gi ekstra kostnader. Det finnes **ingen fastsatt eller validert
månedlig totalsum**. Estimer eksakte SKUer i
[Azure priskalkulator](https://azure.microsoft.com/pricing/calculator/) og
sett opp et budsjett før du distribuerer.

### Distribusjonsmoduser

Disse innstillingene er ressursstørrelser, **ikke produksjons- eller SLA-sertifiseringer**:

| Modus | Chat / mini / embedding / grader kapasitet enheter | Router replikaer | Frontend replikaer | Search nivå | Lagring |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basis, 1 replika | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replika | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replikaer | Standard_GRS |

Modellkapasitet enheter er modell/SKU-spesifikke; ikke summer dem som en universell TPM
garanti. Premium aktiverer ikke sone-redundante Container Apps: det krever
ekstra nettverksdesign. Basic Search støtter vektorsøk, underlagt
tjenestebegrensninger; det er ikke iboende inkompatibelt med vektorer.

## 🚀 Rask distribusjon

Gjennomgå `azuredeploy.json` og `azuredeploy.parameters.json` først. Kommandoene
nedenfor **oppretter fakturerbare Azure-ressurser**; de er ikke offline-sjekker.

Fra depotets rotmappe:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skriptet bruker sti relativ til sin egen mappe, sjekker innlogging/verktøy/argumenter,
oppretter ressursgruppen hvis fraværende, validerer utrullingen, rullerer ut og
viser ikke-hemmelige utdata. Ingen `jq`, datainnbefolkning, hemmeligheterinnhenting, eller
applikasjonsoppsett etter distribusjon kreves eller utføres.

Skriptets standard kommandolinjeverdier overskriver tilsvarende verdier i
parameterfilen. Rediger parameterfilen for innstillinger som sekundære/tertiære
regioner; bruk direkte CLI-distribusjon hvis du trenger vilkårlige parameteroverskridelser:

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

Utrulling kan ta 15–45 minutter eller lenger, og kan feile på grunn av regionale kvoter eller
modell livssyklusbegrensninger. Ikke prøv på nytt blindt: les den mislykkede operasjonen først.

## Konfigurasjonsvalg

| Parameter | Standard i malen | Betydning |
|---|---|---|
| `projectName` | Krevd (`retail` i parameterfil) | 3–10 små bokstaver/siffer |
| `location` | Ressursgruppe lokasjon | Primærregion (`eastus2` i parameterfil) |
| `secondaryLocation` | `westus2` | Mini modell kontoregion |
| `tertiaryLocation` | `francecentral` | Embeddings-kontoregion |
| `graderLocation` | Primærregion | Uavhengig grader kontoregion |
| `environmentName` | `dev` | `dev`, `staging`, eller `prod`; kun navn, ikke en harding-toggle |
| `deploymentMode` | `standard` | SKU/kapasitetsvalg |
| `enableMultiRegion` | `true` | Legg til sekundære og embeddings kontoer |
| `enableMonitoring` | `true` | Legg til Insights/arbeidsområde og miljøloggsamling |
| `enableSecurity` | `true` | Opprett kun et tomt RBAC-aktivert hvelv |

Den misvisende `openAiApiVersion` parameteren ble fjernet: en dataflyt API-versjon
kontrollerer ikke ARM ressursversjoner eller modellversjoner. Modellnavn/versjonspar
finnes i `variables.modelDeployments`; sjekk dem sammen med distribusjons-SKU.

## Verifiser utrulling

Bruk distribusjonsnavnet fra skriptets utdata eller `az deployment group list`.
For direkte distribusjon ovenfor:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Forventet: distribusjonstilstand `Succeeded`. For en feil, undersøk operasjonsfeildetaljer.
Ressurslisteutdata alene er ikke en pålitelig sjekk av utrullingstilstand.

Test plassholderen **root**, ikke et ikke-eksisterende agentendepunkt:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Forventet: HTTP 200 hello-world side, **ikke et chat-svar**. En HTTP-feil
regnes ikke som vellykket verifisering.

For å teste faktisk primær modells inferens (fakturerbart):

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

Forventet: JSON med `choices` og `usage`. Distribusjonsnavnet er
`gpt-4.1-chat`, ikke underliggende modellnavn `gpt-4.1`.

## 🔧 Etter distribusjon: neste steg

Dette er en **utviklingsbacklogg**, ikke en ferdig øvelse:

1. Implementer autentiserte kunde-/lager-agenter og router-kontrakt.
2. Implementer frontend og valider konfigurasjonen.
3. Opprett og fyll en søkeindeks med en dimensjon/profil som matcher din
   embedding-modell, og håndter dokumentfeil og oppdateringer.
4. Opprett et register og konfigurer bilde-trekke-identitet/tillatelser.
5. Bygg og push ekte bilder. Endre Container App ingress-porter og prøver til å
   matche disse bildene før testing; port 80 her tilhører plassholderne.
6. Konfigurer hemmeligheter eller administrerte identiteter og avgrensede dataflytroller. Ikke
   referer til imaginære hemmelighetsnavn: denne malen oppretter ingen applikasjonshemmeligheter.
7. Instrumenter applikasjoner, konfigurer varsler, test feil/gjenoppretting, og evaluer
   resultater med representative sannhetsdata og menneskelig gjennomgang.

Se [arkitektur blåkopi](../retail-scenario.md) for designgrenser.

## Feilsøking og sikkerhetsgrenser

- **Modell utilgjengelig:** verifiser modell/versjon/SKU, region og abonnementskvote;
  skriptet forhåndssjekker ikke modellkataloger.
- **Overvåking deaktivert:** miljøloggdestinasjon er `none`, ikke en
  ugyldig tom Log Analytics-konfigurasjon.
- **Kun plassholdere:** `/chat`, agentevaluering og filinntak eksisterer ikke.
- **Nettverk/identitet:** offentlige endepunkter og lokal autentisering er aktivert.
  Bare å aktivere Key Vault RBAC oppretter ikke rolleoppdrag eller identiteter.
- **Produksjon:** legg til autentisering, avgrensede identiteter, hemmelighetshåndtering,
  privat nettverksstøtte der det er passende, tilgjengelighetsdesign, og operasjonelle tester.
  Multi-region modellkonti alene gir ikke failover.

## Opprydding

Det finnes ikke noe AZD-prosjekt her; `azd down` er ikke oppryddingskommandoen.
Etter å ha sjekket at gruppen kun inneholder læringsressursene dine:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Forventet etter sletting ferdigstilt: `false`. Key Vault og Cognitive Services
myk-slettede ressurser kan beholde navn; rensing krever riktige tillatelser.
Sjekk Kostnadshåndtering for forsinkede brukeravgifter.

[Rapporter et problem](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->