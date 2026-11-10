# Ustvarjanje lastnega azd predloge

**Navigacija po poglavjih:**
- **📚 Domov za tečaj**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 4 - Infrastruktura kot koda in nameščanje
- **⬅️ Prejšnje**: [Vodnik za nameščanje](deployment-guide.md)
- **🚀 Naslednje poglavje**: [Poglavje 5: Rešitve z več agenti](../chapter-05-multi-agent/README.md)

> Pregledano glede na `azd 1.37.2` (november 2026). To je **vodnik za ustvarjanje z delnimi datotekami**, ne popolna predloga: morate zagotoviti kodo aplikacije in `modules/web.bicep` z njenim okoljem, registrom, Container App in izhodi pred nameščanjem. Azure oskrba ni bila izvedena pri tem pregledu.

## Uvod

Do zdaj ste *uporabljali* predloge z `azd init --template <name>`. Ko pa imate postavitev projekta, ki je vaši ekipi všeč—recimo Container App s Cosmos DB in ustreznim nadzorom—boste želeli izdelati svojo ponovno uporabno predlogo. Predloga je preprosto Git repozitorij s predvidljivo strukturo, ki jo azd zna prebrati. Ta lekcija vam pokaže, kako narediti predlogo od začetka, jo preizkusiti in (neobvezno) objaviti v skupnostni galeriji.

## Cilji učenja

Na koncu te lekcije boste:
- Razumeli, kaj naredi mapo "azd predlogo"
- Spoznali zahtevane datoteke in postavitev mape
- Dodali `azure.yaml` in `infra/`, ki jih lahko drugi uporabijo
- Preizkusili svojo predlogo lokalno pred deljenjem
- Objavili jo in (neobvezno) predložili Awesome AZD

## Pričakovani rezultati učenja

Po končanem tečaju boste znali:
- Ustvariti nov repozitorij predloge
- Parametrizirati infrastrukturo, da deluje v katerikoli naročnini
- Validirati predlogo z `azd init` in `azd up`
- Dodati metapodatke, ki jih zahteva skupnostna galerija

---

## Kaj pravzaprav je predloga?

Azd predloga je **Git repozitorij**, ki vsebuje vsaj:

| Datoteka / mapa | Namen | Zahtevano? |
|---------------|---------|-----------|
| `azure.yaml` | Opis storitev, gostiteljev in ponudnika infrastrukture | ✅ Da |
| `infra/` | Definicije oskrbe z Bicep ali Terraform | Zahtevano za ta primer eksplicitne IaC; projekti z generirano infrastrukturo ga lahko izpustijo |
| `src/` (ali vaša koda) | Koda aplikacije, ki jo azd namešča | Zahtevano za storitve na osnovi kode; nekatere predloge ne vsebujejo kode aplikacije |
| `README.md` | Kako uporabljati predlogo | ✅ Močno priporočeno |
| `.azdo/` ali `.github/` | Definicije CI/CD cevovodov | Neobvezno |
| `.devcontainer/` | Reproducibilno razvojno okolje | Neobvezno |
| `azure.yaml` `metadata` | Identiteta predloge/telemetrija | Priporočeno; objava Git repozitorija ni pogojena z njim |

Tukaj ni nič magičnega: ko zaženete `azd init --template you/your-repo`, azd klonira repo in prebere `azure.yaml`.

---

## Korak 1: Ustvarite repozitorij

Ročno ustvarite strukturo map ali začnite z minimalno predlogo in jo uredite:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Tipična končna postavitev izgleda takole:

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

To je srce predloge. Pove azd, kaj in kako se namesti:

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

> Polje `metadata.template` uporablja telemetrija galerije za štetje uporabe. Uporabite konvencijo `name@version`.

---

## Korak 3: Parametrizirajte infrastrukturo

Najpomembnejše pravilo za *ponovno uporabno* predlogo: **nikoli ne trdo vpisujte imen, regij ali vrednosti specifičnih za naročnino.** Uporabite parametre in vzorec žetona virov, da ista predloga deluje v naročnini kogarkoli.

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

Dve stvari naredita to prijazno predlogo:

1. **`azd-env-name` oznaka** — azd jo uporablja za sledenje in čiščenje virov po okolju.
2. **`uniqueString(...)` žeton vira** — ustvari stabilen heš pripono za zmanjšanje trkov; ni zagotovilo globalne unikatnosti.

