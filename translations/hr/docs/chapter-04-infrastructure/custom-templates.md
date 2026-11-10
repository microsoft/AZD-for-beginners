# Izrada vlastitog azd predloška

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 4 - Infrastruktura kao kod i implementacija
- **⬅️ Prethodno**: [Vodič za implementaciju](deployment-guide.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 5: Višekorisnički agenti](../chapter-05-multi-agent/README.md)

> Pregledano u skladu s `azd 1.37.2` (studeni 2026). Ovo je **vodič kroz izradu s djelomičnim datotekama**, ne potpuni predložak: morate dostaviti aplikacijski kod i `modules/web.bicep` sa svojim okruženjem, registracijom, Container App i izlazima prije implementacije. U ovom pregledu nije izvršena Azure-provizija.

## Uvod

Do sada ste *koristili* predloške s `azd init --template <name>`. Ali kad imate raspored projekta koji vaš tim voli — recimo, Container App s Cosmos DB i pravim nadzorom — poželjet ćete ga pretvoriti u vlastiti predložak za ponovnu upotrebu. Predložak je samo Git repozitorij s predvidivom strukturom koju azd zna čitati. Ova lekcija vam pokazuje kako izgraditi jedan od nule, testirati ga i (po želji) objaviti u galeriji zajednice.

## Ciljevi učenja

Do kraja ove lekcije, moći ćete:
- Shvatiti što čini mapu "azd predloškom"
- Poznavati potrebne datoteke i raspored mapa
- Dodati `azure.yaml` i `infra/` koje mogu koristiti i drugi
- Testirati svoj predložak lokalno prije dijeljenja
- Objaviti ga i (po želji) poslati u Awesome AZD

## Ishodi učenja

Nakon završetka ove lekcije, moći ćete:
- Kreirati novi predložak repozitorija
- Parametrizirati infrastrukturu da radi u bilo kojoj pretplati
- Validirati predložak s `azd init` i `azd up`
- Dodati metapodatke koje zahtijeva galerija zajednice

---

## Što je zapravo predložak?

Azd predložak je **Git repozitorij** koji sadrži, minimalno:

| Datoteka / mapa | Svrha | Obavezno? |
|---------------|---------|-----------|
| `azure.yaml` | Opisuje usluge, domaćine i pružatelja infrastrukture | ✅ Da |
| `infra/` | Definicije provisioning-a u Bicep ili Terraformu | Potrebno za ovaj primjer eksplicitnog IaC-a; projekti generirane infrastrukture mogu ga izostaviti |
| `src/` (ili vaš kod) | Aplikacijski kod koji azd implementira | Potrebno za usluge temeljene na izvornom kodu; ne sadrže svi predlošci aplikacijski kod |
| `README.md` | Kako koristiti predložak | ✅ Snažno preporučeno |
| `.azdo/` ili `.github/` | Definicije CI/CD pipelinea | Neobvezno |
| `.devcontainer/` | Reproducibilno razvojno okruženje | Neobvezno |
| `azure.yaml` `metadata` | Identitet/telemetrija predloška | Preporučeno; objava Git repozitorija ne zahtijeva to |

Nema tu magije: kad pokrenete `azd init --template you/your-repo`, azd klonira repozitorij i čita `azure.yaml`.

---

## Korak 1: Kreiranje repozitorija

Ručno kreirajte strukturu mapa ili započnite s minimalnim predloškom i uredite ga:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
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

## Korak 2: Pisanje `azure.yaml`

Ovo je srce predloška. Kaže azd-u što implementirati i kako:

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

> Polje `metadata.template` je ono što galerijska telemetrija koristi za brojanje korištenja. Koristite konvenciju `name@version`.

---

## Korak 3: Parametrizacija infrastrukture

Najvažnije pravilo za *predložak za višekratnu upotrebu*: **nikad ne hardkodirajte imena, regije ili vrijednosti specifične za pretplatu.** Koristite parametre i obrazac tokena resursa tako da isti predložak radi u svakoj pretplati.

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

Dvije stvari čine ovaj predložak prikladnim:

1. **`azd-env-name` oznaka** — azd je koristi za praćenje i čišćenje resursa po okruženju.
2. **`uniqueString(...)` token resursa** — proizvodi stabilni hash sufiks za smanjenje kolizija; nije jamstvo globalne jedinstvenosti.

