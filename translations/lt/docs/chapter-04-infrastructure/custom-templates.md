# Kurkite savo azd šabloną

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 4 skyrius – Infrastruktūra kaip kodas ir diegimas
- **⬅️ Ankstesnis**: [Diegimo vadovas](deployment-guide.md)
- **🚀 Kitas skyrius**: [5 skyrius: Daugelio agentų sprendimai](../chapter-05-multi-agent/README.md)

> Peržiūrėta pagal `azd 1.37.2` (2026 m. lapkričio mėn.). Tai yra **kūrybos vadovas su daliniais failais**, o ne pilnas šablonas: prieš diegimą turite pateikti programos kodą ir `modules/web.bicep` su jos aplinka, registru, konteinerių programa ir išvestimis. Azure teikimas nebuvo vykdomas peržiūros metu.

## Įvadas

Iki šiol jūs *naudojotės* šablonais su `azd init --template <name>`. Bet kai turėsite projekto struktūrą, kuri jūsų komandai patinka – tarkime, konteinerių programą su Cosmos DB ir tinkama stebėsena – norėsite ją paversti pakartotinai naudojamu savo šablonu. Šablonas yra tiesiog Git saugykla su nuspėjama struktūra, kurią azd žino kaip skaityti. Ši pamoka parodo, kaip sukurti tokį šabloną nuo nulio, išbandyti jį ir (pasirinktinai) paskelbti bendruomenės galerijoje.

## Mokymosi tikslai

Užbaigus šią pamoką, jūs:
- Suprasite, kas daro aplanką "azd šablonu"
- Žinosite reikiamus failus ir aplanko išdėstymą
- Pridėsite `azure.yaml` ir `infra/`, kuriuos kiti galės pakartotinai naudoti
- Išbandysite savo šabloną vietoje prieš dalijantis
- Paskelbsite jį ir (pasirinktinai) pateiksite Awesome AZD

## Mokymosi rezultatai

Baigę šią pamoką, galėsite:
- Sukurti naują šablono saugyklą
- Parametrizuoti infrastruktūrą taip, kad veiktų bet kurioje prenumeratoje
- Patikrinti šabloną naudojant `azd init` ir `azd up`
- Pridėti metaduomenis, kurių reikalauja bendruomenės galerija

---

## Kas iš tikrųjų yra šablonas?

Azd šablonas yra **Git saugykla**, kuri turi bent jau:

| Failas / aplankas | Paskirtis | Privaloma? |
|---------------|---------|-----------|
| `azure.yaml` | Aprašo paslaugas, talpyklas ir infrastruktūros tiekėją | ✅ Taip |
| `infra/` | Bicep arba Terraform tiekimo aprašymai | Privalomas šiam tiesioginiam IaC pavyzdžiui; projektuose su generuojama infrastruktūra gali būti praleistas |
| `src/` (arba jūsų kodas) | Programos kodas, kurį diegia azd | Privalomas kodą turinčioms paslaugoms; ne visi šablonai turi programos kodą |
| `README.md` | Kaip naudoti šabloną | ✅ Labai rekomenduojama |
| `.azdo/` arba `.github/` | CI/CD darbo pipeline aprašymai | Pasirinktinai |
| `.devcontainer/` | Atkartojama kūrėjo aplinka | Pasirinktinai |
| `azure.yaml` `metadata` | Šablono identifikacija / telemetrijos informacija | Rekomenduojama; paskelbus Git saugyklą nebūtina |

Čia nėra jokios magijos: kai paleidžiate `azd init --template you/your-repo`, azd nukopijuoja repozitoriją ir skaito `azure.yaml`.

---

## 1 žingsnis: Sukurkite saugyklą

Sukurkite aplankų struktūrą rankiniu būdu arba pradėkite nuo minimalaus šablono ir redaguokite jį:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Tipinė užbaigta struktūra atrodo taip:

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

## 2 žingsnis: Parašykite `azure.yaml`

Čia yra šablono širdis. Jis pasakoja azd, ką ir kaip diegti:

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

> `metadata.template` laukas yra tas, kurį galerijos telemetrija naudoja naudojimui skaičiuoti. Naudokite `name@version` konvenciją.

---

## 3 žingsnis: Parametrizuokite infrastruktūrą

Svarbiausia taisyklė *pakartotinai naudojamam* šablonui: **niekada nekoduokite vardų, regionų ar prenumeratai būdingų reikšmių tiesiogiai.** Naudokite parametrus ir išteklių ženklo modelį, kad tas pats šablonas veiktų bet kurioje prenumeratoje.

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

Du dalykai daro šį šabloną draugišką:

1. **`azd-env-name` žyma** — azd naudoja ją stebėti ir pašalinti išteklius pagal aplinką.
2. **`uniqueString(...)` išteklių ženklas** — generuoja stabilų hešo priesagą, mažinančią konfliktų tikimybę; tai nėra globalaus unikalumo garantija.

