# Naudokite savo programą – pridėkite azd prie esamo projekto

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius – Pagrindai ir greitas pradėjimas
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas**: [Kūrimo konteineriai ir Codespaces](dev-containers.md)

> Patikrinta su `azd 1.27.1` 2026 m. liepos mėn.

## Įvadas

[Jūsų pirmajame projekte](first-project.md) diegėte programą pradėdami nuo šablono. Tačiau dažniausiai jūs jau *turite* programą – Node.js API, Python Flask paslaugą, .NET žiniatinklio programą – esančią aplanke jūsų kompiuteryje. Šiame pamokoje parodoma, kaip pridėti azd prie šio jau esančio kodo, kad galėtumėte jį diegti tiesiog su `azd up`, be jokio šablono.

## Mokymosi tikslai

Pabaigę šią pamoką jūs:
- Suprasite tris būdus, kaip pradėti azd projektą
- Paleisite `azd init` esamame kodo base
- Suprasite, ką daro `azure.yaml` ir `infra/` aplankas jūsų programai
- Žinosite, kada leisti azd generuoti infrastruktūrą, o kada rašyti pačiam
- Išdiegsime esamą programą Azure su `azd up`

## Mokymosi rezultatai

Baigę pamoką galėsite:
- Inicializuoti azd projekte, kurį jau turite
- Perskaityti ir redaguoti pagrindinį `azure.yaml` failą
- Sugeneruoti pradinę infrastruktūrą su `azd infra generate`
- Pasirinkti tinkamą Azure talpinimą programai
- Diegti ir išvalyti savo programą

---

## Trys būdai pradėti azd projektą

| Pradžios taškas | Komanda | Kada naudoti |
|----------------|---------|-------------|
| **Iš šablono** | `azd init --template <name>` | Mokymuisi arba naujos programos pradžiai iš patikrinto pavyzdžio |
| **Iš jūsų esamo kodo** | `azd init` (projekte) | Jau turite programą ir norite ją įdiegti |
| **Iš Git repozitorijos** | `azd init --from-code` (klonuotame repozitoriuje) | Įsidiegiant azd esamam repozitorijui |

Jūs jau praktikuojate pirmą variantą. Šioje pamokoje aptariamas antras – dažniausias realiame pasaulyje atvejis.

---

## 1 žingsnis: Paleiskite `azd init` jūsų projekte

Atidarykite terminalą **jūsų esamo projekto aplanke** ir paleiskite:

```bash
cd my-existing-app
azd init
```

azd paklaus, kaip norite inicializuoti. Pasirinkite:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pasirinkite **„Use code in the current directory.“** azd tada nuskaitys jūsų aplanką, aptiks kalbą ir karkasą bei pasiūlys talpinimo sprendimą.

### Ką aptinka azd

azd ieško ženklų kaip `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` arba `Dockerfile` ir siūlo atitinkamą Azure talpinimą:

| Jūsų programa | Tikėtinas aptiktas talpinimas |
|----------|----------------------|
| Node.js / Python / .NET web programa | Azure App Service arba Container Apps |
| Programėlė konteineryje (`Dockerfile`) | Azure Container Apps |
| Funkcinė programa | Azure Functions |
| Statinis puslapis (React/Vue surinkimo išvestis) | Azure Static Web Apps |

Patvirtinkite aptiktą paslaugą(-as), ir azd sugeneruoja reikiamus failus.

---

## 2 žingsnis: Supraskite, ką sukūrė azd

Po init turėsite du naujus dalykus savo projekte:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — projekto apibrėžimas

