# Saját azd sablon készítése

**Fejezet navigáció:**
- **📚 Tanfolyam főoldal**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 4. fejezet - Infrastruktúra kódként és telepítés
- **⬅️ Előző**: [Telepítési útmutató](deployment-guide.md)
- **🚀 Következő fejezet**: [5. fejezet: Többügynökös megoldások](../chapter-05-multi-agent/README.md)

> Ellenőrizve az `azd 1.27.1` verzióval 2026 júliusában.

## Bevezetés

Eddig *fogyasztottad* a sablonokat az `azd init --template <név>` paranccsal. De miután kialakítottad a projekthez azt az elrendezést, amit a csapatod szeret – például egy Container App-et Cosmos DB-vel és megfelelő monitorozással –, szeretnéd saját újrahasznosítható sablonná alakítani. Egy sablon egyszerűen egy Git tárhely előre meghatározott szerkezettel, amit az azd tud olvasni. Ez a lecké azt mutatja meg, hogyan készíts egy ilyen sablont nulláról, teszteld és (opcionálisan) publikáld a közösségi galériába.

## Tanulási célok

A lecke végére:
- Megérted, mi tesz egy mappát „azd sablonná”
- Tudni fogod a szükséges fájlokat és mappa elrendezést
- Hozzáadsz egy `azure.yaml` és `infra/` mappát, amit mások is újrahasznosíthatnak
- Lokálisan teszteled a sablont megosztás előtt
- Publikálod és (opcionálisan) beküldöd az Awesome AZD-be

## Tanulási eredmények

A lecke elvégzése után képes leszel:
- Létrehozni egy új sablon tárhelyet
- Paraméterezni az infrastruktúrát, hogy bármely előfizetésben működjön
- Érvényesíteni egy sablont `azd init` és `azd up` segítségével
- Hozzáadni a közösségi galéria által megkövetelt metaadatokat

---

## Mi is az a sablon valójában?

Egy azd sablon **egy Git tárhely**, amely legalább tartalmazza:

| Fájl / mappa | Cél | Kötelező? |
|---------------|---------|-----------|
| `azure.yaml` | Szolgáltatások, hosztok és infra szolgáltató leírása | ✅ Igen |
| `infra/` | Bicep, Terraform vagy Pulumi, ami az erőforrásokat létrehozza | ✅ Igen |
| `src/` (vagy a kódod) | Az alkalmazás kódja, amit az azd telepít | ✅ Igen |
| `README.md` | Hogyan kell használni a sablont | ✅ Erősen ajánlott |
| `.azdo/` vagy `.github/` | CI/CD pipeline definíciók | Opcionális |
| `.devcontainer/` | Reprodukálható fejlesztői környezet | Opcionális |
| `azure.yaml` `metadata` | Galéria + telemetria információk | Opcionális (publikáláshoz szükséges) |

Nincs itt semmi varázslat: ha futtatod az `azd init --template you/your-repo` parancsot, az azd lemásolja a tárhelyet és beolvassa az `azure.yaml`-t.

---

## 1. lépés: A tárhely felépítése

Kézzel hozd létre a mappa struktúrát vagy indíts egy minimális sablonból és szerkeszd:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Hozd létre az alapértelmezett elrendezést
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

## 2. lépés: Az `azure.yaml` megírása

Ez a sablon szíve. Megmondja az azd számára, hogy mit és hogyan telepítsen:

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

> A `metadata.template` mezőt használja a galéria telemetria a használat számlálására. Használd a `név@verzió` formátumot.

---

## 3. lépés: Az infrastruktúra paraméterezése

Egy *újrahasznosítható* sablon legfontosabb szabálya: **soha ne kódolj be neveket, régiókat vagy előfizetés-specifikus értékeket.** Használj paramétereket és erőforrás token mintát, hogy ugyanaz a sablon bárkinek az előfizetésében működjön.

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

Két dolog teszi ezt a sablont barátivá:

1. **`azd-env-name` címke** – az azd ez alapján követi és takarítja az erőforrásokat környezetenként.
2. **`uniqueString(...)` erőforrás token** – stabil, globálisan egyedi utótagot állít elő, hogy a nevek ne ütközzenek.

