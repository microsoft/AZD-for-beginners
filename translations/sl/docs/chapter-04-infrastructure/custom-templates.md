# Ustvarjanje lastnega azd predloge

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 4 - Infrastruktura kot koda & implementacija
- **⬅️ Prejšnje**: [Vodnik za implementacijo](deployment-guide.md)
- **🚀 Naslednje poglavje**: [Poglavje 5: Rešitve z več agenti](../chapter-05-multi-agent/README.md)

> Preverjeno z `azd 1.27.1` julija 2026.

## Uvod

Do sedaj ste *uporabljali* predloge z `azd init --template <name>`. Ko pa imate postavitev projekta, ki je vaši ekipi všeč — na primer Container App s Cosmos DB in pravo spremljanje — boste želeli to pretvoriti v svojo ponovno uporabno predlogo. Predloga je preprosto Git repozitorij s predvidljivo strukturo, ki jo azd zna prebrati. Ta lekcija vam pokaže, kako zgraditi predlogo iz nič, jo testirati in (neobvezno) objaviti v galeriji skupnosti.

## Cilji učenja

Do konca te lekcije boste:
- Razumeli, kaj naredi mapo "azd predlogo"
- Spoznali potrebne datoteke in postavitev map
- Dodali `azure.yaml` in `infra/`, ki ju lahko drugi znova uporabljajo
- Testirali svojo predlogo lokalno pred deljenjem
- Objavili predlogo in (po želji) poslali v Awesome AZD

## Rezultati učenja

Po zaključku te lekcije boste znali:
- Ustvariti nov repozitorij predloge
- Parametrizirati infrastrukturo, da deluje v katerikoli naročnini
- Preveriti predlogo z `azd init` in `azd up`
- Dodati metapodatke, ki jih zahteva galerija skupnosti

---

## Kaj pravzaprav je predloga?

Azd predloga je **Git repozitorij**, ki vsebuje vsaj:

| Datoteka / mapa | Namen | Obvezno? |
|---------------|---------|-----------|
| `azure.yaml` | Opisuje storitve, gostitelje in ponudnika infrastrukture | ✅ Da |
| `infra/` | Bicep, Terraform ali Pulumi, ki zagotavlja vire | ✅ Da |
| `src/` (ali vaša koda) | Koda aplikacije, ki jo azd implementira | ✅ Da |
| `README.md` | Kako uporabljati predlogo | ✅ Močno priporočeno |
| `.azdo/` ali `.github/` | Definicije CI/CD pipelines | Neobvezno |
| `.devcontainer/` | Reproducibilno razvojno okolje | Neobvezno |
| `azure.yaml` `metadata` | Galerija + podatki za telemetrijo | Neobvezno (obvezno za objavo) |

Ni nič magičnega: ko zaženete `azd init --template you/your-repo`, azd klonira repozitorij in prebere `azure.yaml`.

---

## 1. korak: Ustvarite repozitorij

Ročno ustvarite strukturo map ali začnite z minimalno predlogo in jo uredite:

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

## 2. korak: Napišite `azure.yaml`

To je srce predloge. Pove azd, kaj implementirati in kako:

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

> Polje `metadata.template` uporablja telemetrija galerije za štetje uporabe. Uporabite konvencijo `name@version`.

---

## 3. korak: Parametrizirajte infrastrukturo

Najpomembnejše pravilo za *ponovno uporabno* predlogo: **nikoli ne hardkodirajte imen, regij ali vrednosti, specifičnih za naročnino.** Uporabljajte parametre in vzorec tokenov virov, da ista predloga deluje v katerikoli naročnini.

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

Dve stvari naredita predlogo prijazno:

1. **`azd-env-name` oznaka** — azd jo uporablja za sledenje in čiščenje virov za vsako okolje posebej.
2. **`uniqueString(...)` token vira** — ustvari stabilen, globalno unikaten pripono, da se imena ne ponovijo.

