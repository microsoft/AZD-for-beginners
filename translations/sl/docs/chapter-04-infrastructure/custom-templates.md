# Ustvarjanje lastne azd predloge

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 4 - Infrastruktura kot koda in nameščanje
- **⬅️ Prejšnje**: [Vodnik za nameščanje](deployment-guide.md)
- **🚀 Naslednje poglavje**: [Poglavje 5: Rešitve z več agenti](../chapter-05-multi-agent/README.md)

> Preverjeno z `azd 1.25.6` junija 2026.

## Uvod

Do zdaj ste *uporabljali* predloge z `azd init --template <name>`. Ko pa imate postavitev projekta, ki je vaši ekipi všeč — na primer Container App s Cosmos DB in ustreznim nadzorovanjem — boste želeli to spremeniti v znova uporabno predlogo. Predloga je preprosto Git repozitorij s predvideno strukturo, ki jo azd zna prebrati. Ta lekcija vam pokaže, kako jo zgraditi iz nič, testirati in (izbirno) objaviti v skupnostni galeriji.

## Cilji učenja

Do konca te lekcije boste:
- Razumeli, kaj naredi mapo "azd predlogo"
- Poznali potrebne datoteke in strukturo map
- Dodali `azure.yaml` in `infra/`, ki jih lahko drugi ponovno uporabijo
- Lokalno preizkusili predlogo pred deljenjem
- Objavili predlogo in jo (izbirno) poslali v Awesome AZD

## Rezultati učenja

Po zaključku te lekcije boste sposobni:
- Postaviti nov repozitorij s predlogo
- Parametrizirati infrastrukturo, da deluje v katerikoli naročnini
- Validirati predlogo z `azd init` in `azd up`
- Dodati metapodatke, ki jih zahteva galerija

---

## Kaj je predloga, v resnici?

azd predloga je **Git repozitorij**, ki vsebuje vsaj:

| Datoteka / mapa | Namen | Zahtevano? |
|---------------|---------|-----------|
| `azure.yaml` | Opisuje storitve, gostitelje in ponudnika infrastrukture | ✅ Da |
| `infra/` | Bicep, Terraform ali Pulumi, ki vzpostavijo vire | ✅ Da |
| `src/` (ali vaša koda) | Koda aplikacije, ki jo azd namešča | ✅ Da |
| `README.md` | Navodila za uporabo predloge | ✅ Močno priporočeno |
| `.azdo/` ali `.github/` | Definicije CI/CD pipeline-ov | Neobvezno |
| `.devcontainer/` | Reproducibilno razvojno okolje | Neobvezno |
| `azure.yaml` `metadata` | Podatki za galerijo + telemetrijo | Neobvezno (zahtevano za objavo) |

Tukaj ni nič magičnega: ko zaženete `azd init --template you/your-repo`, azd klonira repozitorij in prebere `azure.yaml`.

---

## Korak 1: Postavitev repozitorija

