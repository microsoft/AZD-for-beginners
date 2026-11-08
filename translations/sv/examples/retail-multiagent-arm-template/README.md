# Retail Multi-Agent Infrastructure Scaffold

**Avancerat arkitektur-exempel — inte en fungerande multi-agent applikation.**

[Kurshem](../../README.md) ·
[Kapitel 5](../../docs/chapter-05-multi-agent/README.md) ·
[Arkitekturplan](../retail-scenario.md)

## Vad detta distribuerar

Den här katalogen innehåller en ARM-mall, parametrar och ett Bash-distributionsskript.
Det finns **ingen `azure.yaml` eller retail-applikationskod**.

| Resurs | Faktiskt tillstånd efter provisionering |
|---|---|
| Primärt Azure OpenAI-konto | `gpt-4.1-chat` distribution med `gpt-4.1` version `2025-04-14`, `GlobalStandard` |
| Sekundärt OpenAI-konto (valfritt) | `gpt-4.1-mini-inventory`, modell `gpt-4.1-mini` version `2025-04-14`, `GlobalStandard` |
| Embeddings-konto (valfritt) | `text-embedding-ada-002` version `2`, `Standard`; ingen indexeringspipeline |
| Grader OpenAI-konto | `gpt-4.1-grader`, modell `gpt-4.1` version `2025-04-14`, `GlobalStandard`; ingen utvärderare |
| AI Search | Tom tjänst; ingen index eller dokument |
| Lagring | Tomma `documents` och `uploads` blob-containrar |
| Cosmos DB | Serverless-konto, `chathistory` databas, `conversations` container partitionerad efter `/userId`, 30-dagars TTL för objekt |
| Container Apps | Router och frontend kör båda `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` på port 80 |
| Key Vault (valfritt) | Tom RBAC-aktiverad valv; **inga hemligheter eller rolltilldelningar** |
| Application Insights / Log Analytics (valfritt) | Resurser och insamling av miljöloggar; ingen skräddarsydd applikationsinstrumentering, larm eller instrumentpaneler |
| Document Intelligence | S0-konto; ingen dokumentbearbetningsarbetsflöde |

Legacy Bing Search v7 togs ur bruk den 11 augusti 2025 och **provisioneras inte**.
Ingen ersättande web-grounding integration är implementerad.

**Ingår inte:** kund-/inventarieagenter, router `/chat` API, frontend chatt-UI,
sökschema eller inmatningsskript, Azure Container Registry, privata endpoints,
hanterade identiteter, RBAC-tilldelningar, automatisk failover, Front Door, red-team
skanner, utvärderings-CLI, autentisering eller CI/CD.

Ett ARM-succémeddelande bekräftar endast resursprovisionering. Det intygar inte
applikationsfunktionalitet, säkerhet, tillgänglighet eller produktionsberedskap.

## Förutsättningar och kostnader

