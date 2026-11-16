# Too Oma Rakendus - Lisa azd Olemasolevasse Projekti

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Käesolev peatükk**: Peatükk 1 - Alused ja kiire algus
- **⬅️ Eelmine**: [Sinu esimene projekt](first-project.md)
- **➡️ Järgmine**: [Arenduskonteinerid ja Codespaces](dev-containers.md)

> Käsu ja konfiguratsiooni ülevaatuse siht: `azd 1.37.2` (november 2026). Genereeritud failid sõltuvad tuvastatud rakendusest; Azure'i juurutust ei tehtud selles ülevaates.

## Sissejuhatus

Selles [Sinu esimene projekt](first-project.md) lõigus juurutasid rakenduse, alustades mallist. Kuid enamasti on sul juba *oma* rakendus — Node.js API, Python Flask teenus, .NET veebirakendus — mis asub kaustas su masinas. See õppetund näitab, kuidas lisada azd sellele olemasolevale koodile, et saaksid seda juurutada koos `azd up`, mallita.

## Õpieesmärgid

Selle õppetunni lõpuks oskad:
- Mõista kolme võimalust alustada azd projekti
- Käivitada `azd init` olemasoleva koodibaasi sees
- Mõista, mida teeb `azure.yaml` ja `infra/` kaust sinu rakenduse jaoks
- Teada, millal lasta azd-l infrastruktuur genereerida ja millal oma oma kirjutada
- Juurutada oma olemasolev rakendus Azure'i koos `azd up`

## Õpitulemused

Pärast selle õppetunni lõpetamist suudad:
- Algatada azd projekti, mis sul juba olemas on
- Lugeda ja muuta lihtsat `azure.yaml` faili
- Genereerida alginfrastruktuuri kasutades `azd infra generate`
- Valida sobiv Azure majutaja oma rakendusele
- Juurutada ja koristada oma rakendus

---

## Kolm võimalust alustada azd projekti

| Alguspunkt | Käsk | Millal kasutada |
|----------------|---------|-------------|
| **Mallist** | `azd init --template <name> .` (tühi kaust) | Õppimiseks või uue rakenduse alustamiseks tõestatud näidise põhjal |
| **Olemasolevast koodist** | `azd init` (sinu projekti kaustas) | Sul on juba rakendus ja soovid seda juurutada |
| **Git repositooriumist** | `azd init --from-code` (kloneeritud repositooriumis) | azd kasutuselevõtt olemasoleva repositooriumi jaoks |

Sa oled juba praktiseerinud esimest varianti. See õppetund käsitleb teist — kõige tavalisemat reaalses elus olukorda.

---

## Samm 1: Käivita `azd init` oma projektis

Ava terminal **oma olemasoleva projekti kaustas** ja käivita:

```bash
cd my-existing-app
azd init
```

azd küsib, kuidas soovid initsialiseerida. Vali:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Vali **"Kasuta koodi praeguses kataloogis."**. Seejärel skaneerib azd kausta, tunneb keele ja raamistikku ära ning pakub majutajat.

### Mida azd tuvastab

azd otsib rakenduse signaale nagu `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` või `Dockerfile`. Koodipõhine voog ei ole üldine majutaja valiku viisard kõigi toetatud juurutussihtkohtade jaoks:

| Sinu rakendus | Tõenäoline tuvastatud majutaja |
|----------|----------------------|
| Toetatud Node.js / Python / .NET veebirakendus | Tavaliselt Azure Container Apps; kontrolli genereeritud määratlust |
| Konteineriseeritud rakendus (`Dockerfile`) | Azure Container Apps |
| Funktsioonirakendus või Static Web Apps projekt | Kasuta sobivat malli või loo `azure.yaml` ja infrastruktuur, kui koodipõhine voog ei toeta sinu ülesehitust |

Kinnita tuvastatud teenus(ed) ja azd loob vajalikud failid.

---

## Samm 2: Mõista, mida azd lõi

Pärast algatamist vaata `azure.yaml` üle. Genereeritud infrastruktuuri voog võib hoida infrastruktuuri implitsiitsena seni, kuni käivitad `azd infra generate`; ära eelda, et `infra/` juba eksisteerib:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — projekti definitsioon