Nedostajući `modules/web.bicep` mora prihvatiti `name`, `location` i `tags`, provisionirati Container Apps okruženje/registraciju i aplikaciju, označiti aplikaciju s `azd-service-name: web` i izvesti `uri`. Također mora izložiti vrijednosti registra potrebne odabranom tijeku izgradnje/implementacije (npr. `AZURE_CONTAINER_REGISTRY_ENDPOINT` iz korijenskog modula). Sam izlazna točka ne povezuje otkrivanje usluge, postavke aplikacije ili autentifikaciju registra.

Osigurajte odgovarajuću datoteku parametara koja čita vrijednosti koje azd automatski ubacuje iz okruženja:

Spremite sljedeće kao `infra/main.parameters.json`:

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

Azd automatski zamjenjuje `${AZURE_ENV_NAME}` i `${AZURE_LOCATION}` iz trenutnog okruženja.

---

## Korak 4: Testirajte svoj predložak lokalno

Prije dijeljenja, dokažite da predložak radi iz čistog stanja.

**Testirajte iz lokalne mape** (nije potrebna Git push operacija):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Zatim testirajte čišćenje** — dobar predložak potpuno očisti resurse:

```bash
azd down --force --purge
```

Ako `azd down` ostavi resurse, provjerite otkrivanje okruženja/grupe resursa, vanjske/dijeljene resurse, dozvole, zaključavanja i zaštitu od brisanja. `--purge` ne briše lokalno `.azure/` stanje.

> **Savjet:** nakon dodavanja svih nedostajućih datoteka, prvo pokrenite `azd provision --preview`. Pregledajte hooks prije pregleda jer mogu izvršavati naredbe sa sporednim efektima. Pregled nije procjena cijene niti jamstvo uspjeha provisioning-a.

---

## Korak 5: Objavite predložak

Gurnite repozitorij na GitHub (javni ako želite da drugi koriste):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Sada ga svi mogu koristiti:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Korak 6 (neobavezno): Predajte u Awesome AZD

Galerija [Awesome AZD](https://azure.github.io/awesome-azd/) navodi predloške iz zajednice. Da bi vaš repozitorij bio naveden, treba uključivati:

- ✅ Jasnu `README.md` sa preduvjetima, dijagramom arhitekture i bilješkama o troškovima
- ✅ Radni `azure.yaml` s `metadata.template`
- ✅ Infrastrukturu koja se čisto postavlja u novom pretplatničkom računu
- ✅ `LICENSE` datoteku
- ✅ (Preporučeno) `.devcontainer/` za jedno-klik Codespaces

Pošaljite predložak otvaranjem pull zahtjeva koji dodaje vaš predložak u datoteku podataka galerije, slijedeći vodič za doprinos u repozitoriju [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Česte Zamke

| Zamka | Popravak |
|---------|-----|
| Tvrdokodirana imena resursa | Koristite `uniqueString()` token resursa |
| `azd down` ostavlja resurse | Oznaka za svaki resurs (ili grupu resursa) s `azd-env-name` |
| Predložak radi za vas, ne radi za druge | Uklonite ID-eve pretplate, ID-eve zakupca i pretpostavke o regiji |
| Izlazi nisu povezani s aplikacijom | Uskladite `azd-service-name`/`resourceName` za implementaciju i eksplicitno povežite izlaze s postavkama aplikacije |
| Predaja u galeriju odbijena | Dodajte `README.md`, `LICENSE` i `metadata.template` |

---

## Sažetak

- Predložak je samo Git repozitorij s `azure.yaml`, `infra/` i vašim kodom.
- Parametrizirajte sve—imena, regije i ID-eve—tako da radi bilo gdje.
- Uvijek označavajte resurse s `azd-env-name` tako da `azd down` radi.
- Testirajte lokalno s `azd init --template <local-path>` prije objave.
- Dodajte metapodatke i README za predaju u Awesome AZD.

---

## 🔗 Navigacija

| Smjer | Resurs |
|-----------|----------|
| **Prethodno** | [Vodič za implementaciju](deployment-guide.md) |
| **Početna poglavlja** | [Poglavlje 4: Infrastruktura kao kod](README.md) |
| **Sljedeće poglavlje** | [Poglavlje 5: Višestruka rješenja agenata](../chapter-05-multi-agent/README.md) |

## 📖 Povezani resursi

- [Provisioning Resources](provisioning.md)
- [Awesome AZD galerija](https://azure.github.io/awesome-azd/)
- [Službena azd dokumentacija predložaka](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->