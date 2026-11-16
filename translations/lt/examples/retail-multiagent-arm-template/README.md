# Mažmeninės prekybos daugiaveiksmio agento infrastruktūros pagrindas

**Išplėstinis architektūros pavyzdys — tai neveikianti daugiaveiksmio agento programa.**

[Kurso pradžia](../../README.md) ·
[5 skyrius](../../docs/chapter-05-multi-agent/README.md) ·
[Architektūros šablonas](../retail-scenario.md)

## Kas čia diegiama

Šiame kataloge yra ARM šablonas, parametrai ir Bash diegimo scenarijus.
Nėra **`azure.yaml` ar mažmeninės prekybos programos šaltinio**.

| Išteklius | Faktinė būsena po diegimo |
|---|---|
| Pagrindinė Azure OpenAI paskyra | `gpt-4.1-chat` diegimas naudojant `gpt-4.1` versiją `2025-04-14`, `GlobalStandard` |
| Antrinė OpenAI paskyra (pasirinktinai) | `gpt-4.1-mini-inventory`, modelis `gpt-4.1-mini` versija `2025-04-14`, `GlobalStandard` |
| Įterpimų paskyra (pasirinktinai) | `text-embedding-ada-002` versija `2`, `Standard`; nėra indeksavimo kanalo |
| Vertinimo OpenAI paskyra | `gpt-4.1-grader`, modelis `gpt-4.1` versija `2025-04-14`, `GlobalStandard`; nėra vertintuvo |
| AI Paieška | Tuščia paslauga; nėra indekso ar dokumentų |
| Saugykla | Tušti `documents` ir `uploads` blob konteineriai |
| Cosmos DB | Serverless paskyra, `chathistory` duomenų bazė, `conversations` konteineris, padalintas pagal `/userId`, 30 dienų daikto TTL |
| Kontenerių programos | Maršrutizatorius ir priekinė sąsaja abu veikia `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` 80 prievade |
| Rakto saugykla (pasirinktinai) | Tuščia RBAC įjungta saugykla; **nėra slaptųjų raktų ar vaidmenų priskyrimų** |
| Application Insights / Log Analytics (pasirinktinai) | Ištekliai ir aplinkos žurnalų rinkimas; nėra tinkintos programos instrumentacijos, įspėjimų ar ataskaitų |
| Dokumentų intelektas | S0 paskyra; nėra dokumentų apdorojimo darbo eigos |

Senoji Bing Search v7 buvo nutraukta 2025 metų rugpjūčio 11 d. ir **nėra diegiama**.
Nėra įgyvendinta jokia pakeičianti žiniatinklio integracija.

**Neįtraukta:** klientų/inventoriaus agentai, maršrutizatoriaus `/chat` API, priekinės sąsajos pokalbių UI,
paieškos schema ar suvartojimo scenarijai, Azure Container Registry, privačios prieigos taškai,
valdomos tapatybės, RBAC priskyrimai, automatinis perkrovimas, Front Door, raudonosios komandos
skeneris, vertinimo CLI, autentifikacija ar CI/CD.

ARM sėkmės pranešimas tik patvirtina išteklių diegimą. Tai negarantuoja
programos funkcionalumo, saugumo, prieinamumo ar gamybinio paruošimo.

## Išankstiniai reikalavimai ir išlaidos