Ustvarite strukturo map ročno ali začnite z minimalno predlogo in jo uredite:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Ustvari standardno postavitev
mkdir -p src infra
```

Tipična končna postavitev izgleda tako:

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

To je srce predloge. Pove azd, kaj naj namesti in kako:

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

> Polje `metadata.template` je tisto, kar galerija uporablja za telemetrijo pri štetju uporabe. Uporabite konvencijo `name@version`.

---

## Korak 3: Parametrizirajte infrastrukturo

Najpomembnejše pravilo za *ponovno uporabno* predlogo: **nikoli ne vnašajte na trdo kodiranih imen, regij ali vrednosti, specifičnih za naročnino.** Uporabite parametre in vzorec resource token, da ista predloga deluje v katerikoli naročnini.

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

Dve stvari naredita to predlogo prijazno za ponovno uporabo:

1. **`azd-env-name` tag** — azd ga uporablja za sledenje in čiščenje virov na okolje.
2. **`uniqueString(...)` resource token** — ustvari stabilen, globalno edinstven pripono, da se imena ne prekrivajo.

Posredujte ustrezno datoteko s parametri, ki bere vrednosti, ki jih azd vstavi iz okolja:

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

azd samodejno nadomesti `${AZURE_ENV_NAME}` in `${AZURE_LOCATION}` iz trenutnega okolja.

---

## Korak 4: Preizkusite predlogo lokalno

Pred deljenjem dokažite, da predloga deluje iz čistega stanja.

**Preizkus iz lokalne mape** (ni potrebno potiskanje v Git):

```bash
# V praznem imeniku inicializirajte z uporabo lokalne poti do predloge
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Zagotovite in razmestite od začetka do konca
azd auth login
azd up
```

**Nato preizkusite odstranitev** — dobra predloga popolnoma počisti vse:

```bash
azd down --force --purge
```

Če `azd down` pusti vire za seboj, ste verjetno pozabili na `azd-env-name` tag na kakšnem viru.

> **Namig:** najprej zaženite `azd provision --preview`. Izvede what-if in pokaže napake v predlogi, preden se ustvari kateri koli vir.

---

## Korak 5: Objavite predlogo

Potisnite repozitorij na GitHub (javnega, če želite, da ga drugi uporabljajo):

```bash
gh repo create my-azd-template --public --source=. --push
```

Zdaj ga lahko uporablja kdorkoli:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Korak 6 (izbirno): Oddajte v Awesome AZD

Galerija [Awesome AZD](https://azure.github.io/awesome-azd/) navaja predloge iz skupnosti. Da boste uvrščeni, naj vaš repozitorij vsebuje:

- ✅ Jasno `README.md` z zahtevami, diagramom arhitekture in opombami o stroških
- ✅ Delujoč `azure.yaml` z `metadata.template`
- ✅ Infrastrukturo, ki se čisto vzpostavi v sveži naročnini
- ✅ Datoteko `LICENSE`
- ✅ (Priporočeno) `.devcontainer/` za enoklikne Codespaces

Oddajte s tem, da odprete pull request, ki doda vašo predlogo v podatkovno datoteko galerije, in sledite navodilom za prispevanje v repozitoriju [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Pogoste pasti

| Pasti | Popravek |
|---------|-----|
| Trdo kodirana imena virov | Uporabite `uniqueString()` resource token |
| `azd down` pusti vire | Označite vsak vir (ali skupino virov) z `azd-env-name` |
| Predloga deluje pri vas, pri drugih pa ne | Odstranite ID-je naročnin, ID-je najemnikov in predpostavke o regijah |
| Izhodi niso povezani z aplikacijo | Izvozite `SERVICE_<NAME>_ENDPOINT_URL` in druge `AZURE_*` izhodne vrednosti |
| Oddaja v galerijo zavrnjena | Dodajte `README.md`, `LICENSE` in `metadata.template` |

---

## Povzetek

- Predloga je preprosto Git repozitorij z `azure.yaml`, `infra/` in vašo kodo.
- Parametrizirajte vse — imena, regije in ID-je — da deluje kjerkoli.
- Vedno označite vire z `azd-env-name`, da `azd down` deluje.
- Pred objavo lokalno preizkusite z `azd init --template <local-path>`.
- Dodajte metapodatke in README, da predlogo pošljete v Awesome AZD.

---

## 🔗 Navigacija

| Smer | Viri |
|-----------|----------|
| **Prejšnje** | [Vodnik za nameščanje](deployment-guide.md) |
| **Domača stran poglavja** | [Poglavje 4: Infrastruktura kot koda](README.md) |
| **Naslednje poglavje** | [Poglavje 5: Rešitve z več agenti](../chapter-05-multi-agent/README.md) |

## 📖 Sorodni viri

- [Vzpostavljanje virov](provisioning.md)
- [Galerija Awesome AZD](https://azure.github.io/awesome-azd/)
- [Uradna dokumentacija azd predlog](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->