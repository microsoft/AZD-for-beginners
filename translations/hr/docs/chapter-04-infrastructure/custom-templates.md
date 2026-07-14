# Izrada vlastitog azd predloška

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 4 - Infrastruktura kao kod i implementacija
- **⬅️ Prethodno**: [Vodič za implementaciju](deployment-guide.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 5: Višestruka rješenja agenata](../chapter-05-multi-agent/README.md)

> Validirano na `azd 1.27.1` u srpnju 2026.

## Uvod

Do sada ste *koristili* predloške s `azd init --template <ime>`. No kad imate raspored projekta koji vaš tim voli—recimo, Container App s Cosmos DB-om i pravim nadzorom—željet ćete ga pretvoriti u vlastiti predložak za višekratnu upotrebu. Predložak je samo Git repozitorij s predvidivom strukturom koju azd zna pročitati. Ova lekcija prikazuje kako izgraditi jedan od nule, testirati ga i (po želji) objaviti u galeriji zajednice.

## Ciljevi učenja

Do kraja ove lekcije, moći ćete:
- Razumjeti što mapu čini "azd predloškom"
- Znati potrebne datoteke i raspored mapa
- Dodati `azure.yaml` i `infra/` koje drugi mogu ponovno koristiti
- Testirati vlastiti predložak lokalno prije dijeljenja
- Objaviti ga i (po želji) poslati u Awesome AZD

## Ishodi učenja

Nakon završetka ove lekcije, moći ćete:
- Postaviti novi repozitorij predloška
- Parametrizirati infrastrukturu tako da radi u bilo kojoj pretplati
- Validirati predložak s `azd init` i `azd up`
- Dodati metapodatke koje galerija zahtijeva

---

## Što je zapravo predložak?

Azd predložak je **Git repozitorij** koji sadrži, minimalno:

| Datoteka / mapa | Svrha | Obavezno? |
|---------------|---------|-----------|
| `azure.yaml` | Opisuje servise, hostove i davatelja infrastrukture | ✅ Da |
| `infra/` | Bicep, Terraform ili Pulumi koji osigurava resurse | ✅ Da |
| `src/` (ili vaš kod) | Kod aplikacije koju azd postavlja | ✅ Da |
| `README.md` | Kako koristiti predložak | ✅ Preporučuje se |
| `.azdo/` ili `.github/` | Definicije CI/CD pipelinea | Opcionalno |
| `.devcontainer/` | Reproducibilno razvojno okruženje | Opcionalno |
| `azure.yaml` `metadata` | Galerija + informacije za telemetriju | Opcionalno (potrebno za objavu) |

Nema tu ništa čarobno: kad pokrenete `azd init --template you/your-repo`, azd klonira repozitorij i čita `azure.yaml`.

---

## Korak 1: Postavljanje repozitorija

Izradite strukturu mapa ručno ili započnite s minimalnim predloškom i uredite ga:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Izradi standardni izgled
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

Ovo je srce predloška. Kaže azdu što i kako treba postaviti:

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

> Polje `metadata.template` je ono što galerija koristi za telemetriju i brojanje korištenja. Koristite konvenciju `ime@verzija`.

---

## Korak 3: Parametrizirajte infrastrukturu

Najvažnije pravilo za *višekratno upotrebljiv* predložak: **nikad nemojte hardkodirati imena, regije ili vrijednosti specifične za pretplatu.** Koristite parametre i obrazac resursnog tokena kako bi isti predložak radio u bilo čijoj pretplati.

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

Dvije stvari čine ovaj predložak pogodan za ponovnu upotrebu:

1. **oznaka `azd-env-name`** — azd je koristi za praćenje i čišćenje resursa po okruženju.
2. **`uniqueString(...)` resursni token** — stvara stabilan, globalno jedinstven sufiks kako se imena ne bi sukobljavala.

