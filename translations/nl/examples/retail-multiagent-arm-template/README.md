# Retail Multi-Agent Infrastructuur Scaffold

**Geavanceerd architectuuurvoorbeeld — geen werkende multi-agent toepassing.**

[Cursus startpagina](../../README.md) ·
[Hoofdstuk 5](../../docs/chapter-05-multi-agent/README.md) ·
[Architectuur blauwdruk](../retail-scenario.md)

## Wat dit implementeert

Deze map bevat een ARM-sjabloon, parameters en een Bash-implementatiescript.
Er is **geen `azure.yaml` of retail toepassingsbron**.

| Resource | Werkelijke status na provisioning |
|---|---|
| Primaire Azure OpenAI-account | `gpt-4.1-chat` implementatie met `gpt-4.1` versie `2025-04-14`, `GlobalStandard` |
| Secundaire OpenAI-account (optioneel) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` versie `2025-04-14`, `GlobalStandard` |
| Embedding-account (optioneel) | `text-embedding-ada-002` versie `2`, `Standard`; geen indexeringspipeline |
| Grader OpenAI-account | `gpt-4.1-grader`, model `gpt-4.1` versie `2025-04-14`, `GlobalStandard`; geen beoordelaar |
| AI Search | Lege service; geen index of documenten |
| Opslag | Lege `documents` en `uploads` blob containers |
| Cosmos DB | Serverless account, `chathistory` database, `conversations` container gepartitioneerd door `/userId`, 30-daagse item TTL |
| Container Apps | Router en frontend draaien beide `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` op poort 80 |
| Key Vault (optioneel) | Lege RBAC-ingeschakelde kluis; **geen secrets of roltoewijzingen** |
| Application Insights / Log Analytics (optioneel) | Resources en logverzameling van omgeving; geen aangepaste applicatie-instrumentatie, alerts of dashboards |
| Document Intelligence | S0-account; geen documentverwerkingsworkflow |

Legacy Bing Search v7 werd op 11 augustus 2025 uitgefaseerd en is **niet geïmplementeerd**.
Er is geen vervangende web-grondslagintegratie geïmplementeerd.

**Niet inbegrepen:** klant-/inventarisagenten, router `/chat` API, frontend chat-UI,
zoekschema of invoerscripts, Azure Container Registry, private endpoints,
beheerde identiteiten, RBAC-toewijzingen, automatische failover, Front Door, red-team
scanner, evaluatie-CLI, authenticatie, of CI/CD.

Een ARM succesbericht bevestigt alleen resource provisioning. Het certificeert niet
applicatiefunctionaliteit, beveiliging, beschikbaarheid of productieklaarheid.

## Vereisten en kosten

- Bash (Git Bash/WSL op Windows) en
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Een abonnement met permissies om alle vermelde resources te maken.
- Controleer beschikbaarheid van **elk model/versie/SKU in elke geselecteerde regio** en
  quota voor uw abonnement. De standaardwaarden zijn voorbeelden, geen garanties.
  Raadpleeg [modelbeschikbaarheid](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Kies een toegewijde resourcegroep die u na testen kunt verwijderen.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Standaardlocaties: primair `eastus2`, secundair `westus2`, embeddings `francecentral`;
de grader valt standaard terug op de primaire regio tenzij `graderLocation` wordt opgegeven.
`--no-multi-region` slaat secundaire en embeddings-accounts over; het slaat de
grader-account niet over.

Search wordt in rekening gebracht zolang het geïmplementeerd is, ook als het leeg is. Minimale replica's van containers,
opslagredundantie, Cosmos DB-aanvragen/opslag, modeltokens, Document Intelligence
oproepen en log-invoer/opslag kunnen kosten toevoegen. Er is **geen vaste of gevalideerde
maandelijkse totaalprijs**. Schat de exacte SKU's in de
[Azure prijscalculator](https://azure.microsoft.com/pricing/calculator/) en
stel een budget in vóór implementatie.

### Implementatiemodi

Deze instellingen zijn resourcematen, **geen productie- of SLA-certificeringen**:

| Modus | Chat / mini / embedding / grader capaciteitsunits | Router replica's | Frontend replica's | Search tier | Opslag |
|---|---|---|---|---|---|
| minimaal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 replica | Standard_LRS |
| standaard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replica | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replica's | Standard_GRS |

Modelcapaciteitsunits zijn model/SKU-specifiek; tel ze niet op als universele TPM-
garantie. Premium maakt geen zone-redundante Container Apps mogelijk: dat vereist
aanvullende netwerkontwerp. Basic Search ondersteunt vectorazoek, onderhevig aan
servicelimieten; het is niet per definitie onverenigbaar met vectors.

## 🚀 Snelle implementatie

Bekijk `azuredeploy.json` en `azuredeploy.parameters.json` eerst. De onderstaande commando's
maken **in rekening te brengen Azure-resources aan**; het zijn geen offline controles.

Vanuit de repo-root:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Het script gebruikt paden relatief aan de eigen map, controleert login/tools/argumenten,
maakt de resourcegroep aan indien afwezig, valideert de implementatie, provisioneert, en
toont niet-geheime outputs. Er is geen `jq`, gegevenspopulatie, geheimenophaling, of
post-implementatie applicatieconfiguratie vereist of uitgevoerd.

De standaard commando-regelwaarden van het script overschrijven corresponderende waarden in het
parametersbestand. Bewerk het parametersbestand voor instellingen zoals secundaire/tertiaire
regio's; gebruik directe CLI-implementatie als u willekeurige parameteroverschrijvingen nodig heeft:

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

Provisioning kan 15–45 minuten duren of langer, en kan falen vanwege regionale quota of
modellevenscyclusbeperkingen. Probeer niet blind opnieuw: lees eerst de mislukte operatie.

## Configuratie-opties

| Parameter | Standaard in sjabloon | Betekenis |
|---|---|---|
| `projectName` | Vereist (`retail` in parametersbestand) | 3–10 kleine letters/cijfers |
| `location` | Locatie resourcegroep | Primaire regio (`eastus2` in parametersbestand) |
| `secondaryLocation` | `westus2` | Mini model account regio |
| `tertiaryLocation` | `francecentral` | Embeddings account regio |
| `graderLocation` | Primaire regio | Onafhankelijke grader account regio |
| `environmentName` | `dev` | `dev`, `staging`, of `prod`; alleen naam, geen hardening toggle |
| `deploymentMode` | `standard` | SKU/capaciteit selectie |
| `enableMultiRegion` | `true` | Voeg secundaire en embeddings accounts toe |
| `enableMonitoring` | `true` | Voeg Insights/workspace en omgevingslogverzameling toe |
| `enableSecurity` | `true` | Maak alleen een lege RBAC-ingeschakelde vault aan |

De misleidende `openAiApiVersion` parameter werd verwijderd: een data-plane API-versie
beheerst geen ARM resourceversies of modelversies. Model naam/versieparen
staan in `variables.modelDeployments`; controleer deze samen met de implementatie-SKU.

## Verifieer provisioning

Gebruik de implementatienaam uit de output van het script of `az deployment group list`.
Voor directe implementatie hierboven:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Verwacht: implementatiestatus `Succeeded`. Bij een mislukking, inspecteer de fout in de operatie
details. Alleen resource-lijstoutput is geen betrouwbare check op provisioning-status.

Test de tijdelijke aanduiding **root**, niet een niet-bestaand agent-eindpunt:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Verwacht: HTTP 200 hello-world pagina, **geen chatantwoord**. Een HTTP-fout
telt niet als succesvolle verificatie.

Om echte primaire modelinference te testen (in rekening gebracht):

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

Verwacht: JSON met `choices` en `usage`. De implementatienaam is
`gpt-4.1-chat`, niet de onderliggende modelnaam `gpt-4.1`.

## 🔧 Post-implementatie: Volgende stappen

Dit is een **ontwikkelingsbacklog**, geen afgeronde oefening:

1. Implementeer geauthenticeerde klant-/inventarisagenten en het router-contract.
2. Implementeer de frontend en valideer de configuratie.
3. Maak en vul een zoekindex met een dimensie/profiel die aansluit bij uw
   embeddingmodel, en beheer documentfouten en updates.
4. Maak een registry en configureer image-pull identiteit/permissies.
5. Bouw en push echte images. Verander Container App ingress-poorten en probes om te
   passen bij die images voordat u test; poort 80 hier is voor de placeholders bedoeld.
6. Configureer secrets of beheerde identiteiten en gescopeerde data-plane rollen. Verwijs niet
   naar denkbeeldige geheime namen: deze sjabloon maakt geen applicatiegeheimen aan.
7. Instrumenteer applicaties, configureer alerts, test uitval/herstel, en evalueer
   resultaten met representatieve grondwaarheid en menselijke beoordeling.

Zie de [architectuur blauwdruk](../retail-scenario.md) voor ontwerpgrenzen.

## Problemen oplossen en beveiligingsgrenzen

- **Model niet beschikbaar:** controleer model/versie/SKU, regio, en abonnementsquota;
  het script controleert geen modelcatalogi vooraf.
- **Monitoring uitgeschakeld:** de omgeving logbestemming is `none`, geen
  ongeldige lege Log Analytics-configuratie.
- **Alleen placeholders:** `/chat`, agentevaluatie, en file-ingestie bestaan niet.
- **Netwerk/identiteit:** publieke endpoints en lokale authenticatie zijn ingeschakeld.
  Alleen het inschakelen van Key Vault RBAC maakt geen roltoewijzingen of identiteiten aan.
- **Productie:** voeg authenticatie, gescopeerde identiteiten, geheimbeheer,
  privénetwerken waar nodig, beschikbaarheidsontwerp, en operationele tests toe.
  Multi-regio modelaccounts bieden op zichzelf geen failover.

## Opruimen

Hier is geen AZD-project; `azd down` is niet het opruimcommando.
Na controle dat de groep alleen uw leerresources bevat:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Verwacht na voltooiing van verwijderen: `false`. Key Vault en Cognitive Services
soft-verwijderde resources kunnen namen behouden; verwijderen vereist geschikte permissies.
Controleer Cost Management voor vertraagde gebruikskosten.

[Rapporteer een probleem](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->