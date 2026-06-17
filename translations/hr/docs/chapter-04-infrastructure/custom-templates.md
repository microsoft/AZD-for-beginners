# Izrada vlastitog azd predloška

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 4 - Infrastruktura kao kod i implementacija
- **⬅️ Prethodno**: [Vodič za implementaciju](deployment-guide.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 5: Više-agentna rješenja](../chapter-05-multi-agent/README.md)

> Potvrđeno s `azd 1.25.6` u lipnju 2026.

## Uvod

Do sada ste *koristili* predloške s `azd init --template <name>`. Ali kad imate raspored projekta koji se vašem timu sviđa — primjerice Container App s Cosmos DB i odgovarajućim nadzorom — htjet ćete ga pretvoriti u vlastiti predložak za ponovnu upotrebu. Predložak je samo Git repozitorij s predvidljivom strukturom koju azd zna pročitati. Ova lekcija pokazuje kako izgraditi jedan od nule, testirati ga i (po želji) objaviti u galeriji zajednice.

## Ciljevi učenja

Na kraju ove lekcije, moći ćete:
- Razumjeti što mapu čini "azd predloškom"
- Poznavati potrebne datoteke i strukturu mapa
- Dodati `azure.yaml` i `infra/` koje drugi mogu ponovno koristiti
- Testirati svoj predložak lokalno prije dijeljenja
- Objaviti ga i (opcionalno) poslati u Awesome AZD

## Ishodi učenja

Nakon dovršetka ove lekcije, moći ćete:
- Kreirati novi repozitorij predloška
- Parametrizirati infrastrukturu tako da radi u bilo kojoj pretplati
- Validirati predložak s `azd init` i `azd up`
- Dodati metapodatke koje zahtijeva galerija zajednice

---

## Što je predložak, zapravo?

azd predložak je **Git repozitorij** koji sadrži, minimalno:

| Datoteka / mapa | Svrha | Obavezno? |
|---------------|---------|-----------|
| `azure.yaml` | Opisuje servise, hostove i pružatelja infrastrukture | ✅ Da |
| `infra/` | Bicep, Terraform ili Pulumi koji stvara resurse | ✅ Da |
| `src/` (or your code) | Aplikacijski kod koji azd raspoređuje | ✅ Da |
| `README.md` | Kako koristiti predložak | ✅ Snažno preporučeno |
| `.azdo/` or `.github/` | Definicije CI/CD pipelinea | Opcionalno |
| `.devcontainer/` | Reproducibilno razvojno okruženje | Opcionalno |
| `azure.yaml` `metadata` | Informacije za galeriju i telemetriju | Opcionalno (potrebno za objavu) |

Nema tu magije: kada pokrenete `azd init --template you/your-repo`, azd klonira repozitorij i čita `azure.yaml`.

---

## Korak 1: Postavite repozitorij

