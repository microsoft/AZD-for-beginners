# Atsineškite savo programą – pridėkite azd prie esamo projekto

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius – Pagrindai ir greitas pradėjimas
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas**: [Dev konteineriai ir Codespaces](dev-containers.md)

> Komandos ir konfigūracijos peržiūros tikslas: `azd 1.37.2` (2026 m. lapkritis). Sugeneruoti failai priklauso nuo aptiktos programos; „Azure“ diegimas šioje peržiūroje nebuvo vykdomas.

## Įvadas

Lektų jūsų pirmame projekte [Your First Project](first-project.md) diegėte programėlę pradėdami nuo šablono. Tačiau daugeliu atvejų jūs jau *turite* programėlę – Node.js API, Python Flask paslaugą, .NET internetinę programą – esančią aplanke jūsų kompiuteryje. Ši pamoka parodo, kaip pridėti azd prie esamo kodo, kad galėtumėte diegti jį naudojant `azd up`, nereikalingas šablonas.

## Mokymosi tikslai

Pamokos pabaigoje jūs:
- Suprasite tris būdus kaip pradėti azd projektą
- Vykdysite `azd init` esamo kodo bazėje
- Suprasite, ką atlieka `azure.yaml` ir `infra/` aplankas jūsų programėlėje
- Žinosite, kada leisti azd generuoti infrastruktūrą, o kada rašyti ją patys
- Pasiųsite savo esamą programėlę į Azure su `azd up`

## Mokymosi rezultatai

Po šios pamokos galėsite:
- Inicijuoti azd projekte, kurį jau turite
- Perskaityti ir redaguoti pagrindinį `azure.yaml` failą
- Sugeneruoti pradžios infrastruktūrą su `azd infra generate`
- Pasirinkti tinkamą Azure talpinimą savo programėlei
- Diegti ir išvalyti savo programėlę

---

## Tris būdai pradėti azd projektą

| Pradžios taškas | Komanda | Kada naudoti |
|----------------|---------|-------------|
| **Iš šablono** | `azd init --template <name> .` (tuščias katalogas) | Mokantis arba pradedant naują programėlę nuo patikrinto pavyzdžio |
| **Iš jūsų esamo kodo** | `azd init` (jūsų projekto aplanke) | Jūs jau turite programėlę ir norite ją diegti |
| **Iš Git saugyklos** | `azd init --from-code` (klonuotoje saugykloje) | Priimant azd prie esamos saugyklos |

Jūs jau praktikavote pirmą variantą. Ši pamoka apima antrą – dažniausią realaus pasaulio scenarijų.

---

## 1 žingsnis: paleiskite `azd init` savo projekte

Atidarykite terminalą **jūsų esamo projekto aplanke** ir vykdykite:

```bash
cd my-existing-app
azd init
```

azd paklaus, kaip norite inicijuoti. Pasirinkite:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pasirinkite **"Naudoti kodą esamame kataloge."** azd tada nuskaitys jūsų aplanką, nustatys kalbą ir sistemą, bei pasiūlys talpinimo galimybę.

### Ką aptinka azd

azd ieško programėlės ženklų tokių kaip `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` arba `Dockerfile`. Kodo pagrindu vykdoma pradžia nėra bendrinis šeimininkų pasirinkimo vedlys kiekvienam palaikomam diegimo tikslui:

| Jūsų programėlė | Tikėtinas aptiktas šeimininkas |
|----------|----------------------|
| Palaikoma Node.js / Python / .NET internetinė programa | Dažniausiai Azure Container Apps; peržiūrėkite sugeneruotą aprašymą |
| Kontainerizuota programėlė (`Dockerfile`) | Azure Container Apps |
| Function app arba Static Web Apps projektas | Naudokite atitinkamą šabloną arba parengkite `azure.yaml` ir infrastruktūrą jeigu kodo pagrindas nepalaiko jūsų struktūros |

Patvirtinkite aptiktas paslaugas, ir azd sukurs reikiamus failus.

---

## 2 žingsnis: Suprasti, ką sukūrė azd

Po inicijavimo peržiūrėkite `azure.yaml`. Sugeneruota infrastruktūra gali būti implicitinė iki kol paleisite `azd infra generate`; nesitikėkite, kad `infra/` jau egzistuoja:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — projekto apibrėžimas

