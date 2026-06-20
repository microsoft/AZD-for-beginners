# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD kwa Waanzilishi](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Imethibitishwa kwa `azd 1.25.6` mwezi Juni 2026.

## Utangulizi

Katika [Your First Project](first-project.md) ulipeleka programu kwa kuanzia kutoka kwa kiolezo. Lakini mara nyingi tayari una programu—API ya Node.js, huduma ya Python Flask, programu ya wavuti ya .NET—iliyokuwa kwenye saraka kwenye mashine yako. Somo hili linaonyesha jinsi ya kuongeza azd kwenye msimbo uliopo ili uweze kuuitoa kwa `azd up`, hakuna kiolezo kinachohitajika.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakuwa umeweza:
- Kuelewa njia tatu za kuanzisha mradi wa azd
- Kukimbia `azd init` ndani ya msimbo uliopo
- Kuelewa ni nini `azure.yaml` na saraka ya `infra/` hufanya kwa programu yako
- Kujua wakati wa kumruhusu azd kuunda miundombinu vs. kuandika yako mwenyewe
- Kuweka programu yako iliyopo Azure kwa kutumia `azd up`

## Matokeo ya Kujifunza

Baada ya kumaliza somo hili, utaweza:
- Kuanzisha azd kwenye mradi uliouwa tayari
- Kusoma na kuhariri faili ya msingi `azure.yaml`
- Kuunda miundombinu ya kuanzia kwa `azd infra generate`
- Kuchagua mwenyeji wa Azure unaofaa kwa programu yako
- Kufanya utekelezaji na kusafisha programu yako mwenyewe

---

## Njia Tatu za Kuanzisha Mradi wa azd

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
| **From your existing code** | `azd init` (in your project folder) | You already have an app and want to deploy it |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Adopting azd for an existing repository |

Umezoea chaguo la kwanza. Somo hili linashughulikia la pili—hali inayotokea mara nyingi zaidi duniani halisi.

---

## Hatua 1: Endesha `azd init` kwenye Mradi Wako

Fungua terminali **ndani ya saraka ya mradi uliopo** na endesha:

```bash
cd my-existing-app
azd init
```

azd itauliza jinsi unavyotaka kuanzisha. Chagua:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Chagua **"Tumia msimbo uliopo kwenye saraka ya sasa."** azd kisha itapitia saraka yako, itagundua lugha na fremu kazi, na kupendekeza mwenyeji.

### Azd inagundua nini

azd inatafuta ishara kama `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, au `Dockerfile`, na inapendekeza mwenyeji wa Azure unaofanana:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Thibitisha huduma zilizogunduliwa, na azd itaunda mafaili unayohitaji.

---

## Hatua 2: Elewa Nini azd Ilitengeneza

Baada ya init, utakuwa na vitu viwili vipya kwenye mradi wako:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — ufafanuzi wa mradi

Hii ndiyo moyo wa mradi wa azd. Mfupi wake unaonekana kama hii:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Sehemu ya `services` ndiyo sehemu muhimu: kila kipengele kinaweka ramani ya saraka ya msimbo wako hadi mwenyeji wa Azure. Ikiwa programu yako ina upande wa mbele na API, utakuwa na huduma mbili.

### `infra/` — rasilimali zako za Azure kama msimbo

Saraka ya `infra/` ina mafaili ya Bicep yanayofafanua rasilimali za Azure ambazo programu yako inahitaji (App Service, hifadhidata, n.k.). Hujahitaji kuyaandika haya kwa mkono—azd huunda alama ya kuanzia inayofanya kazi. Unaweza kuyarekebisha baadaye kuongeza rasilimali au kuimarisha usalama (itajadiliwa katika [Chapter 4](../chapter-04-infrastructure/README.md)).

> **Vidokezo:** Unataka kuona au kubinafsisha miundombinu iliyotengenezwa kabla ya kuipeleka? Endesha `azd infra generate` (pia inapatikana kama `azd infra synth`) kuandika IaC kwenye diski ili uweze kuikagua na kuiweka chini ya udhibiti wa toleo.

---

## Hatua 3: Weka Usanidi Unaohitajika

Ikiwa programu yako inahitaji mipangilio au siri (kamba ya muunganisho, API key), usizibandike ndani ya msimbo. Tumia thamani za mazingira:

```bash
# Unda mazingira
azd env new dev

# Weka thamani isiyo ya siri
azd env set API_VERSION 1.0.0
```

Kwa siri halisi, ziweke ndani ya Key Vault na uzitaje kutoka kwenye miundombinu yako—angalia [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Hatua 4: Weka Utekelezaji

Sasa tumia mtiririko huo ulioujua tayari:

```bash
# Thibitisha (inahitajika kwa azd)
azd auth login

# Tazama awali rasilimali zitakazoundwa
azd provision --preview

# Tayarisha miundombinu na sambaza msimbo wako
azd up
```

Inapoisha, azd itachapisha URL ya programu yako. Thibitisha kwa njia ile ile kama programu yoyote ya azd:

```bash
azd show           # onyesha vituo vya mwisho
azd monitor --logs # angalia kumbukumbu za shughuli ikiwa inahitajika
```

---

## Masuala ya Kawaida kwa Mara ya Kwanza

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

Kwa zaidi, angalia [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Safisha

```bash
azd down --force --purge
```

---

## Muhtasari

- `azd init` → **"Tumia msimbo uliopo kwenye saraka ya sasa"** inaongeza azd kwenye programu uliyonayo tayari.
- `azure.yaml` inaweka ramani saraka za msimbo wako kwenye wenyeji wa Azure; `infra/` inafafanua rasilimali kama Bicep.
- `azd infra generate` inakuwezesha kukagua au kubinafsisha miundombinu iliyotengenezwa.
- Mara umeanzisha, programu yako iliyopo inatumia mtiririko huo huo wa `azd up` / `azd down` kama programu iliyotokana na kiolezo.

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Your First Project](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Tovuti Zinazohusiana

- [Misingi ya AZD](azd-basics.md)
- [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->