- Bash (Git Bash/WSL Windows) ir
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Prenumerata su teisėmis kurti visus išvardytus išteklius.
- Patikrinkite **kiekvieno modelio/versijos/SKU kiekvienoje pasirinktame regione** prieinamumą ir
  prenumeratos kvotas. Numatytoji reikšmė yra pavyzdys, ne garantija.
  Pasitarkite su [modelių prieinamumu](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Pasirinkite specialią išteklių grupę, kurią po bandymų galėsite ištrinti.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Numatyti regionai: pagrindinis `eastus2`, antrinis `westus2`, įterpimų `francecentral`;
vertintuvas numatytasis yra pagrindiniame regione, nebent pateikiama `graderLocation`.
`--no-multi-region` praleidžia antrinę ir įterpimų paskyras; ne praleidžia
vertinimo paskyros.

Paieška yra apmokestinama, kol vykdoma, net jei tuščia. Minimalūs konteinerių kopijų skaičiai,
saugojimo atsarginės kopijos, Cosmos DB užklausos/saugojimas, modelio žetonai, Dokumentų intelekto
kvietimai ir žurnalų vartojimas/saugojimas gali padidinti sąnaudas. Nėra **fiksuoto ar patvirtinto
mėnesinio bendrojo mokesčio**. Įvertinkite tikslius SKU
[Azure kainoraštyje](https://azure.microsoft.com/pricing/calculator/) ir
nustatykite biudžetą prieš diegdami.

### Diegimo režimai

Šie nustatymai yra išteklių dydžiai, **ne gamybos ar SLA patvirtinimai**:

| Režimas | Pokalbio / mini / įterpimų / vertintuvo pajėgumų vienetai | Maršrutizatoriaus kopijos | Priekinės sąsajos kopijos | Paieškos lygis | Saugykla |
|---|---|---|---|---|---|
| minimalus | 10 / 10 / 20 / 5 | 0–3 | 1–2 | pagrindinis, 1 kopija | Standard_LRS |
| standartinis | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standartinis, 1 kopija | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standartinis2, 2 kopijos | Standard_GRS |

Modelio pajėgumų vienetai yra pagal modelį/SKU; nesumųskite jų kaip universalaus TPM
garantijos. Premium režimas neprisijungia prie zonos atsarginių kopijų konteinerių programoms; tam reikia
papildomo tinklo dizaino. Pagrindinė Paieška palaiko vektorinę paiešką, priklausomai nuo
paslaugos apribojimų; ji nėra savaime nesuderinama su vektoriais.

## 🚀 Greitas diegimas

Pirmiausia peržiūrėkite `azuredeploy.json` ir `azuredeploy.parameters.json`. Toliau pateikti komandų
pavyzdžiai **sukuria apmokestinamus Azure išteklius**; tai nėra offline patikrinimai.

Iš saugyklos šaknies:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Scenarijus naudoja savo katalogo santykinius kelius, patikrina prisijungimus/įrankius/argumentus,
sukuria išteklių grupę, jei jos nėra, patikrina diegimą, įdiegia ir
rodo neskelbtinus rezultatus. Nepasiruošiama ar neatliekama jokio `jq`, duomenų užpildymo,
slaptųjų raktų paieškos ar po-diegimo programos nustatymo.

Scenarijaus numatytos komandinės eilutės reikšmės viršija atitinkamas reikšmes
parametrų faile. Redaguokite parametrų failą, kad nustatytumėte, pvz., antrines/trečiąsias
zonas; jei reikia bet kokių parametrų perrašymų, naudokite tiesioginį CLI diegimą:

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

Diegimas gali užtrukti 15–45 minutes ar ilgiau ir gali nepavykti dėl regioninių kvotų ar
modelio gyvenimo ciklo apribojimų. Nesinaudokite įsimintinai: pirmiausia perskaitykite nepavykusią operaciją.

## Konfigūracijos parinktys

| Parametras | Numatytoji šablone | Reikšmė |
|---|---|---|
| `projectName` | Privaloma (`retail` parametrų faile) | 3–10 mažųjų raidžių/skaitmenų |
| `location` | Išteklių grupės vieta | Pagrindinis regionas (`eastus2` parametrų faile) |
| `secondaryLocation` | `westus2` | Mini modelio paskyros regionas |
| `tertiaryLocation` | `francecentral` | Įterpimų paskyros regionas |
| `graderLocation` | Pagrindinis regionas | Nepriklausomo vertintojo paskyros regionas |
| `environmentName` | `dev` | `dev`, `staging` arba `prod`; tik vardas, ne standarto perjungiklis |
| `deploymentMode` | `standard` | SKU/pajėgumų pasirinkimas |
| `enableMultiRegion` | `true` | Pridėti antrines ir įterpimų paskyras |
| `enableMonitoring` | `true` | Pridėti Insights/darbo srities ir aplinkos žurnalų rinkimą |
| `enableSecurity` | `true` | Sukurti tik tuščią RBAC įjungtą saugyklą |

Klaidinantis `openAiApiVersion` parametras buvo pašalintas: duomenų srauto API versija
nekontroliuoja ARM išteklių versijų arba modelio versijų. Modelio pavadinimų/versijų poros
yra `variables.modelDeployments`; patikrinkite jas kartu su diegimo SKU.

## Patikrinkite parengtį

Naudokite diegimo pavadinimą iš skripto išvesties arba `az deployment group list`.
Tiesioginiam aukščiau nurodytam diegimui:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Tikėtina: diegimo būsena `Succeeded`. Nepavykus, patikrinkite operacijos klaidos
detales. Tik išteklių sąrašo išvestis nėra patikra dėl parengties būsena.

Išbandykite rezervinį **root**, o ne neegzistuojantį agento galinį tašką:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Tikėtina: HTTP 200 hello-world puslapis, **ne pokalbio atsakymas**. HTTP klaida
nelaikoma sėkmingu patvirtinimu.

Norėdami išbandyti tikrą pagrindinio modelio spėjimą (mokama):

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

Tikėtina: JSON su `choices` ir `usage`. Diegimo pavadinimas yra
`gpt-4.1-chat`, o ne pagrindinio modelio pavadinimas `gpt-4.1`.

## 🔧 Po diegimo: kiti žingsniai

Tai yra **plėtros darbų sąrašas**, o ne baigtas pratimas:

1. Įgyvendinkite autentifikuotus klientų/inventoriaus agentus ir maršrutizatoriaus sutartį.
2. Įgyvendinkite frontend'ą ir patikrinkite jo konfigūraciją.
3. Sukurkite ir užpildykite paieškos indeksą su matmenų/profilio, atitinkančio jūsų
   įterpimo modelį, ir apdorokite dokumentų klaidas bei atnaujinimus.
4. Sukurkite registrą ir sukonfigūruokite paveikslėlių traukimo tapatybę/leidimus.
5. Sukurkite ir išsiųskite tikrus paveikslėlius. Prieš bandymą pakeiskite konteinerio programos įėjimo prievadus ir patikras,
   kad jie atitiktų tuos paveikslėlius; čia prievadas 80 priklauso rezerviniams.
6. Konfigūruokite slaptus duomenis arba valdomas tapatybes ir apribotų duomenų ploto vaidmenis.
   Nenurodykite įsivaizduojamų slaptų vardų: šablonas nesukuria jokio programos slaptumo.
7. Instrumentuokite programas, sukonfigūruokite įspėjimus, išbandykite gedimus/atkūrimą ir įvertinkite
   rezultatus naudojant reprezentatyvią tikrąją informaciją ir žmonių apžvalgą.

Žr. [architektūros projektą](../retail-scenario.md), kad sužinotumėte projektavimo ribas.

## Trikčių šalinimas ir saugumo ribos

- **Modelis nepasiekiamas:** patikrinkite modelį/versiją/SKU, regioną ir prenumeratos kvotą;
  skriptas neatlieka modelių katalogų patikrinimo.
- **Stebėsena išjungta:** aplinkos žurnalų paskirties vieta yra `none`, ne neteisinga tuščia Log Analytics konfigūracija.

- **Tik rezerviniai:** `/chat`, agento vertinimas ir failų įkėlimas neegzistuoja.
- **Tinklas/tapatybė:** įjungti viešieji galiniai taškai ir vietinė autentifikacija.
  Tik Key Vault RBAC įjungimas nesukuria vaidmenų priskyrimų ar tapatybių.
- **Gamyba:** pridėkite autentifikaciją, apribotas tapatybes, slaptažodžių valdymą,
  privatų tinklą, kur reikia, prieinamumo projektavimą ir veikimo testus.
  Daugiaračių modelių paskyros pačios nepateikia atsarginio perkėlimo.

## Išvalymas

Čia nėra AZD projekto; `azd down` nėra išvalymo komanda.
Patikrinę, kad grupėje yra tik jūsų mokymosi ištekliai:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Tikėtina po ištrynimo pabaigos: `false`. Key Vault ir Cognitive Services
minkštai ištrinti ištekliai gali išlaikyti vardus; visam ištrinimui reikalingos tinkamos teisės.
Patikrinkite Kostų valdymą dėl vėluojančių naudojimo mokesčių.

[Pranešti apie problemą](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->