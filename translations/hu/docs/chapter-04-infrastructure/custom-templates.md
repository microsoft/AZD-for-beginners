# Saját azd Sablon Írása

**Fejezet Navigáció:**
- **📚 Tanfolyam Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi Fejezet**: 4. fejezet - Infrastruktúra kód formájában & Telepítés
- **⬅️ Előző**: [Telepítési Útmutató](deployment-guide.md)
- **🚀 Következő Fejezet**: [5. fejezet: Többügynökös megoldások](../chapter-05-multi-agent/README.md)

> Ellenőrizve `azd 1.37.2` alapján (2026 november). Ez egy **szerzői végigvezetés részleges fájlokkal**, nem egy teljes sablon: alkalmazáskódot és `modules/web.bicep`-t a környezettel, regisztrációval, Container Applikációval és kimenetekkel a telepítés előtt neked kell biztosítanod. Ebben az áttekintésben nem történt Azure előkészítés.

## Bevezetés

Eddig sablonokat *fogyasztottál* `azd init --template <name>`-vel. De amint van egy projektelrendezés, amit a csapatod szeret—például egy Container App Cosmos DB-vel és a megfelelő monitorozással—akkor saját újrahasznosítható sablont akarsz készíteni. Egy sablon csak egy Git repository kiszámítható szerkezettel, amit az azd tud olvasni. Ez a lecke megmutatja, hogyan kell egyet építeni a nulláról, tesztelni, és (opcionálisan) közzétenni a közösségi galériában.

## Tanulási célok

A lecke végére tudni fogod:
- Mi teszi az azd sablonból mappát
- Ismerni a kötelező fájlokat és mappastruktúrát
- Hozzáadni egy `azure.yaml` és `infra/`, amit mások újrahasználhatnak
- Helyben tesztelni a sablont megosztás előtt
- Közzétenni és (opcionálisan) beküldeni az Awesome AZD-nek

## Tanulási eredmények

A lecke elvégzése után képes leszel:
- Új sablon repositoryt létrehozni
- Paraméterezni az infrastruktúrát, hogy bármely előfizetésben működjön
- Érvényesíteni a sablont `azd init` és `azd up` segítségével
- Hozzáadni a közösségi galéria számára szükséges metaadatokat

---

## Mi is az a sablon valójában?

Egy azd sablon **egy Git repository**, ami legalább a következőket tartalmazza:

| Fájl / mappa | Cél | Kötelező? |
|---------------|---------|-----------|
| `azure.yaml` | Leírja a szolgáltatásokat, hosztokat és az infra szolgáltatót | ✅ Igen |
| `infra/` | Bicep vagy Terraform előkészítés definíciók | Kötelező ennél az expliciten IaC példánál; generált infrastruktúrás projektek kihagyhatják |
| `src/` (vagy a kódod) | Az alkalmazáskód, amit az azd telepít | Kötelező forrás alapú szolgáltatásokhoz; nem minden sablon tartalmaz alkalmazáskódot |
| `README.md` | Hogyan kell használni a sablont | ✅ Erősen ajánlott |
| `.azdo/` vagy `.github/` | CI/CD pipeline definíciók | Opcionális |
| `.devcontainer/` | Újrateremthető fejlesztői környezet | Opcionális |
| `azure.yaml` `metadata` | Sablon identitás/telemetria adatok | Ajánlott; egy Git repo publikálásához nem kötelező |

Nincs itt semmi varázslat: amikor futtatod az `azd init --template you/your-repo`-t, az azd lemásolja a repót és elolvassa az `azure.yaml`-et.

---

## 1. lépés: Repository Vázának Elkészítése

Készítsd el a mappastruktúrát kézzel, vagy kezdj egy minimális sablonnal és szerkeszd azt:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
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

## 2. lépés: Írj `azure.yaml`-t

Ez a sablon szíve. Megmondja az azd-nek, mit és hogyan telepítsen:

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

> Az `metadata.template` mező a galéria telemetria számára használatos, hogy számolja a használatot. Használd az `name@version` konvenciót.

---

## 3. lépés: Paraméterezd az infrastruktúrát

A *újrahasznosítható* sablon egyetlen legfontosabb szabálya: **soha ne kódolj be neveket, régiókat vagy előfizetés-specifikus értékeket.** Használj paramétereket és az erőforrás token mintát, hogy ugyanaz a sablon bármely előfizetésben működjön.

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

Két dolog teszi ezt sablonbaráttá:

1. **`azd-env-name` címke** — az azd ezt használja a környezetenkénti erőforrások nyomon követésére és takarítására.
2. **`uniqueString(...)` erőforrás token** — stabil hash végződést ad, hogy csökkentse az ütközéseket; nem garantál globális egyediséget.