Osigurajte odgovarajuću datoteku parametara koja čita vrijednosti koje azd ubacuje iz okruženja:

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

Azd automatski zamjenjuje `${AZURE_ENV_NAME}` i `${AZURE_LOCATION}` iz trenutnog okruženja.

---

## Korak 4: Testirajte predložak lokalno

Prije dijeljenja, dokažite da predložak funkcionira iz čistog stanja.

**Testirajte iz lokalne mape** (nije potreban Git push):

```bash
# Iz praznog direktorija, inicijalizirajte koristeći lokalnu putanju predloška
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Osigurajte + implementirajte od početka do kraja
azd auth login
azd up
```

**Zatim testirajte uklanjanje**—dobar predložak potpuno čisti:

```bash
azd down --force --purge
```

Ako `azd down` ostavlja resurse, vjerojatno ste propustili oznaku `azd-env-name` na nekom resursu.

> **Savjet:** prvo pokrenite `azd provision --preview`. Izvodi simulaciju i prikazuje pogreške predloška prije nego što se bilo koji resurs stvori.

---

## Korak 5: Objavite predložak

Pošaljite repozitorij na GitHub (javni ako želite da ga drugi koriste):

```bash
gh repo create my-azd-template --public --source=. --push
```

Svatko ga sada može koristiti:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Korak 6 (po izboru): Pošaljite u Awesome AZD

[Awesome AZD galerija](https://azure.github.io/awesome-azd/) popisuje predloške zajednice. Da biste bili uključeni, vaš repozitorij treba sadržavati:

- ✅ Jasno `README.md` s preduvjetima, dijagramom arhitekture i bilješkama o troškovima
- ✅ Radni `azure.yaml` s `metadata.template`
- ✅ Infrastrukturu koja se čisto postavlja u novu pretplatu
- ✅ Datoteku `LICENSE`
- ✅ (Preporučeno) `.devcontainer/` za jednim klikom Codespaces

Pošaljite to otvaranjem pull zahtjeva koji dodaje vaš predložak u datoteku podataka galerije, prateći vodič za doprinos na [Awesome AZD repozitoriju](https://github.com/Azure/awesome-azd).

---

## Uobičajene zamke

| Zamka | Rješenje |
|---------|-----|
| Hardkodirana imena resursa | Koristite `uniqueString()` resursni token |
| `azd down` ostavlja resurse | Označite svaki resurs (ili grupu resursa) s `azd-env-name` |
| Predložak radi za vas, ne radi za druge | Uklonite ID-eve pretplate, ID-eve zakupca i pretpostavke o regiji |
| Izlazi nisu povezani s aplikacijom | Izvezite `SERVICE_<NAME>_ENDPOINT_URL` i druge `AZURE_*` izlaze |
| Odbijena prijava u galeriju | Dodajte `README.md`, `LICENSE` i `metadata.template` |

---

## Sažetak

- Predložak je samo Git repozitorij s `azure.yaml`, `infra/` i vašim kodom.
- Parametrizirajte sve—imena, regije i ID-eve—da radi bilo gdje.
- Uvijek označite resurse s `azd-env-name` da `azd down` radi ispravno.
- Testirajte lokalno s `azd init --template <lokalna-putanja>` prije objave.
- Dodajte metapodatke i README za prijavu u Awesome AZD.

---

## 🔗 Navigacija

| Smjer | Resurs |
|-----------|----------|
| **Prethodno** | [Vodič za implementaciju](deployment-guide.md) |
| **Početak poglavlja** | [Poglavlje 4: Infrastruktura kao kod](README.md) |
| **Sljedeće poglavlje** | [Poglavlje 5: Višestruka rješenja agenata](../chapter-05-multi-agent/README.md) |

## 📖 Povezani resursi

- [Postavljanje resursa](provisioning.md)
- [Awesome AZD galerija](https://azure.github.io/awesome-azd/)
- [Službena azd dokumentacija za predloške](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->