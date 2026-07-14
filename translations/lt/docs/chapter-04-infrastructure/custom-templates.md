# Kurkite Savo Paties azd Šabloną

**Skyriaus navigacija:**
- **📚 Kurso Pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 4 skyrius - Infrastruktūra kaip Kodas ir Diegimas
- **⬅️ Ankstesnis**: [Diegimo Vadovas](deployment-guide.md)
- **🚀 Kitas skyrius**: [5 skyrius: Daugiaagentės Sprendimai](../chapter-05-multi-agent/README.md)

> Patikrinta su `azd 1.27.1` 2026 metų liepą.

## Įvadas

Iki šiol jūs *naudojote* šablonus su `azd init --template <name>`. Bet kai turite projekto išdėstymą, kuris patinka jūsų komandai – pavyzdžiui, Container App su Cosmos DB ir tinkama stebėsena – norėsite jį paversti savo pakartotinai naudojamu šablonu. Šablonas yra tiesiog Git repozitorija su nuspėjama struktūra, kurią azd moka skaityti. Ši pamoka parodys, kaip sukurti tokį šabloną nuo nulio, išbandyti jį ir (pasirinktinai) paskelbti bendruomenės galerijoje.

## Mokymosi Tikslai

Pamokos pabaigoje jūs:
- Suprasite, kas daro aplanką „azd šablonu“
- Sužinosite reikalingus failus ir aplankų išdėstymą
- Pridėsite `azure.yaml` ir `infra/`, kuriuos kiti galės pakartotinai naudoti
- Išbandysite savo šabloną vietoje prieš dalinantis juo
- Paskelbsite jį ir (pasirinktinai) pateiksite Awesome AZD galerijai

## Mokymosi Rezultatai

Baigę šią pamoką galėsite:
- Sukurti naują šablono repozitoriją
- Parametrizuoti infrastruktūrą, kad ji veiktų bet kurioje prenumeratoje
- Patikrinti šabloną su `azd init` ir `azd up`
- Pridėti metaduomenis, kurių reikalauja bendruomenės galerija

---

## Kas Iš Tikrųjų Yra Šablonas?

azd šablonas yra **Git repozitorija**, kuri turi bent:

| Failas / aplankas | Paskirtis | Privalomas? |
|---------------|---------|-----------|
| `azure.yaml` | Apibūdina paslaugas, talpyklas ir infrastruktūros tiekėją | ✅ Taip |
| `infra/` | Bicep, Terraform arba Pulumi, kuris kuria resursus | ✅ Taip |
| `src/` (arba jūsų kodas) | Programos kodas, kurį azd diegia | ✅ Taip |
| `README.md` | Kaip naudoti šabloną | ✅ Rekomenduojama labai |
| `.azdo/` arba `.github/` | CI/CD konfigūracijos | Pasirinktinai |
| `.devcontainer/` | Pakartotinai atstatoma kūrimo aplinka | Pasirinktinai |
| `azure.yaml` `metadata` | Galerijos + telemetrijos informacija | Pasirinktinai (reikalinga paskelbimui) |

Čia nėra jokių stebuklų: kai paleidžiate `azd init --template you/your-repo`, azd klonuoją repozitoriją ir skaito `azure.yaml`.

---

## 1 Žingsnis: Sukurkite Repozitoriją

