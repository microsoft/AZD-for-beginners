# Hozd a Saját Alkalmazásodat - az azd hozzáadása meglévő projekthez

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 1. fejezet - Alapok & Gyors kezdés
- **⬅️ Előző**: [Az első projekted](first-project.md)
- **➡️ Következő**: [Fejlesztői konténerek & Codespaces](dev-containers.md)

> Ellenőrizve `azd 1.27.1` verzióval 2026 júliusában.

## Bevezetés

A [Az első projekted](first-project.md) fejezetben egy sablonból indítva telepítettél egy alkalmazást. De a legtöbb esetben már *van* egy alkalmazásod — egy Node.js API, Python Flask szolgáltatás, .NET webalkalmazás — amely egy mappában van a gépeden. Ez a lecke megmutatja, hogyan lehet az azd-t hozzáadni ehhez a meglévő kódhoz, hogy `azd up` paranccsal telepíthesd, sablon nélkül.

## Tanulási célok

A lecke végére képes leszel:
- Megérteni az azd projekt indításának három módját
- Lefuttatni az `azd init` parancsot meglévő kódbázisban
- Megérteni, hogy mit csinál az `azure.yaml` és az `infra/` mappa az alkalmazásoddal
- Tudni, mikor hagyd, hogy az azd generálja az infrastruktúrát, illetve mikor írd meg saját magad
- Telepíteni a meglévő alkalmazásodat az Azure-ra az `azd up` segítségével

## Tanulási eredmények

A lecke elvégzése után képes leszel:
- Inicializálni az azd-t egy meglévő projektben
- Elolvasni és szerkeszteni egy alapvető `azure.yaml` fájlt
- Generálni kezdő infrastruktúrát az `azd infra generate` paranccsal
- Megfelelő Azure hosztot választani az alkalmazásod számára
- Telepíteni és tisztítani a saját alkalmazásodat

---

## Az azd projekt indításának három módja

| Kiindulópont | Parancs | Mikor használd |
|----------------|---------|-------------|
| **Sablonból** | `azd init --template <név>` | Tanuláshoz, vagy új alkalmazás indításához bevált mintából |
| **Már meglévő kódból** | `azd init` (a projekt mappájában) | Már van alkalmazásod és szeretnéd telepíteni |
| **Git tárházból** | `azd init --from-code` (klónozott tárházban) | Meglévő kódtárházhoz az azd elfogadása |

Az első lehetőséget már gyakoroltad. Ez a lecke a másodikat fedi le — a leggyakoribb valós forgatókönyvet.

---

## 1. lépés: Futtasd az `azd init` parancsot a projektedben

Nyiss egy terminált **a meglévő projekted mappájában** és futtasd:

```bash
cd my-existing-app
azd init
```

Az azd megkérdezi, hogyan szeretnéd inicializálni. Válassz:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Válaszd a **"Használd a jelenlegi könyvtárban lévő kódot."** lehetőséget. Az azd lekéri a mappádat, felismeri a nyelvet és a keretrendszert, és javasol egy hosztot.

### Amit az azd felismer

Az azd olyan jeleket keres, mint a `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, vagy `Dockerfile`, és egy hozzárendelt Azure hosztot ajánl:

| Alkalmazásod | Valószínűleg felismert hoszt |
|----------|----------------------|
| Node.js / Python / .NET web alkalmazás | Azure App Service vagy Container Apps |
| Konténerizált alkalmazás (`Dockerfile`) | Azure Container Apps |
| Function alkalmazás | Azure Functions |
| Statikus webhely (React/Vue build output) | Azure Static Web Apps |

Erősítsd meg a felismert szolgáltatást, az azd pedig előkészíti a szükséges fájlokat.

---

## 2. lépés: Értsd meg, mit hozott létre az azd

Az init parancs után két új dolog lesz a projektedben:

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

Ez az azd projekt szíve. Egy minimális így néz ki:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

A `services` blokk a kulcsfontosságú rész: minden bejegyzés egy kódkönyvtárat képez le egy Azure hosztra. Ha az alkalmazásodnak van frontendje és API-ja is, két szolgáltatást fogsz látni.

### `infra/` — az Azure erőforrásaid kódként

Az `infra/` mappa Bicep fájlokat tárol, amelyek az alkalmazásod által igényelt Azure erőforrásokat határozzák meg (például App Service, adatbázis stb.). Nem kell kézzel írnod ezeket — az azd generál egy működő kiindulási pontot. Később szerkesztheted őket, hogy további erőforrásokat adj hozzá, vagy szigorítsd a biztonságot ([4. fejezet](../chapter-04-infrastructure/README.md) foglalkozik vele).

> **Tipp:** Szeretnéd megnézni vagy testreszabni a generált infrastruktúrát telepítés előtt? Futtasd az `azd infra generate` (más néven `azd infra synth`) parancsot, hogy kiírd az IaC-t lemezre, így átnézheted és verziókezelheted.

---

## 3. lépés: Állítsd be a szükséges konfigurációt

Ha az alkalmazásodnak beállításokra vagy titkokra van szüksége (kapcsolati string, API kulcs), ne kódold be őket keményen. Használj környezeti értékeket:

```bash
# Hozzon létre egy környezetet
azd env new dev

