# Sukurti savo azd šabloną

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Ankstesnis**: [Diegimo vadovas](deployment-guide.md)
- **🚀 Kitas skyrius**: [5 skyrius: Daugiaagentės sprendimai](../chapter-05-multi-agent/README.md)

> Patvirtinta naudojant `azd 1.25.6` 2026 m. birželio mėn.

## Įvadas

Iki šiol jūs *naudojote* šablonus su `azd init --template <name>`. Tačiau kai turėsite projekto išdėstymą, kuris patinka jūsų komandai—pavyzdžiui, Container App su Cosmos DB ir tinkamu stebėjimu—norėsite paversti jį pakartotinai naudojamu savo šablonu. Šablonas iš esmės yra Git saugykla su prognozuojama struktūra, kurią azd sugeba perskaityti. Ši pamoka parodys, kaip sukurti tokį šabloną nuo nulio, išbandyti jį ir (pasirinktinai) paskelbti bendruomenės galerijoje.

## Mokymosi tikslai

Baigę šią pamoką, jūs:
- Suprasite, kas paverčia aplanką „azd šablonu“
- Sužinosite, kokie yra reikalingi failai ir aplankų išdėstymas
- Pridėsite `azure.yaml` ir `infra/`, kuriuos kiti galės pakartotinai naudoti
- Išbandysite savo šabloną vietoje prieš dalindamiesi
- Paskelbsite jį ir (pasirinktinai) pateiksite į Awesome AZD

## Mokymosi rezultatai

Baigę šią pamoką, galėsite:
- Sukurti naują šablono saugyklą
- Parametrizuoti infrastruktūrą, kad ji veiktų bet kurioje prenumeracijoje
- Patikrinti šabloną su `azd init` ir `azd up`
- Pridėti metaduomenis, kurių reikalauja bendruomenės galerija

---

## Kas iš tikrųjų yra šablonas?

azd šablonas yra **Git saugykla**, kurioje mažiausiai yra:

| Failas / aplankas | Paskirtis | Reikia? |
|---------------|---------|-----------|
| `azure.yaml` | Aprašo paslaugas, talpinimo vietas ir infrastruktūros tiekėją | ✅ Taip |
| `infra/` | Bicep, Terraform arba Pulumi, kurie kuria išteklius | ✅ Taip |
| `src/` (ar jūsų kodas) | Programos kodas, kurį diegia azd | ✅ Taip |
| `README.md` | Kaip naudoti šabloną | ✅ Labai rekomenduojama |
| `.azdo/` arba `.github/` | CI/CD proceso apibrėžimai | Neprivaloma |
| `.devcontainer/` | Atkuriama kūrimo aplinka | Neprivaloma |
| `azure.yaml` `metadata` | Galerijos ir telemetrijos informacija | Neprivaloma (reikalinga publikavimui) |

Nėra nieko magiško: kai paleidžiate `azd init --template you/your-repo`, azd klonuoja saugyklą ir perskaito `azure.yaml`.

---

## 1 žingsnis: Sukurkite saugyklos struktūrą

Sukurkite aplankų struktūrą rankiniu būdu arba pradėkite nuo minimalaus šablono ir redaguokite jį:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Sukurti standartinį išdėstymą
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

Tai yra šablono širdis. Jame nurodoma azd, ką diegti ir kaip:

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

> Laukas `metadata.template` yra tas, kurį galerijos telemetrija naudoja naudojimui skaičiuoti. Naudokite konvenciją `name@version`.

---

## 3 žingsnis: Parametrizuokite infrastruktūrą

Svarbiausia taisyklė *pakartotinai naudojamam* šablonui: **niekada nekoduokite tiesiogiai pavadinimų, regionų ar prenumeracijai specifinių reikšmių.** Naudokite parametrus ir resursų žetono šabloną, kad tas pats šablonas veiktų bet kieno prenumeracijoje.

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

Dvi savybės daro šį šabloną draugišką:

1. **`azd-env-name` tag** — azd naudoja ją stebėti ir išvalyti išteklius pagal aplinką.
2. **`uniqueString(...)` resource token** — sukuria stabilų, globaliai unikalų priesagą, kad pavadinimai nekristų į konfliktą.

Pateikite atitinkamą parametrų failą, kuris skaito reikšmes, kurias azd įterpia iš aplinkos:

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