- Bash (Git Bash/WSL på Windows) och
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Ett abonnemang med behörighet att skapa alla listade resurser.
- Kontrollera tillgängligheten för **varje modell/version/SKU i varje vald region** och
  kvot för ditt abonnemang. Standardvärden är exempel, inte garantier.
  Konsultera [modelltillgänglighet](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Välj en dedikerad resursgrupp som du kan ta bort efter testning.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Standardplatser: primär `eastus2`, sekundär `westus2`, embeddings `francecentral`;
grader använder standard till den primära regionen om inte `graderLocation` anges.
`--no-multi-region` hoppar över sekundära och embeddings-konton; det hoppar inte
över grader-kontot.

Sökning debiteras medan den är provisionerad även om den är tom. Minsta repliker för Container,
lagringsredundans, Cosmos DB-förfrågningar/-lagring, modell-token, Document Intelligence
anrop och logginspektion/-lagring kan lägga till kostnader. Det finns **ingen fast eller validerad
månadskostnad**. Uppskatta exakta SKU:er i
[Azure priskalkylator](https://azure.microsoft.com/pricing/calculator/) och
konfigurera en budget före distribution.

### Distributionslägen

Dessa inställningar är resursstorlekar, **inte certifieringar för produktion eller SLA**:

| Läget | Chatt / mini / embedding / grader kapacitetenheter | Router-repliker | Frontend-repliker | Söknivå | Lagring |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 replik | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replik | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 repliker | Standard_GRS |

Modellkapacitetenheter är modell/SKU-specifika; summera dem inte som en universell TPM
garanti. Premium aktiverar inte zonredundanta Container Apps: det kräver
ytterligare nätverksdesign. Basic Search stödjer vektorsökning, med begränsning enligt
tjänstgränser; det är inte i sig oförenligt med vektorer.

## 🚀 Snabb distribution

Granska `azuredeploy.json` och `azuredeploy.parameters.json` först. Kommandona
nedan **skapar debiterbara Azure-resurser**; de är inte offline-kontroller.

Från repositoryns rot:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skriptet använder sökvägar relativa till sin egen katalog, kontrollerar inloggning/verktyg/argument,
skapar resursgruppen om den inte finns, validerar distributionen, provisionerar och
visar icke-hemliga utdata. Ingen `jq`, datainmatning, hemlighetshämtning eller
efter-distributions applikationssetup krävs eller utförs.

Skriptets standardvärden för kommandorad överskrider motsvarande värden i
parameterfilen. Redigera parameterfilen för inställningar som sekundära/tertiära
regioner; använd direkt CLI-distribution om du behöver godtyckliga parameteröverskridningar:

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

Provisionering kan ta 15–45 minuter eller längre, och kan misslyckas vid regionala kvoter eller
modell-livscykelbegränsningar. Försök inte om blindt: läs först felmeddelandet.

## Konfigurationsalternativ

| Parameter | Standard i mall | Betydelse |
|---|---|---|
| `projectName` | Obligatorisk (`retail` i parameterfil) | 3–10 små bokstäver/siffror |
| `location` | Resursgruppens plats | Primär region (`eastus2` i parameterfil) |
| `secondaryLocation` | `westus2` | Mini modellkonto-region |
| `tertiaryLocation` | `francecentral` | Embeddings kontoregion |
| `graderLocation` | Primär region | Oberoende grader kontoregion |
| `environmentName` | `dev` | `dev`, `staging`, eller `prod`; endast namn, inte en hårdningsväljare |
| `deploymentMode` | `standard` | SKU-/kapacitetsval |
| `enableMultiRegion` | `true` | Lägg till sekundära och embeddings-konton |
| `enableMonitoring` | `true` | Lägg till Insights/workspace och miljölogginspektion |
| `enableSecurity` | `true` | Skapa endast ett tomt RBAC-aktiverat valv |

Den vilseledande `openAiApiVersion` parametern togs bort: en data-plane API-version
styr inte ARM-resursversioner eller modellversioner. Modellnamn/versionpar
finns i `variables.modelDeployments`; kontrollera dem tillsammans med distributions-SKU.

## Verifiera provisionering

Använd distributionsnamnet från skriptets utdata eller `az deployment group list`.
För direkt distribution ovan:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Förväntat: distributionsstatus `Succeeded`. Vid misslyckande, inspektera fel i operationen
detaljer. Resurslistas utdata ensam är inte en tillförlitlig provisioneringsstatuskontroll.

Testa platshållaren **root**, inte en icke-existerande agent-endpoint:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Förväntat: HTTP 200 hello-world-sida, **inte ett chatt-svar**. Ett HTTP-fel
räknas inte som en lyckad verifiering.

För att testa verklig primär modellinferens (debiterbar):

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

Förväntat: JSON med `choices` och `usage`. Distributionsnamnet är
`gpt-4.1-chat`, inte det underliggande modellnamnet `gpt-4.1`.

## 🔧 Efter distributionen: Nästa steg

Detta är en **utvecklingsbacklogg**, inte en färdig övning:

1. Implementera autentiserade kund-/inventarieagenter och routerkontraktet.
2. Implementera frontenden och validera dess konfiguration.
3. Skapa och fyll en sökindex med en dimension/profil som matchar din
   embeddingmodell, och hantera dokumentfel och uppdateringar.
4. Skapa ett register och konfigurera image-pull identitet/behörigheter.
5. Bygg och pusha riktiga bilder. Ändra Container App ingress-portar och probningar för att
   passa de bilderna innan test; port 80 här tillhör platshållarna.
6. Konfigurera hemligheter eller hanterade identiteter och scoped data-plane roller. Referera inte
   till imaginära hemlighetsnamn: denna mall skapar inga applikationshemligheter.
7. Instrumentera applikationer, konfigurera larm, testa fel/återhämtning och utvärdera
   resultat med representativ sanning och manuell granskning.

Se [arkitekturplan](../retail-scenario.md) för designramar.

## Felsökning och säkerhetsgränser

- **Modell otillgänglig:** verifiera modell/version/SKU, region och abonnemangskvot;
  skriptet förhandskontrollerar inte modellkataloger.
- **Övervakning avstängd:** miljöloggens destination är `none`, inte en
  ogiltig tom Log Analytics-konfiguration.
- **Endast platshållare:** `/chat`, agentutvärdering och filinmatning finns inte.
- **Nätverk/identitet:** offentliga endpoints och lokal autentisering är aktiverade.
  Att bara aktivera Key Vault RBAC skapar inte rolltilldelningar eller identiteter.
- **Produktion:** lägg till autentisering, scoped identiteter, hantering av hemligheter,
  privat nätverk där det är lämpligt, tillgänglighetsdesign och operativa tester.
  Multi-region modellkonton ensam ger inte failover.

## Rensning

Det finns inget AZD-projekt här; `azd down` är inte städuppdraget.
Efter att ha verifierat att gruppen endast innehåller dina lärresurser:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Förväntat efter att borttagningen är klar: `false`. Key Vault och Cognitive Services
mjuk-borttagna resurser kan behålla namn; tömning kräver lämpliga behörigheter.
Kontrollera Kostnadshantering för fördröjda användningsavgifter.

[Rapportera ett problem](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->