Stvorite strukturu mapa ručno ili krenite od minimalnog predloška i uredite ga:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Stvori standardni izgled
mkdir -p src infra
```

Tipičan završni raspored izgleda ovako:

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

## Korak 2: Napišite `azure.yaml`

Ovo je srž predloška. Govori azd-u što rasporediti i kako:

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

> Polje `metadata.template` je ono što galerijska telemetrija koristi za brojanje uporabe. Koristite konvenciju `name@version`.

---

## Korak 3: Parametrizirajte infrastrukturu

Jedno najvažnije pravilo za *predložak koji se može ponovno koristiti*: **nikad nemojte hardkodirati nazive, regije ili vrijednosti specifične za pretplatu.** Koristite parametre i obrazac resource tokena kako bi isti predložak radio u bilo kojoj pretplati.

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

Dvije stvari čine ovaj predložak pogodnim za ponovno korištenje:

1. **`azd-env-name` tag** — azd ga koristi za praćenje i čišćenje resursa po okruženju.
2. **`uniqueString(...)` resource token** — proizvodi stabilni, globalno jedinstven sufiks tako da se nazivi ne sudaraju.

Osigurajte odgovarajuću datoteku parametara koja čita vrijednosti koje azd injektira iz okruženja:

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

azd automatski zamjenjuje `${AZURE_ENV_NAME}` i `${AZURE_LOCATION}` iz trenutnog okruženja.

---

## Korak 4: Testirajte svoj predložak lokalno

Prije dijeljenja, dokažite da predložak radi iz čistog stanja.

**Testirajte iz lokalne mape** (push na Git nije potreban):

```bash
# Iz praznog direktorija inicijalizirajte koristeći lokalnu putanju predloška
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Priprema resursa i raspoređivanje od početka do kraja
azd auth login
azd up
```

**Zatim testirajte uklanjanje**—dobar predložak se potpuno očisti:

```bash
azd down --force --purge
```

Ako `azd down` ostavlja resurse, vjerojatno ste zaboravili oznaku `azd-env-name` na resursu.

> **Savjet:** prvo pokrenite `azd provision --preview`. Izvrši what-if i prikaže pogreške u predlošku prije stvaranja bilo kojeg resursa.

---

## Korak 5: Objavite predložak

Objavite repozitorij na GitHub (javni ako želite da ga drugi koriste):

```bash
gh repo create my-azd-template --public --source=. --push
```

Sada ga svatko može koristiti:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Korak 6 (Opcionalno): Pošaljite u Awesome AZD

Galerija [Awesome AZD](https://azure.github.io/awesome-azd/) navodi predloške zajednice. Da biste bili navedeni, vaš repozitorij treba uključivati:

- ✅ Jasan `README.md` s preduvjetima, dijagramom arhitekture i napomenama o troškovima
- ✅ Ispravan `azure.yaml` s `metadata.template`
- ✅ Infrastrukturu koja se uredno postavlja u novoj pretplati
- ✅ Datoteku `LICENSE`
- ✅ (Preporučeno) `.devcontainer/` za Codespaces jednim klikom

Pošaljite tako da otvorite pull request koji dodaje vaš predložak u datoteku s podacima galerije, slijedeći vodič za doprinos u repozitoriju [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Uobičajene zamke

| Zamka | Rješenje |
|---------|-----|
| Nazivi resursa zadani u kodu | Koristite `uniqueString()` resource token |
| `azd down` ostavlja resurse | Označite svaki resurs (ili grupu resursa) s `azd-env-name` |
| Predložak radi kod vas, ne radi kod drugih | Uklonite ID-e pretplate, ID-e tenanta i pretpostavke o regiji |
| Izlazi nisu povezani s aplikacijom | Exportajte `SERVICE_<NAME>_ENDPOINT_URL` i druge `AZURE_*` izlaze |
| Slanje u galeriju odbijeno | Dodajte `README.md`, `LICENSE`, i `metadata.template` |

---

## Sažetak

- Predložak je samo Git repozitorij s `azure.yaml`, `infra/`, i vašim kodom.
- Parametrizirajte sve—nazive, regije, i ID-e—tako da radi bilo gdje.
- Uvijek označite resurse s `azd-env-name` kako bi `azd down` radio.
- Testirajte lokalno s `azd init --template <local-path>` prije objave.
- Dodajte metapodatke i README za slanje u Awesome AZD.

---

## 🔗 Navigacija

| Smjer | Resurs |
|-----------|----------|
| **Prethodno** | [Vodič za implementaciju](deployment-guide.md) |
| **Početak poglavlja** | [Poglavlje 4: Infrastruktura kao kod](README.md) |
| **Sljedeće poglavlje** | [Poglavlje 5: Više-agentna rješenja](../chapter-05-multi-agent/README.md) |

## 📖 Povezani resursi

- [Provisioning resursa](provisioning.md)
- [Galerija Awesome AZD](https://azure.github.io/awesome-azd/)
- [Službena dokumentacija azd predložaka](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->