Trūkstamas `modules/web.bicep` turi priimti `name`, `location`, ir `tags`, sukurti Container Apps aplinką/registrą ir programą, pažymėti programą `azd-service-name: web`, ir eksportuoti `uri`. Jis taip pat turi pateikti registruotą informaciją, reikalingą pasirinktame kūrimo/diegimo sraute (pvz., `AZURE_CONTAINER_REGISTRY_ENDPOINT` iš pagrindinio modulio). Vien išvestis apie galinį tašką neužtikrina paslaugos atradimo, programos nustatymų ar registracijos autentifikacijos.

Pateikite atitinkamą parametrų failą, kuris paima reikšmes, kurias azd įterpia iš aplinkos:

Išsaugokite šį failą kaip `infra/main.parameters.json`:

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

Azd automatiškai pakeičia `${AZURE_ENV_NAME}` ir `${AZURE_LOCATION}` pagal dabartinę aplinką.

---

## 4 žingsnis: Išbandykite šabloną vietoje

Prieš dalijantis įrodykite, kad šablonas veikia nuo švarios būsenos.

**Išbandykite vietiniame aplanke** (Git push nereikalingas):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Tada išbandykite pašalinimą** – geras šablonas visiškai išvalo:

```bash
azd down --force --purge
```

Jei `azd down` palieka išteklius, patikrinkite aplinkos/išteklių grupės nustatymus, išorinius/bendrinamus išteklius, leidimus, užraktus ir apsaugą nuo išvalymo. `--purge` neištrina vietinės `.azure/` būsenos.

> **Patarimas:** pateikę visus trūkstamus failus, pirmiausia paleiskite `azd provision --preview`. Patikrinkite kablius prieš peržiūrą, nes jie gali vykdyti šalutinius efektus sukeliančias komandas. Peržiūra nėra kainos įvertinimas ar garantija, kad tiekimas pavyks.

---

## 5 žingsnis: Paskelbkite šabloną

Nusiųskite saugyklą į GitHub (viešą, jei norite, kad kiti ją naudotų):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Dabar ją gali naudoti bet kas:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## 6 žingsnis (pasirinktinai): Pateikite į Awesome AZD

Galerija [Awesome AZD](https://azure.github.io/awesome-azd/) pateikia bendruomenės šablonus. Kad jūsų saugykla būtų įtraukta į sąrašą, ji turėtų turėti:

- ✅ Aiškus `README.md` su išankstiniais reikalavimais, architektūros diagrama ir sąnaudų pastabomis
- ✅ Veikiantis `azure.yaml` su `metadata.template`
- ✅ Infrastruktūra, kuri švariai įdiegiama naujame prenumeratos abonemente
- ✅ `LICENSE` failas
- ✅ (Rekomenduojama) `.devcontainer/` vieno paspaudimo Codespaces

Pateikite atidarydami pull request'ą, kuris prideda jūsų šabloną prie galerijos duomenų failo, vadovaudamiesi indėlio vadovu [Awesome AZD saugykloje](https://github.com/Azure/awesome-azd).

---

## Dažnos klaidos

| Spąstai | Sprendimas |
|---------|-----|
| Iš anksto įrašyti resursų pavadinimai | Naudokite `uniqueString()` resurso žetoną |
| `azd down` palieka resursus | Pažymėkite kiekvieną resursą (arba resursų grupę) su `azd-env-name` |
| Šablonas veikia jums, bet nepavyksta kitiems | Pašalinkite prenumeratos ID, nuomininko ID ir regiono prielaidas |
| Išvestys neprijungtos prie programos | Suderinkite `azd-service-name`/`resourceName` diegimui ir aiškiai susiekite išvestis su programos nustatymais |
| Galerijos pateikimas atmestas | Pridėkite `README.md`, `LICENSE` ir `metadata.template` |

---

## Santrauka

- Šablonas yra tiesiog Git saugykla su `azure.yaml`, `infra/` ir jūsų kodu.
- Parametrizuokite viską — pavadinimus, regionus ir ID — kad veiktų bet kur.
- Visada pažymėkite išteklius su `azd-env-name`, kad veiktų `azd down`.
- Išbandykite vietoje su `azd init --template <local-path>` prieš publikuodami.
- Pridėkite metaduomenis ir README, kad pateiktumėte į Awesome AZD.

---

## 🔗 Navigacija

| Kryptis | Ištekliai |
|-----------|----------|
| **Ankstesnis** | [Diegimo vadovas](deployment-guide.md) |
| **Skyriaus pradžia** | [4 skyrius: Infrastruktūra kaip kodas](README.md) |
| **Kitas skyrius** | [5 skyrius: Daugiagentės sprendimai](../chapter-05-multi-agent/README.md) |

## 📖 Susiję ištekliai

- [Ištekliai planavimui](provisioning.md)
- [Awesome AZD galerija](https://azure.github.io/awesome-azd/)
- [Oficiali azd šablonų dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->