# Állítson be egy nem titkos értéket
azd env set API_VERSION 1.0.0
```

Valódi titkok esetén tárold őket Key Vault-ban, és onnan hivatkozd meg az infrastruktúrádból — lásd [3. fejezet: Konfiguráció és hitelesítés](../chapter-03-configuration/authsecurity.md).

---

## 4. lépés: Telepítés

Most használd ugyanazt a munkafolyamatot, amit már ismersz:

```bash
# Hitelesítés (azd-hez kötelező)
azd auth login

# Tekintse meg a létrehozandó erőforrásokat
azd provision --preview

# Infrastrukturát biztosít és telepíti a kódot
azd up
```

Amikor befejeződik, az azd kiírja az alkalmazásod URL-jét. Ellenőrizd ugyanúgy, mint bármelyik azd alkalmazás esetén:

```bash
azd show           # végpontok megjelenítése
azd monitor --logs # ellenőrizze a naplókat, ha szükséges
```

---

## Gyakori kezdő problémák

| Tünet | Valószínű ok | Javítás |
|---------|--------------|-----|
| Az azd nem ismerte fel az alkalmazásomat | Hiányzó manifeszt (pl. `package.json`) | Add hozzá a manifesztet, vagy válaszd kézzel a hosztot az `azd init` során |
| Az építés meghiúsul az `azd up` lefutása közben | Az alkalmazásnak építési lépésre van szüksége | Add meg a `buildCommand`/`outputPath` mezőket a szolgáltatáshoz az `azure.yaml`-ban |
| Az alkalmazás elindul, de hibákat ad vissza | Hiányzó konfiguráció/titok | Állítsd be az értékeket az `azd env set` paranccsal, vagy kösd össze a Key Vault-tal |
| Hibás hoszt lett kiválasztva | Hibás automatikus felismerés | Szerkeszd a `host:` beállítást az `azure.yaml`-ban és futtasd újra az `azd up`-ot |

További információért lásd a [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/README.md).

---

## Tisztítás

```bash
azd down --force --purge
```

---

## Összefoglaló

- `azd init` → **"Használd a jelenlegi könyvtárban lévő kódot"** hozzáadja az azd-t egy meglévő alkalmazáshoz.
- Az `azure.yaml` leképezi a kódkönyvtárakat Azure hosztokra; az `infra/` Bicep formátumban definiálja az erőforrásokat.
- Az `azd infra generate` segítségével áttekintheted vagy testreszabhatod a generált infrastruktúrát.
- Inicializálás után a meglévő alkalmazás ugyanazt az `azd up` / `azd down` munkafolyamatot használja, mint a sablon alapú alkalmazás.

---

## 🔗 Navigáció

| Irány | Lecke |
|-----------|--------|
| **Előző** | [Az első projekted](first-project.md) |
| **Következő** | [Fejlesztői konténerek & Codespaces](dev-containers.md) |

## 📖 Kapcsolódó források

- [AZD alapok](azd-basics.md)
- [4. fejezet: Infrastruktúra kód formájában](../chapter-04-infrastructure/README.md)
- [Konfiguráció & Hitelesítés](../chapter-03-configuration/authsecurity.md)
- [Parancs gyorslista](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->