A hiányzó `modules/web.bicep`-nak el kell fogadnia az `name`, `location` és `tags` paramétereket, elő kell készítenie a Container Apps környezetet/regisztrációt és az alkalmazást, meg kell címkéznie az alkalmazást `azd-service-name: web`-tal, és exportálnia kell az `uri`-at. Kitéve kell továbbá a regisztrációs értékeket a választott build/deploy folyamathoz (például `AZURE_CONTAINER_REGISTRY_ENDPOINT` a gyökér modulból). Egy végpont kimenet önmagában nem vezeti be a szolgáltatásfelismerést, alkalmazásbeállításokat vagy regisztrációs hitelesítést.

Biztosíts egy hozzáillő paraméterfájlt, ami az azd által a környezetből injektált értékeket olvassa:

Mentsd a következőt `infra/main.parameters.json` néven:

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

Az azd automatikusan behelyettesíti az `${AZURE_ENV_NAME}`-et és `${AZURE_LOCATION}`-t az aktuális környezetből.

---

## 4. lépés: Teszteld helyben a sablont

Megosztás előtt bizonyítsd be, hogy a sablon tiszta állapotból működik.

**Tesztelj a helyi mappából** (nem szükséges Git push):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Majd teszteld az eltávolítást**—egy jó sablon teljesen eltakarít:

```bash
azd down --force --purge
```

Ha az `azd down` erőforrásokat hagy hátra, ellenőrizd a környezet/erőforrás-csoport felismerést, külső/megosztott erőforrásokat, jogosultságokat, zárolásokat és törlés védelmet. Az `--purge` nem törli a helyi `.azure/` állapotot.

> **Tipp:** miután megadtad az összes hiányzó fájlt, először futtasd az `azd provision --preview`-t. Nézd át a hookokat előnézet előtt, mert azok mellékhatásokat kiváltó parancsokat hajthatnak végre. Az előnézet nem árkalkuláció vagy garancia a sikeres előkészítésre.

---

## 5. lépés: Tedd közzé a sablont

Told fel a repo-t GitHubra (nyilvános, ha mások is használják):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Most bárki használhatja:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## 6. lépés (opcionális): Küldd be az Awesome AZD-nek

Az [Awesome AZD galéria](https://azure.github.io/awesome-azd/) közösségi sablonokat listáz. A listázáshoz a repo-nak tartalmaznia kell:

- ✅ Egy világos `README.md`-et előfeltételekkel, architektúra diagrammal, és költségjegyzetekkel
- ✅ Egy működő `azure.yaml`-et `metadata.template`-vel
- ✅ Olyan infrastruktúrát, ami tisztán települ egy friss előfizetésbe
- ✅ Egy `LICENSE` fájlt
- ✅ (Ajánlott) Egy `.devcontainer/` egykattintásos Codespaces-hez

Küldd be egy pull request formájában, ami hozzáadja a sablont a galéria adatfájlhoz, követve a hozzájárulási útmutatót az [Awesome AZD repositoryban](https://github.com/Azure/awesome-azd).

---

## Gyakori Buktatók

| Buktató | Javítás |
|---------|-----|
| Beégetett erőforrásnevek | Használd az `uniqueString()` erőforrás tokent |
| Az `azd down` erőforrásokat hagy | Címkézz meg minden erőforrást (vagy az erőforrás csoportot) az `azd-env-name`-val |
| A sablon neked működik, másoknak nem | Távolítsd el az előfizetés-azonosítókat, bérlő azonosítókat és régió feltételezéseket |
| A kimenetek nem csatlakoznak az app-hoz | Egyeztesd az `azd-service-name`/`resourceName`-ot a telepítéshez és explicit módon köss ki alkalmazás beállításokba |
| Galéria beküldés elutasítva | Add hozzá az `README.md`-et, `LICENSE`-at és `metadata.template`-et |

---

## Összefoglalás

- Egy sablon csak egy Git repo `azure.yaml`-vel, `infra/`-vel és a kódoddal.
- Paraméterezd az egészet— neveket, régiókat, és azonosítókat—hogy bárhol fusson.
- Mindig címkézd az erőforrásokat `azd-env-name`-vel hogy `azd down` működjön.
- Tesztelj helyben `azd init --template <local-path>`-vel a publikálás előtt.
- Adj hozzá metaadatokat és egy README-t az Awesome AZD-nek való beküldéshez.

---

## 🔗 Navigáció

| Irány | Erőforrás |
|-----------|----------|
| **Előző** | [Telepítési Útmutató](deployment-guide.md) |
| **Fejezet Kezdőlap** | [4. fejezet: Infrastruktúra kód formájában](README.md) |
| **Következő Fejezet** | [5. fejezet: Többügynökös megoldások](../chapter-05-multi-agent/README.md) |

## 📖 Kapcsolódó Erőforrások

- [Erőforrások előkészítése](provisioning.md)
- [Awesome AZD Galéria](https://azure.github.io/awesome-azd/)
- [Hivatalos azd sablon dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->