Sukurkite aplankų struktūrą rankiniu būdu arba pradėkite nuo minimalaus šablono ir redaguokite:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Sukurti standartinę išdėstymą
mkdir -p src infra
```

Įprastas galutinis išdėstymas atrodo taip:

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

## 2 Žingsnis: Parašykite `azure.yaml`

Tai šablono širdis. Jis nurodo azd, ką ir kaip diegti:

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

> `metadata.template` laukas yra naudojamas galerijos telemetrijoje vartojimo skaičiavimui. Naudokite „name@version“ konvenciją.

---

## 3 Žingsnis: Parametrizuokite Infrastruktūrą

Svarbiausia taisyklė kuriant *pakartotinai naudojamą* šabloną: **niekada nekoduokite vardų, regionų ar prenumeratos specifinių reikšmių tiesiogiai.** Naudokite parametrus ir resursų žetonų šabloną, kad tas pats šablonas veiktų bet kurios prenumeratos aplinkoje.

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

Dvi svarbios savybės daro šį šabloną patogų:

1. **`azd-env-name` žyma** — azd ją naudoja stebėti ir valyti resursus kiekvienai aplinkai.
2. **`uniqueString(...)` resursų žetonas** — generuoja stabilų, globaliai unikalų priesagą, kad vardai nesikirstų.

Pateikite atitinkamą parametrų failą, kuris skaito vertes, kuriuos azd įdiegia iš aplinkos:

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

azd automatiškai pakeičia `${AZURE_ENV_NAME}` ir `${AZURE_LOCATION}` iš esamos aplinkos.

---

## 4 Žingsnis: Išbandykite Šabloną Vietoje

Prieš dalijantis, įsitikinkite, kad šablonas veikia iš švarios būsenos.

**Išbandykite iš vietinio aplanko** (nereikia push į Git):

```bash
# Iš tuščio katalogo inicijuokite naudodami savo vietinį šablono kelią
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Paruoškite ir įdiekite nuo pradžios iki pabaigos
azd auth login
azd up
```

**Tada išbandykite pašalinimą** – geras šablonas viską visiškai sutvarko:

```bash
azd down --force --purge
```

Jei `azd down` palieka resursus, greičiausiai praleidote `azd-env-name` žymą ant resurso.

> **Patarimas:** pirmiausia paleiskite `azd provision --preview`. Jis atlieka „kas, jeigu“ analizę ir rodo šablono klaidas prieš kuriant bet kokius resursus.

---

## 5 Žingsnis: Paskelbkite Šabloną

Įkelkite repozitoriją į GitHub (viešą, jei norite, kad kiti galėtų naudoti):

```bash
gh repo create my-azd-template --public --source=. --push
```

Dabar bet kas gali jį naudoti:

```bash
azd init --template your-github-username/my-azd-template
```

---

## 6 Žingsnis (Pasirinktinai): Pateikite į Awesome AZD

[Awesome AZD galerija](https://azure.github.io/awesome-azd/) surenka bendruomenės šablonus. Norint būti įtrauktam, jūsų repozitorijuje turėtų būti:

- ✅ Aiškus `README.md` su išankstiniais reikalavimais, architektūros schema ir kaštų pastabomis
- ✅ Veikiantis `azure.yaml` su `metadata.template`
- ✅ Infrastruktūra, kuri tvarkingai kuriama švarioje prenumeratoje
- ✅ `LICENSE` failas
- ✅ (Rekomenduojama) `.devcontainer/` vieno paspaudimo Codespaces aplinkai

Pateikite, atidarydami pull request, kuris prideda jūsų šabloną į galerijos duomenų failą, vadovaujantis prisidėjimo instrukcija [Awesome AZD repozitorijoje](https://github.com/Azure/awesome-azd).

---

## Dažniausios Klaidos

| Klaida | Sprendimas |
|---------|-----|
| Kietai užkoduoti resursų pavadinimai | Naudokite `uniqueString()` resursų žetoną |
| `azd down` palieka resursus | Pažymėkite kiekvieną resursą (arba resursų grupę) `azd-env-name` žyma |
| Šablonas veikia jums, bet kitiems ne | Pašalinkite prenumeratos ID, nuomininko ID ir regiono prielaidų |
| Išvestys nėra susietos su programa | Eksportuokite `SERVICE_<NAME>_ENDPOINT_URL` ir kitas `AZURE_*` išvestis |
| Nenustatytas pateikimas galerijai | Pridėkite `README.md`, `LICENSE` ir `metadata.template` |

---

## Santrauka

- Šablonas yra tiesiog Git repozitorija su `azure.yaml`, `infra/` ir jūsų kodu.
- Parametrizuokite viską – vardus, regionus ir ID – kad veiktų bet kur.
- Visada žymėkite resursus `azd-env-name`, kad veiktų `azd down`.
- Išbandykite vietoje su `azd init --template <local-path>` prieš skelbdami.
- Pridėkite metaduomenis ir README, kad pateiktumėte į Awesome AZD.

---

## 🔗 Navigacija

| Kryptis | Ištekliai |
|-----------|----------|
| **Ankstesnis** | [Diegimo Vadovas](deployment-guide.md) |
| **Skyriaus pradžia** | [4 skyrius: Infrastruktūra kaip Kodas](README.md) |
| **Kitas skyrius** | [5 skyrius: Daugiaagentės Sprendimai](../chapter-05-multi-agent/README.md) |

## 📖 Susiję Ištekliai

- [Resursų įrengimas](provisioning.md)
- [Awesome AZD galerija](https://azure.github.io/awesome-azd/)
- [Oficiali azd šablonų dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->