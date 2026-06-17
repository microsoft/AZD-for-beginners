# Saját azd-sablon létrehozása

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 4. fejezet - Infrastruktúra mint kód és telepítés
- **⬅️ Előző**: [Telepítési útmutató](deployment-guide.md)
- **🚀 Következő fejezet**: [5. fejezet: Többügynökös megoldások](../chapter-05-multi-agent/README.md)

> Érvényesítve a `azd 1.25.6` verzióval 2026 júniusában.

## Bevezetés

Eddig sablonokat *fogyasztottál* az `azd init --template <name>` paranccsal. De ha egyszer van egy projekt elrendezés, amelyet a csapatod szeret — például egy Container App Cosmos DB-vel és megfelelő monitorozással — akkor érdemes újrafelhasználható sablonná alakítani. A sablon egyszerűen egy Git-tár, amely meghatározott struktúrával rendelkezik, amit az azd tud olvasni. Ez a lecke megmutatja, hogyan építs egyet a nulláról, teszteld, és (opcionálisan) publikáld a közösségi galériában.

## Tanulási célok

A lecke végére:
- Megérted, mi tesz egy mappát "azd sablonná"
- Tudni fogod a szükséges fájlokat és mappastruktúrát
- Hozzáadsz egy `azure.yaml`-t és egy újrafelhasználható `infra/`-t
- Helyben teszteled a sablont megosztás előtt
- Közzéteszed, és (opcionálisan) beküldöd az Awesome AZD-hez

## Tanulási eredmények

A lecke elvégzése után képes leszel:
- Létrehozni egy új sablon repót
- Paraméterezni az infrastruktúrát úgy, hogy bármely előfizetésben működjön
- Érvényesíteni a sablont `azd init` és `azd up` használatával
- Hozzáadni a közösségi galéria által megkövetelt metaadatokat

---

## Mi is az a sablon valójában?

Egy azd sablon egy **Git repozitórium**, amely legalább a következőket tartalmazza:

| Fájl / mappa | Cél | Szükséges? |
|---------------|---------|-----------|
| `azure.yaml` | Leírja a szolgáltatásokat, hosztokat és az infrastruktúra-szolgáltatót | ✅ Igen |
| `infra/` | Bicep, Terraform vagy Pulumi, ami létrehozza az erőforrásokat | ✅ Igen |
| `src/` (vagy a kódod) | Az azd által telepített alkalmazáskód | ✅ Igen |
| `README.md` | Hogyan használd a sablont | ✅ Erősen ajánlott |
| `.azdo/` vagy `.github/` | CI/CD pipeline definíciók | Opcionális |
| `.devcontainer/` | Reprodukálható fejlesztői környezet | Opcionális |
| `azure.yaml` `metadata` | Galéria + telemetria információ | Opcionális (a publikáláshoz kötelező) |

Nincs benne semmi varázslat: amikor futtatod az `azd init --template you/your-repo` parancsot, az azd klónozza a repót és olvassa az `azure.yaml`-t.

---

## 1. lépés: A repó alapvázának létrehozása