Tai yra azd projekto širdis. Minimalus atrodo taip:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` bloko dalis yra svarbiausia: kiekvienas įrašas susieja jūsų kodo aplanką su Azure talpinimu. Jei jūsų programa turi front-end ir API, turėsite dvi paslaugas.

### `infra/` — jūsų Azure resursai kaip kodas

`infra/` aplankas laiko Bicep failus, apibrėžiančius Azure išteklius, kurių reikia jūsų programai (App Service, duomenų bazę ir t.t.). Jums nereikia jų rašyti ranka – azd generuoja veikiančią pradinę bazę. Galite vėliau juos taisyti, pridėti išteklių arba griežtinti saugumą (apie tai [4 skyriuje](../chapter-04-infrastructure/README.md)).

> **Patarimas:** Norite pamatyti ar pritaikyti sugeneruotą infrastruktūrą prieš diegiant? Paleiskite `azd infra generate` (taip pat galima `azd infra synth`), kad užrašytumėte IaC ant disko peržiūrai ir versijų kontrolei.

---

## 3 žingsnis: Nustatykite reikiamą konfigūraciją

Jei programai reikalingi nustatymai ar slapti duomenys (ryšio eilutė, API raktas), jų nekoduokite tiesiogiai. Naudokite aplinkos reikšmes:

```bash
# Sukurkite aplinką
azd env new dev

# Nustatykite neslaptą reikšmę
azd env set API_VERSION 1.0.0
```

Tikriems slaptiems duomenims laikykite Key Vault ir nurodykite juos infrastruktūroje – žr. [3 skyrių: Konfigūracija ir autentifikacija](../chapter-03-configuration/authsecurity.md).

---

## 4 žingsnis: Diegimas

Dabar naudokite pažįstamą darbo eigą:

```bash
# Autentifikuoti (reikalinga azd)
azd auth login

# Peržiūrėti resursus, kurie bus sukurti
azd provision --preview

# Teikti infrastruktūrą ir diegti jūsų kodą
azd up
```

Baigus, azd atspausdins jūsų programos URL. Patikrinkite kaip įprasta bet kuriai azd programai:

```bash
azd show           # rodyti galutinius taškus
azd monitor --logs # patikrinkite žurnalus, jei reikia
```

---

## Dažnos pirmosios klaidos

| Simptomas | Galima priežastis | Sprendimas |
|---------|--------------|-----|
| azd neatpažino mano programos | Trūksta manifestų (pvz., `package.json`) | Pridėkite manifestą arba pasirinkite talpinimą rankiniu būdu `azd init` metu |
| Kļūva statyba vykdant `azd up` | Programai reikalinga statybos fazė | Įtraukite `buildCommand` / `outputPath` po paslauga `azure.yaml` faile |
| Programa paleidžiama, bet grąžina klaidas | Trūksta konfigūracijos/slaptažodžių | Nustatykite reikšmes su `azd env set` arba sujunkite Key Vault |
| Pasirinktas neteisingas talpinimas | Automatinis nustatymas suklydo | Redaguokite `host:` `azure.yaml` faile ir paleiskite `azd up` iš naujo |

Daugiau žr. [7 skyrių: Trikčių šalinimas](../chapter-07-troubleshooting/README.md).

---

## Išvalymas

```bash
azd down --force --purge
```

---

## Santrauka

- `azd init` → **„Use code in the current directory“** prideda azd prie programos, kurią jau turite.
- `azure.yaml` sujungia jūsų kodo aplankus su Azure talpinimo paslaugomis; `infra/` apibrėžia išteklius kaip Bicep.
- `azd infra generate` leidžia peržiūrėti arba pritaikyti sugeneruotą infrastruktūrą.
- Po inicializacijos jūsų esama programa naudoja tą pačią `azd up` / `azd down` darbo eigą kaip ir programa kuri pradėta iš šablono.

---

## 🔗 Navigacija

| Kryptis | Pamoka |
|-----------|--------|
| **Ankstesnis** | [Jūsų pirmasis projektas](first-project.md) |
| **Kitas** | [Kūrimo konteineriai ir Codespaces](dev-containers.md) |

## 📖 Susijusios medžiagos

- [AZD pagrindai](azd-basics.md)
- [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/README.md)
- [Konfigūracija ir autentifikacija](../chapter-03-configuration/authsecurity.md)
- [Komandų santrauka](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->