Priložite ustrezno datoteko parametrov, ki prebere vrednosti, ki jih azd avtomatsko vstavi iz okolja:

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

azd samodejno nadomesti `${AZURE_ENV_NAME}` in `${AZURE_LOCATION}` glede na trenutno okolje.

---

## 4. korak: Testirajte predlogo lokalno

Pred deljenjem dokažite, da predloga deluje iz čistega stanja.

**Testirajte iz lokalne mape** (ni potrebno potiskanje v Git):

```bash
# Iz praznega imenika inicializirajte z uporabo lokalne poti predloge
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Zagotovite + razporedite od začetka do konca
azd auth login
azd up
```

**Nato testirajte odstranjevanje virov** — dobra predloga jih popolnoma očisti:

```bash
azd down --force --purge
```

Če `azd down` pusti vire za sabo, ste verjetno pozabili na oznako `azd-env-name` na nekem viru.

> **Namig:** najprej zaženite `azd provision --preview`. Izvede simulacijo in prikaže napake pred ustvarjanjem virov.

---

## 5. korak: Objavite predlogo

Potisnite repozitorij na GitHub (javno, če želite, da ga drugi uporabljajo):

```bash
gh repo create my-azd-template --public --source=. --push
```

Sedaj ga lahko uporablja kdorkoli:

```bash
azd init --template your-github-username/my-azd-template
```

---

## 6. korak (neobvezno): Pošljite v Awesome AZD

Galerija [Awesome AZD](https://azure.github.io/awesome-azd/) navaja predloge skupnosti. Za vpis naj vključuje vaša repozitorij:

- ✅ Jasno `README.md` z zahtevami, diagramom arhitekture in opombami o stroških
- ✅ Delujoč `azure.yaml` z `metadata.template`
- ✅ Infrastrukturo, ki se čisto postavi v sveži naročnini
- ✅ Datoteko `LICENSE`
- ✅ (Priporočeno) `.devcontainer/` za enostaven dostop v Codespaces

Pošljite z odprtjem pull requesta, ki doda vašo predlogo v podatkovno datoteko galerije, sledite vodniku za prispevanje v [Awesome AZD repozitoriju](https://github.com/Azure/awesome-azd).

---

## Pogoste pasti

| Past | Popravek |
|---------|-----|
| Imena virov na trdo nastavljena | Uporabite `uniqueString()` token vira |
| `azd down` pusti vire | Označite vsak vir (ali skupino virov) z `azd-env-name` |
| Predloga deluje pri vas, pri drugih ne | Odstranite ID-je naročnin, ID-je najemnikov in predpostavke o regijah |
| Izhodi niso povezani z aplikacijo | Izvozi `SERVICE_<NAME>_ENDPOINT_URL` in druge `AZURE_*` izhode |
| Zavrnitev predloga v galeriji | Dodajte `README.md`, `LICENSE` in `metadata.template` |

---

## Povzetek

- Predloga je le Git repozitorij z `azure.yaml`, `infra/` in vašo kodo.
- Vse parametrizirajte — imena, regije in ID-je — da deluje kjerkoli.
- Vedno označite vire z `azd-env-name`, da `azd down` deluje.
- Lokalno testirajte z `azd init --template <local-path>` pred objavo.
- Dodajte metapodatke in README za pošiljanje v Awesome AZD.

---

## 🔗 Navigacija

| Smer | Vir |
|-----------|----------|
| **Prejšnje** | [Vodnik za implementacijo](deployment-guide.md) |
| **Domača stran poglavja** | [Poglavje 4: Infrastruktura kot koda](README.md) |
| **Naslednje poglavje** | [Poglavje 5: Rešitve z več agenti](../chapter-05-multi-agent/README.md) |

## 📖 Povezani viri

- [Postavitev virov](provisioning.md)
- [Awesome AZD Galerija](https://azure.github.io/awesome-azd/)
- [Uradna dokumentacija azd predlog](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->