Tai yra azd projekto širdis. Seletintis **iliustracinis App Service aprašymas** reikalauja atitinkamos App Service infrastruktūros; tai nėra priežastis keisti sugeneruotą Container Apps šeimininką be infrastruktūros pakeitimo:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` blokas yra pagrindinė dalis: kiekvienas įrašas sieja jūsų kodo aplanką su Azure šeimininku. Jei jūsų programėlėje yra tiek frontendas, tiek API, turėsite dvi paslaugas.

### `infra/` — jūsų Azure ištekliai kaip kodas

Aplanke `infra/` laikomi Bicep failai, apibrėžiantys Azure išteklius, kurių reikia jūsų programai (App Service, duomenų bazė ir kt.). Jų rašyti ranka nereikia – azd sugeneruoja veikiančią pradinę versiją. Vėliau juos *galite* redaguoti norėdami pridėti išteklių arba sustiprinti saugumą (apie tai skaitykite [4-je skyriuje](../chapter-04-infrastructure/README.md)).

> **Patarimas:** Norite peržiūrėti arba pritaikyti sugeneruotą infrastruktūrą prieš diegdami? Vykdykite `azd infra generate` (taip pat galima kaip `azd infra synth`), kad infrastruktūros kodas būtų įrašytas į diską ir galėtumėte jį peržiūrėti bei valdyti versijas.

---

## 3 žingsnis: Nustatykite būtiną konfigūraciją

Jei jūsų programa reikalauja nustatymų arba slaptažodžių (prisijungimo eilutės, API rakto), jų nerašykite tiesiogiai. Naudokite aplinkos reikšmes:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Tai saugo tik vietinę reikšmę. Norint paveikti programą, ją privaloma tiesiogiai naudoti infrastruktūros parametruose, palaikomame paslaugos nustatyme ar įvykio tvarkytuve; atsitiktinės kintamojo reikšmės nustatymas nekonfigūruoja diegiamo paleidimo laiko.

Tikroms slaptybėms laikyti naudokite Key Vault ir nuorodą iš infrastruktūros – žr. [3 skyrių: Konfigūracija ir autentifikavimas](../chapter-03-configuration/authsecurity.md).

---

## 4 žingsnis: Diegimas

Dabar naudokite jau žinomą darbo eigą:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Baigus azd išveda jūsų programos URL. Patikrinkite taip pat kaip ir bet kurį azd programą:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Dažniausios pirmo karto problemos

| Simptomas | Tikėtina priežastis | Sprendimas |
|---------|--------------|-----|
| azd nepastebėjo mano programos | Trūksta manifesto (pvz., `package.json`) | Pridėkite manifestą arba pasirinkite prieglobą rankiniu būdu vykdant `azd init` |
| Kūrimas nepavyksta vykdant `azd up` | Programai reikia kūrimo žingsnio | Suplanuokite programos paketo scenarijus arba paslaugos `prepackage` kablį; naudokite `dist` diegimo išėjimui, o ne `buildCommand`/`outputPath` |
| Programa paleidžiama, bet grąžina klaidas | Trūksta konfigūracijos/slapto rakto | Prijunkite reikšmes prie vykdymo laiko programos nustatymų arba Key Vault nuorodos; vien `azd env set` nepakanka |
| Pasirinkta bloga priegloba | Automatinis aptikimas neatitinka jūsų poreikių | Pakeiskite tiek `host:`, tiek atitinkamą infrastruktūrą arba pasirinkite tinkamą šabloną |

Daugiau žr. [7 skyrių: Trikčių šalinimas](../chapter-07-troubleshooting/README.md).

---

## Išvalymas

```bash
azd down --force --purge
```

---

## Santrauka

- `azd init` → **"Naudoti kodą dabartiniame kataloge"** prideda azd prie jau turimos programos.
- `azure.yaml` susieja jūsų kodo aplankus su Azure prieglobomis; `infra/` apibrėžia išteklius kaip Bicep.
- `azd infra generate` leidžia peržiūrėti arba pritaikyti sugeneruotą infrastruktūrą.
- Sugužinus, jūsų esama programa naudoja tą patį `azd up` / `azd down` darbo srautą, kaip ir programos, grindžiamos šablonu.

---

## 🔗 Navigacija

| Kryptis | Pamoka |
|-----------|--------|
| **Ankstesnis** | [Jūsų pirmasis projektas](first-project.md) |
| **Kitas** | [Įrenginių konteineriai ir Codespaces](dev-containers.md) |

## 📖 Susiję ištekliai

- [AZD pagrindai](azd-basics.md)
- [4 skyrius: infrastruktūra kaip kodas](../chapter-04-infrastructure/README.md)
- [Konfigūracija ir autentifikacija](../chapter-03-configuration/authsecurity.md)
- [Komandų spausdinimo lapas](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->