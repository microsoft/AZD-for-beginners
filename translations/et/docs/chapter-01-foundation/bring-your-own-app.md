# Too oma rakendus - lisa azd olemasolevasse projekti

**Chapter Navigation:**
- **📚 Course Home**: [AZD algajatele](../../README.md)
- **📖 Current Chapter**: Peatükk 1 - Alus & Kiire algus
- **⬅️ Previous**: [Sinu esimene projekt](first-project.md)
- **➡️ Next**: [Dev Containerid & Codespaces](dev-containers.md)

> Kinnitatud vastu `azd 1.25.6` 2026. aasta juunis.

## Sissejuhatus

Selles [Sinu esimene projekt](first-project.md) sa juurutasid rakenduse, alustades mallist. Kuid enamasti sul juba *on* rakendus — Node.js API, Python Flask teenus, .NET veebi-rakendus — mis asub kaustas sinu masinas. See õppetund näitab, kuidas lisada azd olemasolevale koodile, et saaksid selle juurutada `azd up` abil ilma mallita.

## Õpieesmärgid

Õppetunni lõpuks sa:
- Mõistad kolme viisi azd projekti alustamiseks
- Käivitad `azd init` olemasolevas koodibaasis
- Mõistad, mida `azure.yaml` ja kaust `infra/` sinu rakenduse jaoks teevad
- Tead, millal lasta azd'il infrastruktuuri genereerida ja millal kirjutada ise
- Juurutad oma olemasoleva rakenduse Azure'i `azd up` abil

## Õpitulemused

Pärast selle õppetunni sooritamist oskad:
- Initsialiseerida azd projektis, mis sul juba olemas on
- Lugeda ja redigeerida põhilist `azure.yaml` faili
- Genereerida alginfrastruktuuri `azd infra generate` abil
- Valida sobiva Azure hosti oma rakenduse jaoks
- Juurutada ja puhastada oma rakendust

---

## Kolm viisi azd projekti alustamiseks

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **Mallist** | `azd init --template <name>` | Õppimiseks või uue rakenduse alustamiseks tõestatud näidise põhjal |
| **Oma olemasolevast koodist** | `azd init` (sinu projekti kaustas) | Sul juba on rakendus ja soovid seda juurutada |
| **Git repositooriumist** | `azd init --from-code` (kloneeritud repo sees) | azd kasutuselevõtt olemasolevas repositooriumis |

Sa juba harjutasid esimest varianti. See õppetund käsitleb teist — kõige tavalisemat reaalse maailma stsenaariumi.

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

Vali **"Use code in the current directory."** azd skaneerib seejärel su kausta, tuvastab keele ja raamistikud ning pakub välja hosti.

### Mida azd tuvastab

azd otsib signaale nagu `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` või `Dockerfile` ja soovitab vastavat Azure hosti:

| Sinu rakendus | Tõenäoliselt tuvastatud host |
|----------|----------------------|
| Node.js / Python / .NET veebirakendus | Azure App Service või Container Apps |
| Konteineriseeritud rakendus (`Dockerfile`) | Azure Container Apps |
| Funktsioonirakendus | Azure Functions |
| Staatiline sait (React/Vue build väljund) | Azure Static Web Apps |

Kinnita tuvastatud teenus(ed) ja azd genereerib vajalikud failid.

---

## Samm 2: Mõista, mida azd lõi

Pärast `azd init` käivitamist on sinu projektis kaks uut asja:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — projekti määratlus

See on azd projekti süda. Minimaalne näidis näeb välja nii:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` plokk on võtmeosa: iga kirje seob sinu koodi kausta Azure hostiga. Kui su rakendusel on nii frontend kui API, on sul kaks teenust.

### `infra/` — sinu Azure ressursid koodina

Kaust `infra/` sisaldab Bicep faile, mis määratlevad Azure ressursid, mida su rakendus vajab (App Service, andmebaas jne). Sa ei pea neid käsitsi kirjutama — azd genereerib töötava lähtepunkti. Sa *saad* neid hiljem redigeerida, et lisada ressursse või tugevdada turvalisust (käsitletud [Peatükis 4](../chapter-04-infrastructure/README.md)).

> **Vihje:** Kas tahad enne juurutamist genereeritud infrastruktuuri näha või kohandada? Käivita `azd infra generate` (saadaval ka kui `azd infra synth`), et kirjutada IaC kettale ja seda üle vaadata ning versioonihallata.

---

## Samm 3: Määra vajalik konfiguratsioon

Kui su rakendus vajab sätteid või saladusi (ühendusstring, API võti), ära külasta neid koodi sisse. Kasuta keskkonnamuutujate väärtusi:

```bash
# Loo keskkond
azd env new dev

# Sea mittesalajane väärtus
azd env set API_VERSION 1.0.0
```

Tõeliste saladuste puhul hoia neid Key Vaultis ja viita neile oma infrastruktuurist — vt [Peatükk 3: Konfiguratsioon ja autentimine](../chapter-03-configuration/authsecurity.md).

---

## Samm 4: Juuruta

Nüüd kasuta sama töövoogu, mida sa juba tunned:

```bash
# Logi sisse (vajalik azd-ile)
azd auth login

# Eelvaata ressursse, mis luuakse
azd provision --preview

# Loo infrastruktuur ja juuruta oma kood
azd up
```

Kui see lõpeb, prindib azd sinu rakenduse URL-i. Kinnita see samamoodi nagu iga azd rakenduse puhul:

```bash
azd show           # kuva lõpp-punktid
azd monitor --logs # kontrolli logisid vajadusel
```

---

## Tavalised esmakordsed probleemid

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd ei tuvastanud rakendust | Puudub manifest (nt `package.json`) | Lisa manifest või vali host käsitsi `azd init` ajal |
| Ehitamine ebaõnnestub `azd up` ajal | Rakendus vajab build-sammu | Lisa `buildCommand`/`outputPath` teenuse alla `azure.yaml`-sse |
| Rakendus käivitub, kuid tagastab vigu | Puuduv konfiguratsioon/saladus | Sea väärtused `azd env set` abil või ühenda Key Vault |
| Vale host valitud | Autotuvastus eksis | Muuda `host:` `azure.yaml`-s ja käivita uuesti `azd up` |

Lisateabe saamiseks vaata [Peatükk 7: Tõrkeotsing](../chapter-07-troubleshooting/README.md).

---

## Puhastamine

```bash
azd down --force --purge
```

---

## Kokkuvõte

- `azd init` → **"Use code in the current directory"** lisab azd rakendusele, mis sul juba olemas on.
- `azure.yaml` seob sinu koodi kaustad Azure hostidega; `infra/` määratleb ressursid Bicep-iga.
- `azd infra generate` võimaldab genereeritud infrastruktuuri üle vaadata või kohandada.
- Kui initsialiseeritud, kasutab sinu olemasolev rakendus täpselt sama `azd up` / `azd down` töövoogu nagu mallipõhine rakendus.

---

## 🔗 Navigatsioon

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Sinu esimene projekt](first-project.md) |
| **Next** | [Dev Containerid & Codespaces](dev-containers.md) |

## 📖 Seotud ressursid

- [AZD alused](azd-basics.md)
- [Peatükk 4: Infrastruktuur koodina](../chapter-04-infrastructure/README.md)
- [Konfiguratsioon ja autentimine](../chapter-03-configuration/authsecurity.md)
- [Käskude kiirjuhend](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->