Adj meg egy hozzátartozó paraméterfájlt, amely olvassa az értékeket, amiket az azd injektál a környezetből:

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

Megosztás előtt bizonyítsd be, hogy a sablon tiszta állapotból is működik.

**Teszteld a helyi mappából** (nem szükséges Git push):

```bash
# Egy üres könyvtárból inicializálás a helyi sablon útvonal használatával
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Teljes körű előkészítés és telepítés
azd auth login
azd up
```

**Majd teszteld a lebontást** – egy jó sablon teljesen kitakarít:

```bash
azd down --force --purge
```

Ha az `azd down` erőforrásokat hagy maga után, valószínűleg hiányzik az `azd-env-name` címke egy erőforrásról.

> **Tipp:** futtasd először az `azd provision --preview` parancsot. Ez végrehajt egy "mi lenne ha" ellenőrzést, és hibákat jelez a sablonban mielőtt erőforrásokat hozna létre.

---

## 5. lépés: A sablon publikálása

Push-old a tárhelyet GitHub-ra (nyilvános, ha mások is használni akarják):

```bash
gh repo create my-azd-template --public --source=. --push
```

Most bárki használhatja:

```bash
azd init --template your-github-username/my-azd-template
```

---

## 6. lépés (opcionális): Beküldés az Awesome AZD-be

Az [Awesome AZD galéria](https://azure.github.io/awesome-azd/) a közösségi sablonokat listázza. Ahhoz, hogy listázzanak, a repo-nak tartalmaznia kell:

- ✅ Egy érthető `README.md`-t előfeltételekkel, architektúra diagrammal és költségjegyzetekkel
- ✅ Egy működő `azure.yaml`-t a `metadata.template`-tel
- ✅ Infrastruktúrát, ami tisztán települ egy friss előfizetésbe
- ✅ Egy `LICENSE` fájlt
- ✅ (Ajánlott) Egy `.devcontainer/` egykattintásos Codespaces-hez

Küldd be úgy, hogy pull requestet nyitsz, ami hozzáadja a sablonodat a galéria adatait tartalmazó fájlhoz, a hozzájárulási útmutató követésével az [Awesome AZD repóban](https://github.com/Azure/awesome-azd).

---

## Gyakori buktatók

| Buktató | Javítás |
|---------|-----|
| Beégetett erőforrás nevek | Használd a `uniqueString()` erőforrás tokent |
| Az `azd down` erőforrásokat hagy | Címkézz fel minden erőforrást (vagy a resource groupot) `azd-env-name`-mel |
| A sablon neked működik, másoknak nem | Távolítsd el az előfizetés ID-kat, tenant ID-kat és régió feltételezéseket |
| Kimenetek nincsenek összekötve az alkalmazással | Exportáld a `SERVICE_<NÉV>_ENDPOINT_URL` és más `AZURE_*` kimeneteket |
| Galéria beküldés elutasítva | Add hozzá a `README.md`-t, `LICENSE`-t és a `metadata.template`-et |

---

## Összefoglalás

- Egy sablon csak egy Git repo `azure.yaml`, `infra/` és a kódoddal.
- Paraméterezd mindent – neveket, régiókat és azonosítókat –, hogy bárhol fusson.
- Mindig címkézd az erőforrásokat `azd-env-name`-mel, hogy az `azd down` működjön.
- Teszteld helyben az `azd init --template <helyi-útvonal>` paranccsal publikálás előtt.
- Add hozzá a metaadatokat és egy README-t az Awesome AZD-be való beküldéshez.

---

## 🔗 Navigáció

| Irány | Erőforrás |
|-----------|----------|
| **Előző** | [Telepítési útmutató](deployment-guide.md) |
| **Fejezet főoldal** | [4. fejezet: Infrastruktúra kódként](README.md) |
| **Következő fejezet** | [5. fejezet: Többügynökös megoldások](../chapter-05-multi-agent/README.md) |

## 📖 Kapcsolódó erőforrások

- [Erőforrások létrehozása](provisioning.md)
- [Awesome AZD galéria](https://azure.github.io/awesome-azd/)
- [Hivatalos azd sablon dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->