azd automatiškai pakeičia `${AZURE_ENV_NAME}` ir `${AZURE_LOCATION}` reikšmėmis iš dabartinės aplinkos.

---

## 4 žingsnis: Išbandykite savo šabloną lokaliai

Prieš dalindamiesi, įrodykite, kad šablonas veikia iš švarios būsenos.

**Išbandykite iš vietinio aplanko** (nereikia Git push):

```bash
# Iš tuščio katalogo inicializuokite naudodami savo vietinį šablono kelią
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Paruošimas ir diegimas nuo pradžios iki pabaigos
azd auth login
azd up
```

**Tada išbandykite išmontavimą**—geras šablonas visiškai išvalo išteklius:

```bash
azd down --force --purge
```

Jei `azd down` palieka išteklius, greičiausiai praleidote `azd-env-name` žymą ant ištekliaus.

> **Patarimas:** pirmiausia paleiskite `azd provision --preview`. Tai atlieka what-if analizę ir pateikia šablono klaidas prieš sukuriant bet kokius išteklius.

---

## 5 žingsnis: Paskelbkite šabloną

Įkelkite saugyklą į GitHub (vieša, jei norite, kad kiti ją naudotų):

```bash
gh repo create my-azd-template --public --source=. --push
```

Dabar bet kas gali jį naudoti:

```bash
azd init --template your-github-username/my-azd-template
```

---

## 6 žingsnis (pasirinktinai): Pateikite į Awesome AZD

Galerija [Awesome AZD galerija](https://azure.github.io/awesome-azd/) surašo bendruomenės šablonus. Kad būtumėte įtraukti, jūsų repozitorija turėtų įtraukti:

- ✅ Aiškus `README.md` su išankstiniais reikalavimais, architektūros diagrama ir pastabomis apie kaštus
- ✅ Veikiantis `azure.yaml` su `metadata.template`
- ✅ Infrastruktūra, kuri sklandžiai sukuria išteklius naujoje prenumeracijoje
- ✅ `LICENSE` failas
- ✅ (Rekomenduojama) `.devcontainer/` vieno paspaudimo Codespaces

Pateikite atidarydami pull request, kuris prideda jūsų šabloną prie galerijos duomenų failo, vadovaudamiesi indėlio gairėmis [Awesome AZD saugykloje](https://github.com/Azure/awesome-azd).

---

## Dažnos klaidos

| Problema | Sprendimas |
|---------|-----|
| Užkoduoti išteklių pavadinimai | Naudokite `uniqueString()` resursų žetoną |
| `azd down` palieka išteklius | Pažymėkite kiekvieną išteklį (arba išteklių grupę) su `azd-env-name` |
| Šablonas veikia jums, bet ne kitiems | Pašalinkite prenumeracijos ID, nuomininko ID ir regiono prielaidas |
| Išvestys nėra sujungtos su programa | Eksportuokite `SERVICE_<NAME>_ENDPOINT_URL` ir kitas `AZURE_*` išvestis |
| Galerijos pateikimas atmestas | Pridėkite `README.md`, `LICENSE` ir `metadata.template` |

---

## Santrauka

- Šablonas yra tiesiog Git repo su `azure.yaml`, `infra/` ir jūsų kodu.
- Parametrizuokite viską — pavadinimus, regionus ir ID — kad jis veiktų bet kur.
- Visada pažymėkite išteklius su `azd-env-name`, kad `azd down` veiktų.
- Išbandykite lokaliai su `azd init --template <local-path>` prieš paskelbiant.
- Pridėkite metaduomenis ir README, kad galėtumėte pateikti į Awesome AZD.

---

## 🔗 Navigacija

| Kryptis | Išteklius |
|-----------|----------|
| **Ankstesnis** | [Diegimo vadovas](deployment-guide.md) |
| **Skyriaus pradžia** | [4 skyrius: Infrastruktūra kaip kodas](README.md) |
| **Kitas skyrius** | [5 skyrius: Daugiaagentės sprendimai](../chapter-05-multi-agent/README.md) |

## 📖 Susiję ištekliai

- [Resursų aprovizionavimas](provisioning.md)
- [Awesome AZD galerija](https://azure.github.io/awesome-azd/)
- [Oficiali azd šablono dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->