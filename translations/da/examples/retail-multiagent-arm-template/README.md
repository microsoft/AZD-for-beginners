# Infrastruktur-rammeværk til detailhandel med flere agenter

**Avanceret arkitektureksempel — ikke en fungerende multi-agent-applikation.**

[Kursusforside](../../README.md) ·
[Kapitel 5](../../docs/chapter-05-multi-agent/README.md) ·
[Arkitekturtegning](../retail-scenario.md)

## Hvad dette implementerer

Dette bibliotek indeholder en ARM-skabelon, parametre og et Bash-installationsscript.
Der er **ingen `azure.yaml` eller detailhandelsapplikationskode**.

| Ressource | Faktisk tilstand efter udrulning |
|---|---|
| Primær Azure OpenAI-konto | `gpt-4.1-chat` udrulning ved brug af `gpt-4.1` version `2025-04-14`, `GlobalStandard` |
| Sekundær OpenAI-konto (valgfri) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` version `2025-04-14`, `GlobalStandard` |
| Embeddings-konto (valgfri) | `text-embedding-ada-002` version `2`, `Standard`; ingen indekseringspipeline |
| Grader OpenAI-konto | `gpt-4.1-grader`, model `gpt-4.1` version `2025-04-14`, `GlobalStandard`; ingen evaluator |
| AI Search | Tom tjeneste; intet indeks eller dokumenter |
| Storage | Tomme `documents` og `uploads` blob-container |
| Cosmos DB | Serverløs konto, `chathistory` database, `conversations` container partitioneret efter `/userId`, 30-dages element TTL |
| Container Apps | Router og frontend kører begge `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` på port 80 |
| Key Vault (valgfri) | Tom RBAC-aktiveret vault; **ingen hemmeligheder eller rolleinddelinger** |
| Application Insights / Log Analytics (valgfri) | Ressourcer og miljølogindsamling; ingen brugerdefineret app-instrumentering, alarmer eller dashboards |
| Document Intelligence | S0-konto; ingen dokumentbehandlingsworkflow |

Legacy Bing Search v7 blev pensioneret den 11. august 2025 og er **ikke implementeret**.
Der er ikke implementeret nogen erstatningsintegration til web-grounding.

**Ikke inkluderet:** kunde-/lageragenter, router `/chat` API, frontend chat UI,
søgeskema eller indlæsningsscripts, Azure Container Registry, private endpoints,
styrede identiteter, RBAC-tilknytninger, automatisk failover, Front Door, red-team
scanner, evaluerings-CLI, autentificering eller CI/CD.

En succesmeddelelse fra ARM bekræfter kun ressourceimplementering. Den garanterer ikke
applikationsfunktionalitet, sikkerhed, tilgængelighed eller produktionsparathed.

## Forudsætninger og omkostninger

- Bash (Git Bash/WSL på Windows) og
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Et abonnement med tilladelse til at oprette alle listede ressourcer.
- Tjek tilgængeligheden af **hver model/version/SKU i hver valgt region** og
  kvote for dit abonnement. Standardværdierne er eksempler, ikke garantier.
  Konsulter [modeltilgængelighed](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Vælg en dedikeret ressourcegruppe, du kan slette efter test.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Standardplaceringer: primær `eastus2`, sekundær `westus2`, embeddings `francecentral`;
grader vælger standard til den primære region medmindre `graderLocation` er angivet.
`--no-multi-region` springer over sekundære og embeddings-konti; den springer ikke over
grader-kontoen.

Search opkræves, mens den er implementeret, selv når tom. Mindste antal replikaer af container,
lagringsredundans, Cosmos DB-forespørgsler/lagring, modeltokens, Document Intelligence
kald og logindtagning/lagring kan pålægge gebyrer. Der er **ingen fast eller valideret
månedlig total**. Estimer de nøjagtige SKU'er i
[Azure prismodelberegner](https://azure.microsoft.com/pricing/calculator/) og
konfigurer et budget inden implementering.

### Implementeringstilstande

Disse indstillinger er ressourcestørrelser, **ikke produktions- eller SLA-certificeringer**:

| Tilstand | Chat / mini / embedder / grader kapacitetsenheder | Routerreplicaer | Frontend-replicaer | Search-niveau | Storage |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 replica | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replica | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replicas | Standard_GRS |

Modelkapacitetsenheder er model-/SKU-specifikke; summér dem ikke som en universel TPM
garanti. Premium aktiverer ikke zoneredundante Container Apps: det kræver
yderligere netværksdesign. Basic Search understøtter vektorsøgning, underlagt
tjenestegrænser; det er ikke iboende inkompatibelt med vektorer.

## 🚀 Hurtig implementering

Gennemse `azuredeploy.json` og `azuredeploy.parameters.json` først. Kommandoerne
nedenfor **opretter fakturerbare Azure-ressourcer**; de er ikke offlinekontroller.

Fra bibliotekets rod:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Scriptet bruger stier relative til dets egen mappe, tjekker login/værktøjer/argumenter,
opretter ressourcegruppen hvis den mangler, validerer implementeringen, implementerer og
viser ikke-fortrolige output. Ingen `jq`, datapåfyldning, hemmelighedshentning eller
efterimplementeringsapplikationsopsætning kræves eller udføres.

Scriptets standardkommandolinjeværdier tilsidesætter tilsvarende værdier i
parameterfilen. Rediger parameterfilen for indstillinger som sekundære/tertiære
regioner; brug direkte CLI-implementering hvis du har brug for vilkårlige parameteroverskrivelser:

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

Implementering kan tage 15–45 minutter eller længere og kan fejle på regionale kvoter eller
modellivscyklusbegrænsninger. Prøv ikke blindt igen: læs først den fejlede operation.

## Konfigurationsmuligheder

| Parameter | Standard i skabelon | Betydning |
|---|---|---|
| `projectName` | Påkrævet (`retail` i parameterfil) | 3–10 små bogstaver/cifre |
| `location` | Ressourcegruppens placering | Primær region (`eastus2` i parameterfil) |
| `secondaryLocation` | `westus2` | Mini-modelkonto region |
| `tertiaryLocation` | `francecentral` | Embeddings-konto region |
| `graderLocation` | Primær region | Uafhængig grader-konto region |
| `environmentName` | `dev` | `dev`, `staging` eller `prod`; kun navn, ikke en hardening-kontakt |
| `deploymentMode` | `standard` | SKU-/kapacitetsvalg |
| `enableMultiRegion` | `true` | Tilføj sekundære og embeddings-konti |
| `enableMonitoring` | `true` | Tilføj Insights/workspace og miljølogindsamling |
| `enableSecurity` | `true` | Opret kun en tom RBAC-aktiveret vault |

Den misvisende `openAiApiVersion`-parameter blev fjernet: en data-plane API-version
styrer ikke ARM-ressourceversioner eller modelversioner. Modelnavn/version-par findes
i `variables.modelDeployments`; tjek dem sammen med implementerings-SKU.

## Bekræft implementering

Brug implementeringsnavnet fra scriptets output eller `az deployment group list`.
For direkte implementering ovenfor:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Forventet: implementeringstilstand `Succeeded`. Ved fejl, undersøg fejloplysninger for operationen.
Output af ressource-liste alene er ikke en pålidelig kontrol af implementeringstilstand.

Test pladsholderen **root**, ikke en ikke-eksisterende agentendepunkt:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Forventet: HTTP 200 hello-world side, **ikke et chat-svar**. En HTTP-fejl tæller ikke som en vellykket verifikation.


For at teste faktisk primær modelinferens (fakturerbart):

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

Forventet: JSON med `choices` og `usage`. Implementeringsnavnet er
`gpt-4.1-chat`, ikke det underliggende modelnavn `gpt-4.1`.

## 🔧 Efter implementeringen: Næste trin

Dette er en **udviklings-backlog**, ikke en færdig øvelse:

1. Implementér autentificerede kunde-/lageragenter og routerkontrakten.
2. Implementér frontend og valider dens konfiguration.
3. Opret og fyld et søgeindeks med dimension/profil, der matcher din
   embeddingmodel, og håndter dokumentfejl og opdateringer.
4. Opret et register og konfigurer image-pull identitet/tilladelser.
5. Byg og push rigtige billeder. Skift Container App ingress-porte og prober for at
   matche disse billeder, inden du tester; port 80 her tilhører pladsholderne.
6. Konfigurer hemmeligheder eller styrede identiteter og scoped data-plane roller. Referer ikke til
   imaginære hemmelige navne: denne skabelon opretter ingen applikationshemmeligheder.
7. Instrumentér applikationer, konfigurer alarmer, test fejl/genopretning, og
   evaluer resultater med repræsentativ sandhed og menneskelig gennemgang.

Se [arkitekturtegningen](../retail-scenario.md) for designgrænser.

## Fejlfinding og sikkerhedsgrænser

- **Model utilgængelig:** verificer model/version/SKU, region og abonnements-kvote;
  scriptet flyver ikke forud for modelkataloger.
- **Overvågning deaktiveret:** miljøets logdestination er `none`, ikke en
  ugyldig tom Log Analytics-konfiguration.
- **Kun pladsholdere:** `/chat`, agent-evaluering og filindlæsning findes ikke.
- **Netværk/identitet:** offentlige endepunkter og lokal autentificering er aktiveret.
  Det at aktivere Key Vault RBAC alene skaber ikke rolleinddelinger eller identiteter.
- **Produktion:** tilføj autentificering, scoped identiteter, hemmelighedshåndtering,
  privat netværk hvor passende, tilgængelighedsdesign og operationelle tests.
  Multi-region modelkonti alene giver ikke failover.

## Oprydning

Der er intet AZD-projekt her; `azd down` er ikke oprydningskommandoen.
Efter at have sikret dig, at gruppen kun indeholder dine læringsressourcer:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Forventet efter sletning færdig: `false`. Key Vault og Cognitive Services
ressourcer med soft-sletning kan bevare navne; rydning kræver passende tilladelser.
Tjek Cost Management for forsinkede forbrugsgebyrer.

[Rapporter et problem](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->