See on azd projekti süda. Järgmine **näidiskujutis App Service definitsioonist** nõuab vastavat App Service infrastruktuuri; see ei ole põhjus muuta genereeritud Container Apps majutajat ilma infrastruktuuri muutmata:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` blokis on võtmeosa: iga kirje kaardistab su koodi kausta Azure majutajale. Kui sul on nii kasutajaliides kui API, siis on sul kaks teenust.

### `infra/` — sinu Azure ressursid koodina

Kaust `infra/` sisaldab Bicep-faile, mis määratlevad teie rakenduse jaoks vajalikke Azure ressursse (App Service, andmebaas jne). Te ei pea neid käsitsi kirjutama—azd genereerib töötava lähtepunkti. Neid *võite* hiljem redigeerida, et lisada ressursse või tugevdada turvalisust (shelldatud peatükis [4](../chapter-04-infrastructure/README.md)).

> **Nõuanne:** Kas soovite enne juurutamist genereeritud infrastruktuuri näha või kohandada? Käivitage `azd infra generate` (saadaval ka kui `azd infra synth`), mis kirjutab IaC kettale, et saate seda üle vaadata ja versioonihalduses kasutada.

---

## 3. samm: Määrake nõutav konfiguratsioon

Kui teie rakendus vajab sätteid või saladusi (ühendusstring, API võti), ärge kodeerige neid kõvasti. Kasutage keskkonna väärtusi:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

See salvestab väärtuse ainult lokaalselt. Rakenduse mõjutamiseks kasutage seda selgelt infrastruktuuri parameetrites, toetatud teenuse seadetes või konksudes; suvalise muutuja määramine ei konfigureeri juurutatud käitusaega.

Tõeliste saladuste jaoks salvestage need Key Vault'i ja viitage neile infrastruktuurist—vt [3. peatükk: Konfiguratsioon ja autentimine](../chapter-03-configuration/authsecurity.md).

---

## 4. samm: Juurutage

Kasutage nüüd tuttavat töövoogu:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Kui lõpetab, kuvab azd teie rakenduse URL-i. Kontrollige sama moodi nagu iga azd rakendust:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Levinud esmakordsed probleemid

| Sümptom | Tõenäoline põhjus | Parandus |
|---------|--------------|-----|
| azd ei tuvastanud minu rakendust | Puudu manifest (nt `package.json`) | Lisage manifest või valige host käsitsi `azd init` ajal |
| Build ebaõnnestub `azd up` ajal | Rakendus vajab build-astet | Konfigureerige rakenduse paketi skriptid või teenuse `prepackage` konks; kasutage juurutamistulemuste jaoks `dist`, mitte `buildCommand`/`outputPath` |
| Rakendus käivitub, kuid tagastab vigu | Puudub konfiguratsioon/saladus | Siduge väärtused käitusaegsete rakenduse seadete või Key Vault'i viitega; `azd env set` üksi ei piisa |
| Valesti valitud host | Automaatne tuvastus ei vasta teie vajadustele | Muutke nii `host:` kui vastavat infrastruktuuri või valige sobiv mall |

Rohkem info leiate peatükist [7: Veaotsing](../chapter-07-troubleshooting/README.md).

---

## Puhastamine

```bash
azd down --force --purge
```

---

## Kokkuvõte

- `azd init` → **"Kasuta koodi praeguses kataloogis"** lisab azd olemasolevale rakendusele.
- `azure.yaml` kaardistab teie koodikaustad Azure hostidele; `infra/` määratleb ressursid Bicep-is.
- `azd infra generate` võimaldab üle vaadata või kohandada genereeritud infrastruktuuri.
- Algatatud rakendus kasutab sama `azd up` / `azd down` töövoogu nagu mallipõhine rakendus.

---

## 🔗 Navigeerimine

| Suund | Õppetund |
|-----------|--------|
| **Eelmine** | [Teie esimene projekt](first-project.md) |
| **Järgmine** | [Dev Containers ja Codespaces](dev-containers.md) |

## 📖 Seotud ressursid

- [AZD põhialused](azd-basics.md)
- [4. peatükk: Infrastruktuur koodina](../chapter-04-infrastructure/README.md)
- [Konfiguratsioon ja autentimine](../chapter-03-configuration/authsecurity.md)
- [Käsu kiirjuhend](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->