Hozd létre a mappastruktúrát kézzel, vagy kezdj egy minimális sablonnal és szerkeszd azt:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Hozza létre a szabványos elrendezést
mkdir -p src infra
```

Egy tipikus kész elrendezés így néz ki:

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

## 2. lépés: Írd meg az `azure.yaml`-t

Ez a sablon szíve. Megmondja az azdnak, mit és hogyan telepítsen:

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

> A `metadata.template` mezőt használja a galéria telemetriája a használat számlálásához. Használd a `name@version` konvenciót.

---

## 3. lépés: Paraméterezd az infrastruktúrát

A legfontosabb szabály egy *újrafelhasználható* sablon esetén: **soha ne kódolj be neveket, régiókat vagy előfizetés-specifikus értékeket.** Használj paramétereket és a resource token mintát, hogy ugyanaz a sablon bárki előfizetésében működjön.

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

Két dolog teszi ezt sablonbaráttá:

1. **`azd-env-name` címke** — azd ezt használja az egyes környezetek erőforrásainak nyomon követésére és takarítására.
2. **`uniqueString(...)` resource token** — stabil, globálisan egyedi végződést hoz létre, így a nevek nem ütköznek.

Adj meg egy hozzá illő paraméterfájlt, amely beolvassa azokat az értékeket, amelyeket az azd a környezetből injektál:

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

Az azd automatikusan helyettesíti a `${AZURE_ENV_NAME}` és `${AZURE_LOCATION}` értékeket az aktuális környezetből.

---

## 4. lépés: Teszteld a sablont helyben

Mielőtt megosztanád, bizonyítsd be, hogy a sablon tiszta állapotból is működik.

**Teszteld a helyi mappából** (Git push nem szükséges):

```bash
# Egy üres könyvtárból inicializáljon a helyi sablon útvonalának használatával
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Erőforrás-kiosztás és teljes körű telepítés
azd auth login
azd up
```

**Ezután teszteld a lebontást**—egy jó sablon teljesen eltakarít maga után:

```bash
azd down --force --purge
```

Ha az `azd down` erőforrásokat hagy maga után, valószínűleg hiányzott az `azd-env-name` címke valamelyik erőforráson.

> **Tipp:** futtasd először a `azd provision --preview` parancsot. Ez egy what-if műveletet végez és feltárja a sablonhibákat, mielőtt bármilyen erőforrás létrejönne.

---

## 5. lépés: Tedd közzé a sablont

Töltsd fel a repót a GitHubra (tedd nyilvánossá, ha mások számára is elérhetővé akarod tenni):

```bash
gh repo create my-azd-template --public --source=. --push
```

Mostantól bárki használhatja:

```bash
azd init --template your-github-username/my-azd-template
```

---

## 6. lépés (opcionális): Beküldés az Awesome AZD-hez

Az [Awesome AZD galéria](https://azure.github.io/awesome-azd/) közösségi sablonokat listáz. Ahhoz, hogy fel legyen sorolva, a repódnak tartalmaznia kell:

- ✅ Egy világos `README.md` az előfeltételekkel, egy architektúra diagrammal és költségmegjegyzésekkel
- ✅ Egy működő `azure.yaml` `metadata.template`-tel
- ✅ Infrastruktúra, amely egy friss előfizetésben zökkenőmentesen létrehozza az erőforrásokat
- ✅ Egy `LICENSE` fájl
- ✅ (Ajánlott) Egy `.devcontainer/` az egykattintásos Codespaces-hez

Nyújts be egy pull requestet, amely hozzáadja a sablonodat a galéria adatfájlához, a hozzájárulási útmutató szerint a [Awesome AZD repóban](https://github.com/Azure/awesome-azd).

---

## Gyakori buktatók

| Buktató | Megoldás |
|---------|-----|
| Keménykódolt erőforrásnevek | Használj `uniqueString()`-et |
| `azd down` erőforrásokat hagy maga után | Címkézz minden erőforrást (vagy az erőforráscsoportot) `azd-env-name`-nel |
| A sablon neked működik, másoknál hibásan fut | Távolítsd el az előfizetés azonosítókat, tenant azonosítókat és a régióra vonatkozó feltételezéseket |
| Kimenetek nincsenek bekötve az alkalmazásba | Exportáld a `SERVICE_<NAME>_ENDPOINT_URL`-t és egyéb `AZURE_*` kimeneteket |
| Galéria beküldés elutasítva | Adj hozzá `README.md`-et, `LICENSE`-t és `metadata.template`-et |

---

## Összefoglalás

- A sablon csupán egy Git repo `azure.yaml`-lal, `infra/`-ral és a kódoddal.
- Paraméterezd az egészet — neveket, régiókat és azonosítókat — hogy bárhol fusson.
- Mindig címkézd az erőforrásokat `azd-env-name`-nel, hogy az `azd down` működjön.
- Teszteld helyben az `azd init --template <local-path>`-pal a publikálás előtt.
- Adj hozzá metaadatot és README-t az Awesome AZD-hez való beküldéshez.

---

## 🔗 Navigáció

| Irány | Forrás |
|-----------|----------|
| **Előző** | [Telepítési útmutató](deployment-guide.md) |
| **Fejezet kezdőlapja** | [4. fejezet: Infrastruktúra mint kód](README.md) |
| **Következő fejezet** | [5. fejezet: Többügynökös megoldások](../chapter-05-multi-agent/README.md) |

## 📖 Kapcsolódó források

- [Erőforrások előkészítése](provisioning.md)
- [Awesome AZD galéria](https://azure.github.io/awesome-azd/)
- [Hivatalos azd sablon dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->