Manjkajoči `modules/web.bicep` mora sprejeti `name`, `location` in `tags`, zagotoviti okolje / register in app Container Apps, označiti app z `azd-service-name: web` in izvoziti `uri`. Prav tako mora razkriti vrednosti registra, potrebne za izbran tok gradnje / nameščanja (na primer `AZURE_CONTAINER_REGISTRY_ENDPOINT` iz korenskega modula). Samo izhodna točka ne povezuje iskanja storitev, nastavitev aplikacije ali avtentikacije registra.

Priskrbite ustrezno datoteko parametrov, ki prebere vrednosti, ki jih azd sam vbrizga iz okolja:

Shranite naslednje kot `infra/main.parameters.json`:

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

azd samodejno nadomesti `${AZURE_ENV_NAME}` in `${AZURE_LOCATION}` iz trenutnega okolja.

---

## Korak 4: Preizkusite svojo predlogo lokalno

Pred deljenjem dokažite, da predloga deluje iz čistega stanja.

**Preizkusite iz lokalne mape** (ni potrebno pošiljanje v Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Nato preizkusite odstranjevanje**—dobra predloga popolnoma počisti:

```bash
azd down --force --purge
```

Če `azd down` pusti vire za sabo, preverite odkrivanje okolja/skupine virov, zunanje/skupne vire, dovoljenja, zaklepe in zaščito brisanja. `--purge` ne izbriše lokalnega stanja `.azure/`.

> **Namig:** po zagotovilu vseh manjkajočih datotek zaženite najprej `azd provision --preview`. Preglejte hooke pred predogledom, saj lahko izvajajo ukaze z neželenimi učinki. Predogled ni ocena stroškov ali garancija uspeha oskrbe.

---

## Korak 5: Objavite predlogo

Potisnite repozitorij na GitHub (javno, če želite, da jo drugi uporabljajo):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Zdaj jo lahko vsak uporablja:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Korak 6 (neobvezno): Predložite Awesome AZD

Galerija [Awesome AZD](https://azure.github.io/awesome-azd/) vsebuje predloge skupnosti. Da bo vaš repozitorij vključen, mora vsebovati:

- ✅ Jasno `README.md` s predpogoji, diagramom arhitekture in opombami o stroških
- ✅ Delujoč `azure.yaml` z `metadata.template`
- ✅ Infrastrukturo, ki se čisto zagotovi v novi naročnini
- ✅ Datoteko `LICENSE`
- ✅ (Priporočeno) `.devcontainer/` za enostaven zagon Codespaces

Oddajte s predlogom spremembe, ki doda vaš predlog v podatkovno datoteko galerije, sledite navodilom za prispevanje v [Awesome AZD repozitoriju](https://github.com/Azure/awesome-azd).

---

## Pogoste pasti

| Past | Popravek |
|---------|-----|
| Trdo kodirana imena virov | Uporabite `uniqueString()` token vira |
| `azd down` pusti vire | Označite vsak vir (ali skupino virov) z `azd-env-name` |
| Predloga deluje pri vas, pri drugih ne | Odstranite ID-je naročnin, najemnikov in predpostavke o regijah |
| Izhodi niso povezani z aplikacijo | Uskladite `azd-service-name`/`resourceName` za nameščanje in izrecno povežite izhode z nastavitvami aplikacije |
| Oddaja v galerijo zavrnjena | Dodajte `README.md`, `LICENSE` in `metadata.template` |

---

## Povzetek

- Predloga je zgolj Git repozitorij z `azure.yaml`, `infra/` in vašo kodo.
- Parametrizirajte vse—imena, regije in ID-je—da bo delovala kjer koli.
- Vedno označite vire z `azd-env-name`, da `azd down` deluje.
- Pred objavo preizkusite lokalno z `azd init --template <local-path>`.
- Dodajte metapodatke in README za oddajo v Awesome AZD.

---

## 🔗 Navigacija

| Usmeritev | Vir |
|-----------|----------|
| **Prejšnja** | [Vodnik za nameščanje](deployment-guide.md) |
| **Domača stran poglavja** | [Poglavje 4: Infrastruktura kot koda](README.md) |
| **Naslednje poglavje** | [Poglavje 5: Rešitve z več agenti](../chapter-05-multi-agent/README.md) |

## 📖 Sorodni viri

- [Zagotavljanje virov](provisioning.md)
- [Awesome AZD galerija](https://azure.github.io/awesome-azd/)
- [Uradna dokumentacija azd predlog](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->