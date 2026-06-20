# Hozd a saját alkalmazásodat - azd hozzáadása egy meglévő projekthez

**Chapter Navigation:**
- **📚 Tanfolyam főoldal**: [AZD kezdőknek](../../README.md)
- **📖 Jelen fejezet**: 1. fejezet - Alapok és Gyors kezdés
- **⬅️ Előző**: [Az első projekted](first-project.md)
- **➡️ Következő**: [Dev Containers & Codespaces](dev-containers.md)

> Érvényesítve `azd 1.25.6` használatával, 2026 júniusában.

## Bevezetés

A [Az első projekted](first-project.md) fejezetben sablonból indítva telepítettél egy alkalmazást. De a legtöbbször már rendelkezel egy alkalmazással — egy Node.js API-val, egy Python Flask szolgáltatással, egy .NET webalkalmazással — amely egy mappában van a gépeden. Ez a lecke megmutatja, hogyan adhatsz azd-t egy ilyen meglévő kódhoz, hogy `azd up`-pal telepíthesd, sablon nélkül.

## Tanulási célok

A lecke végére:
- Megérted az azd projekt indításának három módját
- Lefuttatod az `azd init`-et egy meglévő kódbázisban
- Megérted, mit csinál az `azure.yaml` és az `infra/` mappa az alkalmazásod számára
- Tudod, mikor engedd az azd-nek, hogy generálja az infrastruktúrát, és mikor írj sajátot
- Telepíted a meglévő alkalmazásodat Azure-ra `azd up` segítségével

## Tanulási eredmények

A lecke elvégzése után képes leszel:
- Inicializálni az azd-t egy már meglévő projektben
- Olvasni és szerkeszteni egy alapvető `azure.yaml` fájlt
- Generálni indító infrastruktúrát az `azd infra generate`-tel
- Kiválasztani egy megfelelő Azure hosztot az alkalmazásodhoz
- Telepíteni és eltávolítani a saját alkalmazásodat

---

## Három mód az azd projekt indítására

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Tanulás vagy új alkalmazás indítása egy bevált mintából |
| **From your existing code** | `azd init` (in your project folder) | Már van egy alkalmazásod, és telepíteni szeretnéd |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Az azd átvétele egy meglévő repóban |

Az első lehetőséget már gyakoroltad. Ez a lecke a másodikat fedi le — a leggyakoribb valós eshetőséget.

---

## 1. lépés: Futtasd az `azd init`-et a projektedben

Nyiss egy terminált **a meglévő projektmappádban** és futtasd:

```bash
cd my-existing-app
azd init
```

azd megkérdezi, hogyan szeretnéd inicializálni. Válaszd:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Válaszd a **"Use code in the current directory."** opciót. Az azd ezután átvizsgálja a mappádat, felismeri a nyelvet és a keretrendszert, és javasol egy hosztot.

### Mit észlel az azd

Az azd olyan jeleket keres, mint a `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` vagy egy `Dockerfile`, és egy hozzáillő Azure hosztot javasol:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service vagy Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Erősítsd meg a felismert szolgáltatást/szolgáltatásokat, és az azd előállítja a szükséges fájlokat.

---

## 2. lépés: Értsd meg, mit hozott létre az azd

Az init után két új elemet találsz a projektedben:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — a projekt definíciója

Ez az azd projekt szíve. Egy minimális példa így néz ki:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

A `services` blokk a kulcs: minden bejegyzés egy kódkönyvtárat társít egy Azure hoszthoz. Ha az alkalmazásodnak van frontendje és API-ja is, két szolgáltatásod lesz.

### `infra/` — az Azure erőforrásaid kódként

Az `infra/` mappa Bicep fájlokat tartalmaz, amelyek meghatározzák az alkalmazásod által igényelt Azure erőforrásokat (App Service, adatbázis stb.). Nem kell kézzel írnod ezeket — az azd generál egy működő kiindulópontot. Később szerkesztheted őket, hogy további erőforrásokat adj hozzá vagy szigorítsd a biztonságot (erről az [4. fejezet](../chapter-04-infrastructure/README.md) részletesen szól).

> **Tipp:** Szeretnéd megtekinteni vagy testreszabni a generált infrastruktúrát a telepítés előtt? Futtasd az `azd infra generate`-et (elérhető `azd infra synth` néven is), hogy az IaC fájlokat kiírja a lemezre, így átnézheted és verziókezelheted őket.

---

## 3. lépés: Állítsd be a szükséges konfigurációt

Ha az alkalmazásodnak beállításokra vagy titkokra van szüksége (például kapcsolati karakterlánc, API-kulcs), ne kódold be őket. Használj környezeti értékeket:

```bash
# Hozzon létre egy környezetet
azd env new dev

# Állítson be egy nem titkos értéket
azd env set API_VERSION 1.0.0
```

Valódi titkok esetén tárold őket a Key Vault-ban, és hivatkozz rájuk az infrastruktúrádból — lásd a [3. fejezet: Konfiguráció és hitelesítés](../chapter-03-configuration/authsecurity.md)-t.

---

## 4. lépés: Telepítés

Most használd ugyanazt a munkafolyamatot, amit már ismersz:

```bash
# Hitelesítés (azd-hez szükséges)
azd auth login

# Előnézet a létrehozandó erőforrásokról
azd provision --preview

# Infrastruktúra kiépítése és a kód telepítése
azd up
```

Amikor befejeződik, az azd kiírja az alkalmazásod URL-jét. Ellenőrizd ugyanúgy, mint bármely más azd alkalmazást:

```bash
azd show           # végpontok megjelenítése
azd monitor --logs # naplók ellenőrzése szükség esetén
```

---

## Gyakori első alkalommal előforduló problémák

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Hiányzó manifest (pl. `package.json`) | Add meg a manifestet, vagy válaszd ki a hosztot kézzel az `azd init` során |
| Build fails during `azd up` | Az alkalmazásnak szüksége van egy build lépésre | Add hozzá a `buildCommand`/`outputPath` beállításokat a szolgáltatáshoz az `azure.yaml`-ban |
| App starts but returns errors | Hiányzó konfiguráció/titok | Állítsd be az értékeket az `azd env set`-tel, vagy kösd össze a Key Vault-tal |
| Wrong host chosen | Az automatikus felismerés tévesztett | Szerkeszd a `host:`-ot az `azure.yaml`-ban és futtasd újra az `azd up`-ot |

Továbbiakért lásd a [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/README.md)-t.

---

## Takarítás

```bash
azd down --force --purge
```

---

## Összegzés

- `azd init` → **"Használd a kódot az aktuális könyvtárban"** hozzáadja az azd-t egy meglévő alkalmazáshoz.
- Az `azure.yaml` a kódkönyvtáraidat társítja Azure hosztokhoz; az `infra/` Bicep formában definiálja az erőforrásokat.
- Az `azd infra generate` lehetővé teszi, hogy átnézd vagy testreszabjad a generált infrastruktúrát.
- Miután inicializáltad, a meglévő alkalmazás pontosan ugyanazt az `azd up` / `azd down` munkafolyamatot használja, mint egy sablonalapú alkalmazás.

---

## 🔗 Navigáció

| Direction | Lesson |
|-----------|--------|
| **Előző** | [Az első projekted](first-project.md) |
| **Következő** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Kapcsolódó források

- [AZD alapok](azd-basics.md)
- [4. fejezet: Infrastruktúra kódként](../chapter-04-infrastructure/README.md)
- [Konfiguráció és hitelesítés](../chapter-03-configuration/authsecurity.md)
- [Parancs gyorsreferencia](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->